Return-Path: <linux-arm-msm+bounces-4472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBF180F965
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 22:30:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE8AF1C20D23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 21:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3026413B;
	Tue, 12 Dec 2023 21:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a48PMt4j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ABBECD
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 13:30:14 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5d3758fdd2eso60972697b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 13:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702416613; x=1703021413; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VlpWbvexUhGlHNJAFDVrmVYt7WuM+enr1YTAW9UOGnA=;
        b=a48PMt4j87C/YIiqP3Gl7lv0zvMNW8GTEgxtcekfkKQngp7S/1XLfROU/c71KABHuV
         G2PGyYxhP5IbZQQn8+ucCu0WvEAwUXh+EjBIC+VIpO3BpctiZwedJELqxmeKdbVu1n3I
         rEx+EGYwL2LUcj6CI5MeVku4SsbT8oatrwK8/tGP045a8zFCi0YNHYlVn4BPVCEGYoy+
         kfeFeCCVL6zz/Cl5WEEtdWwlYnCIxn1U7qL+E0frWzuRNqloGgHLIJTYFzUpe61yKrgw
         /ZYUogCUw+WGFYoQh4JPW3mhVcccQN+WqAaLfcPodwWp/1FjQ6oJHxzU/GuevkyUF/xW
         HVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702416613; x=1703021413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VlpWbvexUhGlHNJAFDVrmVYt7WuM+enr1YTAW9UOGnA=;
        b=ZuSR9KRJdVBs8KhVgbjzhgwMzik9SVT8vOO4s5JvqlL/5OadsWcx9XD1MiVh6k6hhx
         OHhwdDY7P+IfOMVBr9qqxrPV3aaUYzcyHRE1Pz66OanIsRNL8EEjiVtN1n8LrG9OL4rH
         23C6u8eDRIJF6kEPUsJuxNQ8Frmzn6ine7kRapH4/8Sa9GxgJv/M6vnICQH+rImxSpyD
         t9ooQub3oahfFP79+zTtv6pSdcNtvYpq5XkVkVqWEX3/p8hh4oey15UPEtNWp8JkabGe
         mHfu11Ebx3eL/2RuKGhrzf5SKmEzl+dIyaKHayL2E4sMeuhLk5e1DBqD1afMvAYLbtF9
         NOsQ==
X-Gm-Message-State: AOJu0Ywk9Yr3XLIBYTusQ/BPa+SALhWqn1wEjcsrrkYzSKB8tbSMtexz
	/6+d9G/ezRufyRq/KV1eV9TL1xmlxgmFxBL9T0UA8g==
X-Google-Smtp-Source: AGHT+IFVTRFHws0SaSDJI9xyqMKzMyeyLxK9i288K/Z0ixqQ6uiz13KN6T617psbtjooIQibdRWE7rcO98w06LywAx4=
X-Received: by 2002:a81:a00d:0:b0:5e1:a14f:4648 with SMTP id
 x13-20020a81a00d000000b005e1a14f4648mr2051555ywg.89.1702416613198; Tue, 12
 Dec 2023 13:30:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231212205254.12422-1-quic_abhinavk@quicinc.com> <20231212205254.12422-2-quic_abhinavk@quicinc.com>
In-Reply-To: <20231212205254.12422-2-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Dec 2023 23:30:02 +0200
Message-ID: <CAA8EJpr4X3RLFPfgfnsA+UpiOkV0eRzw_FnrEFykS908YuV9Aw@mail.gmail.com>
Subject: Re: [PATCH v4 01/15] drm/msm/dpu: add formats check for writeback encoder
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	seanpaul@chromium.org, quic_jesszhan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Dec 2023 at 22:53, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> In preparation for adding more formats to dpu writeback add
> format validation to it to fail any unsupported formats.
>
> changes in v4:
>         - change the failure message of the API
>           drm_atomic_helper_check_wb_connector_state() to a generic
>           one in case it checks more errors later and moreoever it
>           already has debug message to indicate its failure
>         - change the corresponding DPU_ERROR to DPU_DEBUG in-line with
>           other atomic_check failure messages
>
> changes in v3:
>         - rebase on top of msm-next
>         - replace drm_atomic_helper_check_wb_encoder_state() with
>           drm_atomic_helper_check_wb_connector_state() due to the
>           rebase
>
> changes in v2:
>         - correct some grammar in the commit text
>
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index bb94909caa25..4953d87affa1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -272,6 +272,7 @@ static int dpu_encoder_phys_wb_atomic_check(
>  {
>         struct drm_framebuffer *fb;
>         const struct drm_display_mode *mode = &crtc_state->mode;
> +       int ret;
>
>         DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
>                         phys_enc->hw_wb->idx, mode->name, mode->hdisplay, mode->vdisplay);
> @@ -308,6 +309,12 @@ static int dpu_encoder_phys_wb_atomic_check(
>                 return -EINVAL;
>         }
>
> +       ret = drm_atomic_helper_check_wb_connector_state(conn_state->connector, conn_state->state);
> +       if (ret < 0) {
> +               DPU_DEBUG("wb check connector state failed ret = %d\n", ret);

We already have a debug message in
drm_atomic_helper_check_wb_connector_state(). Can we please drop this
one?

> +               return ret;
> +       }
> +
>         return 0;
>  }
>
> --
> 2.40.1
>


-- 
With best wishes
Dmitry

