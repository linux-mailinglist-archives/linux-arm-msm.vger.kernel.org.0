Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97E00120F6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2019 17:29:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbfLPQ1y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Dec 2019 11:27:54 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:64207 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725805AbfLPQ1x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Dec 2019 11:27:53 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576513673; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=HRpW6vrt6VMA9QrLQATEyazxuZywgNQlADjWWPvVjb4=; b=LzDRAoN5iD6eenc4EJFa+p3rqZv3VjgYkBmzHr8aE6ANCG+XJy/Q189rcrdw0X9ffgXzPQWH
 fHNW1ZZhPqgWfDexSZZqJvygOKo+ooFtkLqtOm1AqUnWIB8/JleSnUeIm9to/0pwgM1pJ4cl
 kpAO5lcpbD6x9Fyofzi0h+U75hs=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df7b086.7f4d41e56378-smtp-out-n03;
 Mon, 16 Dec 2019 16:27:50 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AD2EAC433A2; Mon, 16 Dec 2019 16:27:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DE04CC433CB;
        Mon, 16 Dec 2019 16:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DE04CC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 16 Dec 2019 09:27:48 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, dri-devel@freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/5] drm: msm: a6xx: fix debug bus register configuration
Message-ID: <20191216162747.GB11074@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sharat Masetty <smasetty@codeaurora.org>,
        freedreno@lists.freedesktop.org, dri-devel@freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <1575385543-11290-1-git-send-email-smasetty@codeaurora.org>
 <0101016ecc4c2e38-cf760c85-09e7-4852-bc99-ff1ae45ab84e-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016ecc4c2e38-cf760c85-09e7-4852-bc99-ff1ae45ab84e-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 03, 2019 at 03:06:15PM +0000, Sharat Masetty wrote:
> Fix the cx debugbus related register configuration, to collect accurate
> bus data during gpu snapshot. This helps with complete snapshot dump
> and also complete proper GPU recovery.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

This guy should be flagged for stable.

> Change-Id: I4f0ae3eb2dd5d24a88d805277fad212dda2d735e
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 99b5a41..d6023ba 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -353,26 +353,26 @@ static void a6xx_get_debugbus(struct msm_gpu *gpu,
>  		cxdbg = ioremap(res->start, resource_size(res));
>  
>  	if (cxdbg) {
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_CNTLT,
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_CNTLT,
>  			A6XX_DBGC_CFG_DBGBUS_CNTLT_SEGT(0xf));
>  
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_CNTLM,
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_CNTLM,
>  			A6XX_DBGC_CFG_DBGBUS_CNTLM_ENABLE(0xf));
>  
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_IVTL_0, 0);
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_IVTL_1, 0);
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_IVTL_2, 0);
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_IVTL_3, 0);
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_0, 0);
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_1, 0);
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_2, 0);
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_3, 0);
>  
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_BYTEL_0,
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_BYTEL_0,
>  			0x76543210);
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_BYTEL_1,
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_BYTEL_1,
>  			0xFEDCBA98);
>  
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_0, 0);
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_1, 0);
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_2, 0);
> -		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_3, 0);
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_0, 0);
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_1, 0);
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_2, 0);
> +		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_3, 0);
>  	}
>  
>  	nr_debugbus_blocks = ARRAY_SIZE(a6xx_debugbus_blocks) +
> -- 
> 1.9.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
