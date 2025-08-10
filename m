Return-Path: <linux-arm-msm+bounces-68236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71384B1FB6B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Aug 2025 19:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82C63178EE3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Aug 2025 17:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43AA427466E;
	Sun, 10 Aug 2025 17:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NAtvL9bt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F6C26E6F7;
	Sun, 10 Aug 2025 17:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754847492; cv=none; b=V3vHmedqqrYLmgwevLVxlwIsCOOTEBpWEJURdewFDCy79k9WMLJWr8rsZbAHwmE4piza15qaFrEBG/hBrAkzuelBFFzv16w6NPlyikxg6ghwDf+Rcsw8NdahErockGXtVDFrqLXo19vBPcNs2aLDBJCeQ9FnQD41PFWA9Jzkhl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754847492; c=relaxed/simple;
	bh=UtC1eyVbnD6Dxf1r+UMQ1SfmdtF+J5BaFqbq83twDHw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GUfvf4F5/KAkbku0XmfvrbfBQ4cZgDHCj+OdP/rkBP2o/ctE4cVKE/jQwly0x0L5UR76RZ7lr/95F+tD8faNeKeV00zohAISlfP9C3O1Jsy8qNOL4obhoBJ/C1YRwwpeN9Km8g+N22D+49s/4UD9LxiIiHmeEJPgQw1hoBahnj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NAtvL9bt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84386C4CEEB;
	Sun, 10 Aug 2025 17:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754847491;
	bh=UtC1eyVbnD6Dxf1r+UMQ1SfmdtF+J5BaFqbq83twDHw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=NAtvL9btH9oVoaN50OYd3P87puKOjMvJlRWAv525oWNgpm7Z5aUWqnlqWe2MBlOyc
	 QrjQEwhFyUiDNQD/21jxFtXshEdC9a0FaLMtSUolC+6OLf46NnzPq1MU21azOkgpSp
	 KUvGnfcD6miX3kXwI9onXBNuE074MLR3s1q/ghXUXwsva1be/L+CvPnUTMv49BklDf
	 KJU6LcJAVmxMBe8wJk08pMO0h8+35J85uBLDETDioCqTYH+dVroDVCtANIFlZQXErY
	 PtNzYqVq1porljJ6Hmj5kJaTx4zvD2RYzvXuBUNiRAZRqpnfF7ZtTDnLQXfHhtrz4o
	 qUOnT6yyIuWSw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C56C87FDA;
	Sun, 10 Aug 2025 17:38:11 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH v10 0/3] arm64: dts: qcom: Add Lenovo ThinkBook 16 device
 tree
Date: Sun, 10 Aug 2025 19:37:41 +0200
Message-Id: <20250810-tb16-dt-v10-0-0bfed6d75c69@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOnYmGgC/33T227cIBAG4FexfF1WDMPRiqq8R5QLDOMsqg9b4
 1hpo7x72V2l9s36EoQ+YOafzzrTnCjXTfVZz7SmnKaxLID/qOpw9uMbsRTLRi24UFwBsKUFzeL
 CyMogEaM1LdTl9GWmLn3cqJfXsj6nvEzzn5u8wnX321D/jRUYZzEoK7UXKkj7PPUxh/M09Xnq3
 5fymHxq09/6Cq5ij+gNEQUxQTqno7IU9SGCO0TIDcGCgCGho0NFBg8R+QCRBREBSHOwETt+iKg
 N0dxsiCqIJ+kQteyUUIeIfoDogmjwCA4kkRGHiNkhwm2IKQgqYTRKQLTdIWJ3CPINsQUJnRQen
 S51Pe6O2xDDt6yt7tri6EhYbtG0j2vydU/iTL/fS5aXexzrgXL2tyg31dO3Dha1UCdw2gqpGTD
 f08dpTaOf86+Un98Gn/pTmIaf9X4YmuoOlL4P00qM4oXRGC9TGpfMOh8pRO9j9NCst8FofSZWm
 CEtTdWCkk5dL7chOGq9QRGEanmZpM54hSGEUu2u/OTrH+AzbQadAwAA
X-Change-ID: 20250511-tb16-dt-e84c433d87b1
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754847490; l=7261;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=UtC1eyVbnD6Dxf1r+UMQ1SfmdtF+J5BaFqbq83twDHw=;
 b=p3gGT4/Iz3PEqemGCe2QuEG3o7eVN2i9DFdi7MQBZCBFpWGxyXD7+nqBnD+RIKhAi9778OBDa
 GktWoMTHlbHDyt4xGhNKT5ak6wBZkgJuIY0VF5TtcbRqqQfqbp2j9Hc
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

Device tree for the Lenovo Thinkbook 16 G7 QOY

The Laptop is a Snapdragon X1 / X1 Plus (Purwa) based device [1].

Supported features:

- USB type-c and type-a ports
- Keyboard
- Touchpad (all that are described in the dsdt)
- Touchscreen (described in the dsdt, no known SKUss)
- Display including PWM backlight control
- PCIe devices
- nvme
- SDHC card reader
- ath12k WCN7850 Wifi and Bluetooth
- ADSP and CDSP
- GPIO keys (Lid switch)
- Sound via internal speakers / DMIC / USB / headphone jack
- DP Altmode with 2 lanes (as all of these still do)
- Integrated fingerprint reader (FPC)
- Integrated UVC camera
- X1-45 GPU

Not supported yet:

- HDMI port.
- EC and some fn hotkeys.

Limited support yet:

- SDHC card reader is based on the on-chip sdhc_2 controller, but the driver from
the Snapdragon Dev Kit is only a partial match. It can do normal slow sd cards,
but not UHS-I (SD104) and UHS-II.

Notes:

- Putting the camera behind usb_2_dwc3 results in the camera switched off after 30
seconds. With the stand-alone node as previously defined it stays usable and
suspends, as intended. Since the sole reason for the USB camera to be in the
devicetree is the required extra supply (which is guessed, as mentioned), and
its handling by power management, I would propose to keep it this way.

- The gpi_dma nodes appear to be implicitly enabled when a serial device is used.
I added them, no change in behaviour, though. Since this would be the only X1
device adding them afaik, I left them out.

- The cma-memory is removed, it is not on all x1 devices as I assumed.
Haven't found a case where it is required.

- i2c2 defines the keyboard and 4 different touchpad interfaces. With the bundling
of the pinctrl it seems to work better. I've had issues with only clock and touchpad
pinctrl on the i2c2 node, and not keyboard.

This work was done without any schematics or non-public knowledge of the device.
So, it is based on the existing x1 device trees, dsdt analysis, using HWInfo
ARM64, and pure guesswork. It has been confirmed, however, that the device really
has 4 NXP PTN3222 eUSB2 repeaters, one of which doesn't have a reset GPIO (eusb5
@43).

I have brought up the Thinkbook over the last 5 months since the x1p42100-crd
patches were available. The laptop is very usable now, and quite solid as a dev/
test platform.

Big thanks to Aleksandrs Vinarskis for helping (and sort of persisting) on the
fingerprint, camera and HDMI issues.

[1]: https://psref.lenovo.com/syspool/Sys/PDF/ThinkBook/ThinkBook_16_G7_QOY/ThinkBook_16_G7_QOY_Spec.pdf

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
Changes in v10:
- rebased as recommended onto 20250701183625.1968246-1-alex.vinarskis@gmail.com and
  20250724-move-edp-endpoints-v1-3-6ca569812838@oss.qualcomm.com (whole series)
- rebased onto next-20250808
- amended node order
- checked occurrence of touchpad variants: current users have eiher @2c (like mine) or @38
- removed 4 lanes definition from mdss_dp0_out and mdss_dp_1_out. The required patches for
  it are not yet upstream, as it seems.
- removed UFS reset from reserved ranges
- removed commented-out lines 
- Link to v9: https://lore.kernel.org/r/20250701-tb16-dt-v9-0-7d9e280837b5@oldschoolsolutions.biz

Changes in v9:
- rebase to next-20250701
- fix errors listed from Rob Herrings dts check script - one typo, one missing 
  pmic-glink compatible string
- Link to v8: https://lore.kernel.org/r/20250630-tb16-dt-v8-0-cf42a396e736@oldschoolsolutions.biz

Changes in v8:
- rebase to next-20250630
- fix bleed-over of edp0_hpd_active - not in linux-next yet
- fix bleed-over of hdmi definition 
- Link to v7: https://lore.kernel.org/r/20250629-tb16-dt-v7-0-35276341338f@oldschoolsolutions.biz

Changes in v7:
- amended pinctrl order and indents where needed
- interchanged enable-gpios and select-gpios for usb-sbu-mux as they are
  defined in the dsdt - dp altmode function confirmed in both orientations
- picked up reviewed-by and acked-by from Dmitry Baryshkob and Rob Herring
- Link to v6: https://lore.kernel.org/r/20250607-tb16-dt-v6-0-61a31914ee72@oldschoolsolutions.biz

Changes in v6:
- removed compatible for qcom,sm8550-pmic-glink" in pmic-glink
- fixed malformed gpu node
- Link to v5: https://lore.kernel.org/r/20250607-tb16-dt-v5-0-ae493364f525@oldschoolsolutions.biz

Changes in v5:
- removed patch for the CMN N160JCE-ELL panel, got reviewed
- re-ordered code in onboard_usb_dev as requested by Dmitry Baryshkov
- amended device tree with review notes from Dmitry Baryshkov where possible
  and resuting in a working laptop - added notes section
- Link to v4: https://lore.kernel.org/r/20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz

Changes in v4:
- squashed Makefile and dts commits to one
- picked up r-b from Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
- Link to v3: https://lore.kernel.org/r/20250524-tb16-dt-v3-0-17e26d935e73@oldschoolsolutions.biz

Changes in v3:
- removed changes in x1e80100.dtsi and x1p42100.dtsi - resolved with [2]
- fixed schema errors with correct compatible string for the model
- added power management for the camera via onboard_usb_dev.c
- amended node ordering
- changed the panel driver used to edp-panel, added panel in the driver
- amended x1e80100.dtsi for exposing PM8010: This one is not present in the design,
  added /delete-node/ for it.
- removed commented-out lines for sdhc, specified which don't work.
- corrected ZAP shader firmware name
- Link to v2: https://lore.kernel.org/r/20250516-tb16-dt-v2-0-7c4996d58ed6@oldschoolsolutions.biz

Changes in v2:
- removed nodes that gave DTC compile errors (pm8010_thermal, edp0_hpd_active)
- amended qcom.yaml
- shortened the commit titles to fit 75 chars
- Link to v1: https://lore.kernel.org/r/20250515-tb16-dt-v1-0-dc5846a25c48@oldschoolsolutions.biz

[2]: 20250520-topic-x1p4_tsens-v2-1-9687b789a4fb@oss.qualcomm.com

---
Jens Glathe (3):
      dt-bindings: arm: qcom: Add Lenovo TB16 support
      firmware: qcom: scm: Allow QSEECOM on Lenovo Thinkbook 16
      arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY device tree

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    2 +
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 1629 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 4 files changed, 1633 insertions(+)
---
base-commit: b1549501188cc9eba732c25b033df7a53ccc341f
change-id: 20250511-tb16-dt-e84c433d87b1
prerequisite-message-id: <20250701183625.1968246-1-alex.vinarskis@gmail.com>
prerequisite-patch-id: b35889814152fca77b3822bce5418358924fe9f7
prerequisite-change-id: 20250724-move-edp-endpoints-fadecdaadda1:v1
prerequisite-patch-id: c536bf9ec7fd22af9b05b695272997615dfd675f
prerequisite-patch-id: d513e5a08d3be585b9b6a737ef3a1ad275d7caad
prerequisite-patch-id: 605ef6f89dd84f810df11be9d11ee6803a6bf289
prerequisite-patch-id: 2ab2430624acbdd9011f6c0c2a77469fd19fc75a
prerequisite-patch-id: bfbb562513763ce75f2bb5da7f12e7b54ff3919d

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



