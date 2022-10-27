Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0A3560F027
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 08:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233993AbiJ0GaW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 02:30:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233813AbiJ0GaT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 02:30:19 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDAF0147D26
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 23:30:17 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id io19so443304plb.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 23:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JP1tZKdszK2IZgh30Tx/YNHuH6W6TpVf+WVjOqWudng=;
        b=PGBv0IXO53nGmM1dm6MD7oUWt9DAvm4ZAUzWZ5X6IjEce08fapbw8ubqicQ9CRbgm6
         6XncBfqS3FguKDXUKvBl9qQX++jyewVH3xePU/30HF5YASApHgaHNx58bfIAmazeXuCJ
         KldOAGPOdvFH3vAHdtuFVOOdbY1QHeOx6/HLXikfdVv08+miTuDXmVIKQa5L3T6mWlIj
         NhXbJoEgWtoTiVErPqIzdyF3jPUSMNCza0rOP1coEkJpQgREivMnFbNTr3eCvhtPUEP1
         /NSiAzFY8IdjRnwSHH+NCwioUh9IlLVIPdUo+tvgsSz4sIEKvVN7fZ4O8jal+BQ+8x0M
         P2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JP1tZKdszK2IZgh30Tx/YNHuH6W6TpVf+WVjOqWudng=;
        b=vB9iZHjZ/9/LkuFUK502l7XciIcXf/Wj0gJU5GQa7egynikMyPxco4rQ0HEz5FrtOL
         u7qIrnqmaL4W9LikY4HG7uZXQSfFpV0t3XeKWgY0dN029SY5mj/py0/o7tA3tiyWXtlN
         RaV1dCxc2D+YMK9wv2isD//Vrx4TWFnHilzKFy0R9tFELyyBp+jA8kvNTgdLOe6XJKkj
         JAmvR8zeCdy3p0QvLQZNBixfH4RrH5Q8Ojkq8AkdYLKL8y1MZRs1cIdW+XtBNWB70D2Z
         jqK2e4YIYNa47Jb+a3rBE5az3lm9VktLl/GK0cRBHil1rUihCpRlsnsUYracwD0EOBy1
         pHUg==
X-Gm-Message-State: ACrzQf1KRWLfmnofx5AyQC7cBPAESlRg/ESN4KyLOolyy47jsl70aZhJ
        qDyDsf7NAAuQROSfIYtlTKuT
X-Google-Smtp-Source: AMsMyM6Dn1op3KfUQJDJRU6fNpMcbQRzaua8eOryw/Z+KrXNMJxY6OS9tvNWxwm6f8XVeLD12sz91w==
X-Received: by 2002:a17:902:ed53:b0:186:6ad3:c155 with SMTP id y19-20020a170902ed5300b001866ad3c155mr34719419plb.43.1666852217347;
        Wed, 26 Oct 2022 23:30:17 -0700 (PDT)
Received: from localhost.localdomain ([117.193.208.123])
        by smtp.gmail.com with ESMTPSA id i126-20020a626d84000000b00561d79f1064sm446041pfc.57.2022.10.26.23.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 23:30:16 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 00/11] Updates to sc8280xp-pmic
Date:   Thu, 27 Oct 2022 11:59:55 +0530
Message-Id: <20221027063006.9056-1-manivannan.sadhasivam@linaro.org>
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

The sc8280xp-pmics is based on the new PMIC7 architecture. In this, all the
ADC/TM5 measurements are collected by the primary PMIC PMK8280 from other
slave PMICs PM8280_{1/2}, PMR735A using the Programmable Boot Sequence (PBS)
and exposed them over the individual channels.

PMK8280 uses the Slave ID (SID) for identifying each slave PMICs in a system.
This ID is not static for each PMIC but rather set for each platform by the
hardware designers. So this series allows the configurable SID by modifying the
binding to accept SID values instead of hardcoding them.

This series is tested on Lenovo X13s laptop by monitoring the temperature of
the 8 on-board thermistors through IIO interface.

Thanks,
Mani

Manivannan Sadhasivam (11):
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

 .../bindings/thermal/qcom-spmi-adc-tm5.yaml   |   6 +-
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 158 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi  |  85 ++++++++++
 .../dt-bindings/iio/qcom,spmi-adc7-pm8350.h   |  90 +++++-----
 4 files changed, 289 insertions(+), 50 deletions(-)

-- 
2.25.1

