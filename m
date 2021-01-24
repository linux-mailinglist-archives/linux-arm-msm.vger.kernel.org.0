Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE592301C5F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jan 2021 14:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbhAXN4z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jan 2021 08:56:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725967AbhAXN4s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jan 2021 08:56:48 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CC1DC061573;
        Sun, 24 Jan 2021 05:56:08 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id 6so9642235wri.3;
        Sun, 24 Jan 2021 05:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=KNL0RhbK+W8NeBfpITYNBDAjPTJqvGFS1T1JmSYruYo=;
        b=KbZEvzSPU6FOihK9ffQPg+ZIcM5kv5t4eZwep3dHr+oaiS2dDRp8yA46ecoVsRLewZ
         hxxFiQdRMm9O0gqLjwMo3vpnPF4L5qLS0LTvLwRTq2irXCavRO6dBWnvq8kwRq0seoE/
         G2yqEWZeiWYnzHdAQ9W8rRaOUmP7iMqcE3azNqSa6WmLUhwQw1NgRLr3ChG8ODLioX9r
         ZMq77Bcq//VfCk1T34PyOD94IPVHKZG1Y06Ei7rrVtn8iCo9EjGmku8pBfY8N5Bli52l
         hxrsXzkHf7dQR4IfPaJHukDpzNykqq7AoJQ/A907w6/vo1GiWGLQ9LDORc9EuawfMG0f
         9bEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KNL0RhbK+W8NeBfpITYNBDAjPTJqvGFS1T1JmSYruYo=;
        b=aiMPZOC6SYQnifUCobFLnWTTn9yBQAiNyVwwyVmjraAjTyHCPOfwV+ILvYfv0Ier0r
         JsmyN2dIwnZAR6jKiPmHIgc7Dpd1RLZINnWWTnmF/ic2nfL8CfRT6OJTWOLohgJUngvo
         UGPwV01hJn3hWiSBUU1ge5+2pnHVo0u6tAFUc1H3QBXeG/Pw1QYcDrbQTuNcvmCS5S93
         a1d3QWaWkYLOp+oNL0zMc1zb9jaXH1S8QiuV17kftJ8Iwm+FZ1jI/3BMp8YkSJpLrRAc
         pWOD+kisu/n7N8pTE2U09PcX24X9iISjDrR+mjXLfYtuKLh8wZuWZoKNm62kTGE91IjZ
         SKMA==
X-Gm-Message-State: AOAM533FIW/qMACHcEMe7fyiXPC20GsVIQepaCavUPwIVchHUZkWv847
        sYiYbYi4XKDwEy0eOTRbr6A09hq7RyKt/A==
X-Google-Smtp-Source: ABdhPJwNJ28Jxl5Wfw5GdESB3FDq0P9NkunrCZYLE8frY9DicwOUKkjWtnF69c5p8AmkJXuwSFdBow==
X-Received: by 2002:a5d:6912:: with SMTP id t18mr5961424wru.268.1611496566384;
        Sun, 24 Jan 2021 05:56:06 -0800 (PST)
Received: from jonathan-N53SV.station ([151.81.101.204])
        by smtp.googlemail.com with ESMTPSA id a27sm19658409wrc.94.2021.01.24.05.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 05:56:05 -0800 (PST)
From:   Jonathan Albrieux <jonathan.albrieux@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, stephan@gerhold.net,
        Jonathan Albrieux <jonathan.albrieux@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/3] Add initial support for BQ Aquaris X5
Date:   Sun, 24 Jan 2021 14:54:04 +0100
Message-Id: <20210124135409.5473-1-jonathan.albrieux@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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

