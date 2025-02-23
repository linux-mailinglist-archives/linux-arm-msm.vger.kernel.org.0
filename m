Return-Path: <linux-arm-msm+bounces-49054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EECA40EC9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 13:22:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A57EF1898D1E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 12:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6444205ACB;
	Sun, 23 Feb 2025 12:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dS0stnC6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40551C84CA;
	Sun, 23 Feb 2025 12:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740313355; cv=none; b=LFd4qff6hBWDztmpAJFRhTdTY4oZ8w6/H27oRACitvh1K85KQPJW6unCHAbVfIzXfQOgS7gl50FJmvac3KRX25pyD4o41wbf21ZV0tROSnTm7RU9P+UbLBFO7uBJ7sv5Cp101sbXiKCuIEMkiyeuOFpeHE+MzEbJpUosaFOmdG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740313355; c=relaxed/simple;
	bh=ArZJRBd/4pbxz5g/Vwcsz0/TlDZxkfebjhAuZq4kED4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VDgBzoOU76/hIh9MVUTNPi0EDqT3blkSU6Q3/QEpQX0n9pzciwmpqrHqXJJCa7V15V7cCoIHb7XmrFtw5wlx7nRtSrbucO0QnpjAqGxl7oSfVkzduKpamXQ6CkFEGMGUwsXF1iCALi9BHkR9Dm2EcdYpswBdi7yM6E6KlsD/nsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dS0stnC6; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38f2f783e4dso3080062f8f.3;
        Sun, 23 Feb 2025 04:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740313352; x=1740918152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FKPUmtrZifzHzdD4ujiZUV2ha0V1EuD2HhlEVPXjoTI=;
        b=dS0stnC6stPwvjTN6IjPm5jDe1p8gbxsSIZcHbbjZw8npGOmkAWc8nK9ATgOkDCmSy
         DeYDDGFgyNXIeytI/2uwyXW91UZ/MTURa174WzUwv9nz96WX+l7w/53CHqGDXhCbcahn
         oCicchPuCT3u0sAmqbhJKUuqohJTihX59ZGjDPvRE7I3YzyCnME9Jh7RMSTxNI76FHeQ
         ruScFFAuG0kh6D78yQ7SiodR8i8vddPsU/tJsWWun32nEcz6MhL2DJ5TWzeZl9F9daBV
         lJp8pMye/Ro6VigjtapqmgxQ7oW9IDLseAeaFK5oXBZDkD77hq7DgMtjedgdHKpn8Hor
         VqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740313352; x=1740918152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FKPUmtrZifzHzdD4ujiZUV2ha0V1EuD2HhlEVPXjoTI=;
        b=Lqd598CksVqF31CjfagecYu0qwQOxJV8Iy4hnmG7BxXhl5obv+P5c+jc6z4isSDNK5
         rFlXdfujraMBw/D2tYTtNPkzxHddKjrJ7jU+Tz7fUpXiM8bnRkAfp0Ps6jndHduFnKW/
         zMqbouHCu2LpXS56OBJJf3QnmPXmJ/X0AZSNpaU33F86BoYNQV7aroNTaJFMzrIBK7nv
         LQCP4pZBcv64zObrAamcJhHFid8ICWopfAMxk1hc/9cgIEex/kiOAABvgRmC/ds/dOOU
         eNFcIu6TolPQCWP0CAxwZZEmnsymNgOgaBOOdmjdcAkFut2nehQnatleJGHp0Ex0Mu/N
         jmQw==
X-Forwarded-Encrypted: i=1; AJvYcCVEiCRA/Gs4te+KcExmsZ3iGG6P/Tw/4f52vfyW5OvO3m6I+vz3cLoHoiCUDEeKsh3npkfYWvQA50s0V4fF@vger.kernel.org, AJvYcCWabAXLxTxr/eX4Kqu9RU2t1t+wLb8tNsIdQEAamqll8z48FMnSNAbXqdVwg/b0z41Ojlb8Eb08e/hW@vger.kernel.org, AJvYcCWkq8vnq3sub0oo5kpCR42hYictLJlX+OC4mUX+vhew2QGodsPor+82I/3jvtVqvIrxJQgCh06TadULAVcTS+YlTsg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5jtw+E8kFiiN5Wa1NvGstllhqB8K9FixwLDdFXJ3Z2hxXslY5
	eb9CAD9E3y1l6zYzTUTMCD1EDkWtzoggHnK5emUFF+sU5V2e7fHa
X-Gm-Gg: ASbGncu6yZqT4jM5ZFkqlAE5k4X7zVORg6WYBShT8JPRNSsPpYu90x05AHnOgX8QVBQ
	cL+GfFJP+sOBzRCfmcCkvFV7rrmqGmB9mNF9oidOUAqwQGRetZ41Kp5oLVwsViz3YRP70uw5OUh
	IQJWk3RNwCA288ZNarBsrU83uW/3oUAlr3UW3iGDtKFJjBZsrRU+qFhQq74KNMAaDrQe/46GbQ2
	VOKX4SuUbJx+/SwH9t68yJTQP2InjfMEUQ13A9hTZu5M+lGOybFGdIucKx2w8SDM7pTV6miZWzZ
	axlJedlczWKhx1vL6zLYR5wH1Rv1fapx81CFIXTMcSdZJJT0CFBBM/FBUfU7/JcCHz4W+f8SIzy
	fcA==
X-Google-Smtp-Source: AGHT+IFF0Ys8iFbS9iVVaNpCOkfbWSsfnV1SQ/+3vlRrKKwWO9igs5LmwE4oSfElk+6OGzdggA5aVA==
X-Received: by 2002:a5d:64ec:0:b0:385:fa26:f0d9 with SMTP id ffacd0b85a97d-38f6e4be4c1mr7603763f8f.0.1740313350463;
        Sun, 23 Feb 2025 04:22:30 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8602sm29611608f8f.94.2025.02.23.04.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:22:30 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/8] phy: samsung: add Exynos2200 SNPS eUSB2 driver
Date: Sun, 23 Feb 2025 14:22:19 +0200
Message-ID: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

In the vendor kernel, everything is handled in a single phy driver,
with helpers for functions outside it. Clocks and regulators are
specified and enabled in one node, which makes it difficult to
separate what clocks and regulators go where without access to
schematics or TRMs. The following gates are defined for USB:

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

From what I've managed to understand, this SoC has 3 PHYs for USB:
 - a synopsys eusb2 phy
 - a synposys combophy for usbdp and superspeed
 - a usbcon phy, which acts as a "controller" for the other 2 phys

As Qualcomm is also using the eUSB2 IP, the approach taken here is to
rename the driver so that it can be used by other SoC vendors as well
while keeping compatibles SoC-vendor prefixed (different vendors have
different implementations of the IP with different register maps),
add support for exynos2200 in it and introduce a new USBCON phy driver,
modelled to take phandles to eUSB2 (and in the future, USBDP).

A new USBDP driver will be added later on, so that pipe3 and super-speed
can be configured.

The USBCON binding includes a header from the clocks [1] patchset.

Bindings have been tested:
$ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j4 dt_binding_check DT_SCHEMA_FILES="Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml"
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
/home/ivaylo/linux-devices/s22/linux/for-upstream/linux-next/Documentation/devicetree/bindings/iio/light/brcm,apds9160.yaml: ps-cancellation-current-picoamp: missing type definition
  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.example.dts
  DTC [C] Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.example.dtb

ivaylo@ivaylo-T580:~/linux-devices/s22/linux/for-upstream/linux-next$ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j4 dt_binding_check DT_SCHEMA_FILES="Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml"
  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  DTC [C] Documentation/devicetree/bindings/phy/snps,eusb2-phy.example.dtb

Best regards,
Ivaylo

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

[1] https://lore.kernel.org/all/20250223115601.723886-1-ivo.ivanov.ivanov1@gmail.com/

Ivaylo Ivanov (8):
  dt-bindings: phy: rename qcom,snps-eusb2-phy binding to snps,eusb2-phy
  dt-bindings: phy: snps-eusb2: add exynos2200 support
  dt-bindings: phy: add samsung,exynos2200-usbcon-phy schema file
  phy: move phy-qcom-snps-eusb2 out of its vendor sub-directory
  phy: phy-snps-eusb2: make repeater optional
  phy: phy-snps-eusb2: make reset control optional
  phy: phy-snps-eusb2: add support for exynos2200
  phy: samsung: add Exynos2200 usb phy controller

 .../phy/samsung,exynos2200-usbcon-phy.yaml    |  76 ++
 ...nps-eusb2-phy.yaml => snps,eusb2-phy.yaml} |  70 +-
 drivers/phy/Kconfig                           |   8 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-snps-eusb2.c                  | 677 ++++++++++++++++++
 drivers/phy/qualcomm/Kconfig                  |   9 -
 drivers/phy/qualcomm/Makefile                 |   1 -
 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c    | 442 ------------
 drivers/phy/samsung/Kconfig                   |  12 +
 drivers/phy/samsung/Makefile                  |   1 +
 drivers/phy/samsung/phy-exynos2200-usbcon.c   | 250 +++++++
 11 files changed, 1085 insertions(+), 462 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
 rename Documentation/devicetree/bindings/phy/{qcom,snps-eusb2-phy.yaml => snps,eusb2-phy.yaml} (57%)
 create mode 100644 drivers/phy/phy-snps-eusb2.c
 delete mode 100644 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
 create mode 100644 drivers/phy/samsung/phy-exynos2200-usbcon.c

-- 
2.43.0


