Return-Path: <linux-arm-msm+bounces-94901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eORvM/l+pWl1CgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:13:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EA11D81CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:13:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86FA33055819
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 12:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50DE936680E;
	Mon,  2 Mar 2026 12:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffTe9Xsd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27D8365A16
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 12:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772453533; cv=none; b=F4w8i5bP3eJ4av1EXFoyhvxGmOmdaeVUVChjw7popWebVju0MkOWNYT1uFbEfQEskCBe56XUbxfw6RBqCVOKD5hMytD1LMdmeq6nn2INPbfN1JgoG6DFZwTgrHofdSnel7FbI0M4Ahr1LyVG+dMv9dNXO1JFGUDXhY7KbSKnyRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772453533; c=relaxed/simple;
	bh=W5SSA3UYg8I25MIm+mWjShyjImuzJeyUcPzINkhXxUw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Zrx2/tcZ1gw7zTXBvjjGogHeCNeuD1IUCxfK6OnuwwFHCfTACL/ss3iNjMMjcN1psJ/SWYAsvewemaltONppHMU8rJZEOUxjHmsQ9s1mgnEipLLNMf1PT9ce2jaXi6Lpb95dsiPFe4qg0XsZZZZlwk78HVsC8qEQxmR4Hf6nrqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffTe9Xsd; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-824b32875e7so2048200b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 04:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772453530; x=1773058330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gWgnbRQ/8PTcBM202cO3isCeV82LIlG0Z6HzVof26ks=;
        b=ffTe9Xsd4Fw/2RZ8rErwzGayIcc5OqrNUyuXTVRc/uuv02P30QJTQd8NYXucxggmmA
         V0430HuuvWS83N9YjVSD8VJYI5qyoDo37wnkCIBpHG8zigPxjVjnoglKF6xD5JK47oP8
         Bo3t+vdlgkIorEUjEDabtfBNTRnPz7Ygq6zaxu18JaLCwp0eZ+YCq9UaOv+xLTkoHrln
         YlFgkt0JSm9yTmY7N/gttKRfPkd5J2HL6kNwLeatnyN/xvs3HGiHNDH+7uOhQ13/DUbJ
         qdvBE00wYMo0P/OHIte9lOdXshKfuDRv7sq1ljKGeCRvNJ8V1JKrRHQKHX+ZiY5zMVKu
         niow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772453530; x=1773058330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWgnbRQ/8PTcBM202cO3isCeV82LIlG0Z6HzVof26ks=;
        b=rzAzK29lA0aIv+gfLcLLOxEQ0DkXqptO4dohwx9H121cZzBVQ4y30il/jHCBHji4iV
         eYX5PbF7fzN0078QBV2Pkfddcjd57XSfEUF2GrXtLItf4mMDTc7Lx2dzB/5ysd+FQx5a
         dXLaLLu66DRc3rVMTIhaBnb6CN4HunJ0sIB8JxDpBXMNk5BxPQzsrJxGcXRVFenuSEte
         VMc/UrwuTSsYsPxRJ/NwiR7iq/O7esJjCjqpW/d48ZZMLqd6jy4ZG8pH7DPaYepZkXWW
         o3gVe5bFI5dkv5GokGbpfpojScDz3xUMN0J4oYlLD+tHFiGEIhSIQtXt+fn0GkAYLwxG
         LLxw==
X-Forwarded-Encrypted: i=1; AJvYcCWMMjE3phKr1o+U8bNLb3WyGtzjLdLHVkZvSwCjKGhhgR/fCt4r1rSvv6p7yPR/r8qtaaGJQMTQR3YWFGR4@vger.kernel.org
X-Gm-Message-State: AOJu0YzesYozRnOrF1yMEVvDmkHMd6HGTZgz9sDkT0Cfc8tjIhwUWOB1
	V/+wtgbl/oBFzY8xCrANefULYYhqF0CZuD7K9wGWEjPfvx3fDhSzdO9s
X-Gm-Gg: ATEYQzy2crgVCxCzxl/ybX+55mUWeukzhHSfPTIFaemt2u3jJd+3mioCFjzxnYAuKb3
	3APVKA6clAduwZCl+5aX8mQsk/5yp+eBcVVTQZkZs7Vt4z3knmUbxv/Lqssu/Mt5CVEm0A0YSn3
	b5Jhz/1SzTDQpj9sqa29b5HC3zeMbtk/8PAbTw3e1OSD3iK8hxMGDIW/3OUQHjWG5UwHx5CP204
	+FAaMkFMmoLGcv21GezzTUkfp+Y+gDbURgowy/BYhpuWYsBRn0ScxsFYHUM43d7+tcG2Xgi2+0Q
	dxNd3KqPNeENxScbbr5ua0ssspU8kXz2W3+fGY6f3elvuUTD5HokqX+v0a+EBEv20zfWsid15Ja
	5rQS6g7ldgYAlW13Wqeva3pxAZbH10pU/WuRxMwsIuhHXznVut/0nXHX9zyQcmg9Rbmb5/ooUxT
	6e8G/fAS+nle3W0WTglnYLYDVVZBPIRfEUCwBPOYpR+LMKsbtXPAKsnfPRIvw=
X-Received: by 2002:a05:6a20:a104:b0:361:2c56:fca8 with SMTP id adf61e73a8af0-395c3b16bbamr12153306637.50.1772453529899;
        Mon, 02 Mar 2026 04:12:09 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa848471sm11454177a12.30.2026.03.02.04.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 04:12:08 -0800 (PST)
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
Subject: [PATCH v15 0/3] Add Qualcomm Technologies, Inc. Talos EVK SMARC support
Date: Mon,  2 Mar 2026 17:41:56 +0530
Message-Id: <20260302121159.1938694-1-tessolveupstream@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-94901-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tessolveupstream@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:url,3d:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 68EA11D81CA
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

Changes in v15:
 - Simplified LVDS backlight implementation to use gpio-backlight with
   GPIO115 only.
 - Removed previously added extra GPIO(GPIO59) and related gpio-
   backlight driver changes.
 - Added #address-cells and #size-cells in &i2c1 to fix dtc warnings.
 - Added missing reg property for bridge@3d to fix dtc warnings.
 - This patch series depends on the below url
   https://lore.kernel.org/linux-arm-msm/e025b1b4-8f5c-4fd2-853e-56b89f1f8e79@oss.qualcomm.com/
 - Updated commit messages.
 - No functional change in bindings file.

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
 .../qcom/talos-evk-lvds-auo,g133han01.dtso    | 127 ++++
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi   | 614 ++++++++++++++++++
 .../dts/qcom/talos-evk-usb1-peripheral.dtso   |  10 +
 arch/arm64/boot/dts/qcom/talos-evk.dts        | 139 ++++
 arch/arm64/boot/dts/qcom/talos.dtsi           |   4 +-
 8 files changed, 900 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-usb1-peripheral.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts

-- 
2.34.1


