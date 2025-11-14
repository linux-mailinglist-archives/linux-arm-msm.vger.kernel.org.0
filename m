Return-Path: <linux-arm-msm+bounces-81854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE8CC5D12B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 13:20:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4AD2B34DB8C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 12:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB0D313E09;
	Fri, 14 Nov 2025 12:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="VSvcuPab"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE784145A1F
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 12:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763122747; cv=none; b=l7LVanFCYKdcB96h+jwjLGkjFYT/t02nF/djLAr54XBcVdvHelbpWVI/1SQtfAzpObKHjkQ1q0sCjsqnx35BoccgharAG7Z5k7AxaaV80PhrSfTZHDOSK4P2od/T5LVAVrHegKVNFt+FSYYr67LJj1MPiAuB9q5SabVjiRH/pAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763122747; c=relaxed/simple;
	bh=SGlJYLihZT4+phmoB/86SGMUspoJUqlO/5liLNI0JaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Im0kwNxmTllI5FZqcc04wyjQZyqMr2ZPmDGZRRCEo3QiOQGWmgKyrl6A9mBtPpgJHETodMK+bUO+ASjIy6MyovTLTnLIYUhBV2PIpUWMvWICsLBZNhnOmKPjsFblKPbUThrVlk9CtpVLe1AFi9Zh2Rd7c6qsg4PCny2RGNqsZDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=VSvcuPab; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b7291af7190so283723066b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 04:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1763122743; x=1763727543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VHSvtON0daRkXUkTRexT/Sc3xyec4Q2i/7798OEMzyc=;
        b=VSvcuPab+M3XrP0erU44T66QaAvKrYgMiBHlSdAxXl9ZEz9Hv1+etnsi0iLQeC1oAN
         jEnOn6G2KUW8fZOyajGb4RuM/t3Ati896X5E0AYq+R5wmVNe68hrQs+W1ETULReoZdSj
         2cZfuHT6I0I7ewHjPpSFzRX1Ap75Liamsdprs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763122743; x=1763727543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHSvtON0daRkXUkTRexT/Sc3xyec4Q2i/7798OEMzyc=;
        b=BzGtcWURRi5APDZa7nKqdM2nyldnGMDB7SC2THpzxvUjNZRCQ4Zn8BHhHeMade7yFz
         DWCJPe80FWwLCF90JudKIukSgt0kxocSL87ZUQrqh31Ou+YvgSM3KKRHnCzcfN5o6i82
         rtrcqiX3Ihvx3SSS3oDjwdVHWgzpaW0bbHRC2LSCE2rRgX17rNorlwmv7UfQ8nDR8Ugg
         ewkyD22SyrG0pWYBBIffpXC/KkbUM4FbYgm4UyBz1GvQUgS6/ACtTrNzBP917+qnsV7a
         sA/aW10p/AKvrknB/VKM+rZq1CDLtD50HpHuYl64Ww9xW7PrrEaUq3FGvn1y1pFIEkk/
         2MaA==
X-Forwarded-Encrypted: i=1; AJvYcCVb+LnsOBmVGLA+SEWHKQ7SBA90qN/xIxGNICUNdSt5bCo0p5auj8TBQbM1MZWBBgmkVc31XHyYHY4lhNF7@vger.kernel.org
X-Gm-Message-State: AOJu0YwBHyx1Z0WHIduFINvAelo3LT5OZ118xLiruxGgS3PM7gFcna0V
	mzjPQg3047qrtKbqk0VVx2CLgQaPHwibvJmy24HH1JaQr709V6gck2+q0hBXIR2k0/U=
X-Gm-Gg: ASbGnctUGXbWovdsTv5lhtqYjwfgYEx+tphvNN/L79bP3vgEiv1Xqwk0oAh6SW/V0a1
	/nXK3N38fQGU6MFtVhZdjlkjoc7SOrblLHsqKQusUuC+lDp/7oerAArjElwQ8Q4ytRsVGzLYfUn
	kHs2zIG2QlQCYfuWvrgRHJ4A5TQIcG+RWEUHoisKodbMqo4iktPEEkM1pNw47XhDzTDi3vmUWuI
	M3tQibyQ4DDu9TCe13mJP/RFsugsIkwhUJp5LjshsdDWcI3Sb0ByzyOyJS6GOSSJL8u3PTxxitl
	EJgYSZb0c65bQ1L2NOacpBdLm6/PdMR8xLMZRVKHxSUGlqxrYUCi5tNEFS91cY7/gmDak2ttd62
	se245lQ3q2G2cgRBSHXMmwsc4ttIiYKhGLBPZqqOBT5oIWaTNSNgmwL2+5IpIzdpdTXWN6z1Qio
	hdhG9TqerLDLC356OppRcuTHDPWHlwRDFIGNFOeoDTp4uC3tujhCz4vHcggZ2GE+V6i6egNQ==
X-Google-Smtp-Source: AGHT+IFxpDudTXwIWPtFNvkoyi2MCTPSB82q+cheaWh8DndjD5+q+I3FMC5nPCdsc5ZAOVqgxrhpjg==
X-Received: by 2002:a17:907:3cd5:b0:b73:57eb:688 with SMTP id a640c23a62f3a-b7367949dc5mr287626866b.53.1763122738505;
        Fri, 14 Nov 2025 04:18:58 -0800 (PST)
Received: from riccardo-work.fritz.box (host-82-52-164-74.retail.telecomitalia.it. [82.52.164.74])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fed6315sm375295666b.64.2025.11.14.04.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 04:18:58 -0800 (PST)
From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
X-Google-Original-From: Riccardo Mereu <r.mereu@arduino.cc>
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
Subject: [PATCH v2 0/6] arm64: qcom: add support for Arduino UnoQ SBC
Date: Fri, 14 Nov 2025 13:18:47 +0100
Message-ID: <20251114121853.16472-1-r.mereu@arduino.cc>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Changes since v1:
- Added PATCH 1/6 adding Arduino vendor prefix to
  dt-bindings/vendor-prefixes.yaml
- In PATCH 2/6 and 3/6 changed compatible in spidev and bindings
  to "arduino,unoq-mcu"
- In PATCH 4/6 changed commit message to clarify imola as UnoQ codename
- In PATCH 5/6 fixed a typo in commit message
- In PATCH 6/6:
	* added chassis-type="embedded"
	* ordered nodes in alphabetical order
	* dropped unused led labels
	* fixed error in commit message (qrb2210 instead of unoq)

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
 .../boot/dts/qcom/qrb2210-arduino-imola.dts   | 456 ++++++++++++++++++
 drivers/spi/spidev.c                          |   2 +
 7 files changed, 488 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts

--
2.51.2


