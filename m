Return-Path: <linux-arm-msm+bounces-57289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E55C9AB0046
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 18:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D12E9E34EC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 16:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26AF5283FFA;
	Thu,  8 May 2025 16:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XA9LS8kA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830E8283FE6;
	Thu,  8 May 2025 16:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746721213; cv=none; b=g0x2eC87CBzzG2G4DLMxEtGoLJ/1CTCoo40TwZE707bdxoNv57/FQr4wTRcKZKJq10zwPDbF+GB+P6s9QX2lALxJmNjr1YbfHlDgFO19KYsd/P5QUB1PQdbUaNmGjhmwuNae7pW+M8UUJbSQ9h3PDHCicv5m9D2zmWVlI+PSO68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746721213; c=relaxed/simple;
	bh=F7usVzQ0Inta3JlAjy+ox8aqluRqb7vk6q7e3z8Z3jI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=eY4m71wG9uPYTwZiAJrh7EWutL/8AIeEAX5oWTeEnPFoMnPIDX2un82P7QWyKiIDJeDCQv7EExwGGPKkiO8IaLI69AA9AGAnyIMiThqACGzSdC2zpDwi8Sube9fucqt1ic63rMKHhgILc2bMSzhsxRpqZ+dxIniSJp86u8RwPNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XA9LS8kA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548DDj0k002235;
	Thu, 8 May 2025 16:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cJNGRAA5W0d9okVSXO4BPgs6c4elS/ruoJbGIngO90I=; b=XA9LS8kARNNvzapp
	VVG8JGHsb2NtbFdjnMYl08GgIbU+J7oJG2bVnysY6wDi5cbiBpE8sySlWVMTEw1F
	bLyKK8ChrqtLwPP08WKu41XmhGcU8Ta5B7yGxwJOuRb0IsjiFTBE47NYt04HTWwi
	YNbxNI94YY3MjRElJ+Oxa1UjJKU2/rINuL25EILTZ9RLqMbDkaooRDkvlBduloB0
	G/yEgyyZ1JiOx/c67J+MsJ7gqe4uSkdwX7VdulapG7glM+hLFmezf45c9KcwMO8b
	UFq5NCS/7RQK84vLQhLM411FySAXc+Z/Pp7dEQ22iqC3xASbtshNyOxGj0Dpp6HZ
	aM52pg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp59wnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 16:19:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 548GJwgM021217
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 May 2025 16:19:58 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 May 2025
 09:19:52 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Thu, 8 May 2025 21:49:21 +0530
Subject: [PATCH v3 3/3] arm64: dts: qcom: qcs8300-ride: Enable Adreno 623
 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250508-a623-gpu-support-v3-3-3cb31799d44e@quicinc.com>
References: <20250508-a623-gpu-support-v3-0-3cb31799d44e@quicinc.com>
In-Reply-To: <20250508-a623-gpu-support-v3-0-3cb31799d44e@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Jie Zhang <quic_jiezh@quicinc.com>,
        "Akhil P
 Oommen" <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746721173; l=851;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=SLqrWslc9+dGwuPw0tM3Mj79iVa07v05e8RMDZ8vSlg=;
 b=KAcidV0oCftdY49tt7KB6TeSJARX2wauMgDogFSD83Nx19GWcENH6X2mchS5iP4RdsRw93V+5
 WPJ/BvYkV+3AHHxFfm4WOl8lT3DWz/wy20cl1NI01UK+dVc0Rekvoao
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=XL0wSRhE c=1 sm=1 tr=0 ts=681cd9af cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=ZzVv045XBorpIeM7bZwA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: RlCNI5dDwh-olYYbo1PSuf4do98OZAj3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE0MiBTYWx0ZWRfX8wUKRJrXObvL
 wDmCQWG2UC0ethBHE6A7vybDruhVNckWp8dCJVo8WnnqUFxPeaj3CBk8ObCUy23pDs2+BF/GVxu
 3Yan6mJzLd8Y9UR/uybk3qL4o5ms83xWa70CR5YfodvvfiRQMlxOUsfBJhEGDlfY84Y5O3W1tAE
 RTRYWkAyvi/1k4L9DtWTuN/LjVB+ERiL27O+Dpc0A8tWHx2BZd0Didt9CAAwOS4b8wck6RAAmPE
 WCNl276cMrgvAHdcy2MZyQ5bL6mYdZmqoRg/fDq3VOZ9Oq7ImBkr+4QgMSvVD23QttMnvKO9ftK
 ATp3NeqlEZWZW1i1P/z+kvV6/rT6kRQgnu0LegVfoyjFcQLv0Wtyx4jYLRkjK5l0xpI0D38O7FU
 4E6BHVSoAjBJDUTI3qYfYsEewKYjtUCCC9nx8JMQJHk0ohKAQhhg1XwUIGbohIGsAHRAMY1n
X-Proofpoint-ORIG-GUID: RlCNI5dDwh-olYYbo1PSuf4do98OZAj3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=902 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080142

From: Jie Zhang <quic_jiezh@quicinc.com>

Enable GPU for qcs8300-ride platform and provide path for zap
shader.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index b5c9f89b34356bbf8387643e8702a2a5f50b332f..5f6c6a1f59655bee62ca9ab09c4ee60c1b826a66 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -285,6 +285,14 @@ queue3 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcs8300/a623_zap.mbn";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.48.1


