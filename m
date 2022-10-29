Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3695F61251F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 21:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbiJ2T1F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Oct 2022 15:27:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiJ2T1E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Oct 2022 15:27:04 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B94C8371B2
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 12:27:03 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id 13so20435484ejn.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 12:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EXBb2KmYy3ncxj7dKkH0trJ5gNOnsu1rYOjk7rftcsw=;
        b=EIRsEPaxOhKa2mqvXJS8AcT7VCw2lvmMNBMC8u27uFMEheVD2gUM5hWkn4EVtLCCA3
         lrdJe5aoYawDIfx5ECQ9ZO7QIRGxKgWhFrNyAqn/Vmjl4XCPXaROH+Ghx6NwZgSdvxFE
         ETP7oLZSdSMVJIRKclqyhWRK+MPHteSk0gEXEsYjsJ6PtMy96CLnrMoGpaYwN4cldluv
         QPETofSvZXJmgVeD49uhkEf6keORYF9lyPFxnxnxEgMq308P2DT0K9QrIfYDPKfIJFWr
         maCyBHE8EWED7JBEH8fcyr+YdvRt8t/T+wPcNaPx01+ODYPgj7ZCMnGOwjnM8PL+SsNn
         sv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EXBb2KmYy3ncxj7dKkH0trJ5gNOnsu1rYOjk7rftcsw=;
        b=XOMRYDSDhXHO7z9d0DwyTQeadyaI1wHCP8rQ/ysx56ziwlYwnMmR6mZGMrljrFml5g
         6eLI1DWm1X+SGImN6p14/BKeAzfoce/MhEpNrZDWD9XZfgrISzBtkOuPDrZRWFiLBfFp
         Ebi7UjVHVKUPXMghIBUMuwzVg99ujXN3S512E49gd7db78FD7d3vT7uItB19Dry9XOAl
         Hg8wCOOhGUvi7Y8cQOzWad+ZaNOJlgzMS/xsnc3suibkw/8dxvuZT00VZJ5Rl1EVB5Ji
         HoTVl52GyA6zzofOnOnucSGYk6PpxA4MKVb9eOz5gugO4t3fa1W8d37kH951iMV89sc2
         SN3A==
X-Gm-Message-State: ACrzQf328LM96jHPsQvUlTQRbbx91D814leOwThhQ9IRt6VwAMa4CmMK
        pON28Ruw2KG/VBpowKzC7mrlaDXbdO3adbBro4DLGA==
X-Google-Smtp-Source: AMsMyM5KMRnudNBo/IcXctcMQsq2cC3UFJwBzJdDsyJN/jzFa11L+XbhckUl1zm/xuCma59yDYOpZatiuI2vixTMeRE=
X-Received: by 2002:a17:907:75c1:b0:79b:f804:c081 with SMTP id
 jl1-20020a17090775c100b0079bf804c081mr5041794ejc.381.1667071622257; Sat, 29
 Oct 2022 12:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <20221029051449.30678-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20221029051449.30678-1-manivannan.sadhasivam@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
Date:   Sat, 29 Oct 2022 14:26:50 -0500
Message-ID: <CAKXuJqg6Ggh=amGJj2B5gT+bBKY035iBmj_YiGFO8CYOh+NMBA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] sc8280xp-pmic updates and X13s thermal zone support
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        johan+linaro@kernel.org, quic_jprakash@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Oct 29, 2022 at 12:15 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> Hello,
>
> This series adds below updates to sc8280xp-pmics:
>
> PM8280_{1/2}:
> - Temp alarm
> - Thermal zones
> - VADC channels
> - ADC_TM5 channels
>
> PMK8280:
> - ADC7 block
> - VADC channels
> - TM5 block
>
> PMR735A:
> - VADC channels
>
> Also adds the thermal zone support to Lenovo X13s based on the thermistor
> SYS_THERM6 that provides the laptop skin temperature.
>
> The sc8280xp-pmics is based on the new PMIC7 architecture. In this, all the
> ADC/TM5 measurements are collected by the primary PMIC PMK8280 from other
> slave PMICs PM8280_{1/2}, PMR735A using the Programmable Boot Sequence (PBS)
> and exposed them over the individual channels.
>
> PMK8280 uses the Slave ID (SID) for identifying each slave PMICs in a system.
> This ID is not static for each PMIC but rather set for each platform by the
> hardware designers. So this series allows the configurable SID by modifying the
> binding to accept SID values instead of hardcoding them.
>
> This series is tested on Lenovo X13s laptop by monitoring the temperature of
> the 8 on-board thermistors through IIO interface. The thermal zone support is
> validated by adding loads to the CPUs and making sure the skin temperature stays
> below the threshold provided in DT.
>
> Thanks,
> Mani
>
> Changes in v2:
>
> * Fixed issues reported by Krzysztof and "make dtbs_check"
> * Collected reviews from Krzysztof
> * Added the Lenovo X13s thermal zone patch
>
> Manivannan Sadhasivam (12):
>   dt-bindings: iio: qcom: adc7-pm8350: Allow specifying SID for channels
>   arm64: dts: qcom: sc8280xp-pmics: Add temp alarm for PM8280_{1/2}
>     PMICs
>   arm64: dts: qcom: sc8280xp-pmics: Add thermal zones for PM8280_{1/2}
>     PMICs
>   arm64: dts: qcom: sc8280xp-pmics: Add support for PMK8280 RESIN input
>   arm64: dts: qcom: sc8280xp-pmics: Add PMK8280 ADC7 block
>   arm64: dts: qcom: sc8280xp-pmics: Add support for TM5 block in PMK8280
>   arm64: dts: qcom: sc8280xp-x13s: Enable PMK8280 RESIN input
>   arm64: dts: qcom: sc8280xp-x13s: Add PMK8280 VADC channels
>   arm64: dts: qcom: sc8280xp-x13s: Add PM8280_{1/2} VADC channels
>   arm64: dts: qcom: sc8280xp-x13s: Add PMR735A VADC channel
>   arm64: dts: qcom: sc8280xp-x13s: Add PM8280_{1/2} ADC_TM5 channels
>   arm64: dts: qcom: sc8280xp-x13s: Add thermal zone support
>
>  .../bindings/thermal/qcom-spmi-adc-tm5.yaml   |   6 +-
>  .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 204 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi  |  83 +++++++
>  .../dt-bindings/iio/qcom,spmi-adc7-pm8350.h   |  90 ++++----
>  4 files changed, 333 insertions(+), 50 deletions(-)
>
> --
> 2.25.1
>
Tested-by: Steev Klimaszewski <steev@kali.org>
