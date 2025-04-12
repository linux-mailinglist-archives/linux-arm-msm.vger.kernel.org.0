Return-Path: <linux-arm-msm+bounces-54110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6990CA86F5F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 22:27:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B47457A8294
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 20:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F9101F37BC;
	Sat, 12 Apr 2025 20:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5R1cKlz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACFE347A2;
	Sat, 12 Apr 2025 20:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744489619; cv=none; b=oreOy5kbhoqKZ0yGcIWZRUVOo1i4Uwor5zmUJmOtKVPXpXXGCNdgmR2p+Nnc5HxszTXD3kBNKnL6T/Bv87Xojgd3nOIAbpUUdRBaR7WhWYZzIRhOYaaO3YskbWs/SHs3h5NoVdNq/D7KQmgxb/LLcev4Wv4wNT7JIJLyiA3XJv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744489619; c=relaxed/simple;
	bh=NTZ+FTmF0S9Ef6nt1Sc+I/jGKIvA4f8+bAajP42rhG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rq0Oubv7ngQcQ2z1Bz/hZCZUm2rTwU9221V2h4YC+RfMc9+xgONEmy2xt5abB57UZUCNAcNX6utdCV/SeMAN7qdWp40dVifmYX4UVk5uljlbaCfwCdaGiQ5HTNrGZvRnnvjp44UAX3U0IlyxwvLMoC0Tz9ZSI1nzXfLWDXwK0Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I5R1cKlz; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso2837476f8f.1;
        Sat, 12 Apr 2025 13:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744489616; x=1745094416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pt8x7MsG2eaE/5Lv28czLfNqjIaR0J4hccDPHzanxb8=;
        b=I5R1cKlzFncBNQdFBwdGMBk1q7qxFgAv3t3Am88TzSP0Cael4LUd5cma2wWh3RJDvp
         hhpb874SKBWHJ4OMSIzLF3qhtmzNNazDDCN8xyjW5ooOLs5+eB4ykTDHdH0VpAHeJzRq
         sHO5BogddMXN0Uv2DBzM/G/U9p/yBPCaKOux/IR8xtaUMhhSdyrbdAxfKXWn4JlOYTbB
         RlbKkFnazS8LMZLx3qEOPSFWV4DDNPEGuorMDOJ2zTsX3Cq6Rd0H8XeQ3m+jrnzJs3og
         8UQdWB1jJUZfhOGC+LOUvNMu/aaAywafSo6ZT9C1/9V5VlgtYLICWVxEwgKXtkhVrew9
         2o1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744489616; x=1745094416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pt8x7MsG2eaE/5Lv28czLfNqjIaR0J4hccDPHzanxb8=;
        b=dSiOUvbbdtyye8sufkWlQP59rTQSmt/g86mL+yKJRbJKma/dz9JNhR8KL39HG5HwQj
         KUspiVgSYUvSfPfpH+63zq67i2DAwQ03SPMhaoKqEz76M+PMcFq+ZF61i/IUOIm0KYz5
         GzUJjkRJbHt9qLAV1aHo7FzdltV+aKAy1U5SFYjHLmawVBvhyHCLvICizY7UUAAMTOS1
         /uZPPmyAfAqE5zi/otDfqTYfj23tkmE9wScj8E5zZDTuDCBzSCIDzjb/xvtyhhMysK85
         EFhFaCNeO3lNNa8qApaVpefBjwFJt+o6NIOXdxIJz+v+RcBontYPt//AAR8xCSNRDLk4
         7kZA==
X-Forwarded-Encrypted: i=1; AJvYcCUCXyj358wObvzgcN8yr6QbgBbOJckRWkQl7LcPHNGx7C0CcFi8JeIIzJpGZWmc1omlNbwrdUS/90lB@vger.kernel.org, AJvYcCUt89b5QAhZuJHyYm4SFtUlOzwOCwdEjS+MYQywFHz+4rsdFoHp4sRSerbGRZO8pOtOA5lOg3MIysib9SH2Vg==@vger.kernel.org, AJvYcCV4zMElxeXOCYB5LgygsiytkVbswKCi+/3xm8mGeK5yMEV9HjI6LtpWR0YbJIZqCQCdvEqKChfugEpv+cZw@vger.kernel.org
X-Gm-Message-State: AOJu0YySMC8rcQ9kaP1MC3gNK8UxLLKIzrSYQvUu+r+UbJpjxERZX+3y
	Rms62QcvdjynccbjssFO30ZCN5LIi+D66mtbJeKPV0M4i/VcLx23
X-Gm-Gg: ASbGncup5z9Iib0Rh6FunhkcpPe7k4JotA4lW4zWk88Zx0tMw8mQQb70DIHwrZjPOsu
	2lXF1PEULLjhs66VsNulWDNW9tBll7ariFvolgPbJs8EOcHE8KUbpLuE1oCx2PA748fBHvjFWZA
	jhZanJyQOXmuxNMDTj2JUXgzaknSvV9uVzvLsEIsSkPfd/UJAiGHJ2vMhvCdyVih3jZB3MmSa4P
	Qif5fuxY6JuD2O7UDvngknA7T2wcA2HInNEjJwLVrvk1KKU93Z+EP1fZ1mAfaoN3mJvrgaZnrae
	N9Rz9qh4H7GXE2HeAPZIzHzsXtroQ0GIMFJRjYIVB6Gw28HcgS4I39ZzP48d9vU80jBHly18WOu
	cwWJOBqsyE3yZ+GK4
X-Google-Smtp-Source: AGHT+IFTVjJVaiqOWTJvgSlXy0IDFIlrMIPfubQkZClUTft4KlMYZTec77RN03cNec003jQi0G1xXg==
X-Received: by 2002:a05:6000:4022:b0:38d:e0a9:7e5e with SMTP id ffacd0b85a97d-39d8f2676a3mr8510788f8f.6.1744489615366;
        Sat, 12 Apr 2025 13:26:55 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d802sm131797845e9.1.2025.04.12.13.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 13:26:54 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 00/10] phy: samsung: add Exynos2200 SNPS eUSB2 driver
Date: Sat, 12 Apr 2025 23:26:10 +0300
Message-ID: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

This patchset adds Exynos2200 support to the existing eUSB2 phy driver,
as well as USBDRD support for that SoC.

The SoC features the same (as far as I can tell from comparing code)
USBDRD 3.2 4nm block that Exynos2400 has, hence the common denominator.
It consists of a SEC USB link controller, Synopsys eUSB2 and Synopsys
USBDP combophy, which are independent underlying hardware blocks of
the USBDRD controller.

In the vendor kernel, everything is handled in the usbdrd controller
driver, with helpers for underlying hardware block functions outside it.
Clocks and regulators are specified and enabled in one node, which makes
it difficult to separate what clocks and regulators go where without
access to schematics or TRMs. The following gates are defined for USB:

CLK_BLK_HSI0_UID_USB32DRD_IPCLKPORT_I_USBSUBCTL_APB_PCLK
CLK_BLK_HSI0_UID_USB32DRD_IPCLKPORT_I_USBDPPHY_CTRL_PCLK
CLK_BLK_HSI0_UID_USB32DRD_IPCLKPORT_I_USBDPPHY_TCA_APB_CLK

CLK_BLK_HSI0_UID_USB32DRD_IPCLKPORT_I_USBLINK_ACLK
CLK_BLK_HSI0_UID_USB32DRD_IPCLKPORT_I_USB32DRD_REF_CLK_40

CLK_BLK_HSI0_UID_USB32DRD_IPCLKPORT_I_EUSB_CTRL_PCLK
CLK_BLK_HSI0_UID_USB32DRD_IPCLKPORT_I_EUSB_APB_CLK
CLK_BLK_HSI0_UID_AS_APB_EUSBPHY_HSI0_IPCLKPORT_PCLKM
CLK_BLK_HSI0_UID_RSTNSYNC_CLK_HSI0_EUSB_IPCLKPORT_CLK

The vendor kernel specifies 4 regulators, 2 of which are for eUSB
and the other 2 for the repeater. The rest of the PHYs and the dwc3
controller are on a single power domain (hsi0), so they're most likely
sharing power rails.

As Qualcomm is also using the eUSB2 IP, the approach taken here is to
rename the driver so that it can be used by other SoC vendors as well
while keeping compatibles SoC-vendor prefixed (different vendors have
different implementations of the IP with different register maps),
add support for exynos2200 in it and implement support for exynos2200
in the existing exynos5-usbdrd driver (with link controller init).

A new USBDP driver will be added later on, so that super-speed can be
configured.

Bindings have been tested:

$ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j4 dt_binding_check DT_SCHEMA_FILES="Documentation/devicetree/bindings/phy/samsung,snps-eusb2-phy.yaml"
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
Documentation/devicetree/bindings/iio/light/brcm,apds9160.yaml: ps-cancellation-current-picoamp: missing type definition
  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/phy/samsung,snps-eusb2-phy.example.dts
  DTC [C] Documentation/devicetree/bindings/phy/samsung,snps-eusb2-phy.example.dtb

Best regards,
Ivaylo

Changes in v4:
EUSB2 changes:
- make a new separate binding for eusb2 ip found in samsung socs
- fix order of tags in 03/10
- change 'SNPS' to 'Synopsys' in the MODULE_DESCRIPTION in 04/10
- simplify code around device_get_match_data in 05/10
USBDRD changes:
- drop double colons and 'phandle to' in binding

Changes in v3:
USBCON changes:
- drop the driver and introduce it all in existing exynos5-usbdrd driver
EUSB2 changes:
- split changes into multiple commits with clear diff
- add a commit to do table-based lookup for refclk
- clean up here and there
- correct the cover letter according to my new knowledge of how the
  hardware functions
- change commit message of the optional repeater patch

Changes in v2:
USBCON changes:
- drop unused header includes
- sanitize the binding
- proper init and exit power management
- shorten some variables
- unrelax reads and writes
- update commit description
- remodel to take other phys
- drop specified regulators as these are for the repeater
- make the kconfig description better
- general cleanup
EUSB2 changes:
- merge the previous separate driver into the qualcomm one
- drop the previous model of taking usbcon phandle

Ivaylo Ivanov (10):
  dt-bindings: phy: add exynos2200 eusb2 phy support
  dt-bindings: phy: samsung,usb3-drd-phy: add exynos2200 support
  phy: move phy-qcom-snps-eusb2 out of its vendor sub-directory
  phy: phy-snps-eusb2: refactor constructs names
  phy: phy-snps-eusb2: split phy init code
  phy: phy-snps-eusb2: make repeater optional
  phy: phy-snps-eusb2: make reset control optional
  phy: phy-snps-eusb2: refactor reference clock init
  phy: phy-snps-eusb2: add support for exynos2200
  phy: exynos5-usbdrd: support Exynos USBDRD 3.2 4nm controller

 .../bindings/phy/samsung,snps-eusb2-phy.yaml  |  79 +++
 .../bindings/phy/samsung,usb3-drd-phy.yaml    |  38 +-
 drivers/phy/Kconfig                           |   8 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-snps-eusb2.c                  | 627 ++++++++++++++++++
 drivers/phy/qualcomm/Kconfig                  |   9 -
 drivers/phy/qualcomm/Makefile                 |   1 -
 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c    | 442 ------------
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 227 ++++++-
 include/linux/soc/samsung/exynos-regs-pmu.h   |   3 +
 10 files changed, 964 insertions(+), 471 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,snps-eusb2-phy.yaml
 create mode 100644 drivers/phy/phy-snps-eusb2.c
 delete mode 100644 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c

-- 
2.43.0


