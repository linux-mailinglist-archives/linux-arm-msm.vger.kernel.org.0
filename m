Return-Path: <linux-arm-msm+bounces-2859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D22C800781
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 10:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2A7E281AB6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 09:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9634D1E524;
	Fri,  1 Dec 2023 09:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VPJ2Fu4Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 219ACE6;
	Fri,  1 Dec 2023 01:50:45 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B19VLlW024036;
	Fri, 1 Dec 2023 09:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=0XpIwtT1OoUo3GQJU24TdpwDyWTq1C+Ah5lfk+OxrXM=;
 b=VPJ2Fu4Qf1LY5B6vy4CHiWYP+nkUFciBq3+/tPAu3bhJ7vj47UW9erckZuXM2KqrQSFH
 VHYax+adgAW8VE+j56xffLe95lk9/MP8GWXmRBj3f5fqfo2UtRCGdk1i5PeWyXZ6vKO/
 E+1ZnfUh8WwMJpplCcHzC815qp7F6HzjSClij6hnWvhRK0Md9K1dJS3DS2kqm8GphMLC
 /ZgoYmBmNqJ1FlHlOLsY0vt6zZ7rDhTz6+pkuYM/ASvRa1ruNAwrNe4mzHoqp9QZ5aKI
 WiyujRKZzDzWI7oTvvqQE0GMI99uDrOChN2OSK7luYnmpD7R0D/fTYlRSbpfNVgd+WvT 7A== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uq6dkrtqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 09:50:40 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B19odqD006034
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Dec 2023 09:50:39 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 1 Dec 2023 01:50:35 -0800
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Fri, 1 Dec 2023 15:20:24 +0530
Subject: [PATCH v3 1/4] dt-bindings: clock: Update the videocc resets for
 sm8150
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231201-videocc-8150-v3-1-56bec3a5e443@quicinc.com>
References: <20231201-videocc-8150-v3-0-56bec3a5e443@quicinc.com>
In-Reply-To: <20231201-videocc-8150-v3-0-56bec3a5e443@quicinc.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Marek <jonathan@marek.ca>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ztzdamBvwDe9bNMiL_rThMKe36H3EeC_
X-Proofpoint-GUID: ztzdamBvwDe9bNMiL_rThMKe36H3EeC_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_07,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=576 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010065

Add all the available resets for the video clock controller
on sm8150.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/dt-bindings/clock/qcom,videocc-sm8150.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,videocc-sm8150.h b/include/dt-bindings/clock/qcom,videocc-sm8150.h
index e24ee840cfdb..c557b78dc572 100644
--- a/include/dt-bindings/clock/qcom,videocc-sm8150.h
+++ b/include/dt-bindings/clock/qcom,videocc-sm8150.h
@@ -16,6 +16,10 @@
 
 /* VIDEO_CC Resets */
 #define VIDEO_CC_MVSC_CORE_CLK_BCR	0
+#define VIDEO_CC_INTERFACE_BCR		1
+#define VIDEO_CC_MVS0_BCR		2
+#define VIDEO_CC_MVS1_BCR		3
+#define VIDEO_CC_MVSC_BCR		4
 
 /* VIDEO_CC GDSCRs */
 #define VENUS_GDSC			0

-- 
2.25.1


