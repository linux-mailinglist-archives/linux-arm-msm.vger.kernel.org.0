Return-Path: <linux-arm-msm+bounces-82701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F01DBC7543E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 17:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2EF014F415E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 15:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903833612C1;
	Thu, 20 Nov 2025 15:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="MqNy79CO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675AB3590A9
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 15:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763654312; cv=none; b=rsehe7UP+aJMzfIfGWVxP/Rcv9rV73EDzsx0quQIomTxtmhSgd7GJn+QgUr1vNFxl0wJCCyDvSx1RtXf4UInK9l4uwNkWGZ2tVP2ttFfuMTVCbU5BdtIx2DrRl7vuv/3CB2H5qKnh906quQFIentK6Lu05/yPU7Pu+daD95I/uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763654312; c=relaxed/simple;
	bh=w7YFrkfbyTCvfyB41gavemDY8lfBuU4oxXFueWjMa9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aq2FugJphSni5IwMUgp1OPkAJsGj1/gP7CPNYlwFm41Byh6RGw5PrY9hg5JE2jegvufMfGT8btBjXWMdga2kkI7gwlfGHFl5yxSGu/lwwUxqWCK49iOAUGVeco3AmtOzDNw0YyXQutRnU7k+IXHlx5LUuZKg5rUchA42dO4hgcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=MqNy79CO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so7826005e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 07:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1763654309; x=1764259109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2hexUd/mEPKRNcSZxwjjDeUDQ0Dgw47XrMHUrWKRSBc=;
        b=MqNy79COfZ4sJe+gRWcQ3dsA0oEMcFxTj8lwFl2heKsWF53trncCcm8bJuxye4ElTR
         FPoSmEA9wJmxDqcWkxUZBX8urWeju0/kt+FYVxTnRI7aNRCkaBypSGOEx4oxV/mOgQMv
         jd/VwKcyhjmk5lCHqVjaCIV2Tv3X7OTuPp5w8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763654309; x=1764259109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hexUd/mEPKRNcSZxwjjDeUDQ0Dgw47XrMHUrWKRSBc=;
        b=ZXJB8M/MmRfK5fg+OxF1YvMUQvJnrmGRBUFvtUKdaJAZbNvw5epM1b4alQolC3YjXT
         M+Y9Jt96uVBgt3J5AD/1+IZkmEXaTcXqLCIeEzre9wwLuBhxuz2fmSdUWI0B0icPs8Ee
         c7ZdgGaofKhC73rnD8mGPNvAmifxy4F/A4JtO2swYeQrTzfhdsdBYqj8Ij8jF7otLTBp
         3ZD8L1vmu4iW9/1JfknP48YaPhSrokcSbqQQ9hoo51u8a0hUPQZrZIIiP5ty2AP8KFp/
         SIycIWx3XdLeYV+IIKV+5TS4/NsYTJhuB7kBU3FWd6VO6t1Q28JJVQMRUG8nPijUxcAz
         DW5w==
X-Forwarded-Encrypted: i=1; AJvYcCU7t0DyXzH9KrKf7hUwZmougG6qkRhpk4OfG49kDmzTjE8OhHaBNUH25WlgIfUvVvaxGJp9W2Dqlsirl3fm@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8g2e3buwfs95KoMatsV/QwPpiLKdSH+A56orMS8yGKT6CYVof
	i0xTwoBN/vI7KMbByx8EFl5tziK1SADOW0MyKG7cif26SFvhfffvLsR4wMjf7SEOJeA=
X-Gm-Gg: ASbGncsTbbrpUDojIjOFb9MCWlyhyyQdZ9GSODaM8dJiXMLqG9NKQ/HVf2qYlLoaiVE
	k4XfRseCOaUuMcTlaI3AbOya8vQunA6gh6ZU0vj719FZqeQt+LE0FqDdXn2+rHgQVZGbh7IJPo7
	GmrqNaqbmzgKtP+nPO3gjmxiGu+xyB9OZYufiUoFYCTMHAiuIK7K8GMh1ky484LOjhb7/SAy8E2
	YVyINoz4OLcM8L6czYKPgGDtrH75aCCOySTU9o3v1r+WuAHmhdY8ayu0IqY1upLYE0lzb90V2DK
	TQ7nM47+faQQz6fo5lRSGikKVV0grjrOIggZWjAM6HMomLDSvm0DWpFybvUiVz2NebGp5KyrzCw
	nDIn5KMrxVRnGoIZFwreUOZFwrM/fJuYjCJ1r3f/4qI0xdfmf7QzERjvVt9xbVhdgc6vYEoj0iE
	jO7SKsyCaFcYWOd7NN/PO7ABo5jj1OaEVEOclyjyrf8Izj
X-Google-Smtp-Source: AGHT+IG4NhfTIea5v4MrG55J2UDtrIq+RFeJgaP8RzHC/SVzuCvbfTRCVSDl01OcSMHk5n0jCxfnRA==
X-Received: by 2002:a05:600c:1c14:b0:477:8b2e:aa7d with SMTP id 5b1f17b1804b1-477b8aa0ed3mr51319355e9.30.1763654308687;
        Thu, 20 Nov 2025 07:58:28 -0800 (PST)
Received: from riccardo-work (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b82e8ea6sm55552185e9.8.2025.11.20.07.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 07:58:28 -0800 (PST)
From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org
Cc: linux@roeck-us.net,
	Jonathan.Cameron@huawei.com,
	wenswang@yeah.net,
	naresh.solanki@9elements.com,
	michal.simek@amd.com,
	nuno.sa@analog.com,
	chou.cosmo@gmail.com,
	grantpeltier93@gmail.com,
	eajames@linux.ibm.com,
	farouk.bouabid@cherry.de,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	m.facchin@arduino.cc,
	Riccardo Mereu <r.mereu@arduino.cc>
Subject: [PATCH v3 0/6] arm64: qcom: add support for Arduino UnoQ SBC
Date: Thu, 20 Nov 2025 16:58:19 +0100
Message-ID: <20251120155825.121483-1-r.mereu.kernel@arduino.cc>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Riccardo Mereu <r.mereu@arduino.cc>

This patch series adds support for Arduino UnoQ single board computer.
UnoQ combines Qualcomm QRB2210 microprocessor and STMicroelectronics
STM32U585 microcontroller.

In some files we decided to keep UnoQ code name as "imola".

As this platform has a microcontroller connected to the microprocessor
we needed a dedicated spidev and to add uart2 to qcm2290.dtsi file; both
are used as interfaces between microprocessor and microcontroller.

Some GPIOs on the JMISC connector have been defined but not used in
qrb2210-arduino-imola.dts; this is meant to facilitate carrier dtbo
development for users.

Changes since v2:
- In PATCH 1/6 the vendor name has been corrected to "Arduino SRL".
- In PATCH 2/6 and 3/6 commit message has been improved to clarify the
  purpose of adding "arduino,unoq-mcu" as trivial device.
- In PATCH 6/6:
  * the qcom,ath10k-calibration-variant has been changed to "ArduinoImola"
  * leds labels have been changed to simplify usage for users and make
    them more consistent with future Arduino carriers for UnoQ.
- For every patch, warning regarding mail mismatch when running
  checkpatch should be fixed.

Riccardo Mereu (6):
  dt-bindings: vendor-prefixes: Add Arduino name
  dt-bindings: trivial-devices: add arduino spi mcu interface
  spi: spidev: add compatible for arduino spi mcu interface
  dt-bindings: arm: qcom: Add arduino imola, UnoQ codename
  arm64: dts: qcom: agatti: add uart2 node
  arm64: dts: qcom: qrb2210: add dts for Arduino unoq

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/agatti.dtsi          |  24 +
 .../boot/dts/qcom/qrb2210-arduino-imola.dts   | 459 ++++++++++++++++++
 drivers/spi/spidev.c                          |   2 +
 7 files changed, 491 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts

--
2.52.0


