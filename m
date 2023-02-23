Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB4A6A097C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Feb 2023 14:06:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234296AbjBWNGj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Feb 2023 08:06:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233771AbjBWNGi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Feb 2023 08:06:38 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FCDB5455B
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 05:06:35 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-536c02c9dfbso179895647b3.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 05:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l976B99XbUna08WmeRhXUm4UkQfISnSwvYYzr2+N86c=;
        b=qCFX28+RmwbMs9tpeR19tdUmhwjV+3IV4aF4Gydv6qUmejZ3SQkwml0zKgGQqTA5xf
         X87HDDK8AjUvFyv20SDTeZykRVX6IHWtD50HEih7dCcq5NnMleFAr+IBxzoP0o+CR+q5
         8tSUkIN9QpxSaGMo6trcYpUNBPxbBzI4Yqltz+Wb+a0YGnm+W3kPkf3Wssh6QAsX1Vum
         c8AFxcbjdk+HNUEYWbU/Epcwpq0GliRbp7PS7iqSwwWRclarjnxBsKhQU9+MyKI+gtI4
         HMD9W+g8dl1VxiDvITDL+L2EwaNSFADD1Cq8iaV1qBArlRlnem9lsC/LuL5RaWe9kKTj
         F6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l976B99XbUna08WmeRhXUm4UkQfISnSwvYYzr2+N86c=;
        b=v+csTBbF8U5SLCqnbFPwi8FDZmgdmkvcfBp7JtdzwAfu974yZniNjIYZ0gDRp9GLNC
         fRCtTkalaHqZPQLC5DLtqUzz3WZ75dyePpH4LCZQxhaCj++JmH5HpOwIB5U9I0dqJSTA
         16uD0gOmt+dX05jtGZlqFqP7DeKAMBD1yJZWSNwv6YGANPv32LdCkl81LM3+w9nlR9Ru
         HsH66wJiZkmQwJ9Me4bwAnY9KVxuQdyE0TLLew/8dONbfEWkOxO/kh0PtBagZQIuDI0b
         oXysLbzEgvdqDbnfvqFMwq02zvX782b7ujOjjtg7a5xwBGeuKx0PhBy/QW0XyPR122sw
         wRNQ==
X-Gm-Message-State: AO0yUKX1rkxWw72y3VkxGcQ+KLchTjGqjESVpznGJVYboPkqIcy9INJT
        tcEjo9SVN3XaGystRu2dPG9W4xzGzV0hg/1NuQegyg==
X-Google-Smtp-Source: AK7set/2vMOCqRHFpmTtAlE31OFzB2vTZ54A1Ly7Gmtm4/ZMrRWyA2L4L3oNl/nq0kGy+urTZ86JLF9PtiPqWxqc8CU=
X-Received: by 2002:a05:6902:138d:b0:a09:314f:9f09 with SMTP id
 x13-20020a056902138d00b00a09314f9f09mr2255202ybu.6.1677157594719; Thu, 23 Feb
 2023 05:06:34 -0800 (PST)
MIME-Version: 1.0
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org> <20230223-topic-gmuwrapper-v3-10-5be55a336819@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v3-10-5be55a336819@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 23 Feb 2023 15:06:24 +0200
Message-ID: <CAA8EJppi45K0hQ=1fZvf+Mps+4uEkXmLFeqdmyk-yk31CNvUsw@mail.gmail.com>
Subject: Re: [PATCH v3 10/15] drm/msm/a6xx: Fix A680 highest bank bit value
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
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

On Thu, 23 Feb 2023 at 14:07, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> According to the vendor sources, it's equal to 16, which makes hbb_lo
> equal to 3.

I think we might be stricken with the ddr kind difference here, but I
would not bet on it.

>
> Fixes: 840d10b64dad ("drm: msm: Add 680 gpu to the adreno gpu list")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index b5017c56fa1b..2c4afecdd213 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -885,12 +885,18 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>                 hbb_lo = 2;
>         }
>
> -       if (adreno_is_a640_family(adreno_gpu)) {
> +       if (adreno_is_a640(adreno_gpu)) {
>                 amsbc = 1;
>                 /* HBB = 15 */
>                 hbb_lo = 2;
>         }
>
> +       if (adreno_is_a680(adreno_gpu)) {
> +               amsbc = 1;
> +               /* HBB = 16 */
> +               hbb_lo = 3;
> +       }
> +
>         if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu)) {
>                 amsbc = 1;
>                 /* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
>
> --
> 2.39.2
>


-- 
With best wishes
Dmitry
