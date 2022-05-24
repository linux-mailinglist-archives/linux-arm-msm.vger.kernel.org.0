Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A92AD5333CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 May 2022 01:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242531AbiEXXNv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 May 2022 19:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242527AbiEXXNt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 May 2022 19:13:49 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1405BE49
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 16:13:48 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id i27so38278664ejd.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 16:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c2gM35Ozz8+cKOIVvSmbVXl7QcMD4o/pnEQk9wTKJw0=;
        b=Hv46XFNR+3YrOPGIN071GPXAYPwUskaj0nAqXdTNj/WE6SrLkmoYP/FM70hm1I6tz1
         f2lHlHgri2fvt8hVNHYFPEehHoY+tag4f1cIVEkLWs24IFHc6EHplAKOjDAPWi5co1xo
         /jOb0ylRTzyuseYrHA0dc5ml6jawr6PJ0yjnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c2gM35Ozz8+cKOIVvSmbVXl7QcMD4o/pnEQk9wTKJw0=;
        b=kEtf/XuTx4+1TswLzmphCLtANTRdG0JGv9h+ON7Zbs6Tv1hkgU/VuyIyuWwi/1ZlJX
         FEMiBqFh3Mh3thjKhG0dccEVFo3LveG7DBKBMeoTAKBBv1LAcV7mqWRMmfLugpNpMWP3
         dAhsugCtmLrcvAURpLd2ng1SceLoDRCxqwqKimIteemL7jxgrlCCODtQZec2ofOl5XWI
         wqmBjuKbaEsFF5OsQdJp3pd2yVa0fh8O6GSVC4ENmeAq08ns3OSpiHEyVPiVie6nmz9P
         sWmd34MKCMcMZft/gpR25uykZimIfnGkuFgHH98NRgMiKBIb3ulh5TxFTGPbqn2CFfj0
         fctg==
X-Gm-Message-State: AOAM531WOXy5q6hjtFkfSp3CUMZFh5RFSjwlb5ADhcJojks3Mk6ArOla
        eKJ96ostqzvjSZ/5vPNjGusJImdm+AbxZA==
X-Google-Smtp-Source: ABdhPJwqYEIM0OpgciGO++bAY7I0eXwtorMBYXyAlZV7CHZ5LgqALrAhncJcET4z5OuOu5lymNk9KQ==
X-Received: by 2002:a17:906:4786:b0:6fe:a063:ceb8 with SMTP id cw6-20020a170906478600b006fea063ceb8mr23901830ejc.265.1653434027034;
        Tue, 24 May 2022 16:13:47 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id d23-20020a50fe97000000b0042ac2b71078sm9897038edt.55.2022.05.24.16.13.46
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 May 2022 16:13:46 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id v4-20020a1cac04000000b00397001398c0so101385wme.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 16:13:46 -0700 (PDT)
X-Received: by 2002:a7b:c143:0:b0:397:4d12:244c with SMTP id
 z3-20020a7bc143000000b003974d12244cmr5889978wmi.29.1653434025754; Tue, 24 May
 2022 16:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <1653313421-29105-1-git-send-email-quic_vgarodia@quicinc.com>
In-Reply-To: <1653313421-29105-1-git-send-email-quic_vgarodia@quicinc.com>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Tue, 24 May 2022 16:13:33 -0700
X-Gmail-Original-Message-ID: <CAMfZQbwJ14eZq7tMuTo8PEjdmFEXgzD5RQ8m4H=iO_4YT+=ymw@mail.gmail.com>
Message-ID: <CAMfZQbwJ14eZq7tMuTo8PEjdmFEXgzD5RQ8m4H=iO_4YT+=ymw@mail.gmail.com>
Subject: Re: [PATCH v2] media: venus: hfi_platform: Correct supported codecs
 for sc7280
To:     Vikash Garodia <quic_vgarodia@quicinc.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        "Viswanath Boma (Temp)" <vboma@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 23, 2022 at 12:32 PM Vikash Garodia
<quic_vgarodia@quicinc.com> wrote:
>
> VP8 codec is deprecated for sc7280 SOC. Fix in platform layer to
> update the supported codecs accordingly.
>
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
> Change since v1:
>  Review comments addressed(from Stanimir)
>
>  drivers/media/platform/qcom/venus/hfi_parser.c   |  6 ++++--
>  drivers/media/platform/qcom/venus/hfi_platform.c | 22 ++++++++++++++++++++++
>  drivers/media/platform/qcom/venus/hfi_platform.h |  2 ++
>  3 files changed, 28 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
> index 5b8389b..6cf74b2 100644
> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
> @@ -234,6 +234,7 @@ static int hfi_platform_parser(struct venus_core *core, struct venus_inst *inst)
>         const struct hfi_plat_caps *caps = NULL;
>         u32 enc_codecs, dec_codecs, count = 0;
>         unsigned int entries;
> +       int ret;
>
>         plat = hfi_platform_get(core->res->hfi_version);
>         if (!plat)
> @@ -242,8 +243,9 @@ static int hfi_platform_parser(struct venus_core *core, struct venus_inst *inst)
>         if (inst)
>                 return 0;
>
> -       if (plat->codecs)
> -               plat->codecs(&enc_codecs, &dec_codecs, &count);
> +       ret = hfi_platform_get_codecs(core, &enc_codecs, &dec_codecs, &count);
> +       if (ret)
> +               return ret;
>
>         if (plat->capabilities)
>                 caps = plat->capabilities(&entries);
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform.c b/drivers/media/platform/qcom/venus/hfi_platform.c
> index f16f896..f07f554 100644
> --- a/drivers/media/platform/qcom/venus/hfi_platform.c
> +++ b/drivers/media/platform/qcom/venus/hfi_platform.c
> @@ -2,7 +2,9 @@
>  /*
>   * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>   */
> +#include <linux/of_device.h>
>  #include "hfi_platform.h"
> +#include "core.h"
>
>  const struct hfi_platform *hfi_platform_get(enum hfi_version version)
>  {
> @@ -66,3 +68,23 @@ hfi_platform_get_codec_lp_freq(enum hfi_version version, u32 codec, u32 session_
>         return freq;
>  }
>
> +int
> +hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codecs, u32 *count)
> +{
> +       const struct hfi_platform *plat;
> +
> +       plat = hfi_platform_get(core->res->hfi_version);
> +       if (!plat)
> +               return -EINVAL;
> +
> +       if (plat->codecs)
> +               plat->codecs(enc_codecs, dec_codecs, count);
> +
> +       if (of_device_is_compatible(core->dev->of_node, "qcom,sc7280-venus")) {
> +               *enc_codecs &= ~HFI_VIDEO_CODEC_VP8;
> +               *dec_codecs &= ~HFI_VIDEO_CODEC_VP8;
> +       }
> +
> +       return 0;
> +}
> +
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
> index 1dcf408..ec89a90 100644
> --- a/drivers/media/platform/qcom/venus/hfi_platform.h
> +++ b/drivers/media/platform/qcom/venus/hfi_platform.h
> @@ -66,4 +66,6 @@ unsigned long hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 code
>                                               u32 session_type);
>  unsigned long hfi_platform_get_codec_lp_freq(enum hfi_version version, u32 codec,
>                                              u32 session_type);
> +int hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codecs,
> +                           u32 *count);
>  #endif
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>

Tested-by: Fritz Koenig<frkoenig@chromium.org>
