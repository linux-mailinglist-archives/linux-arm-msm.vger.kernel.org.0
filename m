Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66DAB61399A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 16:02:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231641AbiJaPCZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 11:02:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbiJaPCY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 11:02:24 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75B9C11178
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 08:02:23 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id k2so30164685ejr.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 08:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uL4PrDj5gli4X0a8PdtqmurG3bEAKsPydYX1NP0DejI=;
        b=jiVRAH5CfODtEh+cnTJ2FqjRdB4Wns6asedhARHD/mxNwvo2nG6lZTs9D8B4QVhsY6
         Asc92/Ale0tmV3oBah6znoIPArTchbPdgHsUaBOZWklyQ6oHjRYSqdB2pVgMw9IuJzqB
         M3XO20sfrgg4XypxBix5+2zvxzlt653lztXIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uL4PrDj5gli4X0a8PdtqmurG3bEAKsPydYX1NP0DejI=;
        b=PRCiyayOekdjeWPiqK9boOs6+2vXWABBvpjxD9TEoq0qGePcdhcD8/kMgwmIREWeTj
         WQljMzh2qQmFQaQhjkgPcFSzbljhUzfXPIaA8mOJ6rBjP7ySwBuBDyQA2ZLsxPa+6w0z
         rhw8GDYRXc65reaPjQAOuAghXMlAWyvHaQFIBSdUv17RtGxj+i/zpkAokzEOIixd9jpg
         xcg29Q/QHFezLD16S+fS50vreGC/VGNRwqfPf/AMs8GwB/LvUYYeTNeeSZhYK2ci8g8L
         Xf2AF9Bt/mMvBPo9vF/OZzkmXFfEfWlRYTKdCaRfdJK5FO5Q7A+fBtcz0ahWpx8VZ7Uq
         MKMw==
X-Gm-Message-State: ACrzQf0u7OYWey0OHbCRtUFpGhO7SP74HPx417VtsZhZ9liOBZlYEaF2
        jXQTa6Og6r4O/9EOCwAFiMDMa9zlV0j5xA==
X-Google-Smtp-Source: AMsMyM5gC4pYtkl+xh+6xmek59P/YUZ+GEYttv7gcLaze8tozI0nIAZDjg5XIDsLJVsEthXzrZsrUA==
X-Received: by 2002:a17:906:8a4b:b0:7a7:3e17:7f91 with SMTP id gx11-20020a1709068a4b00b007a73e177f91mr13403158ejc.331.1667228541698;
        Mon, 31 Oct 2022 08:02:21 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id g1-20020a1709061c8100b00781d411a63csm3073750ejh.151.2022.10.31.08.02.19
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 08:02:20 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso10970589wma.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 08:02:19 -0700 (PDT)
X-Received: by 2002:a05:600c:5114:b0:3c7:8eb:fb28 with SMTP id
 o20-20020a05600c511400b003c708ebfb28mr8224980wms.93.1667228538568; Mon, 31
 Oct 2022 08:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221031102011.136945-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20221031181735.v9.4.I9718ac3622fa550e432209ae5c95c87b873a0f87@changeid>
In-Reply-To: <20221031181735.v9.4.I9718ac3622fa550e432209ae5c95c87b873a0f87@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 31 Oct 2022 08:02:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xy70nvzSmBxGB7iffo5F2jtp6WuUhNBeWo7rE70jewBQ@mail.gmail.com>
Message-ID: <CAD=FV=Xy70nvzSmBxGB7iffo5F2jtp6WuUhNBeWo7rE70jewBQ@mail.gmail.com>
Subject: Re: [PATCH v9 4/4] arm64: dts: qcom: sc7280: include
 sc7280-herobrine-audio-rt5682.dtsi in evoker
To:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Oct 31, 2022 at 3:20 AM Sheng-Liang Pan
<sheng-liang.pan@quanta.corp-partner.google.com> wrote:
>
> Include sc7280-herobrine-audio-rt5682.dtsi in evoker
> as it uses rt5682 codec.
>
> Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
> ---
>
> Changes in v9:
> - new patch for evoker include rt5682.dtsi
>
>  .../boot/dts/qcom/sc7280-herobrine-evoker.dts | 132 ++++++++++++++++++
>  1 file changed, 132 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dts
> index dcdd4eecfe670..d54c07ff35f4f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dts

Why are you modifying the "evoker.dts" file and not the "evoker.dtsi"
file? Does the LTE SKU not have rt5682 audio?


> @@ -8,8 +8,140 @@
>  /dts-v1/;
>
>  #include "sc7280-herobrine-evoker.dtsi"
> +#include "sc7280-herobrine-audio-rt5682.dtsi"
> +
>
>  / {
>         model = "Google Evoker";
>         compatible = "google,evoker", "qcom,sc7280";
>  };
> +
> +&sound {

This is sorted incorrectly. "&sound" sorts under "&lpass".

...though looking closer at everything, I suspect that you're going to
need to reorganize things anyway. See below.


> +       model = "sc7280-rt5682-max98360a-3mic";
> +
> +       audio-routing =
> +               "VA DMIC0", "vdd-micb",
> +               "VA DMIC1", "vdd-micb",
> +               "VA DMIC2", "vdd-micb",
> +               "VA DMIC3", "vdd-micb",
> +
> +               "Headphone Jack", "HPOL",
> +               "Headphone Jack", "HPOR";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +       dai-link@0 {
> +               link-name = "MAX98360";
> +               reg = <0>;
> +
> +               cpu {
> +                       sound-dai = <&lpass_cpu MI2S_SECONDARY>;
> +               };
> +
> +               codec {
> +                       sound-dai = <&max98360a>;
> +               };
> +       };

The way you have things organized right now, technically the entire
"dai-link@0" here should be removed. Why? You're already getting it
from "sc7280-herobrine-audio-rt5682.dtsi". ...so I would say just to
remove it, but... (see below for more).


> +       dai-link@1 {
> +               link-name = "DisplayPort";
> +               reg = <1>;
> +
> +               cpu {
> +                       sound-dai = <&lpass_cpu LPASS_DP_RX>;
> +               };
> +
> +               codec {
> +                       sound-dai = <&mdss_dp>;
> +               };
> +       };

So dai-link@1 is confusing. You're fully overriding all of the
properties that you inherited by including
"sc7280-herobrine-audio-rt5682.dtsi". It happens to work because you
override _all_ of the properties, but it's a sign that something isn't
quite right. It feels like you are diverging _too much_ from
"sc7280-herobrine-audio-rt5682.dtsi"

My suggestion is that, instead of doing it this way, you:

1. Fully copy "sc7280-herobrine-audio-rt5682.dtsi" to a new file
called "sc7280-herobrine-audio-rt5682-3mic.dtsi".

2. Accept that there will be some duplication between the normal and
the 3mic version. I think there are enough differences that the
duplication is better than the spaghetti of overrides.

3. Try to make it so that diffs between the normal and "3mic" version
are as clean as possible so someone comparing the files can see the
exact differences.


> +       dai-link@2 {
> +               link-name = "ALC5682";
> +               reg = <1>;

Something is wrong with the above node. Your unit address (dai-link@2)
doesn't match your reg (reg = <1>;).
