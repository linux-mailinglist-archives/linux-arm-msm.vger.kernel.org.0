Return-Path: <linux-arm-msm+bounces-70246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C58B30F67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 08:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC1B73B168F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 06:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965672E54D4;
	Fri, 22 Aug 2025 06:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MiD5t1EA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DD7219A8D;
	Fri, 22 Aug 2025 06:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755845057; cv=none; b=N1KctFHUSehCLiL+EccYITmnFobXMtXOhXU4v0Q49bopOa9wUe5rF9d4NhVQZiewKA77SOCAIFVR5dUb2C4zqzBtxmCb4cDNeLrc/dsSVVZTQ2ISJ5aRAPnhM6/LcABcT4EX//T19mCmXkyXWOrrR44Vr2UEVZqdKjJmMOqP7YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755845057; c=relaxed/simple;
	bh=OZQdndiZS4RtZD0uOc/KZaY9yPKrmrbYOvpn77uH5RY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=svR7/+ZJ5gWx9ESdtiBulukk8LgGEYzL23MFzsubHjZtwZB+I8cHeNSpKpR6QS8lOz41gABhTyUV+/iQQGs44A5fTHlDMDyoOaNUqz6edxcHIncn5MxkvzN8x0+YSuDekoPn/5ABQC1ALA1jpEQ/e6FIX2WkyOf0+QODmpKfegI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MiD5t1EA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A57CC4CEF1;
	Fri, 22 Aug 2025 06:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755845057;
	bh=OZQdndiZS4RtZD0uOc/KZaY9yPKrmrbYOvpn77uH5RY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=MiD5t1EASSmX0u+ZtFlwF04Crg90yp01jaRXka5vKjlJDZXEuL3v9gQKUBv1L7u+U
	 RPAXW+UPy+W6dpKy6HPv9S6BeT3cvKquXwhtevFSXFLagpchYH4+Cd8FjosXlL+J2P
	 rMmGRphqRAsjZ/F62r3G03qreK39AbiF5jbE0lEtsXn3v0v+ri1LSQFmr9kUH/R/+2
	 M7HbnY9cIm14VH5l47LNxdsS57ZuXJZmEP1pUf/uH285VEwD8PJfvdUuw5yDPglRz4
	 t9EK22uy/uYcUX66Ne41Nff+bYi9Yd5qrEx9ODOJ8ioadAaPHBaBsaDJT05Dck9bt4
	 bmR9VqI2D+teA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171EACA0FE1;
	Fri, 22 Aug 2025 06:44:17 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH v12 0/3] arm64: dts: qcom: Add Lenovo ThinkBook 16 device
 tree
Date: Fri, 22 Aug 2025 08:44:09 +0200
Message-Id: <20250822-tb16-dt-v12-0-bab6c2986351@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALsRqGgC/33TS27bMBAG4KsYWpcGZ/g2giL3CLKgyFFMVLZcU
 RHSBrl7xzZSaWOBG5EQPj5m/s+m0lioNofdZzPSXGoZzjwB/LFr0jGe30iUzAsNSjTSAIipBSv
 yJMjrpJXK3rXQ8N+XkbrycaNeXnl+LHUaxj83eYbr6rdh/hszCClyMl7biCZp/zz0uabjMPR16
 N8nPkzdt+VvcwVnXCN2QZARl3QINhtP2W4iaoWgXhDFCDhCm4My5NQmoh8gmhFMQFaCz6qTm4h
 ZECvdghhGIumglNWdQbOJ2AeIZcRCVBBAEzncRNwKwbAgjhFl0FmlQSnfbSJ+hSi5IJ6R1GmMK
 lh+1+3qhAVxcum1OVxLnAOhl165dvtNQC6Kh9VR+JtH23GPZGeSDdsMrBlcMdeu1QFVxpQdIDx
 kvu65GOn3OydruoejOVGt8Rasw+7p+67glUWzh2A9aitAxJ4+9nM5x7H+KvX57RRLv0/D6Wezj
 uZhdwe4C0/DTILyRdA5X4ZynqroYqaUY8w5wmG+xbSNlQQzpzIddi0YHcx1c59SoDY6hQlNKzn
 XnYtGpZS49h3f5Osfu3+/lisEAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755845055; l=7922;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=OZQdndiZS4RtZD0uOc/KZaY9yPKrmrbYOvpn77uH5RY=;
 b=Sqa8oBdWGR+exEAdYn/nw4W4ix2eqNsjiPyenOgvQ4rfLRG6BCSLn2uruo4F4ydS86CRhQhCA
 9mdMLPq+BeCCr82Vr8RoqRjU+AREyxX0WhWoQbgabPejYk6xJkKj4yg
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

I have brought up the Thinkbook over the last 7 months since the x1p42100-crd
patches were available. The laptop is very usable now, and quite solid as a dev/
test platform.

Big thanks to Aleksandrs Vinarskis for helping (and sort of persisting) on the
fingerprint, camera and HDMI issues.

[1]: https://psref.lenovo.com/syspool/Sys/PDF/ThinkBook/ThinkBook_16_G7_QOY/ThinkBook_16_G7_QOY_Spec.pdf

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
Changes in v12:
- rebased onto next-20250821
- corrected DMIC supplies in the spirit of [3]
- added missing pinctrl for eDP HPD in the spirit of [4]
- Link to v11: https://lore.kernel.org/r/20250812-tb16-dt-v11-0-4923d2cd7121@oldschoolsolutions.biz

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
[3]: https://lore.kernel.org/all/20241203-x1e80100-va-mic-bias-v1-0-0dfd4d9b492c@linaro.org/
[4]: https://lore.kernel.org/all/20250814-x1e80100-add-edp-hpd-v1-0-a52804db53f6@linaro.org/

---
Jens Glathe (3):
      dt-bindings: arm: qcom: Add Lenovo TB16 support
      firmware: qcom: scm: Allow QSEECOM on Lenovo Thinkbook 16
      arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY device tree

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    2 +
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 1625 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 4 files changed, 1629 insertions(+)
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



