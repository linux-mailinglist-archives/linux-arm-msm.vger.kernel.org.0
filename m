Return-Path: <linux-arm-msm+bounces-100646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIqnAIXbyWmC3AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 04:10:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5580F354B1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 04:10:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED5BD30086E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 02:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B71733CE88;
	Mon, 30 Mar 2026 02:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mOHtsRE/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A762C2F3614;
	Mon, 30 Mar 2026 02:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774836610; cv=none; b=Lu6TRzY0BaZXDkMmapx9dc5+5pJUmcNTaPKYlquVehEdsMqp5tJigw+XTAZmEMshiqFnogPEeRBguk+pe1B4LuRr97VlpVWLtzK47prYaNTj0nPRJed62bFs92ngeubjr6LP3Zu1lnzAEYv8m05S/mcZDEo9egu1RdJGjftj5bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774836610; c=relaxed/simple;
	bh=GI737mK+fQJRTF+iOx/VN6jHzSB3/LDwkLILmjxiMC8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DCy2gq3GEY3JuBakPdVSuvUzD+rlDZ7j1a2tlLRqLDPAmoEDeMcF34Ab1DCHXByhFc55Iv0a1q+tIS7hODuTxuFJ9kkJnfAL1wBz6as2b+dNqpfHzGA2g1mUA93pAWlrE8j0G3nXRPHxgsEdkNlDoWd08vKg57KYKfkt6ZFRRoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mOHtsRE/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAhZG1201416;
	Mon, 30 Mar 2026 02:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=U20/O7FgYWbVX6Icc/eYMwWZH+0hpW+d8RW
	7/eBPhSo=; b=mOHtsRE/3huQwSVPdvMm1CNAh5Sjo/MaBeXffrHLK4AZrHX5wOT
	S78E/qLg76usHnyu7SMrCXAo4hvi0cP/21FuBu3gXxBddDhayi+J6aT/gVcQg3V2
	xhPHXgVyiQSftdJtTZNgX5LHZpBW22ck3wgX8Q4yAiYDhdEpRqwg8uw8IEaHdbfI
	JAPoTkfIiYIsVQRA2usoIjsREIWXNTUSAs6jkZhu6v8BA9CWSW50FfLSE6YgXBNf
	6aZq3NfAArQ3mMHYZ5gUBAebwO9q/iGfzIwxlcaQKBILNPzIMbapQ3+VSuWGFCSS
	t1jMrfiFS3tERuwuuhKe62pmQWOqUcKE1TQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66jwm47w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Mar 2026 02:09:49 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 62U29kXE011957;
	Mon, 30 Mar 2026 02:09:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4d6qk1tkdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Mar 2026 02:09:46 +0000 (GMT)
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 62U29ksa011951;
	Mon, 30 Mar 2026 02:09:46 GMT
Received: from cse-cd02-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 62U29jJU011946
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Mar 2026 02:09:46 +0000 (GMT)
Received: by cse-cd02-lnx.qualcomm.com (Postfix, from userid 4438065)
	id 7BACE417E1; Mon, 30 Mar 2026 10:09:44 +0800 (CST)
From: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, ziyue.zhang@oss.qualcomm.com,
        jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
        kwilczynski@kernel.org, bhelgaas@google.com, johan+linaro@kernel.org,
        vkoul@kernel.org, kishon@kernel.org, neil.armstrong@linaro.org,
        abel.vesa@linaro.org, kw@linux.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, qiang.yu@oss.qualcomm.com,
        quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
Subject: [PATCH v2 1/1] arm64: dts: qcom: hamoa: Fix incomplete Root Port property migration
Date: Mon, 30 Mar 2026 10:09:34 +0800
Message-ID: <20260330020934.3501247-1-ziyue.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=I8dohdgg c=1 sm=1 tr=0 ts=69c9db6d cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=7D783TuBx9djJqFGgd4A:9
X-Proofpoint-GUID: xSGPe6w8x8W8ck63q69wFA7nWFHBUdC2
X-Proofpoint-ORIG-GUID: xSGPe6w8x8W8ck63q69wFA7nWFHBUdC2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAxNCBTYWx0ZWRfXzBMN4ssi8hbZ
 S14UIsbpTMcnUjj23Em0QjUW37g5lxrc2+SfMiasauqLSRKA9BCSmeZLUiiKlsnvYaxvgaPX9iK
 xyN2bqtsy9QVNBPR1HcHhK64Ey2pTN6Ajc7h9J1PEHQAfJO2T0f0PhNkUqrIGGSjyFwMcB4qImg
 212tgGwG7iXmj5FG1AlKc9Ozdh4x/CdFRGP0mAM4ikms1NDxDBkH5ysZrGMeA2sOFbsmPYHvKw3
 gkXJhuUS9jYCBQ4NWLYEohsa9yc8vpqa/PDGVPo2Sm1obvl5raFIhVl/x47k2lr0GEhZr+KhBos
 QYsPSXKH4Mv71yNi5kkAg5ASxuAwYdfeheKEfdAm0gFOSIe+g9FzTBZBg8zWgS9Vi8NjDtwygOf
 mx+p7Deeroif4+1pH4xVjKis1+ETLUFYrmibHOqNvKP1WXBbbEVJ5/4myL0K0JGCiyW6HTom4fH
 5w/fpaSgF6U0icPmzlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300014
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100646-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,gmail.com,google.com,linaro.org,linux.com];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ziyue.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5580F354B1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Historically, the Qualcomm PCIe controller node (Host bridge) described
all Root Port properties, such as PHY, PERST#, and WAKE#. But to provide
a more accurate hardware description and to support future multi-Root Port
controllers, these properties were moved to the Root Port node in the
devicetree bindings.

Commit 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake
GPIOs to PCIe port nodes and add port Nodes for all PCIe ports")
initiated this transition for the Hamoa platform by moving the PHY
property to the Root Port node in hamoa.dtsi. However, it only updated
some platform specific DTS files for PERST# and WAKE#, leaving others in
a "mixed" binding state.

While the PCIe controller driver supports both legacy and Root Port
bindings, It cannot correctly handle a mix of both. In these cases, the
driver parses the PHY from the Root Port node, but fails to find the
PERST# property (which it then assumes is not present, as it is optional).
Consequently, the controller probe succeeds, but PERST# remains
uncontrolled, preventing PCIe endpoints from functioning.

So, fix the incomplete migration by moving the PERST# and WAKE# properties
from the controller node to the Root Port node in all remaining Hamoa
platform DTS files.

Fixes: 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake GPIOs to PCIe port nodes and add port Nodes for all PCIe ports")
Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
---
 .../boot/dts/qcom/x1-asus-zenbook-a14.dtsi    | 16 ++++++++-----
 arch/arm64/boot/dts/qcom/x1-crd.dtsi          | 24 ++++++++++++-------
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi   | 14 ++++++-----
 .../boot/dts/qcom/x1-hp-omnibook-x14.dtsi     | 14 ++++++-----
 .../boot/dts/qcom/x1-microsoft-denali.dtsi    |  8 ++++---
 .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  6 ++---
 .../qcom/x1e80100-medion-sprchrgd-14-s1.dts   | 14 +++++------
 .../dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 14 ++++++-----
 8 files changed, 64 insertions(+), 46 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
index cd062f844b2d..66d566808f58 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
@@ -1079,9 +1079,6 @@ &mdss_dp3_phy {
 };
 
 &pcie4 {
-	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie4_default>;
 	pinctrl-names = "default";
 
@@ -1095,10 +1092,12 @@ &pcie4_phy {
 	status = "okay";
 };
 
-&pcie6a {
-	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+&pcie4_port0 {
+	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+};
 
+&pcie6a {
 	vddpe-3v3-supply = <&vreg_nvme>;
 
 	pinctrl-0 = <&pcie6a_default>;
@@ -1114,6 +1113,11 @@ &pcie6a_phy {
 	status = "okay";
 };
 
+&pcie6a_port0 {
+	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+};
+
 &pm8550_gpios {
 	rtmr0_default: rtmr0-reset-n-active-state {
 		pins = "gpio10";
diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 485dcd946757..a9c5c523575e 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1248,15 +1248,17 @@ &mdss_dp3_phy {
 };
 
 &pcie4 {
-	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie4_default>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie4_port0 {
+	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+};
+
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l3i_0p8>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
@@ -1265,9 +1267,6 @@ &pcie4_phy {
 };
 
 &pcie5 {
-	perst-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_wwan>;
 
 	pinctrl-0 = <&pcie5_default>;
@@ -1283,10 +1282,12 @@ &pcie5_phy {
 	status = "okay";
 };
 
-&pcie6a {
-	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+&pcie5_port0 {
+	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+};
 
+&pcie6a {
 	vddpe-3v3-supply = <&vreg_nvme>;
 
 	pinctrl-names = "default";
@@ -1302,6 +1303,11 @@ &pcie6a_phy {
 	status = "okay";
 };
 
+&pcie6a_port0 {
+	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+};
+
 &pm8550_gpios {
 	kypd_vol_up_n: kypd-vol-up-n-state {
 		pins = "gpio6";
diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index 343844cc62f2..0d9a324cc6cc 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -1081,9 +1081,6 @@ &mdss_dp3_phy {
 };
 
 &pcie4 {
-	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie4_default>;
 	pinctrl-names = "default";
 
@@ -1098,6 +1095,9 @@ &pcie4_phy {
 };
 
 &pcie4_port0 {
+	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -1115,9 +1115,6 @@ wifi@0 {
 };
 
 &pcie6a {
-	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_nvme>;
 
 	pinctrl-0 = <&pcie6a_default>;
@@ -1126,6 +1123,11 @@ &pcie6a {
 	status = "okay";
 };
 
+&pcie6a_port0 {
+	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+};
+
 &pcie6a_phy {
 	vdda-phy-supply = <&vreg_l1d_0p8>;
 	vdda-pll-supply = <&vreg_l2j_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
index 16437139d336..b773a4976d1b 100644
--- a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
@@ -1065,9 +1065,6 @@ &mdss_dp3_phy {
 };
 
 &pcie4 {
-	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie4_default>;
 	pinctrl-names = "default";
 
@@ -1082,6 +1079,9 @@ &pcie4_phy {
 };
 
 &pcie4_port0 {
+	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -1099,9 +1099,6 @@ wifi@0 {
 };
 
 &pcie6a {
-	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_nvme>;
 
 	pinctrl-0 = <&pcie6a_default>;
@@ -1110,6 +1107,11 @@ &pcie6a {
 	status = "okay";
 };
 
+&pcie6a_port0 {
+	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+};
+
 &pcie6a_phy {
 	vdda-phy-supply = <&vreg_l1d_0p8>;
 	vdda-pll-supply = <&vreg_l2j_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
index 6ab595b6ea30..dd2de1f723b0 100644
--- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -964,9 +964,6 @@ wifi@0 {
 };
 
 &pcie6a {
-	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_nvme>;
 
 	pinctrl-0 = <&pcie6a_default>;
@@ -982,6 +979,11 @@ &pcie6a_phy {
 	status = "okay";
 };
 
+&pcie6a_port0 {
+	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+};
+
 &pm8550_gpios {
 	rtmr0_default: rtmr0-reset-n-active-state {
 		pins = "gpio10";
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index bd0e3009fb41..beb1475d7fa0 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -1126,9 +1126,6 @@ &mdss_dp3_phy {
 };
 
 &pcie4 {
-	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie4_default>;
 	pinctrl-names = "default";
 
@@ -1143,6 +1140,9 @@ &pcie4_phy {
 };
 
 &pcie4_port0 {
+	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
index 763efb9e070d..23a298248a29 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
@@ -1033,9 +1033,6 @@ &mdss_dp3_phy {
 };
 
 &pcie4 {
-	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie4_default>;
 	pinctrl-names = "default";
 
@@ -1050,6 +1047,8 @@ &pcie4_phy {
 };
 
 &pcie4_port0 {
+	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -1067,10 +1066,6 @@ wifi@0 {
 };
 
 &pcie6a {
-	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
-
-	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_nvme>;
 
 	pinctrl-0 = <&pcie6a_default>;
@@ -1086,6 +1081,11 @@ &pcie6a_phy {
 	status = "okay";
 };
 
+&pcie6a_port0 {
+	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+};
+
 &pm8550_gpios {
 	rtmr0_default: rtmr0-reset-n-active-state {
 		pins = "gpio10";
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
index ab309d547ed5..500809772097 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
@@ -1131,9 +1131,6 @@ &mdss_dp3_phy {
 };
 
 &pcie4 {
-	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie4_default>;
 	pinctrl-names = "default";
 
@@ -1148,6 +1145,9 @@ &pcie4_phy {
 };
 
 &pcie4_port0 {
+	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -1165,9 +1165,6 @@ wifi@0 {
 };
 
 &pcie6a {
-	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_nvme>;
 
 	pinctrl-0 = <&pcie6a_default>;
@@ -1183,6 +1180,11 @@ &pcie6a_phy {
 	status = "okay";
 };
 
+&pcie6a_port0 {
+	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+};
+
 &pm8550_pwm {
 	status = "okay";
 };
-- 
2.43.0


