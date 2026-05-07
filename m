Return-Path: <linux-arm-msm+bounces-106449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6I7lEV6n/GmwSQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:53:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9755E4EA993
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B559630FCB6E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C05723E7174;
	Thu,  7 May 2026 14:44:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756F33FA5DA;
	Thu,  7 May 2026 14:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778165076; cv=none; b=IRHc2sBe5Qgns6OhK57idNhVAuzkaa0t168FxDYnGEQShZWhAw5afuLItwrLC7kHwohG13f4QzN7TH7KR3fKalsFdbcXUHDedncHlg+zn4kDVD03Cc+dhhl0l3YSWhkr2Kw1+Wxt+HD5XkVt/vYLWsyUeR2/WG2BbmJ/9hK4GO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778165076; c=relaxed/simple;
	bh=FaWGavfSxMCBMZdJDxWka2E95Ut88kDIDRC1g41Jyxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=H2Rm1U32crzZpGYHnP4H/ff2pPhOS/Zfs2UPvcnnV+CN0vxADF8nJ35jrTGHgcsV2ZjoIGrzR5YBa9MtGEdzBQ7EBQ1OjrV+MzPmRKCBY44cxUnA4h1kb0LZU7tHFQoB1pcpoX4D9Cgjue4JDm16GoQOqHUBHGarfW/UDZo1HFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpgz14t1778165051tfe28230d
X-QQ-Originating-IP: xhCpagNLNbrivJR0iKX0SpCyBOdQF16AvgTtci3O1FA=
Received: from [192.168.30.32] ( [116.234.74.217])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 22:44:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18324246108429620624
EX-QQ-RecipientCnt: 9
From: Xilin Wu <sophon@radxa.com>
Date: Thu, 07 May 2026 22:44:09 +0800
Subject: [PATCH] arm64: dts: qcom: sc8280xp: add missing QUP pinctrl states
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-sc8280xp-qup-pinctrl-v1-1-8950644af141@radxa.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTtJKSkWr2JYtHWqY0ytHSAkh
 LtbZfkW/28gVJgELs0GhRYWfqeK9tRAeLh0J+RbNWile2XUGSVYbdWa8TNnzJzCVF5onLcuDp4
 6E6GmuVDk9b+9jodl9k8K0+8F+/4F1MY+2HgAAAA=
X-Change-ID: 20260507-sc8280xp-qup-pinctrl-5ab8af9be35f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=30835; i=sophon@radxa.com;
 h=from:subject:message-id; bh=FaWGavfSxMCBMZdJDxWka2E95Ut88kDIDRC1g41Jyxw=;
 b=kA0DAAoWMsMVZ62eMk4ByyZiAGn8pTrIVzbSf47DJE6q+h3Ze6ko5rO/HpPqaF4oykCPT87XZ
 oh1BAAWCgAdFiEEIF8AnQd5bdblFnUuMsMVZ62eMk4FAmn8pToACgkQMsMVZ62eMk7JGwD9Ga/s
 VBMPJfarXaXrMq6jI23k6EIv4C9Md3k0iIPdRokBAN/Bj3FYurhlhK+tdD3ZgZI1OeyUWJwJe/O
 rQh56O7sN
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MPEorwW6cFo9R7GVgHx6JROOMe5Ji9yjURyW3reAaKKruRKleNNLs1ko
	C09APblRkuQdSHgcIBiUkX6c+iu85QAOJii7+jSdDIG6Fs+mp4lpL/G0KvOVQq1yyyARrzM
	n+lg98MMzMzA8iBWjsJO5y4j7DDJfhwFOXM3u6FY7G0Y4eod4b+qDs4Kd+1+5/Z6NR5K8er
	9AWO0EpyYileucIKIMjx7e0c+DL3y2/goxb2z0pTGz0CbQOeEd+Dw5vJWVHocNQKSzU2MNd
	VtT+8VymMPmoT6uiQ5kj2t9POk+NtEVYXQcUawRa+VNNUqc5S+1VBDX1JRBJDqpA2K2eyiW
	2Xb9ATJzrmvZXQIF+hDEf0nBHP6HKMYeHsoonjmkkwvOJarC73ICk+jXTzVJcat0c7ZCLZX
	LATO3YEnoIKRzlVA9vKLduuWyuvit/pqUykmlo8Idl3tGdYF77tQTuJ/psEKyY2yEkyaXNb
	C//jhGtZp0l/e0zRi0e549ykSyZFe5MFHXYd980Oact0q+8iuFK/DevZQgMhdkWkNMciBhX
	1IrAi0KSBegXkzJri8vaSUjKzF7kHOQIgWZdKJUDsIMfnRXv496c0XlgLq06wS01kdLfYm2
	AVuIyFMumK4zzHYslke5FxvssngT3Dc414Tu3Clz9oy0k0IhBeLew0qn7XHqejo4t+eBRdJ
	PEE2oGIdX/rBN5dvr03uXAQT7DAw9NO58k73kpM/O0yY/bKY9OUrQPIJd1sy/ni+lwNnW2w
	eukEIlhw3PI3X+cdPScHBAUSwxqz2gDEdWClh8uQ9u2y2bdnGEUCWdqUMIh54cocUIooidK
	6Fx8FsHmwTgI23KxS6LCiwSC7AXFeSRcjTKFHRgWhq1nM5vLPOOQ7Eg+5rxju8gEOPeJF6f
	7oI55nfXLfiye7vmx8J5SF6t1KK048aLSf8exsWnwZ2ai972/K/O5/aSVfJf6TfQBnpuLeX
	+2VFNy5Zg8hH0mb994bW2xdFke+IVRmM3Wtq6lIuFZ/WkZ8gSveJA/NXhEzC+re3glQ9qr0
	cFdDpQefxHViR+5xpdEE5mEh+/nFV+S6yXlF20mKZ3dNXTOAUt03zBEtEZsrA=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 9755E4EA993
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[radxa.com:email,radxa.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-106449-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Action: no action

Add the missing tlmm pinctrl states for the SC8280XP QUP engines so common
I2C, SPI and UART pinmux definitions are available from the SoC dtsi.
Populate all 24 engines using the SC8280XP lane-to-GPIO mapping, including
the non-linear QUP instances, and keep the mux function names aligned with
the driver-supported qup0..qup23 names.

Move UART electrical settings out of the shared SoC pinctrl states and
into the board dts files that need them. Update the boards that currently
duplicate uart2 pinctrl definitions to reference qup_uart2_default and
override only the required bias and drive properties locally, and do the
same for Arcata's uart18 configuration. This reduces duplicated pinctrl
data and keeps the shared SC8280XP states reusable for future QUP users.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  48 +-
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      |  48 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  48 +-
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    |  68 +-
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts |  48 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 936 ++++++++++++++++++++-
 6 files changed, 1036 insertions(+), 160 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index c53e00cae465..95f631f91edf 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -772,7 +772,7 @@ &sdc2 {
 };
 
 &uart2 {
-	pinctrl-0 = <&uart2_default>;
+	pinctrl-0 = <&qup_uart2_default>;
 	pinctrl-names = "default";
 
 	status = "okay";
@@ -941,6 +941,24 @@ hastings_reg_en: hastings-reg-en-state {
 	};
 };
 
+&qup_uart2_cts {
+	bias-bus-hold;
+};
+
+&qup_uart2_rts {
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&qup_uart2_rx {
+	bias-pull-up;
+};
+
+&qup_uart2_tx {
+	drive-strength = <2>;
+	bias-disable;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <74 6>, <83 4>, <125 2>, <128 2>, <154 7>;
 
@@ -1144,34 +1162,6 @@ reset-n-pins {
 		};
 	};
 
-	uart2_default: uart2-default-state {
-		cts-pins {
-			pins = "gpio121";
-			function = "qup2";
-			bias-bus-hold;
-		};
-
-		rts-pins {
-			pins = "gpio122";
-			function = "qup2";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		rx-pins {
-			pins = "gpio124";
-			function = "qup2";
-			bias-pull-up;
-		};
-
-		tx-pins {
-			pins = "gpio123";
-			function = "qup2";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-
 	usb0_sbu_default: usb0-sbu-state {
 		oe-n-pins {
 			pins = "gpio101";
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
index 9819454abe13..0d7f3dbd8f6a 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
@@ -1107,7 +1107,7 @@ &txmacro {
 };
 
 &uart2 {
-	pinctrl-0 = <&uart2_default>;
+	pinctrl-0 = <&qup_uart2_default>;
 	pinctrl-names = "default";
 
 	status = "okay";
@@ -1299,6 +1299,24 @@ hastings_reg_en: hastings-reg-en-state {
 	};
 };
 
+&qup_uart2_cts {
+	bias-bus-hold;
+};
+
+&qup_uart2_rts {
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&qup_uart2_rx {
+	bias-pull-up;
+};
+
+&qup_uart2_tx {
+	drive-strength = <2>;
+	bias-disable;
+};
+
 &tlmm {
 
 	gpio-reserved-ranges = <70 2>, <74 6>, <83 4>, <125 2>, <128 2>, <154 4>;
@@ -1428,34 +1446,6 @@ reset-n-pins {
 		};
 	};
 
-	uart2_default: uart2-default-state {
-		cts-pins {
-			pins = "gpio121";
-			function = "qup2";
-			bias-bus-hold;
-		};
-
-		rts-pins {
-			pins = "gpio122";
-			function = "qup2";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		rx-pins {
-			pins = "gpio124";
-			function = "qup2";
-			bias-pull-up;
-		};
-
-		tx-pins {
-			pins = "gpio123";
-			function = "qup2";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-
 	usb0_sbu_default: usb0-sbu-state {
 		pins = "gpio164";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index d84ca010ab9d..1850bc77d03b 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -1316,7 +1316,7 @@ &txmacro {
 };
 
 &uart2 {
-	pinctrl-0 = <&uart2_default>;
+	pinctrl-0 = <&qup_uart2_default>;
 	pinctrl-names = "default";
 
 	status = "okay";
@@ -1526,6 +1526,24 @@ hastings_reg_en: hastings-reg-en-state {
 	};
 };
 
+&qup_uart2_cts {
+	bias-bus-hold;
+};
+
+&qup_uart2_rts {
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&qup_uart2_rx {
+	bias-pull-up;
+};
+
+&qup_uart2_tx {
+	drive-strength = <2>;
+	bias-disable;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <70 2>, <74 6>, <125 2>, <128 2>, <154 4>;
 
@@ -1756,34 +1774,6 @@ reset-n-pins {
 		};
 	};
 
-	uart2_default: uart2-default-state {
-		cts-pins {
-			pins = "gpio121";
-			function = "qup2";
-			bias-bus-hold;
-		};
-
-		rts-pins {
-			pins = "gpio122";
-			function = "qup2";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		rx-pins {
-			pins = "gpio124";
-			function = "qup2";
-			bias-pull-up;
-		};
-
-		tx-pins {
-			pins = "gpio123";
-			function = "qup2";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-
 	usb0_sbu_default: usb0-sbu-state {
 		oe-n-pins {
 			pins = "gpio101";
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index f2b4470d4407..d92a9737deac 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -714,7 +714,7 @@ &txmacro {
 };
 
 &uart2 {
-	pinctrl-0 = <&uart2_default>;
+	pinctrl-0 = <&qup_uart2_default>;
 	pinctrl-names = "default";
 
 	status = "okay";
@@ -867,6 +867,44 @@ hastings_reg_en: hastings-reg-en-state {
 	};
 };
 
+&qup_uart2_cts {
+	bias-bus-hold;
+};
+
+&qup_uart2_rts {
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&qup_uart2_rx {
+	bias-pull-up;
+};
+
+&qup_uart2_tx {
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&qup_uart18_cts {
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&qup_uart18_rts {
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&qup_uart18_tx {
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&qup_uart18_rx {
+	drive-strength = <2>;
+	bias-disable;
+};
+
 &tlmm {
 	bt_default: bt-default-state {
 		hstp-bt-en-pins {
@@ -966,34 +1004,6 @@ ssam_state: ssam-state-state {
 		bias-disable;
 	};
 
-	uart2_default: uart2-default-state {
-		cts-pins {
-			pins = "gpio121";
-			function = "qup2";
-			bias-bus-hold;
-		};
-
-		rts-pins {
-			pins = "gpio122";
-			function = "qup2";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		rx-pins {
-			pins = "gpio124";
-			function = "qup2";
-			bias-pull-up;
-		};
-
-		tx-pins {
-			pins = "gpio123";
-			function = "qup2";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-
 	usb0_sbu_default: usb0-sbu-state {
 		oe-n-pins {
 			pins = "gpio101";
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
index 00bbeeef6f14..b402506396db 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
@@ -961,7 +961,7 @@ &txmacro {
 };
 
 &uart2 {
-	pinctrl-0 = <&uart2_default>;
+	pinctrl-0 = <&qup_uart2_default>;
 	pinctrl-names = "default";
 
 	status = "okay";
@@ -1146,6 +1146,24 @@ hastings_reg_en: hastings-reg-en-state {
 	};
 };
 
+&qup_uart2_cts {
+	bias-bus-hold;
+};
+
+&qup_uart2_rts {
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&qup_uart2_rx {
+	bias-pull-up;
+};
+
+&qup_uart2_tx {
+	drive-strength = <2>;
+	bias-disable;
+};
+
 &tlmm {
 	bt_default: bt-default-state {
 		hstp-bt-en-pins {
@@ -1238,34 +1256,6 @@ wake-n-pins {
 		};
 	};
 
-	uart2_default: uart2-default-state {
-		cts-pins {
-			pins = "gpio121";
-			function = "qup2";
-			bias-bus-hold;
-		};
-
-		rts-pins {
-			pins = "gpio122";
-			function = "qup2";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		rx-pins {
-			pins = "gpio124";
-			function = "qup2";
-			bias-pull-up;
-		};
-
-		tx-pins {
-			pins = "gpio123";
-			function = "qup2";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-
 	usb0_sbu_default: usb0-sbu-state {
 		oe-n-pins {
 			pins = "gpio101";
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 761f229e8f47..584b4fba85b8 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -5601,33 +5601,939 @@ cci3_i2c1_sleep: cci3-i2c1-sleep-pins {
 				};
 			};
 
+			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
+				pins = "gpio135", "gpio136";
+				function = "qup0";
+			};
+
+			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
+				pins = "gpio158", "gpio159";
+				function = "qup1";
+			};
+
+			qup_i2c2_data_clk: qup-i2c2-data-clk-state {
+				pins = "gpio121", "gpio122";
+				function = "qup2";
+			};
+
+			qup_i2c3_data_clk: qup-i2c3-data-clk-state {
+				pins = "gpio137", "gpio138";
+				function = "qup3";
+			};
+
+			qup_i2c4_data_clk: qup-i2c4-data-clk-state {
+				pins = "gpio171", "gpio172";
+				function = "qup4";
+			};
+
+			qup_i2c5_data_clk: qup-i2c5-data-clk-state {
+				pins = "gpio111", "gpio112";
+				function = "qup5";
+			};
+
+			qup_i2c6_data_clk: qup-i2c6-data-clk-state {
+				pins = "gpio154", "gpio155";
+				function = "qup6";
+			};
+
+			qup_i2c7_data_clk: qup-i2c7-data-clk-state {
+				pins = "gpio128", "gpio129";
+				function = "qup7";
+			};
+
+			qup_i2c8_data_clk: qup-i2c8-data-clk-state {
+				pins = "gpio43", "gpio44";
+				function = "qup8";
+			};
+
+			qup_i2c9_data_clk: qup-i2c9-data-clk-state {
+				pins = "gpio41", "gpio42";
+				function = "qup9";
+			};
+
+			qup_i2c10_data_clk: qup-i2c10-data-clk-state {
+				pins = "gpio22", "gpio23";
+				function = "qup10";
+			};
+
+			qup_i2c11_data_clk: qup-i2c11-data-clk-state {
+				pins = "gpio18", "gpio19";
+				function = "qup11";
+			};
+
+			qup_i2c12_data_clk: qup-i2c12-data-clk-state {
+				pins = "gpio0", "gpio1";
+				function = "qup12";
+			};
+
+			qup_i2c13_data_clk: qup-i2c13-data-clk-state {
+				pins = "gpio26", "gpio27";
+				function = "qup13";
+			};
+
+			qup_i2c14_data_clk: qup-i2c14-data-clk-state {
+				pins = "gpio4", "gpio5";
+				function = "qup14";
+			};
+
+			qup_i2c15_data_clk: qup-i2c15-data-clk-state {
+				pins = "gpio36", "gpio37";
+				function = "qup15";
+			};
+
+			qup_i2c16_data_clk: qup-i2c16-data-clk-state {
+				pins = "gpio70", "gpio71";
+				function = "qup16";
+			};
+
+			qup_i2c17_data_clk: qup-i2c17-data-clk-state {
+				pins = "gpio61", "gpio62";
+				function = "qup17";
+			};
+
+			qup_i2c18_data_clk: qup-i2c18-data-clk-state {
+				pins = "gpio66", "gpio67";
+				function = "qup18";
+			};
+
+			qup_i2c19_data_clk: qup-i2c19-data-clk-state {
+				pins = "gpio55", "gpio56";
+				function = "qup19";
+			};
+
+			qup_i2c20_data_clk: qup-i2c20-data-clk-state {
+				pins = "gpio87", "gpio88";
+				function = "qup20";
+			};
+
+			qup_i2c21_data_clk: qup-i2c21-data-clk-state {
+				pins = "gpio81", "gpio82";
+				function = "qup21";
+			};
+
+			qup_i2c22_data_clk: qup-i2c22-data-clk-state {
+				pins = "gpio85", "gpio86";
+				function = "qup22";
+			};
+
+			qup_i2c23_data_clk: qup-i2c23-data-clk-state {
+				pins = "gpio59", "gpio60";
+				function = "qup23";
+			};
+
+			qup_spi0_data_clk: qup-spi0-data-clk-state {
+				pins = "gpio135", "gpio136", "gpio137";
+				function = "qup0";
+			};
+
+			qup_spi0_cs: qup-spi0-cs-state {
+				pins = "gpio138";
+				function = "qup0";
+			};
+
+			qup_spi0_cs_gpio: qup-spi0-cs-gpio-state {
+				pins = "gpio138";
+				function = "gpio";
+			};
+
+			qup_spi1_data_clk: qup-spi1-data-clk-state {
+				pins = "gpio158", "gpio159", "gpio160";
+				function = "qup1";
+			};
+
+			qup_spi1_cs: qup-spi1-cs-state {
+				pins = "gpio161";
+				function = "qup1";
+			};
+
+			qup_spi1_cs_gpio: qup-spi1-cs-gpio-state {
+				pins = "gpio161";
+				function = "gpio";
+			};
+
+			qup_spi2_data_clk: qup-spi2-data-clk-state {
+				pins = "gpio121", "gpio122", "gpio123";
+				function = "qup2";
+			};
+
+			qup_spi2_cs: qup-spi2-cs-state {
+				pins = "gpio124";
+				function = "qup2";
+			};
+
+			qup_spi2_cs_gpio: qup-spi2-cs-gpio-state {
+				pins = "gpio124";
+				function = "gpio";
+			};
+
+			qup_spi3_data_clk: qup-spi3-data-clk-state {
+				pins = "gpio137", "gpio138", "gpio135";
+				function = "qup3";
+			};
+
+			qup_spi3_cs: qup-spi3-cs-state {
+				pins = "gpio136";
+				function = "qup3";
+			};
+
+			qup_spi3_cs_gpio: qup-spi3-cs-gpio-state {
+				pins = "gpio136";
+				function = "gpio";
+			};
+
+			qup_spi4_data_clk: qup-spi4-data-clk-state {
+				pins = "gpio171", "gpio172", "gpio173";
+				function = "qup4";
+			};
+
+			qup_spi4_cs: qup-spi4-cs-state {
+				pins = "gpio174";
+				function = "qup4";
+			};
+
+			qup_spi4_cs_gpio: qup-spi4-cs-gpio-state {
+				pins = "gpio174";
+				function = "gpio";
+			};
+
+			qup_spi5_data_clk: qup-spi5-data-clk-state {
+				pins = "gpio111", "gpio112", "gpio145";
+				function = "qup5";
+			};
+
+			qup_spi5_cs: qup-spi5-cs-state {
+				pins = "gpio146";
+				function = "qup5";
+			};
+
+			qup_spi5_cs_gpio: qup-spi5-cs-gpio-state {
+				pins = "gpio146";
+				function = "gpio";
+			};
+
+			qup_spi6_data_clk: qup-spi6-data-clk-state {
+				pins = "gpio154", "gpio155", "gpio156";
+				function = "qup6";
+			};
+
+			qup_spi6_cs: qup-spi6-cs-state {
+				pins = "gpio157";
+				function = "qup6";
+			};
+
+			qup_spi6_cs_gpio: qup-spi6-cs-gpio-state {
+				pins = "gpio157";
+				function = "gpio";
+			};
+
+			qup_spi7_data_clk: qup-spi7-data-clk-state {
+				pins = "gpio128", "gpio129", "gpio125";
+				function = "qup7";
+			};
+
+			qup_spi7_cs: qup-spi7-cs-state {
+				pins = "gpio126";
+				function = "qup7";
+			};
+
+			qup_spi7_cs_gpio: qup-spi7-cs-gpio-state {
+				pins = "gpio126";
+				function = "gpio";
+			};
+
+			qup_spi8_data_clk: qup-spi8-data-clk-state {
+				pins = "gpio43", "gpio44", "gpio45";
+				function = "qup8";
+			};
+
+			qup_spi8_cs: qup-spi8-cs-state {
+				pins = "gpio46";
+				function = "qup8";
+			};
+
+			qup_spi8_cs_gpio: qup-spi8-cs-gpio-state {
+				pins = "gpio46";
+				function = "gpio";
+			};
+
+			qup_spi9_data_clk: qup-spi9-data-clk-state {
+				pins = "gpio41", "gpio42", "gpio43";
+				function = "qup9";
+			};
+
+			qup_spi9_cs: qup-spi9-cs-state {
+				pins = "gpio44";
+				function = "qup9";
+			};
+
+			qup_spi9_cs_gpio: qup-spi9-cs-gpio-state {
+				pins = "gpio44";
+				function = "gpio";
+			};
+
+			qup_spi10_data_clk: qup-spi10-data-clk-state {
+				pins = "gpio22", "gpio23", "gpio24";
+				function = "qup10";
+			};
+
+			qup_spi10_cs: qup-spi10-cs-state {
+				pins = "gpio25";
+				function = "qup10";
+			};
+
+			qup_spi10_cs_gpio: qup-spi10-cs-gpio-state {
+				pins = "gpio25";
+				function = "gpio";
+			};
+
+			qup_spi11_data_clk: qup-spi11-data-clk-state {
+				pins = "gpio18", "gpio19", "gpio20";
+				function = "qup11";
+			};
+
+			qup_spi11_cs: qup-spi11-cs-state {
+				pins = "gpio21";
+				function = "qup11";
+			};
+
+			qup_spi11_cs_gpio: qup-spi11-cs-gpio-state {
+				pins = "gpio21";
+				function = "gpio";
+			};
+
+			qup_spi12_data_clk: qup-spi12-data-clk-state {
+				pins = "gpio0", "gpio1", "gpio2";
+				function = "qup12";
+			};
+
+			qup_spi12_cs: qup-spi12-cs-state {
+				pins = "gpio3";
+				function = "qup12";
+			};
+
+			qup_spi12_cs_gpio: qup-spi12-cs-gpio-state {
+				pins = "gpio3";
+				function = "gpio";
+			};
+
+			qup_spi13_data_clk: qup-spi13-data-clk-state {
+				pins = "gpio26", "gpio27", "gpio28";
+				function = "qup13";
+			};
+
+			qup_spi13_cs: qup-spi13-cs-state {
+				pins = "gpio29";
+				function = "qup13";
+			};
+
+			qup_spi13_cs_gpio: qup-spi13-cs-gpio-state {
+				pins = "gpio29";
+				function = "gpio";
+			};
+
+			qup_spi14_data_clk: qup-spi14-data-clk-state {
+				pins = "gpio4", "gpio5", "gpio6";
+				function = "qup14";
+			};
+
+			qup_spi14_cs: qup-spi14-cs-state {
+				pins = "gpio7";
+				function = "qup14";
+			};
+
+			qup_spi14_cs_gpio: qup-spi14-cs-gpio-state {
+				pins = "gpio7";
+				function = "gpio";
+			};
+
+			qup_spi15_data_clk: qup-spi15-data-clk-state {
+				pins = "gpio36", "gpio37", "gpio38";
+				function = "qup15";
+			};
+
+			qup_spi15_cs: qup-spi15-cs-state {
+				pins = "gpio39";
+				function = "qup15";
+			};
+
+			qup_spi15_cs_gpio: qup-spi15-cs-gpio-state {
+				pins = "gpio39";
+				function = "gpio";
+			};
+
+			qup_spi16_data_clk: qup-spi16-data-clk-state {
+				pins = "gpio70", "gpio71", "gpio72";
+				function = "qup16";
+			};
+
+			qup_spi16_cs: qup-spi16-cs-state {
+				pins = "gpio73";
+				function = "qup16";
+			};
+
+			qup_spi16_cs_gpio: qup-spi16-cs-gpio-state {
+				pins = "gpio73";
+				function = "gpio";
+			};
+
+			qup_spi17_data_clk: qup-spi17-data-clk-state {
+				pins = "gpio61", "gpio62", "gpio63";
+				function = "qup17";
+			};
+
+			qup_spi17_cs: qup-spi17-cs-state {
+				pins = "gpio64";
+				function = "qup17";
+			};
+
+			qup_spi17_cs_gpio: qup-spi17-cs-gpio-state {
+				pins = "gpio64";
+				function = "gpio";
+			};
+
+			qup_spi18_data_clk: qup-spi18-data-clk-state {
+				pins = "gpio66", "gpio67", "gpio68";
+				function = "qup18";
+			};
+
+			qup_spi18_cs: qup-spi18-cs-state {
+				pins = "gpio69";
+				function = "qup18";
+			};
+
+			qup_spi18_cs_gpio: qup-spi18-cs-gpio-state {
+				pins = "gpio69";
+				function = "gpio";
+			};
+
+			qup_spi19_data_clk: qup-spi19-data-clk-state {
+				pins = "gpio55", "gpio56", "gpio57";
+				function = "qup19";
+			};
+
+			qup_spi19_cs: qup-spi19-cs-state {
+				pins = "gpio58";
+				function = "qup19";
+			};
+
+			qup_spi19_cs_gpio: qup-spi19-cs-gpio-state {
+				pins = "gpio58";
+				function = "gpio";
+			};
+
+			qup_spi20_data_clk: qup-spi20-data-clk-state {
+				pins = "gpio87", "gpio88", "gpio89";
+				function = "qup20";
+			};
+
+			qup_spi20_cs: qup-spi20-cs-state {
+				pins = "gpio90";
+				function = "qup20";
+			};
+
+			qup_spi20_cs_gpio: qup-spi20-cs-gpio-state {
+				pins = "gpio90";
+				function = "gpio";
+			};
+
+			qup_spi21_data_clk: qup-spi21-data-clk-state {
+				pins = "gpio81", "gpio82", "gpio83";
+				function = "qup21";
+			};
+
+			qup_spi21_cs: qup-spi21-cs-state {
+				pins = "gpio84";
+				function = "qup21";
+			};
+
+			qup_spi21_cs_gpio: qup-spi21-cs-gpio-state {
+				pins = "gpio84";
+				function = "gpio";
+			};
+
+			qup_spi22_data_clk: qup-spi22-data-clk-state {
+				pins = "gpio85", "gpio86", "gpio83";
+				function = "qup22";
+			};
+
+			qup_spi22_cs: qup-spi22-cs-state {
+				pins = "gpio84";
+				function = "qup22";
+			};
+
+			qup_spi22_cs_gpio: qup-spi22-cs-gpio-state {
+				pins = "gpio84";
+				function = "gpio";
+			};
+
+			qup_spi23_data_clk: qup-spi23-data-clk-state {
+				pins = "gpio59", "gpio60", "gpio61";
+				function = "qup23";
+			};
+
+			qup_spi23_cs: qup-spi23-cs-state {
+				pins = "gpio62";
+				function = "qup23";
+			};
+
+			qup_spi23_cs_gpio: qup-spi23-cs-gpio-state {
+				pins = "gpio62";
+				function = "gpio";
+			};
+
+			qup_uart0_default: qup-uart0-default-state {
+				qup_uart0_cts: cts-pins {
+					pins = "gpio135";
+					function = "qup0";
+				};
+				qup_uart0_rts: rts-pins {
+					pins = "gpio136";
+					function = "qup0";
+				};
+				qup_uart0_tx: tx-pins {
+					pins = "gpio137";
+					function = "qup0";
+				};
+				qup_uart0_rx: rx-pins {
+					pins = "gpio138";
+					function = "qup0";
+				};
+			};
+
+			qup_uart1_default: qup-uart1-default-state {
+				qup_uart1_cts: cts-pins {
+					pins = "gpio158";
+					function = "qup1";
+				};
+				qup_uart1_rts: rts-pins {
+					pins = "gpio159";
+					function = "qup1";
+				};
+				qup_uart1_tx: tx-pins {
+					pins = "gpio160";
+					function = "qup1";
+				};
+				qup_uart1_rx: rx-pins {
+					pins = "gpio161";
+					function = "qup1";
+				};
+			};
+
+			qup_uart2_default: qup-uart2-default-state {
+				qup_uart2_cts: cts-pins {
+					pins = "gpio121";
+					function = "qup2";
+				};
+				qup_uart2_rts: rts-pins {
+					pins = "gpio122";
+					function = "qup2";
+				};
+				qup_uart2_tx: tx-pins {
+					pins = "gpio123";
+					function = "qup2";
+				};
+				qup_uart2_rx: rx-pins {
+					pins = "gpio124";
+					function = "qup2";
+				};
+			};
+
+			qup_uart3_default: qup-uart3-default-state {
+				qup_uart3_cts: cts-pins {
+					pins = "gpio137";
+					function = "qup3";
+				};
+				qup_uart3_rts: rts-pins {
+					pins = "gpio138";
+					function = "qup3";
+				};
+				qup_uart3_tx: tx-pins {
+					pins = "gpio135";
+					function = "qup3";
+				};
+				qup_uart3_rx: rx-pins {
+					pins = "gpio136";
+					function = "qup3";
+				};
+			};
+
+			qup_uart4_default: qup-uart4-default-state {
+				qup_uart4_cts: cts-pins {
+					pins = "gpio171";
+					function = "qup4";
+				};
+				qup_uart4_rts: rts-pins {
+					pins = "gpio172";
+					function = "qup4";
+				};
+				qup_uart4_tx: tx-pins {
+					pins = "gpio173";
+					function = "qup4";
+				};
+				qup_uart4_rx: rx-pins {
+					pins = "gpio174";
+					function = "qup4";
+				};
+			};
+
+			qup_uart5_default: qup-uart5-default-state {
+				qup_uart5_cts: cts-pins {
+					pins = "gpio111";
+					function = "qup5";
+				};
+				qup_uart5_rts: rts-pins {
+					pins = "gpio112";
+					function = "qup5";
+				};
+				qup_uart5_tx: tx-pins {
+					pins = "gpio145";
+					function = "qup5";
+				};
+				qup_uart5_rx: rx-pins {
+					pins = "gpio146";
+					function = "qup5";
+				};
+			};
+
+			qup_uart6_default: qup-uart6-default-state {
+				qup_uart6_cts: cts-pins {
+					pins = "gpio154";
+					function = "qup6";
+				};
+				qup_uart6_rts: rts-pins {
+					pins = "gpio155";
+					function = "qup6";
+				};
+				qup_uart6_tx: tx-pins {
+					pins = "gpio156";
+					function = "qup6";
+				};
+				qup_uart6_rx: rx-pins {
+					pins = "gpio157";
+					function = "qup6";
+				};
+			};
+
+			qup_uart7_default: qup-uart7-default-state {
+				qup_uart7_cts: cts-pins {
+					pins = "gpio128";
+					function = "qup7";
+				};
+				qup_uart7_rts: rts-pins {
+					pins = "gpio129";
+					function = "qup7";
+				};
+				qup_uart7_tx: tx-pins {
+					pins = "gpio125";
+					function = "qup7";
+				};
+				qup_uart7_rx: rx-pins {
+					pins = "gpio126";
+					function = "qup7";
+				};
+			};
+
+			qup_uart8_default: qup-uart8-default-state {
+				qup_uart8_cts: cts-pins {
+					pins = "gpio43";
+					function = "qup8";
+				};
+				qup_uart8_rts: rts-pins {
+					pins = "gpio44";
+					function = "qup8";
+				};
+				qup_uart8_tx: tx-pins {
+					pins = "gpio45";
+					function = "qup8";
+				};
+				qup_uart8_rx: rx-pins {
+					pins = "gpio46";
+					function = "qup8";
+				};
+			};
+
+			qup_uart9_default: qup-uart9-default-state {
+				qup_uart9_cts: cts-pins {
+					pins = "gpio41";
+					function = "qup9";
+				};
+				qup_uart9_rts: rts-pins {
+					pins = "gpio42";
+					function = "qup9";
+				};
+				qup_uart9_tx: tx-pins {
+					pins = "gpio43";
+					function = "qup9";
+				};
+				qup_uart9_rx: rx-pins {
+					pins = "gpio44";
+					function = "qup9";
+				};
+			};
+
+			qup_uart10_default: qup-uart10-default-state {
+				qup_uart10_cts: cts-pins {
+					pins = "gpio22";
+					function = "qup10";
+				};
+				qup_uart10_rts: rts-pins {
+					pins = "gpio23";
+					function = "qup10";
+				};
+				qup_uart10_tx: tx-pins {
+					pins = "gpio24";
+					function = "qup10";
+				};
+				qup_uart10_rx: rx-pins {
+					pins = "gpio25";
+					function = "qup10";
+				};
+			};
+
+			qup_uart11_default: qup-uart11-default-state {
+				qup_uart11_cts: cts-pins {
+					pins = "gpio18";
+					function = "qup11";
+				};
+				qup_uart11_rts: rts-pins {
+					pins = "gpio19";
+					function = "qup11";
+				};
+				qup_uart11_tx: tx-pins {
+					pins = "gpio20";
+					function = "qup11";
+				};
+				qup_uart11_rx: rx-pins {
+					pins = "gpio21";
+					function = "qup11";
+				};
+			};
+
+			qup_uart12_default: qup-uart12-default-state {
+				qup_uart12_cts: cts-pins {
+					pins = "gpio0";
+					function = "qup12";
+				};
+				qup_uart12_rts: rts-pins {
+					pins = "gpio1";
+					function = "qup12";
+				};
+				qup_uart12_tx: tx-pins {
+					pins = "gpio2";
+					function = "qup12";
+				};
+				qup_uart12_rx: rx-pins {
+					pins = "gpio3";
+					function = "qup12";
+				};
+			};
+
+			qup_uart13_default: qup-uart13-default-state {
+				qup_uart13_cts: cts-pins {
+					pins = "gpio26";
+					function = "qup13";
+				};
+				qup_uart13_rts: rts-pins {
+					pins = "gpio27";
+					function = "qup13";
+				};
+				qup_uart13_tx: tx-pins {
+					pins = "gpio28";
+					function = "qup13";
+				};
+				qup_uart13_rx: rx-pins {
+					pins = "gpio29";
+					function = "qup13";
+				};
+			};
+
+			qup_uart14_default: qup-uart14-default-state {
+				qup_uart14_cts: cts-pins {
+					pins = "gpio4";
+					function = "qup14";
+				};
+				qup_uart14_rts: rts-pins {
+					pins = "gpio5";
+					function = "qup14";
+				};
+				qup_uart14_tx: tx-pins {
+					pins = "gpio6";
+					function = "qup14";
+				};
+				qup_uart14_rx: rx-pins {
+					pins = "gpio7";
+					function = "qup14";
+				};
+			};
+
+			qup_uart15_default: qup-uart15-default-state {
+				qup_uart15_cts: cts-pins {
+					pins = "gpio36";
+					function = "qup15";
+				};
+				qup_uart15_rts: rts-pins {
+					pins = "gpio37";
+					function = "qup15";
+				};
+				qup_uart15_tx: tx-pins {
+					pins = "gpio38";
+					function = "qup15";
+				};
+				qup_uart15_rx: rx-pins {
+					pins = "gpio39";
+					function = "qup15";
+				};
+			};
+
+			qup_uart16_default: qup-uart16-default-state {
+				qup_uart16_cts: cts-pins {
+					pins = "gpio70";
+					function = "qup16";
+				};
+				qup_uart16_rts: rts-pins {
+					pins = "gpio71";
+					function = "qup16";
+				};
+				qup_uart16_tx: tx-pins {
+					pins = "gpio72";
+					function = "qup16";
+				};
+				qup_uart16_rx: rx-pins {
+					pins = "gpio73";
+					function = "qup16";
+				};
+			};
+
+			qup_uart17_default: qup-uart17-default-state {
+				qup_uart17_cts: cts-pins {
+					pins = "gpio61";
+					function = "qup17";
+				};
+				qup_uart17_rts: rts-pins {
+					pins = "gpio62";
+					function = "qup17";
+				};
+				qup_uart17_tx: tx-pins {
+					pins = "gpio63";
+					function = "qup17";
+				};
+				qup_uart17_rx: rx-pins {
+					pins = "gpio64";
+					function = "qup17";
+				};
+			};
+
 			qup_uart18_default: qup-uart18-default-state {
-				cts-pins {
+				qup_uart18_cts: cts-pins {
 					pins = "gpio66";
 					function = "qup18";
-					drive-strength = <2>;
-					bias-disable;
 				};
-
-				rts-pins {
+				qup_uart18_rts: rts-pins {
 					pins = "gpio67";
 					function = "qup18";
-					drive-strength = <2>;
-					bias-disable;
 				};
-
-				tx-pins {
+				qup_uart18_tx: tx-pins {
 					pins = "gpio68";
 					function = "qup18";
-					drive-strength = <2>;
-					bias-disable;
 				};
-
-				rx-pins {
+				qup_uart18_rx: rx-pins {
 					pins = "gpio69";
 					function = "qup18";
-					drive-strength = <2>;
-					bias-disable;
+				};
+			};
+
+			qup_uart19_default: qup-uart19-default-state {
+				qup_uart19_cts: cts-pins {
+					pins = "gpio55";
+					function = "qup19";
+				};
+				qup_uart19_rts: rts-pins {
+					pins = "gpio56";
+					function = "qup19";
+				};
+				qup_uart19_tx: tx-pins {
+					pins = "gpio57";
+					function = "qup19";
+				};
+				qup_uart19_rx: rx-pins {
+					pins = "gpio58";
+					function = "qup19";
+				};
+			};
+
+			qup_uart20_default: qup-uart20-default-state {
+				qup_uart20_cts: cts-pins {
+					pins = "gpio87";
+					function = "qup20";
+				};
+				qup_uart20_rts: rts-pins {
+					pins = "gpio88";
+					function = "qup20";
+				};
+				qup_uart20_tx: tx-pins {
+					pins = "gpio89";
+					function = "qup20";
+				};
+				qup_uart20_rx: rx-pins {
+					pins = "gpio90";
+					function = "qup20";
+				};
+			};
+
+			qup_uart21_default: qup-uart21-default-state {
+				qup_uart21_cts: cts-pins {
+					pins = "gpio81";
+					function = "qup21";
+				};
+				qup_uart21_rts: rts-pins {
+					pins = "gpio82";
+					function = "qup21";
+				};
+				qup_uart21_tx: tx-pins {
+					pins = "gpio83";
+					function = "qup21";
+				};
+				qup_uart21_rx: rx-pins {
+					pins = "gpio84";
+					function = "qup21";
+				};
+			};
+
+			qup_uart22_default: qup-uart22-default-state {
+				qup_uart22_cts: cts-pins {
+					pins = "gpio85";
+					function = "qup22";
+				};
+				qup_uart22_rts: rts-pins {
+					pins = "gpio86";
+					function = "qup22";
+				};
+				qup_uart22_tx: tx-pins {
+					pins = "gpio83";
+					function = "qup22";
+				};
+				qup_uart22_rx: rx-pins {
+					pins = "gpio84";
+					function = "qup22";
+				};
+			};
+
+			qup_uart23_default: qup-uart23-default-state {
+				qup_uart23_cts: cts-pins {
+					pins = "gpio59";
+					function = "qup23";
+				};
+				qup_uart23_rts: rts-pins {
+					pins = "gpio60";
+					function = "qup23";
+				};
+				qup_uart23_tx: tx-pins {
+					pins = "gpio61";
+					function = "qup23";
+				};
+				qup_uart23_rx: rx-pins {
+					pins = "gpio62";
+					function = "qup23";
 				};
 			};
 		};

---
base-commit: 735d2f48cadaa9a87e7c7601667878de70c771c5
change-id: 20260507-sc8280xp-qup-pinctrl-5ab8af9be35f

Best regards,
--  
Xilin Wu <sophon@radxa.com>


