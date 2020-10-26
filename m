Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7778129983A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Oct 2020 21:52:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728022AbgJZUwz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Oct 2020 16:52:55 -0400
Received: from z5.mailgun.us ([104.130.96.5]:44205 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728014AbgJZUwz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Oct 2020 16:52:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603745575; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=mH1ppLB1bjTbcIIdnHKn7TDzomVstmyqNeLzh7eO2fQ=;
 b=lUdGfD6QwXfPAe0d/lJqEd9gLCLbHmmMrkA46VXVycf9qMcLd1x/o5uW47OwAF8GmRRSq8OP
 3MtrwIW5X7b6rTbbvZEFJWupp8t/ceWqZ0aQiLYPL9neqRecrmciRNPZd66xDdsqT0PaV/l6
 gNYij39Ysd9vkzF1zdbfXy0N7us=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f9737262421c5ebfbd81feb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 26 Oct 2020 20:52:54
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C4ED0C43395; Mon, 26 Oct 2020 20:52:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D0C93C433F0;
        Mon, 26 Oct 2020 20:52:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 26 Oct 2020 13:52:52 -0700
From:   abhinavk@codeaurora.org
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Rob Clark <robdclark@chromium.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Shubhashree Dhar <dhar@codeaurora.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Raviteja Tamatam <travitej@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 3/4] drm/msm: fix -Woverride-init warning
In-Reply-To: <20201026194110.3817470-3-arnd@kernel.org>
References: <20201026194110.3817470-1-arnd@kernel.org>
 <20201026194110.3817470-3-arnd@kernel.org>
Message-ID: <5a99adc26963c0a64fe6de41b87c6244@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-26 12:41, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> There is one harmless duplicate initialization that causes a warning
> with 'make W=1':
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:122:19: warning:
> initialized field overwritten [-Woverride-init]
>   122 |  .max_linewidth = 4096,
>       |                   ^~~~
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:122:19: note: (near
> initialization for 'sm8250_dpu_caps.max_linewidth')
> 
> Remove one of the two identical initializers to avoid the warning.
> 
> Fixes: af776a3e1c30 ("drm/msm/dpu: add SM8250 to hw catalog")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 60b304b72b7c..9c23f814ccaf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -111,7 +111,6 @@ static const struct dpu_caps sm8150_dpu_caps = {
>  static const struct dpu_caps sm8250_dpu_caps = {
>  	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>  	.max_mixer_blendstages = 0xb,
> -	.max_linewidth = 4096,
>  	.qseed_type = DPU_SSPP_SCALER_QSEED3, /* TODO: qseed3 lite */
>  	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
>  	.ubwc_version = DPU_HW_UBWC_VER_40,
