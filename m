Return-Path: <linux-arm-msm+bounces-73430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 730A9B56A5F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 17:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 450A47A33A0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 15:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E9E92DF3CC;
	Sun, 14 Sep 2025 15:57:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80D12DECC2;
	Sun, 14 Sep 2025 15:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757865476; cv=none; b=LWpdcZ1EXA2uRZR9R6ScYIxnDdl7xD1XNSKkbkakOhkQbXVpm56B+g1xcYSA7/EmTgoOdqPNxGDzJeh2b/Q9w7sqBU9Qa1PXhgj5OVfH/TjghpW0vWVSAMblJoZHaaZpS9zUvHMgeoTePIfvbcbt3P7p6LtsO3Q9X2lx3ATxK4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757865476; c=relaxed/simple;
	bh=EiMdQ56FSpoh+jezouVccupggQusRUgVW7KiFFuQ6YU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZXd3s0ti+ggaPBtQWLVTogsRCKS87GlSAP3Kmxb+7kiNqQi/MKf971aCBss6PML6bEta83c6FTqwKQKYvxWRYcDmuSpkk7h/NH3iQ3qRCu7V/o/b8pRN911IvYPrE3lsK+ALFfgbcNL5MzsrxOOVkPfbI2GTJUWzTxy47GCELe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1757865439t8f0c438a
X-QQ-Originating-IP: pLxyR+EOCK0wlpAMNCC3ZcyEEqs9dXvj/pHWXxrhJUc=
Received: from [192.168.30.36] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 14 Sep 2025 23:57:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11041455606322930672
EX-QQ-RecipientCnt: 12
From: Xilin Wu <sophon@radxa.com>
Date: Sun, 14 Sep 2025 23:57:07 +0800
Subject: [PATCH DNM v2 4/5] arm64: dts: qcom: qcs6490-radxa-dragon-q6a:
 Enable UFS controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250914-radxa-dragon-q6a-v2-4-045f7e92b3bb@radxa.com>
References: <20250914-radxa-dragon-q6a-v2-0-045f7e92b3bb@radxa.com>
In-Reply-To: <20250914-radxa-dragon-q6a-v2-0-045f7e92b3bb@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
 Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757865427; l=1799;
 i=sophon@radxa.com; s=20240424; h=from:subject:message-id;
 bh=EiMdQ56FSpoh+jezouVccupggQusRUgVW7KiFFuQ6YU=;
 b=fbUhLxQn5wBUDSAGSmNf3hIJN57m7niTXJBgwUIp19I/qzEeC1040BKNYAc6cYTIy9XbJEWtt
 IUo4oXqyqTzCSO1Ihz6qO5xqj7TLS0gKofkY6PpXdNb1yN8xoZvrywO
X-Developer-Key: i=sophon@radxa.com; a=ed25519;
 pk=vPnxeJnlD/PfEbyQPZzaay5ezxI/lMrke7qXy31lSM8=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MrTVJ9obs/HIqW9ht9goa9kUk6A99LMhVKvYmtsErieUm2jp0ZqLwUbJ
	Dfrq39pc9Nf35hOo2+jJ6gFi85vz7vCjzHhMtJ0KZbUdXarZA+BDqulN+/a9LlPTt5IoTz9
	BMq8oeZyZ9sWGABCxOdwxQMC2CVgYBF3KYDLTfCGY8ZTQo2ynx+hcyPQxEE3g86qbg36eCn
	bIiQw1fG0IHBNfU1PRbmLlokQkCGBjnxYjXKF/FD4KYfyS9Ex1CISSspHXMOfU0dAR48PsF
	3hSEG7+e1qJTKRBeJBr1AEPamvTXAeSlnCPVzx7hIb9hGlB6jLq6c0Q4YtU1eItyKsRjoFv
	Qze0uKXD+dXRnsE85Ntbx0OE/ryrDr/xPHNeGzatoDXwMeGR/yt9gXLmIdFFW0apen4f6IJ
	3p75UiTIOZA8RfWwVBm69cUBSf+9XfL7S/1r92aqy67Ho9cqNGuuaOwvp9sLLSzPkp7x3SR
	5vfDzhudS+bLg9/90GZV8diF6ziT/EQ/lTOEXx0Nk5pAgNUccGVr1HqwnsJ3lLo4LCilE+n
	EL/V3Vo4mMsEEfETIDiJESliy6bV4KRWvEy0EbNzJZWWFBjnxdXydvGGygeCXAa7f4+afpm
	M9yHZq/x6O1rmySIbIYHBa0hPntC/LbfwFgWRn/LVYoJJsKY4z3nnTZaxkVzdqUnIO24iLg
	NMyTD/m7SjBNGmri6amsWyqWjiheKn7FM0h+sTc/QII2FohNzYHIdFNonxc4kwxAkw1Rh7S
	2uc+nop//Hsb2KJfZ/dlFEMYSIqcicL/dloX8zwn3VH1guMMK6+8Jyb99dQtprT/dAWA8C9
	w9D3TZ8J1G8btsTdVAG66GeSNUTfGDQFi+j6TdYPc6k9upfPR6AgcXg0rSbIz5AVZjIKhCM
	zeLywDskeMGRLJEFLQfy7MiUDXDHk1obtRJdaDPY7Q1iStxVcdrtdui2czHzyfI1BMYFcl1
	4zcEWjoiIJ4O3BSyPyNgN43y8mAzDxI/28ePlPEiqVJSYaFo3rOfcpGpYdt75Y5yeFYXsLR
	Y2bXy5L2+YIhRuDi4w7DGs8LNRfEQrA0JyLNt0DDq6sBL9q/X2lCiBGr6HBAYHxBQmRH1rW
	A==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

Add and enable UFS related nodes for this board.

Note that UFS Gear-4 Rate-B is unstable due to board and UFS module design
limitations. UFS on this board is stable when working at Gear-4 Rate-A.

Signed-off-by: Xilin Wu <sophon@radxa.com>

---

This change depends on the following patch series:
https://lore.kernel.org/all/20250902164900.21685-1-quic_rdwivedi@quicinc.com/
---
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index d30cddfc3eff07237c7e3480a5d42b29091d87d6..3bf85d68c97891db1f1f0b84fb5649803948e06f 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -482,6 +482,11 @@ &i2c13 {
 	status = "okay";
 };
 
+/* It takes a long time in ufshcd_init_crypto when enabled */
+&ice {
+	status = "disabled";
+};
+
 &lpass_audiocc {
 	compatible = "qcom,qcm6490-lpassaudiocc";
 	/delete-property/ power-domains;
@@ -938,6 +943,30 @@ &uart5 {
 	status = "okay";
 };
 
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l7b_2p96>;
+	vcc-max-microamp = <800000>;
+	vccq-supply = <&vreg_l9b_1p2>;
+	vccq-max-microamp = <900000>;
+	vccq2-supply = <&vreg_l9b_1p2>;
+	vccq2-max-microamp = <1300000>;
+
+	/* Gear-4 Rate-B is unstable due to board */
+	/* and UFS module design limitations */
+	limit-rate = "rate-a";
+	/delete-property/ qcom,ice;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l10c_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+
+	status = "okay";
+};
+
 &usb_2 {
 	dr_mode = "host";
 

-- 
2.51.0


