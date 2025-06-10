Return-Path: <linux-arm-msm+bounces-60712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F70DAD2D02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 07:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F34713AE28C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 05:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE0325D528;
	Tue, 10 Jun 2025 05:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Szt3zdlg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50CF4C96;
	Tue, 10 Jun 2025 05:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749531894; cv=none; b=ZjFfrJWxLvDzOQHI+YSMI2q6Ubuom1TgRehjAHqOuYEWSRZ61GpzrmAPa8Af5Ukdq55i3MKIGLWv/NDSVyvePEJcjitzG8Xb1HkdZ9RADlyZ73qN2QHASTRB6zbeRym3bdUjoay2DTN6vWMUvLEhYVIlITyiCnilsuiVuYFWAXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749531894; c=relaxed/simple;
	bh=ckss0rNbafiuVADJI3cuHNy0svrIhWuDg3Uy5vCX1cM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Zb8z9jpNRk68OsZA5/ZmYPitlwsGjZYyjudY6TCN5PLKK/BQN3x9L6x8Lxq0By/gzrNWEHr9AHSVOD8cgJn2OM2W6d4jxMtBeJlHTgBQN1Z9Xf+vIq/oPOs16mQKnQoe3snEhHE/wm8Eo8xMWjBnjxYR4zu8dRvINTvC3asnrHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Szt3zdlg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57773C4CEEF;
	Tue, 10 Jun 2025 05:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749531893;
	bh=ckss0rNbafiuVADJI3cuHNy0svrIhWuDg3Uy5vCX1cM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Szt3zdlgSS4yqa5Ap9os23eB6cbEUiVQumid4PbLlGiAMC4UJsA6FhDiE76f1Tmbz
	 i7rEv5D6n1NLPogjveGPG6CSUk5s1DbhhnPr3qwlY1fsFeEVRQur+AafcQ613PLN1/
	 NQIperMFHgt82zA4dtg7Wh8uYgWXZrPbeCK6g1PWDTTY8cv+BjS1IWvza7svZbCS36
	 WeTrs0oRnpiYvyDqrKkmzGKAY2JqUgAYSRVBUaXHb12Eikip+1WXAryfiXyR7/yMvQ
	 VC+xvw9JfjXsGLJXDgoqmRReT3/UfIXSWFhm/0YtAz4ADBjVrL9JUL1zrUR1yPzNC+
	 20AvYQPL2SuSw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E7A6C5B552;
	Tue, 10 Jun 2025 05:04:53 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Tue, 10 Jun 2025 07:04:46 +0200
Subject: [PATCH v2] dt: arm64: qcom: sc8280xp-x13s: amend usb0-sbu-mux
 enable gpio
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-x13s-usb0-mux-v2-1-598454e6ad64@oldschoolsolutions.biz>
X-B4-Tracking: v=1; b=H4sIAO28R2gC/3WOywqDMBBFf0Vm3SmZiJJ01f8QFz5iHUhNyajYi
 v/e1H2X58A93B3ERXYCt2yH6FYWDlMCfcmgG5vp4ZD7xKCVLlRJCjfKBRdpFT6XDY1urFPaWtM
 ZSJtXdANvZ6+qE48sc4jvM7/Sz/4rrYSEpck15YVRw0D34HvpxhC8BL/M6ZdcW/5AfRzHF3GV0
 J63AAAA
X-Change-ID: 20250610-x13s-usb0-mux-82a9e02998c8
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749531892; l=2468;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=+fHxGsezod2hEeG+axdz1s5DRcNydWWr3ZMst7FzCRc=;
 b=sYHR8d1UsEpY6QT+trLpS2TdB9JDof3zKVA5L5Hpa6JzTE7F5s5bCsYI3ce9PgGhsPkZ71XIn
 gmEIfiRQaI4Awe/O5V+Z/NOcrLK9xQE65c5xGZVayjvCRsPQC4PKydj
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

The usb0 port didn't switch to dp altmode, investigation into DSDT
UCS0 device resulted in GPIO 165.

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
This patch amends the enable gpio for the usb0-sbu-mux to the one
found in the DSDT file for this laptop. UCS0 shows a list of GPIOs in 
a certain order, and it has 2 buffers with slightly different length. 
At the place where one would expect the GPIO for the select pin of USB0 
(by pattern application from USB1) is a deviating value (165 instead of 
101). This value is the same in both buffers. The GPIO previously used
is also there, but at the end of the UCS0 buffer structure. Changing it
resulted in a working dp altmode functionality on usb0.

Since the X13s dt looks derived from the SC8280XP CRD, it is likely that
the change also needs to be done there. 

This debug effort is a result of work / testing of the 4-lanes patch
[1] on all available devices. Independent of it, it enables dp 
altmode on usb0, and with it, also 4 lanes, making it even more useful.

[1]: https://lore.kernel.org/all/20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com/
---
Changes in v2:
- Fixed typos.
- Link to v1: https://lore.kernel.org/r/20250610-x13s-usb0-mux-v1-1-683213580ff1@oldschoolsolutions.biz
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index ae7a275fd2236a2c71808b003fbcb66687e6e45e..abb742337359e88b7db62a3ea2d7cf3f8ab71c53 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -366,7 +366,7 @@ map1 {
 	usb0-sbu-mux {
 		compatible = "pericom,pi3usb102", "gpio-sbu-mux";
 
-		enable-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
+		enable-gpios = <&tlmm 165 GPIO_ACTIVE_LOW>;
 		select-gpios = <&tlmm 164 GPIO_ACTIVE_HIGH>;
 
 		pinctrl-names = "default";
@@ -1781,7 +1781,7 @@ tx-pins {
 
 	usb0_sbu_default: usb0-sbu-state {
 		oe-n-pins {
-			pins = "gpio101";
+			pins = "gpio165";
 			function = "gpio";
 			bias-disable;
 			drive-strength = <16>;

---
base-commit: 475c850a7fdd0915b856173186d5922899d65686
change-id: 20250610-x13s-usb0-mux-82a9e02998c8

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



