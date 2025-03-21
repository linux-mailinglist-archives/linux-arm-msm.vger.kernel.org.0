Return-Path: <linux-arm-msm+bounces-52185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C31A6BC5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 15:02:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4474F7A89E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 13:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1828E86321;
	Fri, 21 Mar 2025 13:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPCq5BN/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B44F78F30;
	Fri, 21 Mar 2025 13:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742565542; cv=none; b=HOaCN5ro0jwRZyRvA7JWjqqo5MsXpTiYTjIOIqes7WWm7ce2VZnHW3TrEsgMUqstGvBXADR4zg6XqGAocvvRWGEk4lxA4MRjV2z4OgqlF/OIpMovYRXRR9RIfVue4k4Uclneuu52P7sYXRve1PS4Veo83gOYLLGk57cLmpdq5ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742565542; c=relaxed/simple;
	bh=Ovk1ExHa8mCFmYiAW8pvoVloVrvk8A3zeAUdnpbbAQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M7Wkhlurqpcd1N3hls+UAjQeiNTPOEFfEdLnVnWZpUhsTgodxOnZl+gArDglEvcfke+SUaVA9Al/4OYS2ejceNGv0JcuSq2oi1NPMo9E970/drVq7GQ6Y7WqnOIRoaMu7J+8GFw6/Q8y5StKJzAnDlmneV82HHWdnbPwNXU7RRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPCq5BN/; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3995ff6b066so1247331f8f.3;
        Fri, 21 Mar 2025 06:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742565538; x=1743170338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=56J1KUMfPtv7YH7JwS6tnsp9uttP01mWHoJl2IMnwrU=;
        b=gPCq5BN/ICvQ2gYZJTVBcUEuqpCMGWBz+9fuBzIN00wEX72zhr82KSBREMWvVcppCc
         +2+D6nU05lQwj9w0R+7BRq5gwINOVDK6KcC8Dm2JkP2cPNfXpSCoamIX+ot7j+g0VJhe
         FgugkcYg3gVrzlL/rBsdQ/iNnCRetrkiwAyxr/CTBlQ/gNf4wtIWQ9h+gGXPdmvAYiYE
         7v+YXnFk1xZvANX6TIT6xi8gpt6/cqgIIkRHaVUwQ1cFg/EgRK+zS0nql5RS3RnTwSs1
         zcBFWBGImuuCX75XqoxgfOCMZHDklzybhBjTgApdXjYSwmr+eLkKqSx32u8mijSAczfQ
         os5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742565538; x=1743170338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=56J1KUMfPtv7YH7JwS6tnsp9uttP01mWHoJl2IMnwrU=;
        b=Z8uq2fG7BIRHEyrZ0v8gKDLjZmRbzFzFadHBbvUOYPKm137C1PV+0IIEhpW+qMm5tr
         xoavwj7K39LPQChyFiSnLXEWnwYDSOzN25WROvqRrDfB5mtOlljrd+Ioxj+9M8B+xoAq
         xDZkk0ll88dQBrwN2EILmN+XBVRxgi5yDivw8jo9IoI/sl6q8gp/DYbTSfl2kzsIGitD
         3cuPuxwrD6LEQ9aBpzLv7OSm9Q1YUsvjbPjwpdvZIJL5+0XvX6WA0fFDctW2viWKz4TO
         XfADFNOyZOlvzELwvI0QtS9dr8JQgZ6lMynE08CxF0JU5Na83qGIxRnns9xTipDOoOEL
         HiQQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9gG5hy55J4ju3SHdUIce1YSwYFYEeaedsPeeAnDQEGvp6/TuTWGPerUQUNf3t9ETh6QBQ+H/y1N+qDMzM@vger.kernel.org, AJvYcCUqVAjkxr+C09S0k0Rjl5QaWcallW9BlOUT4ReH/HsGJ1+hMZ1gGpt/Vxr/mW1WpDJzqcSh/Ma1X23cjzWzI1WeJmo=@vger.kernel.org, AJvYcCXn9iSoZJMfAPXHF1DVlzxXwXYnVA6h+tFYsSVptQ8cbJ6Ra1wU1aaQFfxzJw/vsI/H+LfZvM218bu+@vger.kernel.org
X-Gm-Message-State: AOJu0YwHeB24GuGsr27Ah9qXXJ6wvGaVYIYS5A4pRRj1YY6rmJ8cHoIK
	D7Q8YciZOoCdcOrDZ5qqcMfdWVMux5JzeqdGgvu3e191xSgNvClB
X-Gm-Gg: ASbGncu0dkk/Za9GbVcwZJv8ELD50RJ8yzC9ZgCIDGHOl3hBjhCL5ZxuZNCsmnSQ44m
	YdbfHIrzdzXAEWU5TIvLExZJ4U99/S4ycmE1GEoFxsgsUxaaVCC+8YzzCoRmyMS7dip4y5yQcXg
	EwdZ8Ew8iRjDfXa5iQGQB56PKtImV3kdFns4yorid0K2S7kZ18c8JZnQsd9qUPL6wTYA2hPN2va
	lp70bRuEqLFN2ecjECyIKkcp7FB5X0tQ5dt+7zSBzDJhl0AYFMDLarEHWYFXdWhM7nOh2ViRiRe
	hIjwFPYHicRCEmP2O7DzjXyRc7Z2x2OlU4EUoF+lIc5uNE2ZXZlPorTXdPy1B0KBs2DAZ+0iQVr
	gA5jFuVpEhI9bJUKXlNic
X-Google-Smtp-Source: AGHT+IEmP2V8CO1INsAaZ0+BS6Z4Of0/aKLxKxtEMiq516SLKe67fIcVMhRIBPUe38svnpCtWpDFgg==
X-Received: by 2002:a05:6000:156b:b0:391:3173:4fa2 with SMTP id ffacd0b85a97d-3997f90087emr3132261f8f.5.1742565537889;
        Fri, 21 Mar 2025 06:58:57 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6651sm2437162f8f.75.2025.03.21.06.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:58:57 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 00/10] phy: samsung: add Exynos2200 SNPS eUSB2 driver
Date: Fri, 21 Mar 2025 15:58:44 +0200
Message-ID: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
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

$ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j4 dt_binding_check DT_SCHEMA_FILES="Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml"
  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  DTC [C] Documentation/devicetree/bindings/phy/snps,eusb2-phy.example.dtb

Best regards,
Ivaylo

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

 .../bindings/phy/samsung,usb3-drd-phy.yaml    |  38 +-
 ...nps-eusb2-phy.yaml => snps,eusb2-phy.yaml} |  62 +-
 drivers/phy/Kconfig                           |   8 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-snps-eusb2.c                  | 629 ++++++++++++++++++
 drivers/phy/qualcomm/Kconfig                  |   9 -
 drivers/phy/qualcomm/Makefile                 |   1 -
 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c    | 442 ------------
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 227 ++++++-
 include/linux/soc/samsung/exynos-regs-pmu.h   |   3 +
 10 files changed, 941 insertions(+), 479 deletions(-)
 rename Documentation/devicetree/bindings/phy/{qcom,snps-eusb2-phy.yaml => snps,eusb2-phy.yaml} (59%)
 create mode 100644 drivers/phy/phy-snps-eusb2.c
 delete mode 100644 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c

-- 
2.43.0


