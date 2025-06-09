Return-Path: <linux-arm-msm+bounces-60690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CBCAD2828
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 22:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B55F1631E6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 20:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D002B1ADC98;
	Mon,  9 Jun 2025 20:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RklBcIKR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A1018DB34;
	Mon,  9 Jun 2025 20:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749502447; cv=none; b=KskIAca3DJAQ378Ed+d3E6QTsEvJrNSmc/Ddzhll0ZZVGKvpX9NZQSMzM+b+Rg0BtsPpVfYwcAKOiGtSTtRQfdwFKFj5FlmPtJFLv1noDKHkPD8TSvNKn47CIbvWGP+fEsKQMunI84CbtuzZ46L6CNOKf+cEJsuOzDiljUfXsp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749502447; c=relaxed/simple;
	bh=P+msmKRqtD0R3+trbW8WYXnfkRFUir/DVlfAO/CXGEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FyXqvTGeOq00c8tFzV1jdGjkG6IPgI6AT2n5nnNoXn7HHZ1bpmcCIKRgWXSXgH6Xbu1LRkElayUNVfYGUJxNUwj+9ueirCQuk7eUyY+uhAnBa5hZBgLIug2t8h+wCteTK/V31o3ZVcn17isMSq6enr3bfpq00abMA4HoyNaeBL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RklBcIKR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23FFFC4CEEB;
	Mon,  9 Jun 2025 20:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749502447;
	bh=P+msmKRqtD0R3+trbW8WYXnfkRFUir/DVlfAO/CXGEc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=RklBcIKR9PdrTrFZ06c+8JQKtcmJVc1yT0+PKTkLNYiO12b7QtduICDR9m+16cAkW
	 rGmtY/knsK9VHe8Nsxf+F8vwAr4IhwXDJlkcKp2fU8FtupyU2WjUwXXlk0TY1i/afb
	 EXPQUa7p9CftEAj867APl5cYLVsnLSunhZKGanwcdWSz3vdj2yKfjFeLYBgZBnox9R
	 cM8kdC8fhqY8evQI+ahm96/kMWX8wuNtMEY5P4C5ODcXv324Wh1BzufGMIDLm/E4Fy
	 KKbVtPeQigy+x0PyTYT3Talrig837+khNl3vs3QO+Y54BjkRLnvYUn/ldy+I2wgoX/
	 YF76zbtbdrzLw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116ABC5B552;
	Mon,  9 Jun 2025 20:54:07 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Mon, 09 Jun 2025 22:53:56 +0200
Subject: [PATCH] dt: arm64: qcom: sc8280xp-blackrock: amend usb0-sbu-mux
 enable gpio
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-blackrock-usb0-mux-v1-1-7903c3b071e4@oldschoolsolutions.biz>
X-B4-Tracking: v=1; b=H4sIAONJR2gC/x3MSQqAMAxA0atI1gZicUCvIi5sjBocaakI4t0tL
 t/i/we8OBUPTfKAk0u9HntElibAc79PgjpEgyFTUEk12rXnxR28YPCWcAs3mqEiZku1zXKI4el
 k1Puftt37fj0IVTVkAAAA
X-Change-ID: 20250609-blackrock-usb0-mux-2d70ccb09b14
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749502444; l=2173;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=0U1VNm6UEDUZ5+luOdhF4fqviPgQfWkNGEy/dPW1eC4=;
 b=e9Byf0rEru5w6V5DwJCO6BifuGo/PjwSHJviqRtqjj9xTZOSR/IGL6aRyqrFXKqTdZgHCDBps
 6T/ZEP8N0TyBVghdGNSqevtKq0CuNJykE7Y9SecA+ZBTchfkzNvFIQd
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

The usb0 port didn't switch to dp altmode, investigation into DSDT
UCS0 device resulted into GPIO 100.

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
This patch amends the enable gpio for the usb0-sbu-mux to the one
found in the DSDT file for this box. It shows a list of GPIOs in 
a certain order, and it has 2 buffers with conflicting values. 
The one deviating is in the second buffer, at the place where one 
would expect the GPIO for the select pin of USB0 (by pattern 
application from USB1). The GPIO previously used is also there, but 
at the end of the UCS0 buffer structure). Changing it resulted in 
a working dp altmode functionality on usb0.

This debug effort is a result of work / testing of the 4-lanes patch
[1] on all available devices. Independent of it, it enables dp 
altmode on usb0, and with it, also 4 lanes, making it even more useful.

[1]: https://lore.kernel.org/all/20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
index 812251324002b50f3b48845b6c244f692d42b9b2..b8cbef0ebce76acf9d1e841e613646119dc400ff 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
@@ -243,7 +243,7 @@ linux,cma {
 	usb0-sbu-mux {
 		compatible = "pericom,pi3usb102", "gpio-sbu-mux";
 
-		enable-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
+		enable-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
 		select-gpios = <&tlmm 164 GPIO_ACTIVE_HIGH>;
 
 		pinctrl-0 = <&usb0_sbu_default>;
@@ -1267,7 +1267,7 @@ tx-pins {
 
 	usb0_sbu_default: usb0-sbu-state {
 		oe-n-pins {
-			pins = "gpio101";
+			pins = "gpio100";
 			function = "gpio";
 			bias-disable;
 			drive-strength = <16>;

---
base-commit: 475c850a7fdd0915b856173186d5922899d65686
change-id: 20250609-blackrock-usb0-mux-2d70ccb09b14

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



