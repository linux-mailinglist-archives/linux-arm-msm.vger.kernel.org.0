Return-Path: <linux-arm-msm+bounces-93110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFffCgpFlGmcBwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:38:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 965D014AEA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:38:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5CEDD301D4CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B04326948;
	Tue, 17 Feb 2026 10:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kaW1mQDa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0FC1A83F9
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771324679; cv=none; b=jWftuEahDKAijf0D6YuKEmGHSotgvP0B+S+/p214iK9iHBHWHb9iPoEM1pQHg2VqpwMEYwDel8lHQRc+3a8pluDbcOlfpfxQ/pEoEqle/RqZCiUMhZBRrkQtajkCHcowHL0B0XkMw0nzkO0sPn5epVcUdZ9myWoC6QFs3ri7WvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771324679; c=relaxed/simple;
	bh=VELRk/3T6JQEGjP8j7wJdh6tOQP7e6O2cy6b5pMe04M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=nSSLgkISiRGeqX41FtdJbWGPl33gEfh2gIS7jsvPQCA98mW8YtcxHjHCZnVErCjDdoVLzbyxccV4Z6BEVW3DxZK9DpAPbJmIXOVgAyH3rujROWrV7x/egOPGZVdIL8zRZSLTRzcIcKL02Uw2PVXMO0G7O/5pZYHC1QpYPhbqopc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kaW1mQDa; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a79ded11a2so25434215ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 02:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771324678; x=1771929478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=inByKGEuGTcHK6CknaH427tzHzcGDbCJiVSyK40pxu8=;
        b=kaW1mQDagG+A8/aq8JtfpN8PBH0zjalhK0W0bkz9nJiiD7encpibY9GYxFCiKJGggw
         b8jfmKqetFxS1Ru29Ip9UGZD2TTBgeC/RFYWF2/CUjm87BQkArprGNOsDUbqOvxtcGr9
         UoXE3XrbOO4KcUXU3HrO6zk1khMnsj7fltalp7qolRwLitTERpXsG3PYcqq7XiZZV25K
         5BH10s9tqBck2EOJn6JMoFX+Xw1XkwzlmrXlUzC1VRiYwQO5twbMJ1ZxYXh6WIe0wIGq
         mKLhP2KrN7XNPtlZo3QpQ4YYMw2ozeeUDFGH+zvl/MHdMZOZPpejixdqBsmdekIcB3IC
         w8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771324678; x=1771929478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=inByKGEuGTcHK6CknaH427tzHzcGDbCJiVSyK40pxu8=;
        b=EZY3Q+MaOJJcFq/SJoBxoXUAna0WKuGSoAPMQRXpSmH7jzrqkyN42FvcnvAvvegutQ
         xhsmJ0arPnqJKdQFg+9gaRH/iMb1GrJ0AmFZsURM6NqV/+UImYkmUAWNr746JIxS1kmA
         KvB17hEmqp5/uTs/VX6L2S/cBSnatfqAJgeESg7tn5e6L1CYmK4+rn/rDHV1bi7237XJ
         M7yK5+8ImXV1pnskhnGdnd4z4Ir9WRMsfooXnK90mqJEVX4EeUYThA8qcbbHWysjTwWf
         UmRm3zdGdz3Royfw1b76cL92rA5e+aMqLvJWGvgpbiwaF9l/4YW+Ish2mc8MLO7+JV5Y
         zTQQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2IO2TbyBytTbbg4YgtOOVE+cM3IaU3i83MdaB8qULIFyo8uoQ/LH6smqdJT4hwaRtvUkvfEqqdKOOZ7su@vger.kernel.org
X-Gm-Message-State: AOJu0YyOslk0JqdhujcHh0A2rmwpYgRvmlfpCTprzIIgsNiP+teM+FGA
	1D1y46nl3/M3oVLJZK5gQ99xVNR61wpo42mFnvqCQzKoItRIV6E5FVmp
X-Gm-Gg: AZuq6aJJftRlUvPwba/2wGjBPHtJ3hJBb6DS13PWMSwYq5aRduWDEsUXP+OhY9xRgil
	/gU7hI7GQ49edtYHoRUfCq4QaFT1qYIDrNJiOrN/LG0MxK4J1YBMW1nVcW9nAkJMyeZpIfzoiO0
	PFoX7wpmMMFITmBYbbrlsXpqf9C47bAOdwx62hXOx0Ro2lRxugD0Ogv2maJDfi/6zOYHf6y+/WV
	aUSL85AVA2k1ExeRrDNzLc3qrduwqTw5kuakM+kT0v6pJt+xVuBN4I29q9meZgCulTMHIpViroD
	plNzCqEeL9Qpu76ahZtGZmT4Xgr7+R1/cQ1r0k7Z/h3V7ytgGinPSewbPQGFlZnv8r9+RyJ4hhy
	9IV/CzKadqE4RfzFp8BE5+2vjUcb7s0O/SVgAzUNCQP6qh5msg2hfI53c5ORAkKLoDILY0kOF77
	T3ZYrJaFXdEBi8RrLGDs/EnI+Q+mecZN7nRHXYRuK/c5xfGqGQJtlZEzKUxhk=
X-Received: by 2002:a17:902:da89:b0:2aa:d316:f30e with SMTP id d9443c01a7336-2ab50586bf7mr125138475ad.28.1771324677476;
        Tue, 17 Feb 2026 02:37:57 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a6fa21dsm94337205ad.12.2026.02.17.02.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 02:37:57 -0800 (PST)
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
Subject: [PATCH v14 0/3] Add Qualcomm Technologies, Inc. Talos EVK SMARC support
Date: Tue, 17 Feb 2026 16:07:46 +0530
Message-Id: <20260217103749.1249718-1-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-93110-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tessolveupstream@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 965D014AEA3
X-Rspamd-Action: no action

Hi all,

This patch series adds device tree binding and board support for the
Qualcomm Technologies, Inc. Talos EVK SMARC platform based on the
QCS615 SoC.

The first patch introduces the DT binding entry for the Talos EVK
SMARC board, and the next patches adds the corresponding DTS
files for the platform.

Note:
USB(usb_1_dwc3) supports host-only mode based on the switch SW1 on
the SoM, which is purely a hardware controlled as USB-ID and USB-VBUS
is not connected and switching cannot be handled from SW.
USB0 is configured host-only in the base device tree, hence host-only 
mode is supported on Linux boot up.
For ADB to work during normal runtime, a separate device-tree overlay 
enables the Micro-USB peripheral configuration.

Changes in v14:
 - Added DT aliases for i2c1, i2c5, and spi6.
 - Dropped unrelated talos.dtsi and qcs615-ride.dtsi modifications
   (handled in separate patches).
 - Updated commit messages.
 - Updated USB note in the cover letter for maintainers' awareness.
 - Ignore v13 patch.

Changes in v13:
 - The USB HS PHY node naming has been corrected to follow the
   existing convention used across the tree (usb_x_hsphy instead of
   usb_hsphy_x). (suggested by Konrad)
 - Removed unnecessary output-low from the wlan_en_state node.
 - Updated WiFi DT to control PA power through WLAN_EN, removing
   separate regulator definitions.
 - Added USB peripheral overlay allowing USB0 to operate in device
   mode when required. (suggested by Dmitry)
 - Updated commit messages.
 - No functional change in bindings file.

Changes in v12:
 - qcs615-ride.dts patch squashed with talos.dtsi patch.
   (suggested by Konrad)
 - Added static power supply node for lvds-panel.
 - The ti,dsi-lanes, ti,lvds-format, and ti,lvds-bpp properties
   dropped because they were redundant for the current
   panel/bridge configuration.
 - No functional change in bindings file.

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

Sudarshan Shetty (3):
  dt-bindings: arm: qcom: talos-evk: Add QCS615 Talos EVK SMARC platform
  arm64: dts: qcom: talos/qcs615-ride: Fix inconsistent USB PHY node
    naming
  arm64: dts: qcom: talos-evk: Add support for QCS615 talos evk board

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   6 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts      |   2 +-
 .../qcom/talos-evk-lvds-auo,g133han01.dtso    | 131 ++++
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi   | 614 ++++++++++++++++++
 .../dts/qcom/talos-evk-usb1-peripheral.dtso   |  10 +
 arch/arm64/boot/dts/qcom/talos-evk.dts        | 139 ++++
 arch/arm64/boot/dts/qcom/talos.dtsi           |   4 +-
 8 files changed, 904 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-usb1-peripheral.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts

-- 
2.34.1


