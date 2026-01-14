Return-Path: <linux-arm-msm+bounces-88988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F27D1DC4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 11:00:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DE11D30066F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 10:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B9B138A298;
	Wed, 14 Jan 2026 10:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WL91ZlNX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441713803E9
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 10:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768384854; cv=none; b=XZMpZBqq9icMW2dIm9JUOf55edY0pmwLEmOkl3lX8Rg36w1CVD9+WTsnr3O6K+xIMufUgRGUhHRzIomEwCGldX/heoaMXGlB5vzZM3lI4aYVNDRtv19Ehd5n/BSQ8wEyor9UHBRi1yNl5MPJKgjI9Vwmh1RoCLYxo8ERRmPLjEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768384854; c=relaxed/simple;
	bh=5NWXTiOZxnLPxYsFndkHZiCAxfCLA/mi2eQZS5IVVFU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=b5LkysvNz6rdTOklg172ErikmVahIiLMW9fQny0/VEuyGWQih60G+2FTdxgUKj3HzgA+tbhuRL4lh+sbFlwvVeUsFzbBu8LP3T4lkjWdFFFNkjCGKfE2o1CX1jbuzuD6IziXhVF41rrxET6oQdpJa/UI27v5mSZEEMtDwp6ss58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WL91ZlNX; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-c227206e6dcso5462065a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 02:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768384852; x=1768989652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PfRYTK2N1uDwrmSwdOEm1OGo9GqKAG1+PhlxqVktM8g=;
        b=WL91ZlNXYT2LR0a2kKf5JC9+iZydOzXD//9bQklGfpqnYP4eVt37f/6IL3bGwIfEcW
         4pnMuRrhEcRQ9uz4gHJI+obdzJXCfq7D3dhY29aq9jS94azOvzSuuNkKSB/IYMIK/3ir
         W7wk8xVY2/j2bEMiryOHmwX7QExkVm30X3vK9sAlT8VYfEfh8EWQG5fGjnDR601paRvB
         m38H+19TkY4icM8mBzeoig1m6nDdMfSo0n4b9anyiNGQKhrjgeM7LU38MIv4sIkmEtN/
         PHfurRtHi9eXM3o4HpI7eAot1OWzwIVwENsiKE4+LjdiM4C371/UJsKMOplaeeQeCdRP
         8YDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768384852; x=1768989652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfRYTK2N1uDwrmSwdOEm1OGo9GqKAG1+PhlxqVktM8g=;
        b=MwuhFIL+Bq+ejjdxLs9wOywUuH7+XWPlrcxI2CeRQfNLui7/oXiTXTFOiGUjjx2gnx
         gIi06pa8Kg+yDtFrBDHNbGl5U9qlF6hLfDXbQVYBCpLpuqZvfJlDC+lx11xmVxI149FS
         6109Y/k1YRnOktJ4ex3/QVAApzpjrBr7mCtFBi+/m0A2F5cxtdclk1ouzbXBMgpU1yoi
         dcl/I6K6hNi8mT+G3K0Hxdoi7Re5Gdq9jT1I7dVms6wfGvEgeNL/FwiIsyvMi7NHfEG2
         mlzBMuo+2qWGOyn944OLxtRBvS2o5/2RN1nNsrNG2dMXxl5lCErRMw3pahMlYlrIWDhy
         5EMA==
X-Forwarded-Encrypted: i=1; AJvYcCWjvcwTx9PbgVjWomXueVAqaEAO9Kz/8JCzwzaGJzR8/WUSXVva4n62e3nRy/hzrGXMFfOpmrq7Z+SHlc72@vger.kernel.org
X-Gm-Message-State: AOJu0YwftGA9Y//Zf8mhyz7sAKJnAmCXcTRRb8gvwFpcH98lEy/JLa5D
	EfLwcXbtRblCwUKbQkVCtCZ6lqSAwTbSow6Q3g3KsUB7hO20Pb11vhxt
X-Gm-Gg: AY/fxX4E6rTl6FxzK5nrIUZdN7QJBBWFJTvvJ7oufzYPk8JcXUPHpndlP0DSCGLYHxV
	JazYBS0t6w+JV62R0xYe4lEJsMU5bAJDdTMfESJ5Hwah2f0nVzpeTJvNwpeZSMbMIgZsvAGJ17Z
	uG/pbUB7jNeuL+n7Y23gSjj6QXROn2VKCqNvV+PxXl0F3VfzxFK5hOiTprSwEYFpK9e/mKluef6
	gMH7nw7lLFG4RBDr3ARV5/OEJHrcRj8uROwBD7fLPIyjXUvGofnn8oc111s+3vjTdQIfAqm462h
	m5KJDDB9Xs4UesSukFEjqAxWHQo8KnAwLTrn8HgX6WlbuNLHobAYcYSCNERro9QJ9bE9BtOvH9B
	qGDu+JR8ZRPxiL8PKiNVDef5TFF0sa2u9AEZJQPUM+f78AJ5o6lewEwjIkJeBW71mSXEpzmRTHg
	0e90jwXEh1XiIY8c+833VoQSg6eGP0Ay3bb7Tz
X-Received: by 2002:a17:90b:3f88:b0:341:ae23:85fd with SMTP id 98e67ed59e1d1-351090b16b1mr2411562a91.11.1768384852365;
        Wed, 14 Jan 2026 02:00:52 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35109c78f20sm1522043a91.13.2026.01.14.02.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:00:51 -0800 (PST)
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
Subject: [PATCH v12 0/3] Add Qualcomm Technologies, Inc. Talos EVK SMARC support
Date: Wed, 14 Jan 2026 15:30:40 +0530
Message-Id: <20260114100043.1310164-1-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts      |   2 +-
 .../qcom/talos-evk-lvds-auo,g133han01.dtso    | 131 ++++
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi   | 616 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-evk.dts        | 139 ++++
 arch/arm64/boot/dts/qcom/talos.dtsi           |   4 +-
 7 files changed, 894 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts

-- 
2.34.1


