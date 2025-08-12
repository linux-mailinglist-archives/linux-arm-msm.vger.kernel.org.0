Return-Path: <linux-arm-msm+bounces-68779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08952B227F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 15:13:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 448191BC11FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 13:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBBA279346;
	Tue, 12 Aug 2025 13:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sQtbTHnP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794E3277009;
	Tue, 12 Aug 2025 13:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755003792; cv=none; b=k53tOamgFBmSPdYdrS3rIOkbMyQty7DAmiq+oZW7t1yQFYugkhNAvn9t8hmmp5WnGnGp37clgMIg0WwOrToP+e/b+hwWp1eyDpyXdPtJGqIkKchu4iJcqKKK+XmSYjCG6UN+IsOwWWUvtxM8sHFYcxLL1RIm61ktuJxsl4PdtPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755003792; c=relaxed/simple;
	bh=MvCjB2FFh0rEnk1mIXk4Ad2pPOp0IpbEwQOMEM9XKLA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m3Lz4v44W/g8uUTk3KxiXxFmfmX5z0NdjaRAg1CyxW0NTXYeJnwIzVUii+oJ1WxkWiGIgW+gxmcTxgpguX3fLNiWgXoG7bOOp4N04SxFaYlf25E87PuqnWzJpC3GiTDOXWBQ47aOx4+N8dykCjQHj9jZKkySyeYTJeb9VF8QOck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sQtbTHnP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4DBAFC4CEF0;
	Tue, 12 Aug 2025 13:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755003792;
	bh=MvCjB2FFh0rEnk1mIXk4Ad2pPOp0IpbEwQOMEM9XKLA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=sQtbTHnPcBc/LIxEenAALis0AHhCRVOOjZDE/u859HAMQhyeTDtmJXbMlCpzA7Wyt
	 uz6piPEVzXzL4fXBCGpKkmM0vyqtcK8X07l1Riw78UKjVJFJTCfutCUQQqepdnpcla
	 EZsWufvm1M+0N/WbMxpfFZhA+Fo7OwMwYG82D3BBYEeI6rVhxNDKlW2RJFUPEKTUqL
	 +TUyw+mgPFb0KP3aunrCmJXGSfXbkXDY1jIEFYxvx8C9zSlhOTkCwdccx5bhP8AhV7
	 w/ikYM0bggm8iTthj0nzQTuk68sBaPw8sIC6gUwyJiXAOzA5FNRUK0/ISHW0HbCWyA
	 cHI2jBgUwR94Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6CDC87FCB;
	Tue, 12 Aug 2025 13:03:12 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH v11 0/3] arm64: dts: qcom: Add Lenovo ThinkBook 16 device
 tree
Date: Tue, 12 Aug 2025 15:02:47 +0200
Message-Id: <20250812-tb16-dt-v11-0-4923d2cd7121@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHg7m2gC/33T226cMBAG4FdBXNcrj89GUZX3iHJh7CFrlcMWE
 5Q2yrt3dlcp3CziBlvoY+z557MuOGcsdVN91jOuueRppAXAj6qO5zC+IcuJNmrBheYagC0tGJY
 Whk5FJWVytoWavr7M2OWPG/XySutzLss0/7nJK1x3vw3931iBcZaidsoEoaNyz1OfSjxPU1+m/
 n2hYsqpzX/rK7iKPWI2RBBio/LeJO0wmUNE7hChNkQSAhaFSV5qtPIQUQ8QRYiIgIaDS7Ljh4j
 eEMPthmhCAiovpVGdFvoQMQ8QQ4iBIMGDQrTiELE7RPgNsYRILayRCqR03SHidojkG+IIiZ0SQ
 XpD93rcHb8hlm9ZW/21xcmjcNxJ2x7fCfBNcbArhd7paTvKSLI6Gv+Q+boHesbf7zQSyz3V9YC
 lhNtENNXTd5HgpBH6BN44oQwDFnr8OK15DHP5lcvz2xByf4rT8LPez1RT3QGKzzCtyDBdGI7pM
 uVxKawLCWMKIaUAzXqbrzYUZMQMeWmqFrTy+vpzF6PHNlgpotAtp4HsbNAyxkhN6+gkX/8Ajen
 sWuQDAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755003790; l=7478;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=MvCjB2FFh0rEnk1mIXk4Ad2pPOp0IpbEwQOMEM9XKLA=;
 b=plSHW2jwSAKKF5SBaLx+GhAZcf8qybHDSqgeROMEk6FloZUUiuep2oyTfrjPc+quZGYY3+d+a
 Ark118gOxthDOs1k7lkeiyuea2dBhog79rNUgK95SmRoUYCmZpy7SOO
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
Changes in v11:
- respin due to b4 / git issue (thanks Konrad)
- corrected SoB for patch #3 (thanks Krzysztof)
- Link to v10: https://lore.kernel.org/r/20250810-tb16-dt-v10-0-0bfed6d75c69@oldschoolsolutions.biz

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



