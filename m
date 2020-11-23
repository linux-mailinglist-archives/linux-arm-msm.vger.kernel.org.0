Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3C72C1771
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 22:17:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729747AbgKWVMK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 16:12:10 -0500
Received: from z5.mailgun.us ([104.130.96.5]:43194 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729632AbgKWVMK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 16:12:10 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606165930; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=sLXph1fVaBzXxkzR1k1mDUs2s3xMx2NERmjF55dg/ps=;
 b=T6XS/5qv6yZgfHF/qgj9+EelcqK7z2rDmrcwEJ3kRLWFveXhwkcb1lozy3ksSxbWehqBpSii
 VMTOznUcfycRIEK12cCEboi4sM4W3TMgoPjDCQTEQah0VxXdfzqN86GseMWC1fqssrm4BqU9
 3bqQjgsRu8ykbdnEqbVCkN9NP5U=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fbc25a29e87e16352523edd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 21:12:02
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 256C1C43460; Mon, 23 Nov 2020 21:12:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AA8E8C433ED;
        Mon, 23 Nov 2020 21:12:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Nov 2020 13:12:00 -0800
From:   abhinavk@codeaurora.org
To:     Lee Jones <lee.jones@linaro.org>
Cc:     freedreno@lists.freedesktop.org,
        Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH 20/40] drm/msm/disp/dpu1/dpu_hw_sspp: Fix
 kernel-doc formatting abuse
In-Reply-To: <20201123111919.233376-21-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-21-lee.jones@linaro.org>
Message-ID: <d05b5aabd35debc9edc800c62e5075c2@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-23 03:18, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:240: warning: Function
> parameter or member 'ctx' not described in 'dpu_hw_sspp_setup_format'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:240: warning: Function
> parameter or member 'fmt' not described in 'dpu_hw_sspp_setup_format'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:240: warning: Function
> parameter or member 'flags' not described in
> 'dpu_hw_sspp_setup_format'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:240: warning: Function
> parameter or member 'rect_mode' not described in
> 'dpu_hw_sspp_setup_format'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:446: warning: Function
> parameter or member 'ctx' not described in 'dpu_hw_sspp_setup_rects'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:446: warning: Function
> parameter or member 'cfg' not described in 'dpu_hw_sspp_setup_rects'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:446: warning: Function
> parameter or member 'rect_index' not described in
> 'dpu_hw_sspp_setup_rects'
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Jonathan Marek <jonathan@marek.ca>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index c940b69435e16..2c2ca5335aa8c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -231,7 +231,7 @@ static void _sspp_setup_csc10_opmode(struct
> dpu_hw_pipe *ctx,
>  	DPU_REG_WRITE(&ctx->hw, SSPP_VIG_CSC_10_OP_MODE + idx, opmode);
>  }
> 
> -/**
> +/*
>   * Setup source pixel format, flip,
>   */
>  static void dpu_hw_sspp_setup_format(struct dpu_hw_pipe *ctx,
> @@ -437,7 +437,7 @@ static u32 _dpu_hw_sspp_get_scaler3_ver(struct
> dpu_hw_pipe *ctx)
>  	return dpu_hw_get_scaler3_ver(&ctx->hw, idx);
>  }
> 
> -/**
> +/*
>   * dpu_hw_sspp_setup_rects()
>   */
>  static void dpu_hw_sspp_setup_rects(struct dpu_hw_pipe *ctx,
