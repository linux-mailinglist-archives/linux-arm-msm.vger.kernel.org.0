Return-Path: <linux-arm-msm+bounces-56233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD496AA4911
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 12:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EF773A49D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 10:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BCD725B1D8;
	Wed, 30 Apr 2025 10:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MjGZlgax"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8615825B1DD;
	Wed, 30 Apr 2025 10:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009568; cv=none; b=rBTnbU424g4+5bD7CzDF5C6XQuM+iGsyKsx8lrb3paesk04xverPHU5SK7y4YolXsVE5x2vGcJox7KAf8NX/dGS9skjR6vJ0ZmyewiC+/OZNlohIb/tK/q65p60AapmP5tu9OiMaw2+t6dfOVMg+r3wXEDwdGboCE85yNQjZw1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009568; c=relaxed/simple;
	bh=PGb+U+eJQ/RIrJF6T002OHVTNHflptYtN/UR7z43UHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=uagXKjE8L3RyMVtMRUZyb6xBj/cikvXznQRQjx5pfHCl/l+41eSbD9F1tZvB9QUbc1+bYWb6zgcA2HMFqPJ0SfxuUtv0QD4rC/wF72ow0kgHGfTzFf74gfrXBzLGvz39iy349r+A13AqzFHlUdLPcM725nZuM7LTbOBwNP2Koms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MjGZlgax; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9QARc031269;
	Wed, 30 Apr 2025 10:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WxL1phANRBIGWXGo36/SH8PY/I9BmOo93tRM0Moo3Ow=; b=MjGZlgax5kesRzjt
	Sk9WUOyjaLNxPmIIMDfS/n17ow929rF226j4d/rgvdxBojItLfe3GUa0m2CJVZwW
	jVnocYpXxFh/a8tprWRL5ArzO62UOHuL+SyXI0LOoXgYKZFIf50u+WnlTOWFNc6g
	F3IPWBx5Kq2i/HnvQ8z9cq5Wp53JEtGgzlX2hrMGzXqFVFmdVkMhJo0ANkWvMrTY
	KdAkxYPLjL1IH/BvN85AayyUYSsR4hCZqA6PUXmwlaUBvbHh0Sq676xiQEt8eWZg
	lsDHIk1b8hy624KTPydusTIBcejxtFJdMiVU8tlS4RkI8knYDw45fz8oXd+8sGUr
	aeFf4w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u7st09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 10:39:23 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53UAdLD0009811
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 10:39:21 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Apr 2025 03:39:16 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Wed, 30 Apr 2025 16:08:55 +0530
Subject: [PATCH v2 1/4] dt-bindings: clock: qcom: Add missing bindings on
 gcc-sc8180x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250430-sc8180x-camcc-support-v2-1-6bbb514f467c@quicinc.com>
References: <20250430-sc8180x-camcc-support-v2-0-6bbb514f467c@quicinc.com>
In-Reply-To: <20250430-sc8180x-camcc-support-v2-0-6bbb514f467c@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <stable@vger.kernel.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Ldc86ifi c=1 sm=1 tr=0 ts=6811fddb cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=lUUcdF5SPxt6UHNlAwwA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: fGPP-X7OW5Dth1Gv9nFepqs3epDYqCs9
X-Proofpoint-ORIG-GUID: fGPP-X7OW5Dth1Gv9nFepqs3epDYqCs9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA3NSBTYWx0ZWRfX1HV9R7THWtf+ 08kWkvgtuDg08qwf0vtP6S7q2VaTVT1m31/Jdr2QXLs6eJ0rFujCv9TrTqT93TStcFUppAOfrLX HeLsWdtMxv37SMu4lZj6fItnQE2Qqqye0x/b4X7JSW2maJKo9phE5dYSKYzmCZg5IHBwWVGhTD+
 mOX/2eMtdVyMlX801P7KEERD+4EByXONHx+TC0oIOWKLWFugxNEAXFiN8tdMf+7qrv/7TTSZUbJ BX9neRxSE8yf36VuIXh+BKVA4/CRBoqeOUSXRdGrclbEXowscMO9/AIxvnzKqBTgijJQKxntjhw hVtmeFChxjDo0b4UlLHcaZsb7eef7XpYVeC+zhmODB747Y583DbC2JBqE1UgrAAKKT4crfTpuBX
 YNGyTXwqZz51uqpAG02sbJMjPzV1XoguplsPo0otWsTdPnzS+HG3zpSJ4oc/j/xHAzw15nZR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 mlxlogscore=772 malwarescore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300075

Add all the missing clock bindings for gcc-sc8180x.

Fixes: 0fadcdfdcf57 ("dt-bindings: clock: Add SC8180x GCC binding")
Cc: stable@vger.kernel.org
Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 include/dt-bindings/clock/qcom,gcc-sc8180x.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-sc8180x.h b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
index e364006aa6eab8c1c9f8029a67087d09a73cee51..bff83d8edb5e4abaef496a75387abafb152b1480 100644
--- a/include/dt-bindings/clock/qcom,gcc-sc8180x.h
+++ b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
@@ -249,6 +249,18 @@
 #define GCC_UFS_MEM_CLKREF_EN					239
 #define GCC_UFS_CARD_CLKREF_EN					240
 #define GPLL9							241
+#define GCC_CAMERA_AHB_CLK					242
+#define GCC_CAMERA_XO_CLK					243
+#define GCC_CPUSS_DVM_BUS_CLK					244
+#define GCC_CPUSS_GNOC_CLK					245
+#define GCC_DISP_AHB_CLK					246
+#define GCC_DISP_XO_CLK						247
+#define GCC_GPU_CFG_AHB_CLK					248
+#define GCC_GPU_IREF_CLK					249
+#define GCC_NPU_CFG_AHB_CLK					250
+#define GCC_VIDEO_AHB_CLK					251
+#define GCC_VIDEO_XO_CLK					252
+#define GCC_AGGRE_UFS_CARD_2_AXI_CLK				253
 
 #define GCC_EMAC_BCR						0
 #define GCC_GPU_BCR						1

-- 
2.25.1


