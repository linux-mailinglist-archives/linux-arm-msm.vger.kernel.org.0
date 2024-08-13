Return-Path: <linux-arm-msm+bounces-28357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F69894FC3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 05:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 527611C2237C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 03:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371E61B970;
	Tue, 13 Aug 2024 03:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q6Q464fI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B7112E4A;
	Tue, 13 Aug 2024 03:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723519800; cv=none; b=YkJ++DIwdHWSqe04iLFN5EOCAYY4oHjH1U/Y5gascvzISh+xygrkxn9iGyLF7jx0ubjtQS23vRjWrnSM7j89jGVR/i3sFh0Nbjz3T/6Y0BLw5NjFL3Cm1Urujr0pR9THEbhog7jzsCETl7Er+IitoSM3Jhg1qw7WTobJcmeG0bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723519800; c=relaxed/simple;
	bh=nGsWtFuom5NXcGscR90UEwmRO5sXxpeKyyJeSal2KBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KDsVB6ZEMdUA5n/p4Rp8PnHQ8abThbzJGe1N49ZLNvEQiTEhLEOOJ0ycVDad9IaxXCZOIXP6TgbPgSueSUXd5FGSTWj9uW1r3HKcR3VMCCIkNFwsymPhfjAZYkvdJaTh/dwWHAwJEUNoW66NKhdXEJgWs4djmDNi4EoT+Ri64D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q6Q464fI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03EA2C4AF0B;
	Tue, 13 Aug 2024 03:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723519799;
	bh=nGsWtFuom5NXcGscR90UEwmRO5sXxpeKyyJeSal2KBE=;
	h=From:Date:Subject:To:Cc:From;
	b=q6Q464fIne3S/2qStjao11Tw/nlMeuog9YZbzMCZrn78psZEm0gA+3yZQfe3t1MZP
	 gSnSW/irl9zBU/hBcf7Jj7VSfcmcomKKFvYUwzrtxQ8s99K/QKBql/DKXTfqGlhNZG
	 420IqC9aXp0vzhEyo4ebXv/57bjss0LKu1A8sGd1k7+fqmG+tLibCR7Nhb72zcGZW3
	 DJdUcb5i5xVbyawgTkfp/XqRr07dCqNc6cdsQs69AekPqcPXnJNae2m9fsOaepeOGZ
	 8R7fZVu+MBMRA0NE5D17ZzdEZOBjG7JgABPSqoeyieuQ6evgT2ZsR0kqtI1lfK+peR
	 /kVKTBMVItleQ==
From: Bjorn Andersson <andersson@kernel.org>
Date: Mon, 12 Aug 2024 20:34:19 -0700
Subject: [PATCH] arm64: dts: qcom: sc8180x: Enable the power key
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240812-sc8180x-pwrkey-enable-v1-1-2bcc22133774@quicinc.com>
X-B4-Tracking: v=1; b=H4sIADrUumYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDC0Mj3eJkC0MLgwrdgvKi7NRK3dS8xKScVF3LtFRToLi5qYVxqhJQb0F
 RalpmBdjc6NjaWgC9dv4NZwAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2059;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=tdGwC6bibYA9UKrmpiBgcjhaNhSmDRF6YxMyF8SERhY=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmutQ8LD3Q7jZqHP6D71jo21E77sRiSdrRwpwyT
 DHAMdasMoGJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZrrUPBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXWPBAAi7IdCjiqN/c/vcxjQ0b+ekkGNMeIF+DIIdkD0Tg
 uT3GZCafGbz/h+sykNLQQu6q8tPjtzg3OHclTfv/rFdn7BlYF3KQzdfhuZTNwMbaWyI0ISdZdB8
 dfLVPBHBX+lPqJO/cdqokvHNIKc+1xXU4Ixx7FDE3T5ck9qwmiitx/uMOARiTzdXxPwnkavJDTU
 7QcXOB28c7L25jlliSeA7BRNlC+e0FaIVBRxV/yPD3kCVu06dV/sus3HEo4ianxJ87ZuGkle7Hy
 CLjXQk/QMDUEyLwbVKW2jeY2Qm39Xtcf2El0fkeMHfVDS1RqJh0CiD5QqRfMqDX5hnF6OZvRTUb
 Qlxmh7Vn0UoDuJxiPoCoNvr8fpTAuu5BDJ9C20Z2l/EPFfe8oSAS0bvjjCX1gMupmpaksbLn2kJ
 DNjFP4vqfBPb+M8m4l4BlebsH9sHDd5xeY5iRUupaHyUZclWTPJhejAgSW+PW6zvuXobjh2SXmc
 ousdZbvOHYaFJtLSVOQhb05JdD5p0U6kSZ20wiuzZkkp/EynfTXOONX3QqySuqn06i7vSLJtI/M
 IwgL07ovf3w5O261ML+ZEqEOxyG0fRQwvOWLU8lOVINNJ1vq01zy9lF/gbF4pRiaaEcR0iI5bMW
 KUuXz8wU7SVMBh7ehf9QeU+AXp85QxkwAWZkKsoVybU8=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

No input events are generated from the pressing of the power key on
either Primus or Flex 5G, because the device node isn't enabled.

Give the power key node a label and enable this for the two devices.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 4 ++++
 arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi         | 2 +-
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts         | 4 ++++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index 575a1a5ae20f..62de4774c556 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -484,6 +484,10 @@ &pcie3_phy {
 	status = "okay";
 };
 
+&pmc8180_pwrkey {
+	status = "okay";
+};
+
 &pmc8180c_lpg {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi
index b6f8d1558c0d..451c9b984f1f 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi
@@ -75,7 +75,7 @@ pmc8180_0: pmic@0 {
 		pon: pon@800 {
 			compatible = "qcom,pm8916-pon";
 			reg = <0x0800>;
-			pwrkey {
+			pmc8180_pwrkey: pwrkey {
 				compatible = "qcom,pm8941-pwrkey";
 				interrupts = <0x0 0x8 0x0 IRQ_TYPE_EDGE_BOTH>;
 				debounce = <15625>;
diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
index 9447c1e4577b..79b4d293ea1e 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
@@ -578,6 +578,10 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pmc8180_pwrkey {
+	status = "okay";
+};
+
 &pmc8180c_lpg {
 	status = "okay";
 };

---
base-commit: 9e6869691724b12e1f43655eeedc35fade38120c
change-id: 20240812-sc8180x-pwrkey-enable-9fe58187583e

Best regards,
-- 
Bjorn Andersson <quic_bjorande@quicinc.com>


