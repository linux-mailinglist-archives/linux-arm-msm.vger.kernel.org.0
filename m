Return-Path: <linux-arm-msm+bounces-19873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C868C6534
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 12:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B5D7281EF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 10:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E1CA627E2;
	Wed, 15 May 2024 10:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IJJqbP93"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD42160ED3
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2024 10:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715770502; cv=none; b=r9l+kx1bYyNhFxNqRv4AAMdBWZaarHT4HcPg2hylgwR9JvtOkx4+Qm+FJG4UK8a9z6zFmgwWgkcCmBq7pbr9vCxKYi8KG8L7ZFny5YezNvCk+S/2YY/utAMh1BV4NzYNb8opKHiR050NxU6mX9WuIlo1M1uY6VWYg1eQ7ClMyuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715770502; c=relaxed/simple;
	bh=QQOwsJIqbn/sH6QWOe5NAW476GND/Y4m9LnS8t8IvAg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q8/5xg3fnTy0wvmm3Mp7xxLvWNDo8lcupzSz5UwT8/2rrviQTATldj7ZmhF17tVe+5FEqbm9BwH0nCj4kCpOUBlykQ7am12l3XJHEMZy9dE2Sifjpo6T2QFqoTTXID57H3dpt3OwSg0oX06jD36bvbfQIwljQ8PhaP4Mu9RLLx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IJJqbP93; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1eeb1a4c10aso40878125ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2024 03:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715770500; x=1716375300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v8PahdsTaxrvJsdtCNtln2KbqBTimvNp7eghq2QDJGQ=;
        b=IJJqbP938E2fxf44VWQUURP62CGOcQQ05sPea+rhMasBmrkP5AyVFV8LxW+83Tv37Z
         PPNXkF+GYK/+VbYeUrTjXAfcgngeR0C8+izsQIe9dJSqC3CGsPD4qFg6pwxqjNjAmBBv
         Ybh6z/nPiKPWuCyaqgs/zLi33OcUZslCApCvJ6ysACbeXi8d46Lgz5PaxzolodL50BJt
         UWKDIFuItDBr2qhAhEDsXZJvOke2H2vc50f7OAMw9Z4cjeEnkD9bZKwBJ/pDGXATH9um
         hiLysbMG4xOBfbe2QVne+zePcHVQdhnswomq/hOpk4KiDf3YAXeVv9KIWAU6a1ljyKXL
         Wj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715770500; x=1716375300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8PahdsTaxrvJsdtCNtln2KbqBTimvNp7eghq2QDJGQ=;
        b=M43g/McIT0oj7+nsGyljRc2fr50s9/1g1GS76VuwNUGP3AhMbCr4/mdwRI1jqtEei1
         i+3P526O+PhfCCdAuI9Cv+RF4EEjzM+dbfg1CX6lyYDs01fmcpi0cuLy8HaZWBOj6IVm
         v+FbEfrL11T7cDWNaYyJgy5ssCi9cbnFfR/FmwfpUQ40ScKTa6iAXXv7yp+ehGSFC1O6
         PZmjoaTLzKzDMbtXLICKw1aPE9FNhitNOFOemihqvaErUkd7zTwZKKTqxHnUSxLmDG1i
         njdVqKw1yLn6ZL1T7ThKTpB6Q3v2PyBVkQReUWvL1ysMsqfLKDZu6IW3fzfZOtHqYlnD
         s57w==
X-Forwarded-Encrypted: i=1; AJvYcCXfbwwuCIGyOn3LGYVkUhaRvGkRxnEgqe0W3t1J/v/6fFqNKjegGMWctix9rwlHBU4D1h7ctYf7Av05oGQj3bUzZEwCHFx/FWpqolYtLA==
X-Gm-Message-State: AOJu0Yxzh2vm4zpwZH3al4Z2yHgBZtkO9j3q6kgGdpCJQs5/QTgEFEGp
	K80CQ7nslz3cLjX1URlRO4v83VONnAv3xE8K7w8FuMdjEdYbxbxk+iET062q7kt7a6j2yF1FLGV
	V
X-Google-Smtp-Source: AGHT+IH7jVsFEK/WViebanM6yM0hwAGJFTpQyeaaJhHLcyB+wlePKbxg/ptxeWRkJLnl73OzyfnVmA==
X-Received: by 2002:a17:902:dad2:b0:1eb:5293:dc37 with SMTP id d9443c01a7336-1ef43c0cf65mr174485285ad.10.1715770500209;
        Wed, 15 May 2024 03:55:00 -0700 (PDT)
Received: from sumit-X1.. ([223.178.209.205])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf30bb9sm115092425ad.135.2024.05.15.03.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 03:54:59 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	stephan@gerhold.net,
	caleb.connolly@linaro.org,
	neil.armstrong@linaro.org,
	dmitry.baryshkov@linaro.org,
	laetitia.mariottini@se.com,
	pascal.eberhard@se.com,
	abdou.saker@se.com,
	jimmy.lalande@se.com,
	benjamin.missey@non.se.com,
	daniel.thompson@linaro.org,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH RESEND v5 0/3] arm64: dts: qcom: apq8016: Add Schneider HMIBSC board DTS
Date: Wed, 15 May 2024 16:24:43 +0530
Message-Id: <20240515105446.3944629-1-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Schneider Electric HMIBSC board DTS. The HMIBSC board is an IIoT Edge
Box Core board based on the Qualcomm APQ8016E SoC. For more information
refer to the product page [1].

One of the major difference from db410c is serial port where HMIBSC board
uses UART1 as the debug console with a default RS232 mode (UART1 mode mux
configured via gpio99 and gpio100).

Support for Schneider Electric HMIBSC. Features:
- Qualcomm Snapdragon 410C SoC - APQ8016 (4xCortex A53, Adreno 306)
- 1GiB RAM
- 8GiB eMMC, SD slot
- WiFi and Bluetooth
- 2x Host, 1x Device USB port
- HDMI
- Discrete TPM2 chip over SPI
- USB ethernet adaptors (soldered)

This series is a v2 since v1 of this DTS file has been reviewed on the
U-Boot mailing list [2].

Changes in v5:
- Addressed another nitpick from Stephen.
- Collected Stephen's review tag.
- Warnings reported by Rob's DT check bot aren't related to HMIBSC
  board DTS but rather they are due to msm8916.dtsi or extcon-usb-gpio.txt
  still not converted to YAML format.

Changes in v4:
- Dropped IRQ_TYPE_EDGE_FALLING for pm8916_resin given the expectations
  of Linux kernel driver. Instead depend on systemd workaround suggested
  by Caleb to get expected HMIBSC reset behaviour.
- Incorporated further DT coding style comments from Stephen.
- Warnings reported by Rob's DT check bot aren't related to HMIBSC
  board DTS but rather they are due to msm8916.dtsi or extcon-usb-gpio.txt
  still not converted to YAML format.

Changes in v3:
- Picked up tags.
- Fixed further DT schema warnings.
- Configure resin/power button interrupt as falling edge.
- Incorporate DTS coding style comments from Krzysztof and Konrad.

Changes in v2:
- Fix DT schema warnings.
- Incorporate suggestions from Stephan.
- Document UART1 mode GPIOs based mux.

[1] https://www.se.com/us/en/product/HMIBSCEA53D1L0T/iiot-edge-box-core-harmony-ipc-emmc-dc-linux-tpm/
[2] https://patchwork.ozlabs.org/project/uboot/patch/20240311111027.44577-6-sumit.garg@linaro.org/

Sumit Garg (3):
  dt-bindings: vendor-prefixes: Add Schneider Electric
  dt-bindings: arm: qcom: Add Schneider Electric HMIBSC board
  arm64: dts: qcom: apq8016: Add Schneider HMIBSC board DTS

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/apq8016-schneider-hmibsc.dts     | 491 ++++++++++++++++++
 4 files changed, 495 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts

-- 
2.34.1


