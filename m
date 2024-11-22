Return-Path: <linux-arm-msm+bounces-38736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8319D57F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 03:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A74B11F21C9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 02:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4AB154454;
	Fri, 22 Nov 2024 02:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AmMq5SVF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752BF2AE84;
	Fri, 22 Nov 2024 02:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732241003; cv=none; b=XAo2EAyrvt+VtARNeV+88Jv37XHouHxgzKpfoZGrD+X06HsB39lNnO5g0rlwGPKaSi5UVZktMdT8hw5WBn95toNNgr+cjTMF8+lqwd2PNMicOTm1PtNXq2FF4JyODJ3KkcAoxIU195rGwfyIDS14qxibtnbrTQpvlPoAUOFUL/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732241003; c=relaxed/simple;
	bh=12tt6sQ/sNIXlSfWJUTjSx0VcFjQAIIwLwc7a7dQV7w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cBJFa5GEbcBW2E46L4+vsgWhmCIuUwG+ZInuOVYB0/obyA29eScgSt2WgcjzcXj2XWakSVoEFoka7jVJGVzv3UIj9kiCP4Y2L29hrhdv3XMRTspGF84bJBLXkATgGLLp9lH+MurOEoPw+K9UiyVSGZDPuAG1NNli/cSeC+UAPcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AmMq5SVF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALMMi1H003971;
	Fri, 22 Nov 2024 02:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BQ1OD+cYYs3
	yLMO7DnL1KKffAZLTMobDq5A7RSe6d54=; b=AmMq5SVFM0FUQXtOwSDGSCdx+B2
	eUcWLzpo1KbrD7xDchNGSNBy6I4LWK3B65zvCVS42JU4lSYQJb75US69DQ+XV6b6
	DWd3rTcMaJtHMHqQM29bUGhlLYVDecEbQ3EFe7yK3Y4CT02zeWA150t5yHa9Is4c
	taNXYSGVMWudxCbrCJh/CAXz/Efr1vINzwxZVmTJhnV7iAdkUEbqf81pgQD05ZOQ
	D9H3KLEeiZ5DfO/jE2LJyq+HqzZkCXJjj6S4xlYJBZnF87uoMnsoeAm9hjLY1dPK
	zy2svtM+H8tArkUfn0r81ZE0emK5opHZiiBxCmZCXGPXE07jdvG63GRXyRg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ce3duxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 02:03:13 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM23Bba017956;
	Fri, 22 Nov 2024 02:03:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 42xmfkuev1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 02:03:11 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AM23Bq0017945;
	Fri, 22 Nov 2024 02:03:11 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4AM23Ael017937
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 02:03:11 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 4438065)
	id D636317FD; Fri, 22 Nov 2024 10:03:08 +0800 (CST)
From: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        manivannan.sadhasivam@linaro.org, bhelgaas@google.com, kw@linux.com,
        lpieralisi@kernel.org, quic_qianyu@quicinc.com, conor+dt@kernel.org,
        neil.armstrong@linaro.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: quic_tsoni@quicinc.com, quic_shashim@quicinc.com,
        quic_kaushalk@quicinc.com, quic_tdas@quicinc.com,
        quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com, kernel@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>,
        Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Subject: [PATCH v2 6/6] arm64: dts: qcom: qcs615: enable pcie for qcs615 platform dts
Date: Fri, 22 Nov 2024 10:03:05 +0800
Message-Id: <20241122020305.1584577-7-quic_ziyuzhan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122020305.1584577-1-quic_ziyuzhan@quicinc.com>
References: <20241122020305.1584577-1-quic_ziyuzhan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: K0ybVl3TNM6_SOxkG_nZSc3V6ZEUzlES
X-Proofpoint-ORIG-GUID: K0ybVl3TNM6_SOxkG_nZSc3V6ZEUzlES
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=971
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411220015

From: Krishna chaitanya chundru <quic_krichai@quicinc.com>

Add platform configurations in devicetree for PCIe, board related
gpios, PMIC regulators, etc.

Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 42 ++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index ee6cab3924a6..18f131ae9e07 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -202,6 +202,23 @@ &gcc {
 		 <&sleep_clk>;
 };
 
+&pcie {
+	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-0 = <&pcie_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -210,6 +227,31 @@ &rpmhcc {
 	clocks = <&xo_board_clk>;
 };
 
+&tlmm {
+	pcie_default_state: pcie-default-state {
+		clkreq-pins {
+			pins = "gpio90";
+			function = "pcie_clk_req";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio101";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		wake-pins {
+			pins = "gpio100";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
-- 
2.34.1


