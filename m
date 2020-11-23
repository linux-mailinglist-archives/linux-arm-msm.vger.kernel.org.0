Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58C0E2C1757
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 22:11:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730561AbgKWVIH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 16:08:07 -0500
Received: from z5.mailgun.us ([104.130.96.5]:17681 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729244AbgKWVIH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 16:08:07 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606165686; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=xctod4y8H2RB6ARM9/cplLeTPl8gam1WWi1GE5ItuhA=;
 b=nRd2lH/znl2olZUFRisXu/Ebfdv9b0RQzOahiS8KkjJycBChowQGkQKk7mGpHattiGAD3KSR
 PUV21oQgJVUqpqfZ3IvuNeOk5ISuae6QvvsJrmZ8j82HjTr+MydrtCsyz+QKOtBggwyHGYvd
 X1qVLM2l4JA1411SdoFBibP3E+Q=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fbc24b37f0cfa6a1661a908 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 21:08:03
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 63565C43466; Mon, 23 Nov 2020 21:08:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 51327C433C6;
        Mon, 23 Nov 2020 21:08:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Nov 2020 13:08:01 -0800
From:   abhinavk@codeaurora.org
To:     Lee Jones <lee.jones@linaro.org>
Cc:     freedreno@lists.freedesktop.org,
        Fritz Koenig <frkoenig@google.com>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH 12/40] drm/msm/disp/dpu1/dpu_formats: Demote
 non-conformant kernel-doc header
In-Reply-To: <20201123111919.233376-13-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-13-lee.jones@linaro.org>
Message-ID: <98cc3d66e28b4fb863811f595a05277a@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-23 03:18, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'fmt' not described in 'INTERLEAVED_RGB_FMT'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'a' not described in 'INTERLEAVED_RGB_FMT'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'r' not described in 'INTERLEAVED_RGB_FMT'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'g' not described in 'INTERLEAVED_RGB_FMT'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'b' not described in 'INTERLEAVED_RGB_FMT'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'e0' not described in 'INTERLEAVED_RGB_FMT'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'e1' not described in 'INTERLEAVED_RGB_FMT'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'e2' not described in 'INTERLEAVED_RGB_FMT'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'e3' not described in 'INTERLEAVED_RGB_FMT'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'uc' not described in 'INTERLEAVED_RGB_FMT'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'alpha' not described in 'INTERLEAVED_RGB_FMT'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'bp' not described in 'INTERLEAVED_RGB_FMT'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'flg' not described in 'INTERLEAVED_RGB_FMT'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'fm' not described in 'INTERLEAVED_RGB_FMT'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'np' not described in 'INTERLEAVED_RGB_FMT'
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Fritz Koenig <frkoenig@google.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> index a05282dede91b..21ff8f9e5dfd1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> @@ -22,7 +22,7 @@
>  #define DPU_MAX_IMG_WIDTH		0x3FFF
>  #define DPU_MAX_IMG_HEIGHT		0x3FFF
> 
> -/**
> +/*
>   * DPU supported format packing, bpp, and other format
>   * information.
>   * DPU currently only supports interleaved RGB formats
