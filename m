Return-Path: <linux-arm-msm+bounces-88243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D45D0859E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 10:53:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 072213055F41
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 09:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C2D30FC34;
	Fri,  9 Jan 2026 09:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="agEpZM7Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0478F24293C
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 09:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767952355; cv=none; b=J7ixIBkk4xrvQ+245ymvI0zYx/IdPlz6gko2/MUGW5GhSmM8jS9n0eSptWDpUF2hCPCiAvObiCeHCNmoar6XQJMI9COoMi0SoWhpHETkeyMQnBTvO3faOC5zI4+cCJVH04oJ66ZUSsMiS2DKmbA4ymYIpN2hup8+qOOQiBuHT84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767952355; c=relaxed/simple;
	bh=RzyJyvo/x42cBiwj2oou9H3/2KqVVuJXxMtZVIK/lqg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=moD0TUcUpmKO1QGBvbgw7ld3Idwncwtr2uhShFlLrxNlxq9utJIVq//DH2cRQLEbs/v7RJtHUdWRbK6HikvaT8uj5vXPHeEe1nLgHSrVfLz/O3taQfYRgtHF4dHw8wmksoVo2D7j3uTjvGbC6aCxwJWdZ27MShP90NQWKGcNrYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=agEpZM7Z; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-29f1bc40b35so47618395ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 01:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767952353; x=1768557153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5/BU4zRZ83RUczqUvA0ENYWG0qT5PQqCiT860KG9yx0=;
        b=agEpZM7ZxYW0qgF7J6zv28eM+C0m0pzMrB+ZyxfFnITSQFCrHTpkJG0e+fz+6u0k65
         HARtRqVvM4MAodcYxnE4x8ckajW1bVs89Y0o+yvNqnETILLQDjuec3t83056lfXi0U8W
         HRJFURq6rtwDJjhPi3A8Lpjup2otFNmEwtiG0JTnOteMQ/bkrm9RNe9BXmyigy43NxgI
         G+RV7NhW07q0RFr1f3pshskloXBIbKU0s+HtmLzQDe2KQ3xzEzv6wIcxgFcUZ6imUj4p
         GMy/tcXUH+uznoPFH2bw9/+s0cilm3wjZbb1f7axaSD5tZskN2p2yV/D34uR6g0OPWtU
         jVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767952353; x=1768557153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/BU4zRZ83RUczqUvA0ENYWG0qT5PQqCiT860KG9yx0=;
        b=dafqdCI3kBikY0hagWoH/iYOaLhqAuclsOJPXuIs9LVXoi3ZD+69bSvicFmRdia8Ln
         GK0U87HmjQN1RLAASdN2PUGtOjbKwCgiLWpfdADPZv7thdnJQWPuPJKI7xS0HCDjcTZj
         xFHBukvgap7UwWv/vRhcJ7AA4ETMX1RzA2Cer0HpvYsMb2yX1dFB9l0kYNiYx0vzDFSJ
         qq2Fsx6SD4H0l7ZHfcJPUKUyzYH9W4iolCTr3/He7flNEw59Xf7e+JKzzbLeEAje93mL
         ASuix3ae+BNnWi+TKTN0NxaSr4WHzxG7/OTQ4j4Zwet30t5dlJJugwkbIcDRRK2uqf0C
         sNeA==
X-Forwarded-Encrypted: i=1; AJvYcCXJrBs4APHKzUzGfDy31fek0qyUkKHAj2SgIvgdLYCP99TVW7Rrs9gg6jXbwHQnv41/FOYIsmTqpx5Cwf34@vger.kernel.org
X-Gm-Message-State: AOJu0YwwdEODgflOj1erFIE67tBM5AHw2YR3XLvuXICwxlI1QsU8/IPT
	ZnihWxgQVxBUBE78CxaZQz1YQHpwpVfkLo8zm3gJuy0UR5NlcHFX1sKB
X-Gm-Gg: AY/fxX4+TAxDarnnTx+DeNvl6wIi2+iyA9U2aWsbhhAolyFchNIHWF4hJGurZKnP1Q7
	MnHBYEgx8bcWChvIJ+OXvGrlK723bfoyXRJal82A9mUBWgWgdxod4yxaRKnRQKhbGXe/HyhsOzK
	ueTsf3hgCC4G5zuDbOqoXXB6iW+4r68jqqVM9/f0+C8PugS4fEV3nS4ZOMZKoCcnHxDExij4IYk
	UpDXEFQOGE0RMTf8DSo+FOAOEVJRav8R73qZfLoKTGMe1fELW6hKhV7dASDdQ9Ymfpk0fsOBLXC
	XYpfdaiPpH6gYJuUbpcDH8VWczP3QKpj2Hj6vWLaZ64A27k0lBEnccCh39IzrBDqEptczsKYxe1
	ZMaAurwRN7xseBdRnSmaItv1fVbDVqElpDtpHb43S7wK0wg1vi4uYeD90gdc1m++RziKfpzFd3B
	cxokLm1JOkWq/bAAy+hT+mNSsKb3Yy4Y3EvWwQ
X-Google-Smtp-Source: AGHT+IF+kms8nBtaQzDtlzzxdD/bWwTsAmCulVF7PrcBiCcNtSdGmmIperLGaJOoPzMjUCnyeTzlBw==
X-Received: by 2002:a17:903:1a6b:b0:295:8da5:c634 with SMTP id d9443c01a7336-2a3ee41354amr78081505ad.9.1767952353246;
        Fri, 09 Jan 2026 01:52:33 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2d79sm103081795ad.56.2026.01.09.01.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:52:32 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>
Subject: [PATCH v11 0/4] Add Qualcomm Technologies, Inc. Talos EVK SMARC support
Date: Fri,  9 Jan 2026 15:22:16 +0530
Message-Id: <20260109095221.2847067-1-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Hi all,

This patch series adds device tree binding and board support for the
Qualcomm Technologies, Inc. Talos EVK SMARC platform based on the
QCS615 SoC.

The first patch introduces the DT binding entry for the Talos EVK
SMARC board, and the second patch adds the corresponding DTS
files for the platform.

Note:
USB(usb_1_dwc3) supports host-only mode based on the switch SW1 on
the SoM, which is purely a hardware controlled as USB-ID and USB-VBUS
is not connected the switching cannot be handled from SW.
Hence from SW Host-only mode is supported on Linux boot up.

Changes in v11:
 - Fixed inconsistent USB PHY node naming in qcs615-ride.dts to
   align with the expected naming convention. (suggested by
   yuanjiey)
 - Reordered properties in property-n and property-names for
   consistency across DT files.
 - Removed unnecessary output-low from the bt_en_state node.
 - Used a &label_reference for hdmi_connector.
 - Added pcieport0 device node, which is required for WLAN to
   power on.
 - No functional change in bindings file.

Changes in v10:
 - This series extends the gpio-backlight driver and its DT bindings
   to support multiple control GPIOs. (suggested by Dmitry)
 - Addressed DT node labeling feedback.
 - Polished overall device tree structure and minor formattings.
 - Corrected pinctrl configuration for the active-low PERST# pin.
 - Includes a fix for inconsistent USB PHY node naming in
   talos.dtsi. (suggested by Dmitry)
 - Enabled WiFi and Bluetooth functionality.
 - Updated commit message.
 - No functional change in bindings file.

Changes in v9:
 - The updates in the following patch url is taken care in this
   patch series.
   https://lists.freedesktop.org/archives/dri-devel/2025-November/534473.html
 - Ignore v8 patch

Changes in v8:
 - This patch series depends on the below url
   https://lists.freedesktop.org/archives/dri-devel/2025-November/534473.html
 - Moved the contents of `talos-evk-cb.dtsi` to `talos-evk.dtsi`
   which will describe all the standard configuration of the EVK.
 - Introduced 'talos-evk-lvds-auo,g133han01.dtso' which has overlay
   to disable HDMI and adds the LVDS-related on top of the base
   dts file. (suggested by Bjorn)
 - Ethernet and Wi-Fi/BT are not (yet) supported.
 - Updated commit message.
 - No functional change in bindings file.

Changes in v7:
 - Added i2c clock frequency for i2c5 node.
 - Moved adv7535 controller section to talos-evk.dts file.
 - Reorder the usb nodes.
 - GPI_DMA nodes added in the device tree files.
 - No functional change in bindings file.

Changes in v6:
 - Clarified description of `talos-evk-cb.dtsi` to explain that it
   defines common carrier board interfaces shared between HDMI and
   LVDS variants, And It’s a single carrier board. HDMI and LVDS
   share the same DSI interface, and only one can be active at a
   time depending on a DIP switch.
 - Added missing newlines before 'status' and between the last property
   and subnode (suggested by Konrad).
 - Updated commit messages for clarity.

Changes in v5:
 - Updated commit message. (suggested by Krzysztof)
 - Introduced generic node name for can, dp, hdmi-bridge. (suggested by
   Krzysztof)
 - Introduced talos-evk-cb.dtsi, which has common carrier board
   interfaces.
 - No functional change in bindings file.

Changes in v4:
 - Updated product name to full form per Krzysztof’s feedback in
   dt-binding comment.
 - Hook up the ADV7535 DSI-to-HDMI bridge to base DTS file.
 - Add DP connector node and MDSS DisplayPort controller.
 - Added USB note in the cover letter for maintainers' awareness.

Changes in v3:
 - Addressed comments from Dmitry regarding USB1 `dr_mode` and
   added a DTS comment.
 - No functional change in bindings file.

Changes in v2:
 - Renamed compatible to "qcom,talos-evk" (suggested by Dmitry/Bjorn)
 - Merged enum entry with existing `qcs615-ride` block (Krzysztof)
 - Fixed subject and commit message to use imperative mood.

Thanks,
Anusha

Sudarshan Shetty (4):
  dt-bindings: arm: qcom: talos-evk: Add QCS615 Talos EVK SMARC platform
  arm64: dts: qcom: talos: Fix inconsistent USB PHY node naming
  arm64: dts: qcom: qcs615-ride: Fix USB PHY label reference
  arm64: dts: qcom: talos-evk: Add support for QCS615 talos evk board

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts      |   2 +-
 .../qcom/talos-evk-lvds-auo,g133han01.dtso    | 126 ++++
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi   | 616 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-evk.dts        | 139 ++++
 arch/arm64/boot/dts/qcom/talos.dtsi           |   4 +-
 7 files changed, 889 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts

-- 
2.34.1


