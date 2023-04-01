Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38B9D6D3480
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Apr 2023 00:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbjDAWIP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Apr 2023 18:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjDAWIO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Apr 2023 18:08:14 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE1727AB6
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Apr 2023 15:08:12 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id s20so6332546ljp.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Apr 2023 15:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680386891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=has59VHh1bBQ36gANW59HJL3NztiYKM/e6Q9Kg9nML0=;
        b=y2QCWQypHgScBzEHDMGbZrx6ZfsgwbrudlnZ4mmCfUUg+8VwZRzsAfs4NPH5IoZ0lM
         UQWMtkWo5KNPy3wj2tPluqE97Xt03GjNtVQuColTAZ+hjMUvV8DySoyGxFymmwKMoZIG
         0KbeTgM6NF9myKZ2EubKq8EITJSxGoQadeKPl2LpFqzGY5idzRnAUZyvgWlTpTJmSyCs
         BGebZLbZitZt1OE8FaN+A/Atmm/dxUvXeVvs0HzViw7pAsS4baIMRT118+NJ+TRL+00k
         xH/ziAa6y+1PG1yPaAso160Y9ndwdWB3e9sPV4JscVKZaAzqMSd3wL43/rzCOuGTchHZ
         n0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680386891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=has59VHh1bBQ36gANW59HJL3NztiYKM/e6Q9Kg9nML0=;
        b=B5pE5PC3JhuRmcmBKPw958dLnjXj9fgqLymdqQZXV5Zlre6WHtQLKohsp+mTfo0pMd
         sBKHs3+dnKzicAMTqjlM4aBRq/xFYXrJPXAm3Yizw/S34l244KnUmW+xDV0I+F3HdkuD
         i4OF08jO6qErCPwytwBll2reqf3VuSq9iZJy3iOTljSYXzPeH/qJDtwreMMr5AWLBnXJ
         SFu3gJuknv6vkVlgYuVndrMugeQ9TF2e0BEHpa1wn2d+80xfIQoDZlQFU+DvmI0kvOS+
         /nS6djvA68AoKDCHfR0MluXuJICK5AZ5k2Hnt+adjqlt647zix8BsknB0vPGr9yIH4WJ
         4Png==
X-Gm-Message-State: AAQBX9cTCrmcBTIkzDsC+QDBNblnuoqWP6O6dLPN2IucV7tGTBZuRGpS
        Os78QFegMCVReH0K52q5iAxu8Q==
X-Google-Smtp-Source: AKy350bv02Wrh2B+P78hHqR4lsGybPviSr1C1aLSuS+lChYI89rOUApskFsRMUutkfygogAKhjsvVQ==
X-Received: by 2002:a2e:6817:0:b0:29f:7c5b:8795 with SMTP id c23-20020a2e6817000000b0029f7c5b8795mr9288247lja.9.1680386891193;
        Sat, 01 Apr 2023 15:08:11 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k17-20020a2e9211000000b0029bd4d0d3f2sm997590ljg.33.2023.04.01.15.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 15:08:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org
Subject: [PATCH v2 00/22] arm64: dts: qcom: remove duplication in PMIC declarations
Date:   Sun,  2 Apr 2023 01:07:48 +0300
Message-Id: <20230401220810.3563708-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The sc8280xp platform uses its own copy of PMIC declarations. This can
easily end up with the issues that are fixed in the main PMIC include
file, but are not fixed for sc8280xp (and vice versa). For example
commit c0ee8e0ba5cc ("arm64: dts: qcom: pmk8350: Use the correct PON
compatible") changed pmk8350 to use "qcom,pmk8350-pon" compat for the
PON device, while sc8280xp-pmic.dtsi still has the incorrect
"qcom,pm8998-pon".

Another example is pm8280_2_temp_alarm device, which uses interrupts
tied to SID 2, while having SID 3. This can be easily left unnoticed.

Employ a small amount of C preprocessor magic to make
sc8280xp-pmics.dtsi use standard PMIC include files

Also apply the same approach to sa8540p-pmics/pm8150.

Jonathan Cameron Acked merging the dt-bindigns patch together with the
rest of the patches to simplify merge process.

Dmitry Baryshkov (22):
  arm64: dts: qcom: pm8350: fix thermal zone node name
  arm64: dts: qcom: pm8350b: fix thermal zone node name
  arm64: dts: qcom: sc8280xp-pmics: use pmk8350 specifics for pon device
  arm64: dts: qcom: sc8280xp-pmics: correct interrupt routing for
    pm8280_2_temp_alarm
  dt-bindings: iio: qcom,spmi-adc7-pmk8350.h: include sid into defines
  arm64: dts: qcom: pmk8350: rename pon label
  arm64: dts: qcom: pmk8350: port sdam_6 device from sc8280xp-pmics
  arm64: dts: qcom: pmk8350: rename PMK8350_SID to PMIC_SID
  arm64: dts: qcom: pmk8350: allow overriding the label
  arm64: dts: qcom: pmk8350: use interrupts-extended for IRQ
    specification
  arm64: dts: qcom: sc8280xp*: use pmk8350.dtsi
  arm64: dts: qcom: pm8350: allow overriding SID and label
  arm64: dts: qcom: pm8350: use interrupts-extended for IRQ
    specification
  arm64: dts: qcom: sc8280xp*: use pm8350.dtsi
  arm64: dts: qcom: pm8350c: move thermal zone declaration to the top
  arm64: dts: qcom: pm8350c: allow overriding SID and label
  arm64: dts: qcom: pm8350c: use interrupts-extended for IRQ
    specification
  arm64: dts: qcom: sc8280xp*: use pm8350c.dtsi
  arm64: dts: qcom: sc8280xp*: use pmr735a.dtsi
  arm64: dts: qcom: pm8150: convert to use dynamic SID/LABEL
  arch: arm64: dts: qcom: pm8150: support SID greater that 9
  arm64: dts: qcom sa8540p-pmics: switch to pm8150.dtsi

 .../bindings/iio/adc/qcom,spmi-vadc.yaml      |   2 +-
 .../bindings/thermal/qcom-spmi-adc-tm5.yaml   |   4 +-
 arch/arm64/boot/dts/qcom/pm8150.dtsi          |  53 +++--
 arch/arm64/boot/dts/qcom/pm8350.dtsi          |  33 ++-
 arch/arm64/boot/dts/qcom/pm8350b.dtsi         |   6 +-
 arch/arm64/boot/dts/qcom/pm8350c.dtsi         |  73 +++---
 arch/arm64/boot/dts/qcom/pmic-dyn-footer.dtsi |  23 ++
 arch/arm64/boot/dts/qcom/pmic-dyn-header.dtsi |  26 +++
 arch/arm64/boot/dts/qcom/pmk8350.dtsi         |  51 ++--
 arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi   |  96 ++------
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi      |   2 +-
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi    |   2 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts     |   4 +-
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    |   8 +-
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi  | 221 ++----------------
 .../qcom/sm6375-sony-xperia-murray-pdx225.dts |   7 +-
 .../boot/dts/qcom/sm7225-fairphone-fp4.dts    |   8 +-
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts       |   8 +-
 .../dts/qcom/sm8350-sony-xperia-sagami.dtsi   |   8 +-
 .../dts/qcom/sm8450-sony-xperia-nagara.dtsi   |   4 +-
 .../dt-bindings/iio/qcom,spmi-adc7-pmk8350.h  |  52 ++---
 21 files changed, 279 insertions(+), 412 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/pmic-dyn-footer.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmic-dyn-header.dtsi

-- 
2.30.2

