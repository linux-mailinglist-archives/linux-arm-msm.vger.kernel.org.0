Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA4C259C67D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Aug 2022 20:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235078AbiHVShA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 14:37:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236877AbiHVSg7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 14:36:59 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1F0A2E9F1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 11:36:58 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id w19so22995788ejc.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 11:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=+WwoP89naLFw376J31mZC0baqAJeBhnYDrkPNXljcJ4=;
        b=lJMf+tYZ7J2q8o7OYUpHOIMdrGH70ce5L+DWiPnndbCDB5fygnig4PXs0ZYAtqh5QM
         03sVuyelBIukUpsbwEVRY8e8WolKhVq6nCuDwUxP7TaoqxOEYv5qJm68OcmFzQYvEJaD
         kRo9wAFEkcT8is3jRGgy0qOHt2ck7swchXvcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=+WwoP89naLFw376J31mZC0baqAJeBhnYDrkPNXljcJ4=;
        b=VQzCIzi+0AKj8KmTgDZoG6xI4c9FPF6vQd3dhPcygiJGxtHJQ0+Wvtl2d+vP4p6dZ1
         J61GflZmfhm7050hTZbZYQ507Kjqm1Eoc4K72QtHSgNDyvQTzoaZjvM0yB3ozauSDB1N
         PisNFRLfGRg/SwYIg30ssZvCy8Mw0Cl7q9GsgneTqxvPw2F9FJSypfeankoeXnGikPxT
         54QiYkeZ/krPcl0mgJS1UXBaOvJHzCRuPAdT/WSoK4yCDanc/uFBOWjDpwDzjsJ06NRA
         Hw7CPeeQ6pBhj6dXz4TbD5hOfHLXJj038GEfON56VzQ4nCr8BjSRXIBHv9g5UeCNiXYg
         cY4Q==
X-Gm-Message-State: ACgBeo05aVvBT0FjtsCAi+lP9PIrlUL+SLpeTx1LbwkimxiotX3UfbKt
        7wqJdHikGpjFSnUYCEPkdS9D8mqMdhfX4w1V
X-Google-Smtp-Source: AA6agR6FjqEZ+LAM/NOdv7wIAdMiZn463gWOYhPfUaiVZ6By0S4bXC3S/1qNzan6+WBllk2dnZqCsA==
X-Received: by 2002:a17:907:3f98:b0:730:cfce:9c0f with SMTP id hr24-20020a1709073f9800b00730cfce9c0fmr13940852ejc.475.1661193417134;
        Mon, 22 Aug 2022 11:36:57 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id z22-20020a170906435600b007308812ce89sm6571688ejm.168.2022.08.22.11.36.54
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 11:36:55 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id bs25so14307752wrb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 11:36:54 -0700 (PDT)
X-Received: by 2002:a5d:6881:0:b0:225:28cb:332f with SMTP id
 h1-20020a5d6881000000b0022528cb332fmr11502894wru.405.1661193414265; Mon, 22
 Aug 2022 11:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220822062820.1684139-1-judyhsiao@chromium.org>
In-Reply-To: <20220822062820.1684139-1-judyhsiao@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 22 Aug 2022 11:36:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V4rYBdPiUxvtWZdr0ng67CSmCJD4CzigU=XeUV7sa1nA@mail.gmail.com>
Message-ID: <CAD=FV=V4rYBdPiUxvtWZdr0ng67CSmCJD4CzigU=XeUV7sa1nA@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: sc7280: Use "PP1800_L2C" as the DMIC
 power source.
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Judy Hsiao <judyhsiao@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sun, Aug 21, 2022 at 11:28 PM Judy Hsiao <judyhsiao@chromium.org> wrote:
>
> Use "PP1800_L2C" as the DMIC power source to match the hardware
> schematic by:
>    1. Set MIC bias voltage regulator (vdd-micb-supply) to PP1800_L2C.
>    2. In audio-routing, set VA DMIC01~VA DMIC03 to use the vdd-micb-supply
>       setting.
>
> It fixes the DMIC no sound issue of villager-r1.
>
> Co-developed-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> ---
> Changes since V2:
>     -- Update the commit message.
> Changes since V1:
>     -- Update the commit message.
>
> This patch depends on:
> arm64: dts: qcom: sc7280: Add herobrine-villager-r1. [1]
>
> [1] https://patchwork.kernel.org/patch/12926099/
>
> .../dts/qcom/sc7280-herobrine-villager-r1.dts | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dts
> index c03b3ae4de50..983defa7c76d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dts
> @@ -12,3 +12,31 @@ / {
>         model = "Google Villager (rev1+)";
>         compatible = "google,villager", "qcom,sc7280";
>  };
> +
> +&lpass_va_macro {
> +       vdd-micb-supply = <&pp1800_l2c>;
> +};
> +
> +&sound {
> +       audio-routing =
> +                       "IN1_HPHL", "HPHL_OUT",
> +                       "IN2_HPHR", "HPHR_OUT",
> +                       "AMIC1", "MIC BIAS1",
> +                       "AMIC2", "MIC BIAS2",
> +                       "VA DMIC0", "vdd-micb",
> +                       "VA DMIC1", "vdd-micb",
> +                       "VA DMIC2", "vdd-micb",
> +                       "VA DMIC3", "vdd-micb",
> +                       "TX SWR_ADC0", "ADC1_OUTPUT",
> +                       "TX SWR_ADC1", "ADC2_OUTPUT",
> +                       "TX SWR_ADC2", "ADC3_OUTPUT",
> +                       "TX SWR_DMIC0", "DMIC1_OUTPUT",
> +                       "TX SWR_DMIC1", "DMIC2_OUTPUT",
> +                       "TX SWR_DMIC2", "DMIC3_OUTPUT",
> +                       "TX SWR_DMIC3", "DMIC4_OUTPUT",
> +                       "TX SWR_DMIC4", "DMIC5_OUTPUT",
> +                       "TX SWR_DMIC5", "DMIC6_OUTPUT",
> +                       "TX SWR_DMIC6", "DMIC7_OUTPUT",
> +                       "TX SWR_DMIC7", "DMIC8_OUTPUT";
> +
> +};

nit: there's an extra blank line here. Can you send a v4 to fix?

Other than that this looks OK to me, but I suspect that Bjorn will
have a hard time applying this without help. I think someone who is
keeping track of all the audio patches is going to need to provide a
list (or a sample tree) showing what needs to be applied and in what
order. It would be good to confirm that there aren't any outstanding
issues on any of the patches as well. We really don't want to go
another cycle without getting the audio patches landed.

-Doug
