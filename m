Return-Path: <linux-arm-msm+bounces-58168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA04AB94BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 05:29:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D526F1BA8664
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 03:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7710425DAE0;
	Fri, 16 May 2025 03:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mWyrktOk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC6D25CC58;
	Fri, 16 May 2025 03:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747366092; cv=none; b=qtXSqbuflXSTtoJDqAx2ndUsNokrjDWCA4iec62JGGQNX7A3OIObU0zZdBJpj3jyMid2zvm3c8xgYHuiUOwI/gWBMCaNYwo3ttu0e3jeTHKhdxgqwQHxxzbC3OSE+Gk+bKg61VjJay6yDRQ/BnsbXey/bXQO9QpKJEprdplw6Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747366092; c=relaxed/simple;
	bh=WbclKrKNpH+XumO8udCZ+WnQuj7DovTwmfHCDYT4Vbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=SoSAiEu4A45Bkw02uq3ySL4povcE6hyDGOEr6oIFWObk/QWkHIxoDuUS/YSWwk3BphOAlX2vsmbARIFrrGO8+T8RtGQ4ui9I4s58umY0DaI9Aq3xYuPZ2zUZLmkTPyuX8dFAKq1ZDXEHzA1nQnhZjmqHpkX7yRp5EPJ4QP+r5eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mWyrktOk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFCjB024320;
	Fri, 16 May 2025 03:28:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2xgZgVXFHKNEqF2MV79SagmshPphfRqIpWisK7VReKk=; b=mWyrktOkY7xqov48
	SOgyQYggFjmAJgQujfYUbY3HSLQ/A8OozKDu9pUA9rwEax5KQvk7ucRw3s7bmu9t
	xNG+DZn+zMG7kRPYKkLsa/vpfeEzfbCHKn1FrwkYUj8O6ALjXuw/K2+9xplYvD/u
	OYZvN5syQHzYlH1fTlDcTqdG/QToP/wc0MPRFXaWJQKH5uAF6acpq0iYbPmc+Pi2
	IXdLgpl022jcq0sb/he+tvsChJN36eOShn7WUrx2Y10sUWy0gFfpKX8epVf/bbX4
	7rYcKNd//oBu8jtSnP53MTwtqKPK+j0M868NfIlKHe7DEGGV7aRhM9BWtVr+Znf3
	HNrqNg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcn0kwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 03:28:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54G3S5Ca019335
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 03:28:06 GMT
Received: from lijuang3-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 15 May 2025 20:27:59 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Fri, 16 May 2025 11:27:07 +0800
Subject: [PATCH v3 6/6] arm64: dts: qcom: qcs615-ride: enable remoteprocs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250516-add_qcs615_remoteproc_support-v3-6-ad12ceeafdd0@quicinc.com>
References: <20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com>
In-Reply-To: <20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Lijuan Gao <quic_lijuang@quicinc.com>,
        "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747366059; l=980;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=WbclKrKNpH+XumO8udCZ+WnQuj7DovTwmfHCDYT4Vbo=;
 b=C6B/hKz39+Z00u7JGfkomlnzf4sxE4nfViUaqYJQXCRecnJ6QFBZ8OuO5JOVQ21a2NRrCk/kg
 AVHv4XwfBllB+xr0ysfz146Dvku0Qf1t8S7UBT0189boILM+kQ1qVNi
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VbX_RiCtxAdk9hU11s_XdC-fKtv43rTM
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=6826b0c6 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=tk-iKo2JpmutBzwaR1gA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: VbX_RiCtxAdk9hU11s_XdC-fKtv43rTM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDAzMSBTYWx0ZWRfXz72LvI9zet5S
 bHzGFV92xW0y+rYFVdLCksfN5y4M1wIxCSkH46rqpuVJSRnJ3t4uPEogOTgwvHvZPO4YW5nP7/j
 APsglEXUIzuLG3YybAgGluBwRTrgsjDc6WQY5tJfaLQtiJqBTIyX/bRZhdSNHok/yzU439RigPY
 wNn4sqXY/eGiPZDupL2zp3oDqy4FP3UBx4kY2AFV9Z86bXle6o+cn0z1IJktp9tAr9D/B7fzjsx
 rKfmTX1Q7zT0PcSh+sNgLqk472kFbNQx1T9u0XAYotJGF50Vrl9fjvs5aK0LjIf4G6hOnjBj2yg
 JCTtXXxEOEJ30+a3Ua3qIpiVZ5oVb/1RumdODVyuJp3rFj3u1lgxU8eCw/Wrb6QDj06ijtz89AH
 erFlsMocCIGRIBrL7SnJvRAr8Gb9sok68Zw5zpD3tlKeFTr+hdOQw+GYNTUXNHbJeMrkVLtN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_01,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=637 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160031

Enable all remoteproc nodes on the qcs615-ride board and point to the
appropriate firmware files to allow proper functioning of the remote
processors.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 2b5aa3c66867676bda59ff82b902b6e4974126f8..a6652e4817d1c218c7981b04daeb035e2852ac1a 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -240,6 +240,18 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/qcs615/adsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/qcs615/cdsp.mbn";
+
+	status = "okay";
+};
+
 &rpmhcc {
 	clocks = <&xo_board_clk>;
 };

-- 
2.34.1


