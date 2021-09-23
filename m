Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31835416822
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Sep 2021 00:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243507AbhIWWjT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 18:39:19 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:42984 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243435AbhIWWjS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 18:39:18 -0400
Received: by mail-ot1-f42.google.com with SMTP id 67-20020a9d0449000000b00546e5a8062aso10640806otc.9;
        Thu, 23 Sep 2021 15:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=Ehgc1xr5Jam8rs01fnTSs9+xWvKa7TjfDUqqbms8SFM=;
        b=EfWx/UG51saojKDFSkocmzi/EGnzNf/WF+WJyohEEQ/Mj7Gf3QCE8CWT7dyfTFTSlo
         tnCa7m7Fi3wU0BAZcXCTJg8BYOxvdA1CaE1lCIoRBUbq4hUkXPCrxKCedjtvxUyEUPjy
         xlSQ1QYkFFzSAZ8WYqX8rLDZLiTOjJw6wuJyqHjN1wJWJmlDbVWS3z5wmtZk5Sb6k5J2
         vjbvSqzpkMpTevdOgWEiytZix/i2MKrtq/IvOB5UuwlcYkRRAAeNHcRaGyks49j3eEVE
         p+RSP2TMvcUM8BKUofzUDfZbQS+D//F14TnEb4yDRpDxA0xthpEAvdyGDtUrXBSokhYj
         qSlw==
X-Gm-Message-State: AOAM530eKyeKQHnvvmijS9xgSKNwwGGaJEJ3d5BEXqNgsQl3F3ChtckD
        ngMPS11qgEW2ZaagDVXANQ==
X-Google-Smtp-Source: ABdhPJwj1wLAwPAv3L4kDbu+Gbdkli0LQ9Qk3w+P6ZcTiRweD/dfoVdrfHXQCJO3GlOE4TtvHXQa2g==
X-Received: by 2002:a05:6830:18d0:: with SMTP id v16mr982743ote.177.1632436666136;
        Thu, 23 Sep 2021 15:37:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id t21sm572335otr.13.2021.09.23.15.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 15:37:45 -0700 (PDT)
Received: (nullmailer pid 3653406 invoked by uid 1000);
        Thu, 23 Sep 2021 22:37:43 -0000
From:   Rob Herring <robh@kernel.org>
To:     Rajesh Patil <rajpat@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>, msavaliy@qti.qualcomm.com,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        rnayak@codeaurora.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, saiprakash.ranjan@codeaurora.org,
        sboyd@kernel.org, dianders@chromium.org, skakit@codeaurora.org,
        mka@chromium.org
In-Reply-To: <1632399378-12229-2-git-send-email-rajpat@codeaurora.org>
References: <1632399378-12229-1-git-send-email-rajpat@codeaurora.org> <1632399378-12229-2-git-send-email-rajpat@codeaurora.org>
Subject: Re: [PATCH V10 1/8] dt-bindings: spi: Add sc7280 support
Date:   Thu, 23 Sep 2021 17:37:43 -0500
Message-Id: <1632436663.381520.3653405.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 23 Sep 2021 17:46:11 +0530, Rajesh Patil wrote:
> Add compatible for sc7280 SoC.
> 
> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
> Change in V10:
>  - As per Stephen's comments,
>    sorted compatible names in alphabet order
> 
> Changes in V9:
>  - No changes
> 
> Changes in V8:
>  - As per Doug's comments, added "qcom,sc7280-qspi" compatible
> 
>  Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1531702


spi@88dc000: compatible:0: 'qcom,qspi-v1' is not one of ['qcom,sc7280-qspi', 'qcom,sdm845-qspi']
	arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dt.yaml

spi@88dc000: compatible: ['qcom,qspi-v1'] is too short
	arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dt.yaml

spi@88dc000: interconnect-names: ['qspi-config'] is too short
	arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dt.yaml
>From nobody Thu Sep 23 17:37:11 2021
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: Taniya Das <tdas@codeaurora.org>, marijn.suijten@somainline.org, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, martin.botka@somainline.org, Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, angelogioacchino.delregno@somainline.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, jamipkettunen@somainline.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Michael Turquette <mturquette@baylibre.com>, ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <20210923162645.23257-1-konrad.dybcio@somainline.org>
References: <20210923162645.23257-1-konrad.dybcio@somainline.org>
Subject: Re: [PATCH v4 1/9] dt-bindings: clk: qcom: Add bindings for MSM8994 GCC driver
Status: RO
Content-Length: 4225
Lines: 83

On Thu, 23 Sep 2021 18:26:34 +0200, Konrad Dybcio wrote:
> Add documentation for the MSM8994 GCC driver. While at it, retire its
> compatible from the old, everyone-get-in-here file.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes since v3:
> - Don't document the compatible twice
> 
>  .../bindings/clock/qcom,gcc-msm8994.yaml      | 70 +++++++++++++++++++
>  .../devicetree/bindings/clock/qcom,gcc.yaml   |  2 -
>  2 files changed, 70 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1531778


clock-controller@100000: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dt.yaml
	arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dt.yaml
	arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dt.yaml
	arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dt.yaml
	arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dt.yaml
	arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dt.yaml

clock-controller@1800000: '#power-domain-cells' is a required property
	arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dt.yaml
	arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dt.yaml
	arch/arm/boot/dts/qcom-ipq4018-jalapeno.dt.yaml
	arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1-c1.dt.yaml
	arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dt.yaml
	arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c3.dt.yaml
	arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dt.yaml
	arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c2.dt.yaml

clock-controller@900000: '#power-domain-cells' is a required property
	arch/arm/boot/dts/qcom-apq8060-dragonboard.dt.yaml
	arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml
	arch/arm/boot/dts/qcom-msm8660-surf.dt.yaml
	arch/arm/boot/dts/qcom-msm8960-cdp.dt.yaml

clock-controller@900000: 'thermal-sensor@900000' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/qcom-ipq8064-ap148.dt.yaml
	arch/arm/boot/dts/qcom-ipq8064-rb3011.dt.yaml

clock-controller@fc400000: 'clock-names' is a required property
	arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dt.yaml
	arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dt.yaml
	arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dt.yaml
	arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dt.yaml

clock-controller@fc400000: 'clocks' is a required property
	arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dt.yaml
	arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dt.yaml
	arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dt.yaml
	arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dt.yaml
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dt.yaml

gcc@1800000: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml

gcc@1800000: '#power-domain-cells' is a required property
	arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml

