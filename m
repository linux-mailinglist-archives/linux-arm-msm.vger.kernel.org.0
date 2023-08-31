Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5199578E3E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Aug 2023 02:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244595AbjHaAZC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 20:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242695AbjHaAZB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 20:25:01 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7346CD2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 17:24:55 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-d73c595b558so108875276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 17:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693441495; x=1694046295; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wE7oiFJoR9KfWY52ArAEgPG+Y/Fo2kX4EkxDGcD8QAY=;
        b=mpsPFO4eMT6jxnpRn1Zg6c+snRaFTJPnKrsKny5oAX94/Qsb5xOTI44Rh7TsTQ8LAK
         ktk2+sfaZkgbyu1/4sJXDFfPj7Dr8QSqZpjLv6fZP2GgOrddKeuT1QKDcybazSpAPSgD
         5GIel4h6UsbBYBk3DovECFrzlAU3s5S161ZGGxDddwXhMSIcjB41tC4nCwpXZLQVUSJI
         wBX0XLJI5rH9BA9ZV33kLhQ5pBOymlz8QXsZOcz5p7mH/5wK8AvYRYCIiYGE5SqF0NP8
         tR/Wpvf9WEhwoeedDO4VVN99jP16YeI7gUE2irKmmdZD0JnjHS2EA+GnI7xwP2JKPZuw
         /nCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693441495; x=1694046295;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wE7oiFJoR9KfWY52ArAEgPG+Y/Fo2kX4EkxDGcD8QAY=;
        b=VJ5xIVTvjlI8CMhB9v35dqg0j9aOhWzfxpUUCaIsSIaBegObIPkTMPVaiXewVgyhTC
         /GAHyaJ0QAiN9mmmTehTqXLmV4Ivaiym3Wyjk09lnAqKcxpkQLDrizGK6nAe1zcr0FOQ
         PdLliJzwO+oRLSrvpRRpC+o34gQsg8Up6CdOQM9JL4R3qa6glnoOb1IZdl9PIZR8wAZj
         Uzt6iNLHz8++7XOPLBatXFQMPj/8d+8HsSH0YDpvmItu11gKbdIEI2cFN3porCwaZ0ag
         rN6xxI9HGKxQ1k5ed6qE1u0fWRahiV1+YFJezjAlpk4+f/npdfPoYTV2iAL6B9cQyP+L
         bZfw==
X-Gm-Message-State: AOJu0YwHP73wNJUhHvDGUv144IAioMFzM+O3PWav9L+keCZJ7xVDTbEN
        qbhg1SmsT0h5J3Km2SZK/JFtFD/UFB7Lz8wJeYTJtQ==
X-Google-Smtp-Source: AGHT+IGDrpoIANqhoS8W6TCVcYzFB0D2zfRP/P4a1pikuoYb3lQsJ+AISYlrnw9s5BBfQK3HzdDbQ+iuUI75raDCxew=
X-Received: by 2002:a25:b9c6:0:b0:d7b:8c90:ce5b with SMTP id
 y6-20020a25b9c6000000b00d7b8c90ce5bmr3238476ybj.63.1693441495006; Wed, 30 Aug
 2023 17:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com> <20230830224910.8091-15-quic_abhinavk@quicinc.com>
In-Reply-To: <20230830224910.8091-15-quic_abhinavk@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 31 Aug 2023 03:24:44 +0300
Message-ID: <CAA8EJprZma-e=zbtDuGKfcHK7zTaSykACt+=rh7W92iEpif=Ug@mail.gmail.com>
Subject: Re: [PATCH 14/16] drm/msm/dpu: do not allow YUV formats if no CDM
 block is present
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com,
        quic_parellan@quicinc.com, quic_khsieh@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> On chipsets where CDM block is not available OR where support has
> not been added yet do not allow YUV formats for writeback block.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index 7fc174b33ae2..d8edca9bc964 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -406,6 +406,12 @@ static int dpu_encoder_phys_wb_atomic_check(
>                 return ret;
>         }
>
> +       if (DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(fb))) &&
> +           !phys_enc->dpu_kms->catalog->cdm) {
> +               DPU_ERROR("cannot support YUV formats without CDM block\n");
> +               return -EINVAL;
> +       }

Can we have YUV formats in wb_formats if we do not support CDM? That
would be an error.

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
