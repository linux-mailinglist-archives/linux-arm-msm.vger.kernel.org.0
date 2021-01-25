Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27F063049E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 21:18:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbhAZFVT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 00:21:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727166AbhAYJrO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 04:47:14 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BA2DC061786;
        Mon, 25 Jan 2021 01:46:27 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id c127so10118336wmf.5;
        Mon, 25 Jan 2021 01:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=TV0xw0urZWA7yxhi2valt8DXJLxBV/z7jKveKN9m6ds=;
        b=ksPQsC1nyqO+hH9ep9+kZ9SMdnnJhY6fJ9CkJknO3o36nva3MH/duQt3Udm7n/flT9
         Jm8qaUB8ragyj99W6FbJ1bx12lcMj0ajZsLh5MfUSX6UoSZlNIeIQ3IS4Cs807DaLdv5
         M6raw4K7eljJYmIjxavEeoAEMDr+aBaL8I1WUg2eA93aQKcllkmaGfsj7Zes6fQpQmLP
         vRW22Y9IB8DHC9a4pe8zANO5roi20X9hHWyYjZ5NSDOlwLxi/1T+VxXV5ZdtPvZy300r
         6X4hmcF+A6rf6YD1G4p46vVTboNpZu2xAbCRZngsHrWl9NYtJWh3hozj9qbkhBWM46Ft
         Jsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=TV0xw0urZWA7yxhi2valt8DXJLxBV/z7jKveKN9m6ds=;
        b=qE0yAAZcfbAbhhqgkICuJH5OY5zw6IR803A2cvr0wlsRpMWI43JVEpXF+ctWyOk9JZ
         25QG9hYeSmLRzMAqRQ5F8ynyKFkJyD5bdJR9fIkZBcTSBewPTs/zEAGBBV1khzegmsIo
         2CgXRPdhPBaaRC5cmT8wMD4ycQoVHT3ACRglldTytKPLIQ7ks+gnnPTrPDTyL3tdTCn+
         tpVr0ToT6/qg6mkTjSx/uCi0wbplnhDP1+KmiLpxPnukaYlzO3e2+icZV3JlRxvaKodN
         9s7x+H63QGpsro7SLHUKnPLeZIpOb6RSiP5QF+vKSYeRCQ1il5GkeNR7S4IPLpxWKSXz
         Nijg==
X-Gm-Message-State: AOAM533/tvIye7/YGXjnzbqDMRu3s3R6felbR7kiiKUBRZoRT4VntN48
        n5tXOiaBZbF3+D1E0Ad6lqTeJZi0OCU=
X-Google-Smtp-Source: ABdhPJy1oQ/Ef4RY0U1iiHDEM5BlNCP4W/7PSDGr2G5l/6GJTQZunZNIiiPPIokMN5NYb0I0QoxUeg==
X-Received: by 2002:a05:600c:2253:: with SMTP id a19mr1599635wmm.75.1611567985825;
        Mon, 25 Jan 2021 01:46:25 -0800 (PST)
Received: from jonathan-N53SV.station ([151.81.101.204])
        by smtp.googlemail.com with ESMTPSA id u5sm22154052wmg.9.2021.01.25.01.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 01:46:25 -0800 (PST)
From:   Jonathan Albrieux <jonathan.albrieux@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, stephan@gerhold.net,
        phone-devel@vger.kernel.org,
        Jonathan Albrieux <jonathan.albrieux@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] Add initial support for BQ Aquaris X5
Date:   Mon, 25 Jan 2021 10:44:29 +0100
Message-Id: <20210125094435.7528-1-jonathan.albrieux@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

v2:
 - reorder I2C devices sorting them by address

v1:
 - initial patch submission
https://lore.kernel.org/linux-arm-msm/20210124135409.5473-1-jonathan.albrieux@gmail.com/

Aquaris X5 (Longcheer L8910) is a smartphone released by BQ in 2015.

As part of msm8916-mainline project, this series aims to bring initial
mainline support for it.

Features added:
 - SDHCI (internal and external storage)
 - USB Device Mode
 - UART
 - Regulators
 - WiFi/BT
 - Volume buttons
 - Vibrator
 - Touchkeys backlight
 - Accelerometer and gyroscope sensor
 - Magnetometer sensor

Jonathan Albrieux (3):
  arm64: dts: qcom: Add device tree for BQ Aquaris X5 (Longcheer L8910)
  arm64: dts: qcom: msm8916: Add blsp_i2c3
  arm64: dts: qcom: msm8916-longcheer-l8910: Add imu/magnetometer

 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts | 267 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi    |  16 ++
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |  15 +
 4 files changed, 299 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts

-- 
2.17.1

