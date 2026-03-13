Return-Path: <linux-arm-msm+bounces-97389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKd5FOvds2ktcQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:50:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B3D280CD5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:50:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FBC83190790
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0A1F30596D;
	Fri, 13 Mar 2026 09:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U9lBrXw1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD8F28A72F;
	Fri, 13 Mar 2026 09:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773395198; cv=none; b=uYzoxYYV2g/cx/rMgfQFMUTUkaX9AXg63uNJY0oDkbCUOmWKE5VVYqXhIhR1mvBJZqsBQTiI9T+kC+gP0ifTDB4DY1jclZkhb1dwAmqwtqdZ65lJ6MEHa9IKL5ymuntJi8RY6tbPfRS75zkClQ7Vs2hSMUc62YSfFTa2vFpxiIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773395198; c=relaxed/simple;
	bh=P/QjLX60ftxYsCuuU+q2T4Kg1OJAh8y8YMt8vy2ssV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c3mzEH2OZMO/fzFnofCcSKhxneM5TJ1URv1OuGCukvlC2SNGTIIYmocFeRRyd9ggjIuFkEOefQebdelFJn9vtmRU4Bx4stvfp/iD9C7vpuvmhK2Fq9Ohvl+ZEBjt6mnX0R0KLo7syJat2ipxTHocvE9135/YyIu18+fc/gcGkv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U9lBrXw1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tnim3230183;
	Fri, 13 Mar 2026 09:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oXOC0knKrYpytnso+z1bkS
	+uAEzCzxbDUi4HE2ycxjo=; b=U9lBrXw1O6AWHhkYaVrcJyXK4TVWLYvIkKYcu+
	3lET7pnn7BK+sQtRIKfbb4RxfnD70JNdGQ/G4+bfRz4appUIvnN9O7fTy+wVoT9+
	kUYYh320GPFbM2hr3BfLsflCGgwUq96FM+TKv9bwBU5MIS2l9BvosMrecmQ+DjqN
	cjfHs+57//V0OUeMG8QdIY2qQ2o4edoA/apA3+cW2vYFnrWQCcX2kFPFROYdKB/4
	Kz2eyJCIkK68CriBIjwEmwBJ4mR9QcqzjXAXN1wZX0d4/egTA+whfI3dO/sdxix4
	UQ/Sev4f6DX3UaADmI63NBz6KfpCEA6ImaKYxg8BuHlsyUAg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7hkn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 09:46:26 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 62D9kNRC029626;
	Fri, 13 Mar 2026 09:46:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4crd3n3n4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 09:46:23 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62D9kN5l029617;
	Fri, 13 Mar 2026 09:46:23 GMT
Received: from cse-cd02-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 62D9kMH5029612
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 09:46:23 +0000
Received: by cse-cd02-lnx.qualcomm.com (Postfix, from userid 4438065)
	id 6BD7D417EE; Fri, 13 Mar 2026 17:46:21 +0800 (CST)
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
Subject: [PATCH v1 1/1] arm64: dts: qcom: hamoa: Move PCIe PERST and Wake GPIOs to port nodes
Date: Fri, 13 Mar 2026 17:46:18 +0800
Message-ID: <20260313094618.1361418-1-ziyue.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: m43B4lBDarmsTYFtZYHSDwibNSqJcUj0
X-Proofpoint-GUID: m43B4lBDarmsTYFtZYHSDwibNSqJcUj0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA3NSBTYWx0ZWRfX1s2ReGDwmYfC
 DrpfUfrPlvAPkbPLYBrnUizu7fPt7Ft9rEswrzFJYbX3ki3oGg6cP8FSy/O+treqmoBYf8wVVLT
 uwH3LD1toRz8HiOUie3gWI4IpyXV6j6o32xWagV4UA+MNRbAPnyioCZxopgAviYUiyaRmF44Tdo
 JQoGccrOZ0vrslslheM5F7PMpTM/eMFnv+6dpeaM8z+ljkHlzQRttM3YQr16y64cFvIRrnw/H8B
 30PJM/u6NWqpcULI4tRLw6MTOY1UY8Pp249bnnXcd+0ZLlTBvC6cBq1w+9BT3jN5Nq0m8wKiZAY
 Y58mKfoRMs67ZuyI6rG1mgV9ucVGXiu4hs4nLBljMAXaCY9H0y8SyodftTHu7W4f5zE+KguWSic
 MUZNXXvqmCTnNYSlScBYnkjpjd/TTBy2nWrK1Qgz0seAEfWNOpRX1/d7Siy4GDBbBTd33FP8IE2
 b9ajqUIXF3F6uCqmzEA==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b3dcf2 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=8Yf5sxLigYUWTy5zZX0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130075
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,gmail.com,google.com,linaro.org,linux.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97389-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ziyue.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A8B3D280CD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake
GPIOs to PCIe port nodes and add port Nodes for all PCIe ports") did not
convert all Hamoa‑based platforms to the new method of defining PERST and
Wake GPIOs in the PCIe root port nodes.

Without the change PCIe probe will fail. The probe failure happens because
the PHY stays in the controller node while the PERST/Wake GPIOs were moved
to the port nodes.

This fixes probe failures seen on the following platforms:
 - x1-hp-omnibook-x14
 - x1-microsoft-denali
 - x1e80100-lenovo-yoga-slim7x
 - x1e80100-medion-sprchrgd-14-s1
 - x1p42100-lenovo-thinkbook-16
 - x1-asus-zenbook-a14
 - x1-crd
 - x1-dell-thena

Fixes: 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake GPIOs to PCIe port nodes and add port Nodes for all PCIe ports")
Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
---
 .../boot/dts/qcom/x1-asus-zenbook-a14.dtsi    | 16 ++++++++-----
 arch/arm64/boot/dts/qcom/x1-crd.dtsi          | 24 ++++++++++++-------
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi   | 14 ++++++-----
 .../boot/dts/qcom/x1-hp-omnibook-x14.dtsi     | 14 ++++++-----
 .../boot/dts/qcom/x1-microsoft-denali.dtsi    |  8 ++++---
 .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  6 ++---
 .../qcom/x1e80100-medion-sprchrgd-14-s1.dts   | 15 ++++++------
 .../dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 14 ++++++-----
 8 files changed, 65 insertions(+), 46 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
index 8e5c5575a532..0a382cc9e643 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
@@ -1032,9 +1032,6 @@ &mdss_dp3_phy {
 };
 
 &pcie4 {
-	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie4_default>;
 	pinctrl-names = "default";
 
@@ -1048,10 +1045,12 @@ &pcie4_phy {
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
@@ -1067,6 +1066,11 @@ &pcie6a_phy {
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
index ded96fb43489..2fbf9ec66fb8 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1216,15 +1216,17 @@ &mdss_dp3_phy {
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
@@ -1233,9 +1235,6 @@ &pcie4_phy {
 };
 
 &pcie5 {
-	perst-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_wwan>;
 
 	pinctrl-0 = <&pcie5_default>;
@@ -1251,10 +1250,12 @@ &pcie5_phy {
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
@@ -1270,6 +1271,11 @@ &pcie6a_phy {
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
index bf04a12b16bc..217ca8c7d81d 100644
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
index a4075434162a..41063948c583 100644
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
index d77be02848b5..ba6b7b5a9191 100644
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
index d6472e5a3f9f..d7938d349205 100644
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
index 20a33e6f27ee..3af7f19224ad 100644
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
@@ -1086,6 +1081,12 @@ &pcie6a_phy {
 	status = "okay";
 };
 
+&pcie6a_port0 {
+	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+};
+
+
 &pm8550_gpios {
 	rtmr0_default: rtmr0-reset-n-active-state {
 		pins = "gpio10";
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
index 1e5eb8c5dc98..06747b54a38e 100644
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


