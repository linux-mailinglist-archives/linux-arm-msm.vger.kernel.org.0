Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 896906710FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 03:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbjARCQe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 21:16:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbjARCQc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 21:16:32 -0500
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DCC953564
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:16:30 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-4c131bede4bso449413367b3.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WTelNd/87R5jSKpjxuTjQoM4TcDwXgDtZiccb4mI7os=;
        b=BeO1vd+nYNzaTVGL4K1aGbH1qHT/ypHg3FWdn5k/n535Ir1E6oVs1Qpusnqd1NEyl7
         qG6Iln1cIx7bzclj1mek4Tl+hQ3NYOIJLcc9K4rh8sorZnze9HVroRa9+MR8HM6VKqtv
         f/uCGQ2d5WcxHKix3eRqpGIFEVmIf69EBnMGSK4OcYtTAwvGjsN5UN7xAKpQE+n6v6Eu
         P88jEBhQFe+W2Rh8LA3P+zTdv0nf2hnx0NZlaXfj1B9RcBm9KlUsDk2o2z28fq7WYjR2
         soXM8iCiS0H7WGVpTlXuYKtOwYfSfT5C5jgFwBdEoDCk3dkPW7Xi0RhltF1ZENW9s3Qz
         wS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTelNd/87R5jSKpjxuTjQoM4TcDwXgDtZiccb4mI7os=;
        b=vUwJQI4Hmqm3yfgFC4EVdMLD541KY/INT/YtxNlVBvibYTjcsY3n/hDsVvRP0LCAt/
         IqTeRwc5Cb7xRT4k5Ic5GMUy4vnQI4+wjkr92y1bGHBKn6q8zTIV40v4L5I/sDaT0YWe
         q8xY1/1DfUzavmTwEOqd7AUIKuqrfBxAA6014fYi4WEP+QXBb+abh8Hp1xVMjKIxZ4PX
         Gfrtvi63TIU61WRyqQ0RaIFQJ7fucVSM5NyUrIiOorsK7zVkXC5TAEjoz1DuZxdxM3A1
         +Rnhs27LLBb+PaRURGSITiwml+ksVZPHyJedo9Y0Xnh+d2VKgAR7SQhNYxfDOHTkIKll
         7fLw==
X-Gm-Message-State: AFqh2krColqIdPBL8a9bYjPGEON7/FC71eDYANzOdoT1XpuAmesUSjGW
        8+Ozn+nE79uXCB//kkTHy4B3cC5d2wsgo1Bg4NO1/1zZc1M0OboA
X-Google-Smtp-Source: AMrXdXsYNRgRsxLE4EskwQVMnKYVOCMhOKZaffiRjaF9y3tc78QjF1fxjwYPtPDXH1tdRSj/CdFg61Yg1LHRgs+zW0w=
X-Received: by 2002:a0d:fd07:0:b0:3d6:2151:4038 with SMTP id
 n7-20020a0dfd07000000b003d621514038mr627610ywf.418.1674008189782; Tue, 17 Jan
 2023 18:16:29 -0800 (PST)
MIME-Version: 1.0
References: <20230118021441.161-1-quic_jesszhan@quicinc.com>
In-Reply-To: <20230118021441.161-1-quic_jesszhan@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 18 Jan 2023 04:16:18 +0200
Message-ID: <CAA8EJpqP+JNXMoPqWrTOA9HT0wS22Uz807S1HndCnP7R4LZiHw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Reapply CTM if modeset is needed
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, quic_kalyant@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 18 Jan 2023 at 04:14, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Add a !drm_atomic_crtc_needs_modeset() check to
> _dpu_crtc_setup_cp_blocks() so that CTM is reapplied after a
> suspend/resume.

.. or if the LM/DSPP blocks were reallocated by resource allocation
during the modeset.

>
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/23
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 13ce321283ff..aa120a230222 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -748,7 +748,7 @@ static void _dpu_crtc_setup_cp_blocks(struct drm_crtc *crtc)
>         int i;
>
>
> -       if (!state->color_mgmt_changed)
> +       if (!state->color_mgmt_changed && !drm_atomic_crtc_needs_modeset(state))
>                 return;
>
>         for (i = 0; i < cstate->num_mixers; i++) {
> --
> 2.39.0
>


-- 
With best wishes
Dmitry
