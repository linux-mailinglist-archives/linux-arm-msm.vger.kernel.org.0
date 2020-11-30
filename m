Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93B722C8FF0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 22:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388533AbgK3VYH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 16:24:07 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:61990 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388531AbgK3VYG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 16:24:06 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606771427; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=dbZGdUcFmNG53loMl2JmT/iUQISOLMxPK14YsDoFSQ4=;
 b=Nhl8swbQcqmIF/eeP9F0eJ35cdGcje+wl0rgs1DtmVUemGF+zPDPeIcyUILOYWtpsavxoIjG
 2QDMwC4WHqwWOqtpXYqxpo9cggDipOC/dvCZf1bII4JaGMnRhoobWJCVZfG5dttx7Wm1Nlzy
 ur64hyK8pMwq56B2UAOOIZTbsOA=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fc562c6f4482b01c4c5a4c6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 30 Nov 2020 21:23:18
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A839FC43460; Mon, 30 Nov 2020 21:23:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1DE4BC433ED;
        Mon, 30 Nov 2020 21:23:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 30 Nov 2020 13:23:17 -0800
From:   abhinavk@codeaurora.org
To:     Lee Jones <lee.jones@linaro.org>
Cc:     freedreno@lists.freedesktop.org,
        Shubhashree Dhar <dhar@codeaurora.org>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 15/40] drm/msm/disp/dpu1/dpu_hw_interrupts: Demote
 kernel-doc formatting misuse
In-Reply-To: <20201126134240.3214176-16-lee.jones@linaro.org>
References: <20201126134240.3214176-1-lee.jones@linaro.org>
 <20201126134240.3214176-16-lee.jones@linaro.org>
Message-ID: <7ecb21f6b65de4014b2bbe9dcc5762a0@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-26 05:42, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:246: error: Cannot
> parse struct or union!
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:756: error: Cannot
> parse struct or union!
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Shubhashree Dhar <dhar@codeaurora.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 38482b1047745..5c521de715670 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -189,7 +189,7 @@ struct dpu_irq_type {
>  	u32 reg_idx;
>  };
> 
> -/**
> +/*
>   * struct dpu_intr_reg -  List of DPU interrupt registers
>   */
>  static const struct dpu_intr_reg dpu_intr_set[] = {
> @@ -245,7 +245,7 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
>  	}
>  };
> 
> -/**
> +/*
>   * struct dpu_irq_type - IRQ mapping table use for lookup an irq_idx 
> in this
>   *			 table that have a matching interface type and
>   *			 instance index.
