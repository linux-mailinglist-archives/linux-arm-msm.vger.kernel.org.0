Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03E0CF403B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 07:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbfKHGJg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 01:09:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:52280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbfKHGJg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 01:09:36 -0500
Received: from localhost (unknown [106.200.194.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9C07C214DB;
        Fri,  8 Nov 2019 06:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573193375;
        bh=fDN1mBJKXXkbsUvrmqvMu3Eczk2hzN49BjHFdS4DsWQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iMwXTbCy0i+k3NGaoN7+dJi6pi4Ep5S6N6rP9TWV7tDgCjmJqBa7Z8ZH9TiVi75Vp
         jjpHKr5/9htAf2H6iM8rAFbi73qXfjIqDLCWGXeRZfKmeErs1zlQPTVKmXM02PDv5j
         8ksXwRqw+kCXG+X2bTf8AXXwsXdjCVWSGAGcIkL0=
Date:   Fri, 8 Nov 2019 11:39:30 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Elliot Berman <eberman@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org, tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/17] firmware: qcom_scm-64: Add SCM results to
 descriptor
Message-ID: <20191108060930.GA952516@vkoul-mobl>
References: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
 <1572917256-24205-7-git-send-email-eberman@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572917256-24205-7-git-send-email-eberman@codeaurora.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04-11-19, 17:27, Elliot Berman wrote:
> Remove knowledge of arm_smccc_res struct from client wrappers so that
> client wrappers only work QCOM SCM data structures. SCM calls may have
> up to 3 arguments, so qcom_scm_call_smccc is responsible now for filling
> those 3 arguments accordingly.
> 
> Signed-off-by: Elliot Berman <eberman@codeaurora.org>
> ---
>  drivers/firmware/qcom_scm-64.c | 105 ++++++++++++++++++-----------------------
>  1 file changed, 45 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
> index 76412a5..f6536fa 100644
> --- a/drivers/firmware/qcom_scm-64.c
> +++ b/drivers/firmware/qcom_scm-64.c
> @@ -50,6 +50,7 @@ struct qcom_scm_desc {
>  	u32 cmd;
>  	u32 arginfo;
>  	u64 args[MAX_QCOM_SCM_ARGS];
> +	u64 res[MAX_QCOM_SCM_RETS];
>  	u32 owner;
>  };
>  
> @@ -115,8 +116,7 @@ static void qcom_scm_call_do_smccc(const struct qcom_scm_desc *desc,
>  }
>  
>  static int ___qcom_scm_call_smccc(struct device *dev,
> -				  const struct qcom_scm_desc *desc,
> -				  struct arm_smccc_res *res, bool atomic)
> +				  struct qcom_scm_desc *desc, bool atomic)
>  {
>  	int arglen = desc->arginfo & 0xf;
>  	int i;
> @@ -125,6 +125,7 @@ static int ___qcom_scm_call_smccc(struct device *dev,
>  	void *args_virt = NULL;
>  	size_t alloc_len;
>  	gfp_t flag = atomic ? GFP_ATOMIC : GFP_KERNEL;
> +	struct arm_smccc_res res;
>  
>  	if (unlikely(arglen > SMCCC_N_REG_ARGS)) {
>  		alloc_len = SMCCC_N_EXT_ARGS * sizeof(u64);
> @@ -158,15 +159,19 @@ static int ___qcom_scm_call_smccc(struct device *dev,
>  		x5 = args_phys;
>  	}
>  
> -	qcom_scm_call_do_smccc(desc, res, x5, atomic);
> +	qcom_scm_call_do_smccc(desc, &res, x5, atomic);
>  
>  	if (args_virt) {
>  		dma_unmap_single(dev, args_phys, alloc_len, DMA_TO_DEVICE);
>  		kfree(args_virt);
>  	}
>  
> -	if (res->a0 < 0)
> -		return qcom_scm_remap_error(res->a0);
> +	desc->res[0] = res.a1;
> +	desc->res[1] = res.a2;
> +	desc->res[2] = res.a3;

res represents result, so can we rename this here and in qcom_scm_desc
as result, somehow I kept on reading this as res and got confused ;/ or
maybe it is just me!

-- 
~Vinod
