Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEC0E61772B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 08:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbiKCHJe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Nov 2022 03:09:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbiKCHJd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Nov 2022 03:09:33 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75FE8B03
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Nov 2022 00:09:30 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id g129so909444pgc.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Nov 2022 00:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LkHnq8wlBfVlfriOmpPxlarX6Xf3b38smcgL/6sjikk=;
        b=wS2uOLCGL26kIPInJbuPEphCBlVt9LYrHO5YFaJZW8jNi1oRmOIMF5llWI+ea7hIHh
         Qs6+HZ5pGkKYGqCgNuGhsN5lYxkOaWY+L8GFuVR6reQ6ZkgUCUCcmENSuWq9BWtosvJc
         BJwPqF3DwiWgrVlkjgG6CE7j6hUgtuRQdmbyEzyAoNVtOezBhvn5TE6po5uKLxluSsiM
         Dx2Bc7WHqcG6Cefat8nuFFg6hYpPC2VNPLTezH1IuLY1lxKbmlJR9v+58iCkKjVosWLS
         iqKMWYcCOWZ5KvNsFKYLfucvu7W3L2pwYBsgFyLXZcm/SzDRpOFWLZiJVQbjI4YZJDtT
         wOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LkHnq8wlBfVlfriOmpPxlarX6Xf3b38smcgL/6sjikk=;
        b=K9DSXygt8KEK7G4vvune8rIAQRNSimN8i8Gw/wGTmXoJm+llU9dQJmMy1D4c5XSfnp
         u/cJh1m+tybzuNlm7iWRmsgiYGXPYduJF9KpApWaai5ieJVoSymrc/+t0IbgYc2mXGiJ
         CPb0vx/Y8MwN7oVPFOxtLLK9qkCmf0QeM+PnfISpM4+bl8pO8fEZflMiZF+Fh9uJFydb
         LfrY72y44r4FBUNVkl6wd53IdZRhBnbSFzzlKaUkXkrs51iLrzOUCq7neZlco8eOtifP
         jWcz4pULRfrEHnTDqAj3KsekDibOfBbz+8tS/1/1bsYhiK3lUrzLMJlsj3NrT+iSp9zO
         rz8A==
X-Gm-Message-State: ACrzQf38yvE1Oo/V4aASXea+URB0xUjWLNU/89aJgmejPO3jxltf1pLe
        VSPnMSvxAsN/oqloGpbjJtGNaMGKKWYr
X-Google-Smtp-Source: AMsMyM7jg3itAXy7IHb+R1SjQ46Pz5fBBfKvaFnZurczcTzD3RIEfyMsxzGdTcAzH6bE2QZ5QTPK4g==
X-Received: by 2002:a63:5853:0:b0:46f:fdfc:a651 with SMTP id i19-20020a635853000000b0046ffdfca651mr8243896pgm.385.1667459369822;
        Thu, 03 Nov 2022 00:09:29 -0700 (PDT)
Received: from localhost.localdomain ([117.193.208.64])
        by smtp.gmail.com with ESMTPSA id s9-20020a170903214900b00186748fe6ccsm9451244ple.214.2022.11.03.00.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 00:09:28 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 00/12] sc8280xp-pmic updates and X13s thermal zone support
Date:   Thu,  3 Nov 2022 12:38:59 +0530
Message-Id: <20221103070911.20019-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
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

Hello,

This series adds below updates to sc8280xp-pmics:

PM8280_{1/2}:
- Temp alarm
- Thermal zones
- VADC channels
- ADC_TM5 channels

PMK8280:
- ADC7 block
- VADC channels
- TM5 block

PMR735A:
- VADC channels

Also adds the thermal zone support to Lenovo X13s based on the thermistor
SYS_THERM6 that provides the laptop skin temperature.

The sc8280xp-pmics is based on the new PMIC7 architecture. In this, all the
ADC/TM5 measurements are collected by the primary PMIC PMK8280 from other
slave PMICs PM8280_{1/2}, PMR735A using the Programmable Boot Sequence (PBS)
and exposed them over the individual channels.

PMK8280 uses the Slave ID (SID) for identifying each slave PMICs in a system.
This ID is not static for each PMIC but rather set for each platform by the
hardware designers. So this series allows the configurable SID by modifying the
binding to accept SID values instead of hardcoding them.

This series is tested on Lenovo X13s laptop by monitoring the temperature of
the 8 on-board thermistors through IIO interface. The thermal zone support is
validated by adding loads to the CPUs and making sure the skin temperature stays
below the threshold provided in DT.

Thanks,
Mani

Changes in v3:

* Used thermistor index in node names for VADC channels. This is required by IIO
* Collected reviews
* Rearranged the dt properties (Konrad)

Changes in v2:

* Fixed issues reported by Krzysztof and "make dtbs_check"
* Collected reviews from Krzysztof
* Added the Lenovo X13s thermal zone patch

Manivannan Sadhasivam (12):
  dt-bindings: iio: qcom: adc7-pm8350: Allow specifying SID for channels
  arm64: dts: qcom: sc8280xp-pmics: Add temp alarm for PM8280_{1/2}
    PMICs
  arm64: dts: qcom: sc8280xp-pmics: Add thermal zones for PM8280_{1/2}
    PMICs
  arm64: dts: qcom: sc8280xp-pmics: Add support for PMK8280 RESIN input
  arm64: dts: qcom: sc8280xp-pmics: Add PMK8280 ADC7 block
  arm64: dts: qcom: sc8280xp-pmics: Add support for TM5 block in PMK8280
  arm64: dts: qcom: sc8280xp-x13s: Enable PMK8280 RESIN input
  arm64: dts: qcom: sc8280xp-x13s: Add PMK8280 VADC channels
  arm64: dts: qcom: sc8280xp-x13s: Add PM8280_{1/2} VADC channels
  arm64: dts: qcom: sc8280xp-x13s: Add PMR735A VADC channel
  arm64: dts: qcom: sc8280xp-x13s: Add PM8280_{1/2} ADC_TM5 channels
  arm64: dts: qcom: sc8280xp-x13s: Add thermal zone support

 .../bindings/thermal/qcom-spmi-adc-tm5.yaml   |   6 +-
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 204 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi  |  84 ++++++++
 .../dt-bindings/iio/qcom,spmi-adc7-pm8350.h   |  90 ++++----
 4 files changed, 334 insertions(+), 50 deletions(-)

-- 
2.25.1

