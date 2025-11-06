Return-Path: <linux-arm-msm+bounces-80626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9984EC3C196
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 16:37:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 403CA56098A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 15:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C9C287518;
	Thu,  6 Nov 2025 15:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="OdOBHfbu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB0A2957C2
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 15:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762443086; cv=none; b=i70C8xufNKbZooEs8eZrlZcBn9ynO7DTPWLTAQqQVEs0nhBvGjGBSt57smOHT1P3sYdyZdOl57OWXr70FpkRJDqlk/PQ6pdMP88ynfAaBlW6KECF3DKyZSf5czhG1UdhJUOnSpqqkXZGJQFEV3fEpi1UCWeBfM4bKWvKhLge0zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762443086; c=relaxed/simple;
	bh=q7sHWixTWPakJjpCcPxaoq8AAo162rx3AhfF7uVu25c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gstzYr16Oh6dxAQ93E1J7OVn4xoXRi4st6jmmM6HNqPMtME5qaf4kOVxoaPv3nkSuDHSZJTbpUQM4Ns0n4CD0do85ligtg0Sm5iVmJu0gZmeXO6aYZ755qbby12Wuo9loG/KN4npO7l/Vu3YEqF0jn0r/r0MomaX3yyo3nEKxW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=OdOBHfbu; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so733355f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 07:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1762443083; x=1763047883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yiPq/j8AAJTo8QumL7Ou0ccmUXufOZkM5RLHegjZVMs=;
        b=OdOBHfbueRgB62YMyO/xKfh2Zf+yMHwDrCxlE6ZShHQdhZuWQ+n15KOGbvk9ITW06D
         dVs6oN2MurfkC2rWyFo4uH1t2CBIsqJfl2SOQ1XRs7Z+kukQxdL1/zT7M15GG/YjdUe2
         rv0467B33Xhgc8vcR/we4HLVvNo1TL/ytPIYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762443083; x=1763047883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yiPq/j8AAJTo8QumL7Ou0ccmUXufOZkM5RLHegjZVMs=;
        b=bu6JSHsk/iScyyEFwF9nfaLuXkHG7BhyQ9Zr1IMCP03EDJ5iZ5havcMeocJJfnKcD8
         2nM6X92Trf7nUSEzj43KdGNL/7yOQOSUEtlXBxHkNRV05GfG+rvbGSheMmclWfilz128
         ZC520QXtRBZKnrqYEO1sQhSqdp2dOqf0i/QJPk5Ji1JdcpzFrJUTP4aam2QC1O8Ooz5a
         W76TcBGkUb4RCGnCvLT30NGViSoRuccgpfJjLf0KDqYBD1LNRSmiZjjCQ8aJ63X5i75l
         K/hw3a5YybsewcYRAglmhkCqjTiB03R35kwNIGcIZ3NkkKfIQxOVBr7Sla9y+fd2QzyS
         1hkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjxDqFze4OO10Rfw0p7Xx89pcXzt6/mfQjqsBX0vm7yzet65PTmBn7tM6LAqje6ZjDyIIQspWuG3CQK1/9@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr9TWgqeleUWG5Y410VK+ZZ470J2Shnz9B+D+/OvoZ6E3DCdew
	K7hTucD7Bs1Ney+pJUSOzc46aYxu4kY7wD0GLDaD6uYHGck6JgYWHhH1P8eTU5fJ+wcAgkqijhJ
	hMh9A
X-Gm-Gg: ASbGncuCMs2FW4jLqjuf7zBPt2hDSYi+f9Un5J45HpIs3RHxChhe8hwGIP/YNXu4IZJ
	Jc/vePqH8BYFAcX3eLRHrOyNEedH+ivlDhC9so0Sr/nG9TndpN/dH2MJM/ZvndfCKXd7kHU4Nar
	lDRl2CQ9OarNiGuESfzAOuzmT7AGZzY+lgLso1+pEVIN8hL+kLr0t7jG8pKIdywWVAUK5Uv/36y
	WkY/n5plrO6VtwYrrqBBzr1RugI0CN93wWx44EXvIb9Gf+8S0INNkBVn6E4fQsF2iaRenVdVjyp
	gt6OdNbcOt1WRXeqsRga/Jfo1XYkg6adQKl1bAXi9aEOFxyD3+RTagkBTj4DuMXEmGTyLz7xCtd
	4PQRf01yzTbluKVKmlI6+vfX9kGH8yJEfonnkNBUoLeCyK5B/DUACUzKbdFULPH12tUz/o774L7
	A62L5DKnVKfrenRPKYhzoqNfWw
X-Google-Smtp-Source: AGHT+IEDkfl3qHSikpIA1Fyk7Grp63BtfKWcdxvISif02sG/ljkZgpwjNMkZU5Sn7DWLfr/nw/w+YQ==
X-Received: by 2002:a05:6000:2c07:b0:429:66bf:1475 with SMTP id ffacd0b85a97d-429e32c6cb6mr6521748f8f.3.1762443083270;
        Thu, 06 Nov 2025 07:31:23 -0800 (PST)
Received: from riccardo-work (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb49a079sm5966719f8f.32.2025.11.06.07.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 07:31:22 -0800 (PST)
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
	mm.facchin@arduino.cc,
	Riccardo Mereu <r.mereu@arduino.cc>
Subject: [PATCH 0/5] arm64: qcom: add support for Arduino UnoQ SBC
Date: Thu,  6 Nov 2025 16:31:14 +0100
Message-ID: <20251106153119.266840-1-r.mereu@arduino.cc>
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

Riccardo Mereu (5):
  dt-binding: trivial-devices: add arduino spi mcu interface
  drivers: spi: spidev: add compatible for arduino spi mcu interface
  dt-binding: arm: qcom: add arduino unoq codename
  arm64: dts: qcom: qcm2290: add uart2 node
  arm64: dts: qcom: unoq: add dts for arduino unoq

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/qcm2290.dtsi         |  24 +
 .../boot/dts/qcom/qrb2210-arduino-imola.dts   | 467 ++++++++++++++++++
 drivers/spi/spidev.c                          |   2 +
 6 files changed, 497 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts

-- 
2.51.2


