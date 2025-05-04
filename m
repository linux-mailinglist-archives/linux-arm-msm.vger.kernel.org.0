Return-Path: <linux-arm-msm+bounces-56684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4DEAA86C6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 16:45:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF1DC3B5781
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 14:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE493C465;
	Sun,  4 May 2025 14:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnqrodQt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEE2A32;
	Sun,  4 May 2025 14:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746369941; cv=none; b=rGh0xrft8wP3LmBj/289T75lT2e/09Q9vYXtNQKHxw137sIEE2APta8KWydIUYYdhJas3SJY0kk/pYM9n2+DiS3L3ikYWKBC1nyK49QfSLihUikq/DEO3EiTPBOlbmsmURbyfSfsCxJqEj9VCz2rpuE6dYh+qdqO6zBTxj5UuCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746369941; c=relaxed/simple;
	bh=oiCEtS/eOz6m9+tyNyy/pKX2vCc5Am/9bmOf469qf7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fal2SZEyb7CWZ24yN4om3zUT8ViHKr//Z65WAfdPOgGI9zOJGNAet65oycE+USkYfrC02qUxeIpgtKpGeGuSVBXHDQBIqbhsDByHc6oh7DWScZGJESWG4QOTFHFXMVl5p7yNMzqF1DsodJSrAZetcf7pwrJN2l6HMEnjgMLvePM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnqrodQt; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso6750482a12.0;
        Sun, 04 May 2025 07:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746369937; x=1746974737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3GLMQvVURueTJUfJOlZy1bzDlyZjB6YxPVmLXhRiwUg=;
        b=cnqrodQtr8c2v4B3axTP2fovZHdNUCCxj1ok0H4ijGphIFOG1ZvdJY8PKpA6vhW0SC
         lD0vO+TQXTLS9Vj/SPW1jUGHBzHrCcnVkZEnr/wy+v+jy/b7g0SttCbPCxUx3EiJUxFa
         qLy4CrI3cqGaay6AbjEYYvDRcTytHaXsfpaeVHSNHtCacVPoYRxdH/ziGYi9GXIPyzHx
         CMGkeS2zvrPcjoFdhPjAomla310Gz42/hbE5FgqnakG00XMc8orNLGKFPMOMf3HT6rdk
         8S0Q11z0qIJxW+26E5npJ3cgA9DX79kkoQFLRisn/VZEjcJrEK0JhWd6ChCnGBOI3Ucq
         ZhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746369937; x=1746974737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3GLMQvVURueTJUfJOlZy1bzDlyZjB6YxPVmLXhRiwUg=;
        b=cZbxQpCjSwEh5ISI6H/x3+2HDq1DfIZFkAN9E75FrMuQxKxCjCC4CUujei1O0tJUbt
         nriWpSYtZ6b/3Xd1QkU5hIH3iV+OX19nHq1rVaa8Oy8rtvLhv0M/RQDK3gG8nU6Rn2KF
         CLD+5tQ/7T+3phVLoEZTETlHWUSrZ1on63psNPbnh8+25ffHNl763ElJobEWO44R+LsT
         VNJ7XPmKIHk9ofQqExINMIRLvfSmccmYicLGZJmcOTe773uACFG4mgtBbYjnvaGjiKS1
         fOyFSm+gDta6feKKVGOwL7Vtsz7dKJJN7j0i1fgB3DsydSqhA5z+gSu/yYediXWZDaft
         OEIA==
X-Forwarded-Encrypted: i=1; AJvYcCVajcEG3bwsokUn6yNcJXFGLWuXti3DTyddrk9U6m6yYLv5v08FUU4bD+f66jZiZWgy9uif+S0WCIpMHSgQcw==@vger.kernel.org, AJvYcCW76lLeIlNNgo5oKzroJR+4FsPT2G3RPJCeZFhOIRkN6S1BrkLqG38ulu4/q/uZr7DOL2S8NBP+sUNn@vger.kernel.org, AJvYcCX8fwaYijG2Ga+ve4urCXFh/lVDYwE8NNvlnzZ45fwbDeLKvYp8yobsrvSgxIAFhxfs+d8ZkcmwrcxX3F+8UwGlsOo=@vger.kernel.org, AJvYcCXTsAXs+ni91torFdUbsQrQa4SXvTinDMVoHBwpMEZx9ZJvcq0wDwVRErEQco0VY8w3UuO88abzOjXQECsH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Xs7a9e+tjg5de24yx7DnAWSzQoLCfDczkhLrsYgZjaTCwXYU
	34XXCGNSPUmwBUXUjbHNmAOZnngeFBMCW8SKqQXZosqehK92km3SO1RsXw==
X-Gm-Gg: ASbGncs5zCGLjcQU5GnsKpbA4jFpie4D1dt6ZuNlsCqVOsFcpQz0In9kNF861j7v7JZ
	uma6aQwZfLBivAnsCHrNRyavI3fPaQJpfWH0HkGDcqUuzOYc+xsr8kFX0FE9Y6aOIrlAowt0H7c
	aMxg/oQ5kn9S0k1ng2xrQHfS+VzdgmEC2jDaEGi5stbzJ+ci4VX6djFXTOOS65jj2xjpIvRQ43p
	g7kJPkcv8llbZ9JnkO/7Dm51kknNTdbdxC3LauPgF5iqyg6+VSQnQORrmjt9YRAaHbb/pjpwGBx
	u0lb3MsQ5TNKDqHZipwlBp777Lr/kZCWayMjmV51VCBNUfBepiF4LUt2IkIhQybWWMSQRYX/P1z
	0MnbA0+ElvPqZygF0
X-Google-Smtp-Source: AGHT+IEC43jOF2l9Y+pWj7JP3rs0bfznp+nHLXmOJyVYTaj2ERAtZaGGWdiC4aq9yrCcx89V7OTvYw==
X-Received: by 2002:a05:6402:3494:b0:5f8:36b2:dc07 with SMTP id 4fb4d7f45d1cf-5fab057d79cmr3440722a12.16.1746369937074;
        Sun, 04 May 2025 07:45:37 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5faecf59d31sm1147258a12.77.2025.05.04.07.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:45:36 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-phy@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 00/10] phy: samsung: add Exynos2200 SNPS eUSB2 driver
Date: Sun,  4 May 2025 17:45:17 +0300
Message-ID: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
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

$ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j4 dt_binding_check DT_SCHEMA_FILES="Documentation/devicetree/bindings/phy/samsung,exynos2200-eusb2-phy.yaml"
  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/phy/samsung,exynos2200-eusb2-phy.example.dts
  DTC [C] Documentation/devicetree/bindings/phy/samsung,exynos2200-eusb2-phy.example.dtb

Best regards,
Ivaylo

Changes in v5:
EUSB2 changes:
- rename binding to match compatible
- simplify binding name
- indent binding example node properly
- add r-b tag for binding
USBDRD changes:
- add r-b tag for binding

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

 .../phy/samsung,exynos2200-eusb2-phy.yaml     |  80 +++
 .../bindings/phy/samsung,usb3-drd-phy.yaml    |  38 +-
 drivers/phy/Kconfig                           |   8 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-snps-eusb2.c                  | 627 ++++++++++++++++++
 drivers/phy/qualcomm/Kconfig                  |   9 -
 drivers/phy/qualcomm/Makefile                 |   1 -
 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c    | 442 ------------
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 227 ++++++-
 include/linux/soc/samsung/exynos-regs-pmu.h   |   3 +
 10 files changed, 965 insertions(+), 471 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-eusb2-phy.yaml
 create mode 100644 drivers/phy/phy-snps-eusb2.c
 delete mode 100644 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c

-- 
2.43.0


