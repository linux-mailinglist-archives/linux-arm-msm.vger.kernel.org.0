Return-Path: <linux-arm-msm+bounces-21958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3A28FEFDE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 17:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C01E1F226D6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 15:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5051B29D2;
	Thu,  6 Jun 2024 14:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R2kcB2/e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D4719EEA5;
	Thu,  6 Jun 2024 14:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717684836; cv=none; b=NnDc0TtGPMApgbNpUmhtzKhNuSzKA/0c7RS0nwTgCZDqVAseIRAAsYQVRFpTgPJsSa/go6TV4qeFa1SK43tlGG0COR5TEu+Lr5nZZ0ukjlWdUQRE6Tt+Yy/SgdnuIpV+0XQwlajsQf5qAU3wYKb4ZcY8XPUDUUt4ecoD+Ep8T6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717684836; c=relaxed/simple;
	bh=YWMIwKvc7/j4kF8T7szEVtXoh1FH6L5bFnZ+Hm9S6Mc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mhe1CSC9UclGzsY5Yptk0Zevesa8N6sHjxSwaU/GMqs5HO3IYgYheMlFjC/LuFKwHVDZeMGVTYBPETD7UdiyZCiO23nBgquKkPfLu/IxuDq6aVMXi1B2iDDgpFcurIvRHhn1i+vG2I/XdQxQgY8gxsunDfy6xBW0DKdF4m45Y/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=R2kcB2/e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 456AMtVO019470;
	Thu, 6 Jun 2024 14:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DN+n1jW3RFfLMT8pryUrqVTW
	Qv7lfaCodyhv7x1Ejog=; b=R2kcB2/eWpNdrzop1jgNz7ZJEhjiUamEtlXo7FfJ
	iepGHmoOGvJN76YYWcIk30R3CH2aPYAoaUyP5fFKJAStPAhE58gdvnqTmHnGfEhD
	pi7IgSZo3D9py8fN/wHP1NNO48TRUD2cSKehJbhnO8/xsacJxE9HKr4eSF0ksEhH
	Ly7/uHLInRkzhSzy7ZjAUu/MlRrdtI3hQP0iNpgDJjqjpowiHkJ3clgXivUUZGq5
	DpCL2vCnK+ZV5pKaWXnAaIJs/jjulUOBT7Nn4p69Qq9Nqx2JRERsg2MfUkFAnt2x
	5HSX+577DwtewpQTr2dOsHcEkvuI5YANxSDex5pZHr6TRg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjan2mvfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 14:40:32 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 456EeVuj004012
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Jun 2024 14:40:31 GMT
Received: from hyd-e160-a01-3-01.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Jun 2024 07:40:28 -0700
From: Naina Mehta <quic_nainmeht@quicinc.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_nainmeht@quicinc.com>
Subject: [PATCH 3/5] arm64: dts: qcom: sdx75: add missing qlink_logging reserved memory for mpss
Date: Thu, 6 Jun 2024 20:08:56 +0530
Message-ID: <20240606143858.4026-4-quic_nainmeht@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240606143858.4026-1-quic_nainmeht@quicinc.com>
References: <20240606143858.4026-1-quic_nainmeht@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: smwD3TqyqYL3tc1YcZiYGPIGwu732wdd
X-Proofpoint-ORIG-GUID: smwD3TqyqYL3tc1YcZiYGPIGwu732wdd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_01,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=946 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406060106

The qlink_logging memory region is also used by the modem firmware,
add it to reserved memory regions.
Also split MPSS DSM region into 2 separate regions.

Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 9b93f6501d55..9349b1c4e196 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -366,7 +366,12 @@
 			no-map;
 		};
 
-		qdss_mem: qdss@88800000 {
+		qdss_mem: qdss@88500000 {
+			reg = <0x0 0x88500000 0x0 0x300000>;
+			no-map;
+		};
+
+		qlink_logging_mem: qlink_logging@88800000 {
 			reg = <0x0 0x88800000 0x0 0x300000>;
 			no-map;
 		};
@@ -377,18 +382,22 @@
 			no-map;
 		};
 
-		mpss_dsmharq_mem: mpss-dsmharq@88f00000 {
-			reg = <0x0 0x88f00000 0x0 0x5080000>;
+		mpss_dsm_mem_2: mpss-dsmharq-2@88f00000 {
+			reg = <0x0 0x88f00000 0x0 0x2500000>;
 			no-map;
 		};
 
+		mpss_dsm_mem: mpss-dsmharq@8b400000 {
+			reg = <0x0 0x8b400000 0x0 0x2b80000>;
+		};
+
 		q6_mpss_dtb_mem: q6-mpss-dtb@8df80000 {
 			reg = <0x0 0x8df80000 0x0 0x80000>;
 			no-map;
 		};
 
 		mpssadsp_mem: mpssadsp@8e000000 {
-			reg = <0x0 0x8e000000 0x0 0xf400000>;
+			reg = <0x0 0x8e000000 0x0 0xf100000>;
 			no-map;
 		};
 
-- 
2.17.1


