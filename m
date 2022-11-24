Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12245636F15
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Nov 2022 01:48:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbiKXAsK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 19:48:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiKXAsH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 19:48:07 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1358F532D0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 16:48:06 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id a11-20020a05600c2d4b00b003cf6f5fd9f1so181843wmg.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 16:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6YPFVF1eY9/ODmDT3NI20gj5TL4wvhdUoa/GdSB6uN4=;
        b=xImOnWP2Who9GsW9wL7MuY5SPWwHsdXGlbna50GyteErWTOSAbyGsn3tezjS4/ck90
         GnaFwjmMSkvh34UHnZK1NWBPojYS1lPgt9nxKR3hONxSTCLTxARB+HKMNnA1dL7cvDIZ
         O+j95kq753YJ8pW28FA4SFvagHOk+MRGVu26bVoyCTbKMixaNh4066PbLD6bv2rtKPwv
         fqbk2GOQzbxwEwSIl/QYo3vbhTHzPf4AvvPYgpwuoc98f/+fuQD1d1m0gXO5EbZ1mLqO
         Hkg8q7oNlvfN+f4gwEZ2CLW8/ZOz5+DxRgzHdk1B1xcg6h1ETVarRldUuUi/XgPpLHJt
         3SxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6YPFVF1eY9/ODmDT3NI20gj5TL4wvhdUoa/GdSB6uN4=;
        b=xMYW0JPokhGkh8sP3wjf4+Yr4LLuW29aAZbv++eFPtwV+f9B1K8LNZx5FLfUt/eMXE
         aZOeqCBk6c1sRPnq5uN4d59gdeJ1ewRR+U0jPgHJXHolQHwnrlsHnjW9egJ/zin3oIbP
         uZ006sExI02GduDiyJNXYN+2Z/oeoYSTJvMag1L77FVOUPZtjdo0BcjlB1vZ0LlXqFxT
         7r9feDTJTP66GMIWbd/H+CxA82kloDIRcbKlZLug9FG3ytRQd6VzoBKvREnKqfSEJut3
         vfDDEKYDrX0rT48phghxyzqdWaq33gr5tez4vGxmori3+3uuIzdHrI0JIXaLtqsHtkqZ
         dtqA==
X-Gm-Message-State: ANoB5pnco5Rtn4M0Q6tkjUP2ko9tGw2SzquWs6ExsaNi8OHxn7qScjil
        +2vRseivMn0pvkZSo6HeG7wknmlk2T044Q==
X-Google-Smtp-Source: AA0mqf6/zD7eXqbSH9mq7KMYXonPKLW5ymPGsayC+jRgJPCp6lQRRjSgVHkc8u7NgQMmKGrIxMBHKA==
X-Received: by 2002:a7b:cb83:0:b0:3cf:96da:3846 with SMTP id m3-20020a7bcb83000000b003cf96da3846mr24532549wmi.10.1669250884374;
        Wed, 23 Nov 2022 16:48:04 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 16:48:03 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org, dianders@chromium.org,
        david@ixit.cz, krzysztof.kozlowski+dt@linaro.org,
        swboyd@chromium.org, konrad.dybcio@somainline.org,
        agross@kernel.org, andersson@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v3 00/18] mdss-dsi-ctrl binding and dts fixes
Date:   Thu, 24 Nov 2022 00:47:43 +0000
Message-Id: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

V3:
- Moves declaration of mdss-dsi-ctrl into compat string declaration
  patch - Krzysztof, Dmitry
- Renames qcm-2290 compat string to agreed compat "qcom,socname-dsi-ctrl"
  Dmirty, Krzysztof
- Adds empty line after if clause in yaml control flow section - Dmirty
- Adds Rb/Ack - Krzysztof, Dmitry, Doug, David
- vdd*
  Looking into this some more, I don't believe vdd, vdda, vddio ought to be
  required properties. Its up to the PCB manufacturer and the panel in-use
  how that panel is powered. Powering the panel is not something that
  even necessarily needs to be done from the dsi-ctrl driver.
  Originally marking vdd* as required in the .txt was an error, its not a
  SoC level dtsi requirement.
- clock-names
  Rather than replicate the clock-name in each if block I listed them with
  a specific description from a similar reference in usb/qcom,dwc3.yaml.
 
https://lore.kernel.org/linux-arm-msm/eb80681f-2e0b-605f-0444-ec65562f74b8@linaro.org/

V2:
https://www.spinics.net/lists/linux-arm-msm/msg116326.html

- Moves the DSI PHY changes to a different later series.
  There are enough dsi-controller-main changes to justify its own
  standalone series.

- The original phy-name binding change given discussion with Rob and
  Krzysztof became its own standalone series that has since been merged.
  https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg403214.html

- Retains the drop of power-domain from yaml as a required property.
  I dug into the available dtsi. The apq8064 doesn't appear to have any
  GDSC which can be attached as a power-domain, which means the
  power-domain requirement is not universal across the various silicon
  versions.

- Adds Dmitry's RB to power-domain drop

- For the clock declarations I've
  * I noticed that the simple change I had worked for msm8939 but
    subsquently broke other dtsi which drove a bigger change to document
    the clocks on a per compatible basis.
  * Added compat strings in yaml.
  * Moved the allOf down later in the file to acomodate the if/then.
  * Number of clocks validated on a per compatible basis
  * The driver code which doesn't care about the number of clocks
    can still operate on the mdss-dsi-ctrl compat but the dts checks will
    validate against the compat string and yaml.

- vdd descriptions
  Took the previous text I missed from the .txt file - Krzysztof, Dmitry
  Adds vdd, vdda and vddio to the required list. This exposes warnings in
  existing dtsi but the previous .txt declared these regulators as
  required. - Krzysztof
 
V1:
This series fixes up a number of dtbs checks which are being flagged adding
in the msm8939 dtsi.


When converting from .txt to .yaml a number of the parameters for the older
msm8916 silicon were not transmitted into the yaml.

Adding in the msm8939 which is a near 1:1 copy of the msm8916 in terms of
dtsi triggers a rake of dtbs checks as a result.

https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg403211.html

Bryan O'Donoghue (18):
  dt-bindings: msm: dsi-controller-main: Fix operating-points-v2
    constraint
  dt-bindings: msm: dsi-controller-main: Fix power-domain constraint
  dt-bindings: msm: dsi-controller-main: Rename qcom,dsi-ctrl-6g-qcm2290
    to qcom,qcm2290-dsi-ctrl
  dt-bindings: msm: dsi-controller-main: Add compatible strings for
    every current SoC
  dt-bindings: msm: dsi-controller-main: Document clocks on a per
    compatible basis
  dt-bindings: msm: dsi-controller-main: Fix description of core clock
  dt-bindings: msm: dsi-controller-main: Fix clock declarations
  dt-bindings: msm: dsi-controller-main: Add vdd* descriptions back in
  ARM: dts: qcom: apq8064: add compat qcom,apq8064-dsi-ctrl
  ARM: dts: qcom: msm8974: Add compat qcom,msm8974-dsi-ctrl
  arm64: dts: qcom: msm8916: Add compat qcom,msm8916-dsi-ctrl
  arm64: dts: qcom: msm8996: Add compat qcom,msm8996-dsi-ctrl
  arm64: dts: qcom: sc7180: Add compat qcom,sc7180-dsi-ctrl
  arm64: dts: qcom: sc7280: Add compat qcom,sc7280-dsi-ctrl
  arm64: dts: qcom: sdm630: Add compat qcom,sdm630-dsi-ctrl
  arm64: dts: qcom: sdm660: Add compat qcom,sdm660-dsi-ctrl
  arm64: dts: qcom: sdm845: Add compat qcom,sdm845-dsi-ctrl
  arm64: dts: qcom: sm8250: Add compat qcom,sm8250-dsi-ctrl

 .../display/msm/dsi-controller-main.yaml      | 205 ++++++++++++++++--
 arch/arm/boot/dts/qcom-apq8064.dtsi           |   3 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi           |   3 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |   3 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   6 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |   3 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |   3 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |   3 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi          |   3 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   6 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   6 +-
 11 files changed, 208 insertions(+), 36 deletions(-)

-- 
2.38.1

