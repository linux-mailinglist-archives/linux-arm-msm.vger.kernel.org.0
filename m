Return-Path: <linux-arm-msm+bounces-55096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F6DA98539
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 11:19:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 381A5179E46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 09:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1747262FCE;
	Wed, 23 Apr 2025 09:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XCfcdLGF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4C8244689;
	Wed, 23 Apr 2025 09:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745399903; cv=none; b=SqnELtlIa+04zoqRwsYf2CJirukj/Kj5Xu9ledvsMi0j/FPbdJPWjJ3PbYDl7UptvtCti3KIkRGO6vCUYffxvqe6vCXikbWo0xThsS0WZgHcaOmTka/oRMQjnJgoMIvfTjBLBko+x4vnuB+vZUlm+1xR0b7vv5P1Sbht8Pm3O80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745399903; c=relaxed/simple;
	bh=4PH12LZ8KnPrQ9HfLWt1Je39m7Rk2x3d4YOW+9HoPWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qQ17i7LWs4YEOxQpiyNWCK4ykypiGncuUj07gak1nca4QfaCq4L61sXsrwjmIS1cSgV6NW8kUYrMEap6pjbqiU/h4H/FS+6nXdSUbcMT+chwufVwKt7CR5j973/jE9lZAkLaXKtLWPs2CpJcFKsEee5UhSWgTRgFG1qJMxZVuro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XCfcdLGF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iH76011951;
	Wed, 23 Apr 2025 09:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eSxrZfltw030riy7VA48Jp4LP8T0RfLdcv1du42cXJc=; b=XCfcdLGFfOxnn1bM
	mmYzNMzHYZI7CUFEJbkPy5kyAIx5or14DDDVkD0YLu7SZyq1kpei8uhYhfCOxmIt
	JipJbD7wOxGwK28uN6PAXLOvt7+CZJyqTOWJRg1M1tA3Khnid0UrzUQ0DatZ1ILK
	2bEcIbYqvmnbdOMjvbgavoQy0uL0Tw6egj/3I++fnGH/o3nde2Svl7eS8qXJVopt
	B7XkMUAfLlJPyJIVwQzq3fsLY7Wr28bzLYCnh4w7vN2gaJyq323YX53Z9iaHf+yl
	Qbhj82yoxGmjf1136EEGPhCudJpt+WFVk06R94oF59MxOCZ5kgPkFETNaFXysRkX
	tlRMkg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1hkj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 09:18:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N9IIrC021384
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 09:18:18 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Apr 2025 02:18:11 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Wed, 23 Apr 2025 17:17:40 +0800
Subject: [PATCH 4/6] arm64: dts: qcom: qcs615: Add IMEM and PIL info region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250423-add_qcs615_remoteproc_support-v1-4-a94fe8799f14@quicinc.com>
References: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
In-Reply-To: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
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
        <linux-kernel@vger.kernel.org>, Lijuan Gao <quic_lijuang@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745399876; l=1115;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=4PH12LZ8KnPrQ9HfLWt1Je39m7Rk2x3d4YOW+9HoPWg=;
 b=w4Zr5hc/Yw02qqLKrJeknfFZDGIKtgQpONgOFcwsbfmb5nhlxNxL0aC/bB8W9/qZ2Nfub+kPj
 xTkw6/gEO3tAkWxenIlXpCvcgGHxFcGaZSA7FbNmGeAcGxtp0uQodd/
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QAwga5TwC-kR173RyltQWgiic16O3h9X
X-Proofpoint-ORIG-GUID: QAwga5TwC-kR173RyltQWgiic16O3h9X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA2MyBTYWx0ZWRfX415Usv6jV38R UXqse5nUe1sNgyvjIeMSQbmyvgvwYUaemiAFhFKS3ggC00sXdn4d/QoCNowWPv/gxE/TwmOC3Hx 0CaHq0rfEp0XqYx8BXyV0YgN10ZjNRCs8UYEfB2Msb2chWc+fMeB2Cx6wKu03mwvBqqSqFpgypM
 5LNnHf5bH3L/TUD0i+FZ/8vfWKhoY/91bejMZVuKDkzfiCPqQDDHgUTV2Wh9n5ApkDFQRFflHy1 B+6VsxePqlZEcxral0C5qC0JCa/xt44Mjl+g14OlRbr3oSlZAJAmSaHa1GJhigE6hxWnyAbkBo8 YkdVX/BQkfNysNOWpGmfSE+g67V/vyiANsPE5yKaLi3lX7Ap9kKrNts9Ur+EFJkuhIrYgpyRCN4
 DIjOYzRWhsoEJZiVJsVEphpxusdl8RkJicFMnNOLEI/mEXR0KT6CAaSYr4O8Tr7FCJOIjeM2
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=6808b05a cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=z94EKvC_FZ4CR_5xBlQA:9 a=toRrsMVtB3VFFdKA:21
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_06,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=601 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230063

Add a simple-mfd representing IMEM on QCS615 and define the PIL
relocation info region, so that post mortem tools will be able
to locate the loaded remoteprocs.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index ab3c6ba5842b..fe9fda6b71c4 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -3297,6 +3297,20 @@ sram@c3f0000 {
 			reg = <0x0 0x0c3f0000 0x0 0x400>;
 		};
 
+		sram@146aa000 {
+			compatible = "qcom,qcs615-imem", "syscon", "simple-mfd";
+			reg = <0x0 0x146aa000 0x0 0x1000>;
+			ranges = <0 0 0x146aa000 0x1000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			pil-reloc@94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x94c 0xc8>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,qcs615-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0x0 0x15000000 0x0 0x80000>;

-- 
2.46.0


