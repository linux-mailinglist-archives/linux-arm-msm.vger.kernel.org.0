Return-Path: <linux-arm-msm+bounces-40240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F35189E3A2C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 13:43:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C336B222EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 12:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0D31CDFAC;
	Wed,  4 Dec 2024 12:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cvK7kZXq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C329B1CD1ED;
	Wed,  4 Dec 2024 12:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733315236; cv=none; b=nBIbCh6sOlKrKA3bJP9VPK4dUuU2icKWHaxt/myQswwZbkB+IM4H7EpusnV0+e001sk/omnMdVGcDU4o8vRs8UIZhyaV6ut/ZgsZ8VFZY34yOPcKsoBC61gq3spf/yvrTgfGEoSTEUd+dLAarFJuQpTf9QuyJ1M80IAnObxVGdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733315236; c=relaxed/simple;
	bh=veOjOT3iEd6VMjm8v/gKMHePK0b17+jLJcqBAMqKg3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HkMj6eK1GaC2T9V7esSRNBVMGQ+lbLHs+f+6dFuiiHvGF2yQ8CVZl2T3wxJqCJU3IkQ9ytKjCrTs16Yn4LfIhJ5JTmVTOt2wxsA4F77LuV2UUwBGI0LrgrrhLYnOeJL72N64wNaSF73Thn+mOhFHIELPPe2EkNNaBMHubLJF5CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cvK7kZXq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61D8EC4CED2;
	Wed,  4 Dec 2024 12:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733315236;
	bh=veOjOT3iEd6VMjm8v/gKMHePK0b17+jLJcqBAMqKg3Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cvK7kZXq3yTNtmgtBc+nJtvGW8WCPyeXofanDlduXedNIjgwcNitOvjyZhm8mPri6
	 WToy6UnkuxLkf0X+AvYlz9Hi7HfxIyFTFb7iGo/qAY8CD1Xq+FqMkJeA12BIEgTbHS
	 87x4+SAgfnWs1ik3Emq5z94kYAhwkpspvmerdbCokhbPWcG+V0FVLsIxVwm7afpd+u
	 BU9slwNhR7H0ASOuiTJUUP1marO7t2NzuXFa3hbo2J4LmXThL0MAt+MxkspyWF+Cig
	 XHyYmnHu5IzCiAiwSdTDchxa+bPsxpiooRrhSzaT6kjRsSVMnRmM/kFG4s7svVQXCb
	 9HPbI2n2hl/3Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53DBDE77170;
	Wed,  4 Dec 2024 12:27:16 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Wed, 04 Dec 2024 13:26:38 +0100
Subject: [PATCH v6 2/3] arm64: dts: qcom: x1e80100-vivobook-s15: Add lid
 switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-asus_qcom_display-v6-2-91079cd8234e@hotmail.com>
References: <20241204-asus_qcom_display-v6-0-91079cd8234e@hotmail.com>
In-Reply-To: <20241204-asus_qcom_display-v6-0-91079cd8234e@hotmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733315235; l=1682;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=0B52a4aN6AtF5Fhm9CoQyjjWWNFyLW5DlJvH60vGtGk=;
 b=lEH4/pK8h+ZNPl1j9/+PElwRI9vgvmHWrPYbMbLZ7uQxn22XKDKO836Uh5tw8t34LagsqrBzM
 V/IE/5xy/YiBBynGdoWiGKWD6xtdPUJSi1GLpFPFFV9dbh6431WPh25
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

From: Maud Spierings <maud_spierings@hotmail.com>

Add the lid switch for the Asus vivobook s15

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts    | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index d909167dc7119fba56e0240f6f24fd1a803fa94c..ba52c0eef4e32019f6eb7c7ae3c4cd727df23490 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
@@ -18,6 +19,20 @@ / {
 	compatible = "asus,vivobook-s15", "qcom,x1e80100";
 	chassis-type = "laptop";
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&hall_int_n_default>;
+		pinctrl-names = "default";
+
+		switch-lid {
+			gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+		};
+	};
+
 	pmic-glink {
 		compatible = "qcom,x1e80100-pmic-glink",
 			     "qcom,sm8550-pmic-glink",
@@ -540,6 +555,12 @@ edp_reg_en: edp-reg-en-state {
 		bias-disable;
 	};
 
+	hall_int_n_default: hall-int-n-state {
+		pins = "gpio92";
+		function = "gpio";
+		bias-disable;
+	};
+
 	kybd_default: kybd-default-state {
 		pins = "gpio67";
 		function = "gpio";

-- 
2.47.1



