Return-Path: <linux-arm-msm+bounces-65180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C010B070F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 10:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 675E83AFAD9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 08:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE882EF9BA;
	Wed, 16 Jul 2025 08:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EhgAfZRR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC6D2EF657;
	Wed, 16 Jul 2025 08:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752655923; cv=none; b=ay5BDtHzbzWG01jWi+GZWj1lLcRaYt7Jmh828fbkaTN/Rfm0W6gEmzRzoABdXEFVAh/psXUUFXnl8ssZ4Mps25etxWsHwjBOlKvAePwfqi8fr4xUCxOkouWlb/VNHxV6MoPO22zvHOgHMCkR3JnnEFyM04RDD7eRIIq36MODa9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752655923; c=relaxed/simple;
	bh=ba3xsj1JR3uFQUlvWu1s2ut631oLcsVyu+jMgQ1S/Lc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d4bCQNv6nPHtW+FwYLkU1A9i5P8n3Zv1sYzROZI0dwv+5p0dLMCyGNoRM26q6QNb+31od6ey6g/wXHPhOTxu8p/Sceg+nxOqmOXv6WSrbmXLKrW6ifZKt30BVyecpLGzpBYbz17OlFy0Dk0/dKXqIb7p0QfO8WI4SboNRdHRJ8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EhgAfZRR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G63FEf003267;
	Wed, 16 Jul 2025 08:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=l7zH9aHo2OyEeykd42T8XtnZ
	JrdxgBFY+gGnZRd9f0g=; b=EhgAfZRRXGGPormE1j1jJqh34OwPuFLtLNnCPLuh
	3/YRxjAN8Vi0DlpO9liJO3P/0sXNRb3MguCFjZTcswP98CQWE3EKfooYBpeyEggq
	1rCiDMQz0ZZUEOL9Z1T8LASo5bqGYSCbGF5+CbKccpkg9z/BWwznLMyzAmWIgSAC
	5OM/L2CB2t8Y+MwlRz0Bn4oloPR3n7isk1kEGtBJsfxLpxAjkoTvnO+D6RMhfBTl
	LW617ItISXiFQwIjXs8v+sz3ucTZ3gsoDVblIyVNLugaXwY9UBBZWWJjVPqda1lf
	WZd7w6LAs1N9dQk8+ch8bdGLrCFoQ6bUsAuC1XgO1EgmOw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drp4na-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 08:51:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56G8pqV2005751
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 08:51:52 GMT
Received: from hu-sayalil-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 16 Jul 2025 01:51:49 -0700
From: Sayali Lokhande <quic_sayalil@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>
Subject: [PATCH V4 2/2] arm64: dts: qcom: qcs8300-ride: Enable SDHC1 node
Date: Wed, 16 Jul 2025 14:21:25 +0530
Message-ID: <20250716085125.27169-3-quic_sayalil@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250716085125.27169-1-quic_sayalil@quicinc.com>
References: <20250716085125.27169-1-quic_sayalil@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uu1G1_LjOtlH4Jfn7OFIOCOOvId6Q9TY
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=68776829 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=_IW4Oi3bjg1409mID4wA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: uu1G1_LjOtlH4Jfn7OFIOCOOvId6Q9TY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA3OSBTYWx0ZWRfX3PUBfn5QH/cA
 mGIybfBa4uZC+siUIzz6urL8sx3zeSr3E/T5sYbJRiWiNWr95sfikYgns8Rs4myXyzzSeWVZ/je
 6YNY1XFYoZx23KtEV2kWL/USWIwX8gUpQskspOgjbN0VSwUahTsXQMVOJn9u/FI6ekCjfpvXeVL
 tWPujLoxKPaeC+rzEr8t4AQOuF30CxD8ZNIjYNyAgp7yQXiYxDP3dUy7KyXPyquWtpY84J8IEF4
 5D12Dr/u93ACUTeyB8XYjypHC7bBReU64q+b2/1VpgKaXNOfS7cIM8A2O3Qi0Ffi+MZyw3Mxq+y
 bqCcpO2rwC1X7qeXLkmuk6hkxvO8E+cd0cNwVZQJocVqzvkFFAAjJkVwYJVAv1B4HQuiExmbXt9
 Ij+svbTGjdXePh/M/Q9yJYFoVnk3itgXMkUabpF0VHvMnFQGrCapWsYVQg58Kz21piou+Sv/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=761 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160079

Enable sdhc1 support for qcs8300 ride platform.

Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 8c166ead912c..9c37a0f5ba25 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -17,6 +17,7 @@
 
 	aliases {
 		serial0 = &uart7;
+		mmc0 = &sdhc_1;
 	};
 
 	chosen {
@@ -332,6 +333,26 @@
 	status = "okay";
 };
 
+&sdhc_1 {
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+	pinctrl-names = "default", "sleep";
+
+	bus-width = <8>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	vmmc-supply = <&vreg_l8a>;
+	vqmmc-supply = <&vreg_s4a>;
+
+	non-removable;
+	no-sd;
+	no-sdio;
+
+	status = "okay";
+};
+
 &tlmm {
 	ethernet0_default: ethernet0-default-state {
 		ethernet0_mdc: ethernet0-mdc-pins {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


