Return-Path: <linux-arm-msm+bounces-100944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLqIIjJjy2nCHAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 08:01:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29256364507
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 08:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 849273012BF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 06:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4F42ECE93;
	Tue, 31 Mar 2026 06:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fz2ib44T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3455B2BF3D7
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 06:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774936878; cv=none; b=FCCsb+hmhs2s0AZoRNDqF/hYQ329lnHgS+KnIFX8mToXuHJizlcjWYs/baPt+uQAhsccDkd1BemGoUJkSDXiV6y221vLp71nt1xrstivICrkcTaEdDiMch0N9WlmLnT7emAcsn+wknkumkjDAIYkpAKTB7AR4pLPrzF7Rbkk7Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774936878; c=relaxed/simple;
	bh=w+fAriFQ8WCUbA1D2cwXRmLRMFcXIzrV7SLpfLn5HzY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=sh7x+nW7QuGNSCAYYwKKT+c7lGh6k+GBgFRZyBbotBCCeV8hAVPwcBnl17vy+aDcKL4twXlTtgIf0l2ZIP2qHp059nJdto3tjD92KZs0KuRXIwn/sauey9aJUdR1Xf5sd0v5ZvIFY1r3Ruqb9jXbW0tLNDYAtGCcOYV3VnGV+ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fz2ib44T; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35d99bae2ebso2187036a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 23:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774936876; x=1775541676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ilQzBc8woUsRjSpAUcJxuzvzWy7droM45xTJ5hZXLwU=;
        b=Fz2ib44TonMMdbA3qilnxOIVgbKpCnStTmbSUMS7wIuQHZxZoY8Ig7W8v7IJIGoxFr
         gHIW4p+zFdGBHEztu7L4FGF52zfRpwRHE7JCWr9rlo5gJBz9Pr/kRDA4ZjmviG9hM8hG
         w0QI+Cc8T4eHmiEiRrAT/+otEyYtnvq1bFaLvw7L82xE5mdAtw8VSDJvEm4HtLqGJr3U
         O+mb5QN0Os3XKyW/lrZGAz8egGhmVB3udf5TVM8Q+UN63ez3pJQ6QEbjSUfasRWquXjK
         B9jF0WPYYx9qsPE8r7OHFh9toR1wfdlt+dmPDtnEim9+4kZPHagSCCv9m/bOlI2P05qp
         lKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774936876; x=1775541676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilQzBc8woUsRjSpAUcJxuzvzWy7droM45xTJ5hZXLwU=;
        b=W55xXqFCjOM/g2u3BN9PAp/90RzvzUMs0aDqE1/SzQ8XJrpwSM3wqSP3TgXii+fecA
         uHImnG438mkOzjT2IsM9FOt8yOOn11PuDg8FLqkuB4BDs8+sojiZDKpO0MyxReRx13wN
         zNGXQbRiEtL4qniRtyVKQiHF+dz8Ej3UkjuK9Oi6QbSZi4CQgJeqH7p6idIU8sHodAnS
         PZ1k2ZpGQeBwSF8PFw4W4+sMhyE3nqNhFOAykBfGS7168ouc6KlUteqF0hlemCDTiFKD
         wtQepVDNVfU7rIq069xboI6nso6dZ/54c6g2QXw0K+r8hlUp2jKQ6PCHJhJqCw4i6FGo
         0EfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrW/+2Ij4EnZpi9M5lJNkh5MUiK1zVG0diUx+IAYMJib7L02w/7edjoP+2BCFXWjO0+pxMC/pzTjJH9z9U@vger.kernel.org
X-Gm-Message-State: AOJu0YzlaAq5kkMi/GuUlDnxQuEZ5L99Nwzg88FdyAdfJPt2ukePWw2r
	lPDLrbDlMzSjS6Mj2uOJ0xnmEhh/ptZ0f7ApFwZUXMcjgX0T6c4jW9cE
X-Gm-Gg: ATEYQzy0OsAgoaB5HVNsErc1sCycrqarngNVjVx1sje+mYPehXZ9fv+J9hHBYQrmqiI
	U3R9gO9V4Vxym5ozxlSHEuKc7+dMAG7R6INLI8JOkDcpse4ASILbKIKBEsGKv9mnxBBG+1Vt4m1
	GdHZraYt49VYztgNlcuN5PI9NogBk83Rf/9KnSpNe1w2/bAVXjRf7NveSLNYE29ytBuA+FQB2iJ
	FmKYhcHAhDsirlbRZ81sNGo0ao37H0d9cx1K6Os7ztapaChd5EJZbCBN0VXJUNi3Rpi56fOCpyO
	CIODkhzqTX6MSXdkjuL+VQxQLjcFZwCI+rq3Uy197Zahb4LuUcs2q3GrvYwKY5rHK1250j5SlzL
	SGpfBULiwDcApbchYx3j+g2N+wzXC/I8JPTXSbxm/rFfU/pIyKXrhPPbKtArSkTHYaHCHloO8Dq
	nD/Y9ZBZehKmN0Lxb2NpjEVL+XEeNyL1yHLBDuQyyqLQe8rM9/
X-Received: by 2002:a17:90b:558d:b0:35a:329:73d8 with SMTP id 98e67ed59e1d1-35c2ffb03bcmr14476488a91.4.1774936876413;
        Mon, 30 Mar 2026 23:01:16 -0700 (PDT)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe606dd2sm575343a91.3.2026.03.30.23.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 23:01:15 -0700 (PDT)
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
Subject: [PATCH v16 0/3] Add Qualcomm Technologies, Inc. Talos EVK SMARC support
Date: Tue, 31 Mar 2026 11:31:04 +0530
Message-Id: <20260331060107.501561-1-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-100944-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tessolveupstream@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,lists.freedesktop.org:url,3d:email]
X-Rspamd-Queue-Id: 29256364507
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

This patch series adds device tree binding and board support for the
Qualcomm Technologies, Inc. Talos EVK SMARC platform based on the
QCS615 SoC.

The first patch introduces the DT binding entry for the Talos EVK
SMARC board, and the next patches adds the corresponding DTS
files for the platform.

Note:
USB0(usb_1) supports host-only mode based on the switch SW1 on
the SoM, which is purely a hardware controlled as USB-ID and USB-VBUS
is not connected and switching cannot be handled from SW.
USB0 is configured host-only in the base device tree, hence host-only
mode is supported on Linux boot up.
For ADB to work during normal runtime, a separate device-tree overlay
enables the Micro-USB peripheral configuration.

Changes in v16:
 - Reordered device tree nodes.
 - Added explanatory comments in talos-evk-usb1-peripheral.dtso.
 - This patch series depends on the below url
   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20260330&id=c1e77b13457d20f14c70e623f7c0a6a3cefc1d67
 - No functional change in bindings file.

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
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi   | 610 ++++++++++++++++++
 .../dts/qcom/talos-evk-usb1-peripheral.dtso   |  27 +
 arch/arm64/boot/dts/qcom/talos-evk.dts        | 139 ++++
 arch/arm64/boot/dts/qcom/talos.dtsi           |   4 +-
 8 files changed, 913 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-usb1-peripheral.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts

-- 
2.34.1


