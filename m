Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E93EE4BEFCE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 04:15:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233620AbiBVDMb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Feb 2022 22:12:31 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239511AbiBVDMa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Feb 2022 22:12:30 -0500
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A5FD60D2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 19:12:06 -0800 (PST)
Received: by mail-qv1-xf36.google.com with SMTP id x3so37571233qvd.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 19:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gQ7tL9yE1YjTlYy7IejJ8wI93X2uR0MQXXmiDoUIMcA=;
        b=widGmEJ6an//elEa8rev0M6RF+QC8ehjwvQe1U0C2Wrcne672GyJ+RJLdDOwhjuhNI
         UcpbRuelVUJcEQeRZNccQxmvsGXx0/Fd3M75o3+Q/PjT9dNMDogeWaeKTngkwiAbahkI
         rO7hqsUL8KQDoja4dZt9RRb0eEnAic9/jYh1S02Cahb1RbwmEw2SjyTAB0VfHf45i4rV
         +rQ33Q+YIHM9JvYOzg6C8lIkwoqps9FfRTuQ4F/Ek+WEwIluRTJZxNWyHfZ4nEgJ8RW3
         tZBgXSK+dkrG5cGAASx4asZ4ILaDTwUozxHNINhLjAk5cJvAHfBa8yU+VPwsOSdfVQZz
         lH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gQ7tL9yE1YjTlYy7IejJ8wI93X2uR0MQXXmiDoUIMcA=;
        b=iiZbMx2ykSdP4Y2BOc3SxQpUGkLRcFI3mI//CsoKlWcOKfwXbcgLh/gj/kEBA5DrGO
         g4GE/FNKp4T9na3cVn46SemT7ivZNFx49V1idSpA8bYFAntS9aq6y77gSou3M7u/dO7r
         CjnHTRlSQy5bPzM0P3Oc2aL4S7bjTv49tT5tqEZ+M7UEh0S0fbTMYyZorY+UvRnNPzbp
         pifmbWiopVWtHxwtpknp9g4EP9Da+MCDkMLjdalbloeBVcUWhUoAChi8ShkffIa1PbF+
         2yj+E3LD5B828Pk2lVYCz//Dnek9DiNb7pBe55dyeSBhObYb6P3pHgY5w7mcJpV51d8y
         JpFA==
X-Gm-Message-State: AOAM532u0RRx9bPqjNpk12K7H1IAcM9vOzqx1e9HaLyMOPYPZAcWtvh+
        gxlsDtwerO6RPTr9y/3j581EnWsSOmoSyEf5aIFJkw==
X-Google-Smtp-Source: ABdhPJw7BO2C1PYECTEtc3I5iKBeb2Gxkis1DlKuq3jNu0GdzNbF3pLixIt7A3UygUGnJxqtVPwf14/05FmYSwMt0Qs=
X-Received: by 2002:a05:6214:400a:b0:431:7f6c:98fc with SMTP id
 kd10-20020a056214400a00b004317f6c98fcmr8728971qvb.122.1645499525424; Mon, 21
 Feb 2022 19:12:05 -0800 (PST)
MIME-Version: 1.0
References: <1645455086-9359-1-git-send-email-quic_vpolimer@quicinc.com> <1645455086-9359-4-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1645455086-9359-4-git-send-email-quic_vpolimer@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 22 Feb 2022 05:26:42 +0300
Message-ID: <CAA8EJpq1U6ZdZu42vg0qpMUxJao+s58ZJfcNh_F-4SBH_E=MJg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm/disp/dpu1: use atomic enable/disable
 callbacks for encoder functions
To:     Vinod Polimera <quic_vpolimer@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        dianders@chromium.org, krzysztof.kozlowski@canonical.com,
        thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
        daniel@ffwll.ch, quic_kalyant@quicinc.com,
        quic_sbillaka@quicinc.com, quic_vproddut@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 21 Feb 2022 at 17:52, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> Use atomic variants for encoder callback functions such that
> certain states like self-refresh can be accessed as part of
> enable/disable sequence.
>
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> Changes in v2:
> - As per review suggestion by Dmitry.
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1e648db..6eac417 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1138,7 +1138,8 @@ void dpu_encoder_virt_runtime_resume(struct drm_encoder *drm_enc)
>         mutex_unlock(&dpu_enc->enc_lock);
>  }
>
> -static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
> +static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc,
> +                               struct drm_atomic_state *state)
>  {
>         struct dpu_encoder_virt *dpu_enc = NULL;
>         int ret = 0;
> @@ -1176,7 +1177,8 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
>         mutex_unlock(&dpu_enc->enc_lock);
>  }
>
> -static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
> +static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc,
> +                               struct drm_atomic_state *state)
>  {
>         struct dpu_encoder_virt *dpu_enc = NULL;
>         struct msm_drm_private *priv;
> @@ -2094,8 +2096,8 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
>
>  static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
>         .mode_set = dpu_encoder_virt_mode_set,
> -       .disable = dpu_encoder_virt_disable,
> -       .enable = dpu_encoder_virt_enable,
> +       .atomic_disable = dpu_encoder_virt_disable,
> +       .atomic_enable = dpu_encoder_virt_enable,
>         .atomic_check = dpu_encoder_virt_atomic_check,
>  };
>
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
