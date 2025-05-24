Return-Path: <linux-arm-msm+bounces-59290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C93E8AC2F6E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 13:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF7354A511A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 11:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4A11E503C;
	Sat, 24 May 2025 11:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PmCNCMIP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624B01DF27C;
	Sat, 24 May 2025 11:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748087325; cv=none; b=JhO35IsbOYTMCEMvgaP73oJso8hV/Y3chtdB35FWNN64Gk7YJ1RP4mfRm6qsu/P9NMfl3OCTQitlKxJdHxyGRE3aKB5SwqTCcHesTg+0dgfrsKjLGSHEMWFnghU9T6NsRs0vZAt8I8Gsb/gyWwaM5tAweJm1cy+Ukqpg9hRGHw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748087325; c=relaxed/simple;
	bh=cDAGEvaEut9Wx4ncI5G3ZNgyLhjTpeeMC7Uy6xv4YFA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j7IgptCdwyZ+H/7Fx4w549mx43ybTCPdvR3dV8S+kdPBl5KVxNZ++qbHhT0RMfl8drNjkHeq6qdGnO08FDEdjFhcrH6Nk1eY+wAA0TVUgpFK/m/vp1UKFvBnPLCg1XGNiAC58DclyObvssknyMnUIq8B+RP+w631jblha1O9LUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PmCNCMIP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD24AC4CEEE;
	Sat, 24 May 2025 11:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748087324;
	bh=cDAGEvaEut9Wx4ncI5G3ZNgyLhjTpeeMC7Uy6xv4YFA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=PmCNCMIPKShYaUUA5GEM5O+Q22q1ymWWR6/mCOVdF13J2dOk18XfVN4orNSaWqD/n
	 Md0jWoa80UQ6vSLEp+EmiLNR1x+S0BnNzVAKdBNLVG/5yDJw+gwOdSWpw1QY0uEccK
	 EF3umwhEmXYEUEg1vWgiwGCfW6bhCytvk01mL/w/zWv0KNlOjDbf4sJoL7v/sxZVeW
	 Ai0OX+I+D8GiPadJKq00pm9iLAhTfuWqhNafuNsOMXkrIU98DapQ/WEWFZ8ZhFnkM5
	 ddm4uBJ1TgopfS7apZQH+dFqjLEiFiGfy/Kr4aguXw0mIASG6++VvqZK3ICE1JWUCY
	 63RKrnjE5+IhQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F31C54F32;
	Sat, 24 May 2025 11:48:44 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH v4 0/5] arm64: dts: qcom: Add Lenovo ThinkBook 16 device
 tree
Date: Sat, 24 May 2025 13:48:35 +0200
Message-Id: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABOyMWgC/33OTQ6CMBCG4auQrq2hvxRX3sO4gHaUJoSatjYq4
 e4WEoWNLt8vkyczogDeQkCHYkQekg3WDTn4rkC6a4YrYGtyI1pSUQpCcGyJxCZiUFxzxoyqWoL
 y9c3DxT4W6XTO3dkQnX8ucCLz+jHE10gEl9hoobhsqNBcHV1vgu6c64Pr7zH/EvatfaEZTHSLy
 BWhGak0r2tphAIj/yJsg1C+IiwjpAIqTc0EVOwnMk3TGwXWGUE1AQAA
X-Change-ID: 20250511-tb16-dt-e84c433d87b1
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, linux-usb@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748087323; l=4168;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=cDAGEvaEut9Wx4ncI5G3ZNgyLhjTpeeMC7Uy6xv4YFA=;
 b=rUuueDf7GE4lvcyoT3SdhoYXBsm46XHUp/epyPMPZjSHdhQgT7lrqMYg5tNcmtML8CjSNIFFG
 1Qch+QyZi4jApmk/vZ6WFXNcaLaKT/uXueOMyr1iC/c7+5oiPiMTJrg
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

Not supported yet:

- HDMI port.
- EC and some fn hotkeys.

Limited support yet:

- SDHC card reader is based on the on-chip sdhc_2 controller, but the driver from
the Snapdragon Dev Kit is only a partial match. It can do normal slow sd cards,
but not UHS-I (SD104) and UHS-II.

- The GPU is not yet supported. Graphics is only software rendered.

This work was done without any schematics or non-public knowledge of the device.
So, it is based on the existing x1 device trees, dsdt analysis, using HWInfo
ARM64, and pure guesswork. It has been confirmed, however, that the device really
has 4 NXP PTN3222 eUSB2 repeaters, one of which doesn't have a reset GPIO (eusb5
@43).

I have brought up the Thinkbook over the last 4 months since the x1p42100-crd
patches were available. The laptop is very usable now, and quite solid as a dev/
test platform. GPU support would be nice, though :)

Big thanks to Aleksandrs Vinarskis for helping (and sort of persisting) on the
fingerprint, camera and HDMI issues.

[1]: https://psref.lenovo.com/syspool/Sys/PDF/ThinkBook/ThinkBook_16_G7_QOY/ThinkBook_16_G7_QOY_Spec.pdf

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
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
Jens Glathe (5):
      dt-bindings: arm: qcom: Add Lenovo TB16 support
      drm/panel-edp: add N160JCE-ELL CMN panel for Lenovo Thinkbook 16
      usb: misc: onboard_usb_dev: Add Bison Electronics Inc. Integrated Camera
      firmware: qcom: scm: Allow QSEECOM on Lenovo Thinkbook 16
      arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY device tree

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    3 +
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |    2 +-
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 1655 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 drivers/gpu/drm/panel/panel-edp.c                  |    1 +
 drivers/usb/misc/onboard_usb_dev.c                 |    2 +
 drivers/usb/misc/onboard_usb_dev.h                 |    8 +
 8 files changed, 1672 insertions(+), 1 deletion(-)
---
base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
change-id: 20250511-tb16-dt-e84c433d87b1

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



