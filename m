Return-Path: <linux-arm-msm+bounces-23033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B395B90D1EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 15:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FEA61F27631
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 13:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493AC1A4F3C;
	Tue, 18 Jun 2024 13:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="btVJjodj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF921A3BCD;
	Tue, 18 Jun 2024 13:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718716468; cv=none; b=c7S84UgxTPpz+H8slJIvEKb2W1Ue6n4lxkYaWmRFxRD3PKSo87XKJtxcaf1HzMqLVzshLJhlL10o5AGW1Mxlar8/Szw/nnxV8uIecAFkg63nkLCOrd3lm0pF39uA6Qk96NQeKcjPx8N18FA9xLaCd9cI6sGA0m4eAI9vPLK+rCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718716468; c=relaxed/simple;
	bh=M4xmosgTfz8zdoraDQ1gP4020ci+6plRwc2Mfcd9LEs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bz6vYEYlq4Tzc4ebtVvhUxDMo4EPYyKy12o8kJsKiOHHuIro/g8MG6GUcUemdIVwO9iQwBb06HZkgvOWoEfTJT848FIjjpgLiUSBGw1Ld3+c9w6se0fa3cR3ee5JzRZm3rQ62PL8itsJkkDOSyQiUbmAms9v+X2Ap1lwQ1Kw0L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=btVJjodj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45IBCp8q005307;
	Tue, 18 Jun 2024 13:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yP+Rkh8oIUkD3aQv9OQvTfDSvqES14aO9Uxg/NuzVR4=; b=btVJjodj/RWJ3Toe
	JPx5Ojr0zoCZREKret+bexdWxiZbvKCEOyXM4WXiLBAlrKJVbuBdBeg4Tt83tSnQ
	6GNbQw5Ujco0zjJPwywNE28aON8/jOzgk4sDPpY8fL8fnMMWvYok39dKGR+woVeX
	Tou2juUij/UVuh0Nycu+05/L8HhE+RHArCwXpBVFoLSIJwCsrz2HW3Krc05+RoLa
	8WIu1KnURMvMjTJWqcoxaACAcKH3A7XiNQ2ZrQADG2wjIXktZU/GUji91wQ2Zhzj
	ftXuuj5GIE9YoVrH1DHG1X579eXR1jwIRbpBygyUZvvZuW+ANX31qc0lhhPVlnsf
	RYNZWQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yu95rgbrx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 13:14:21 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45IDEKDg011833
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 13:14:20 GMT
Received: from hu-nainmeht-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Jun 2024 06:14:17 -0700
From: Naina Mehta <quic_nainmeht@quicinc.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_nainmeht@quicinc.com>
Subject: [PATCH v3 3/5] arm64: dts: qcom: sdx75: update reserved memory regions for mpss
Date: Tue, 18 Jun 2024 18:43:40 +0530
Message-ID: <20240618131342.103995-4-quic_nainmeht@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240618131342.103995-1-quic_nainmeht@quicinc.com>
References: <20240618131342.103995-1-quic_nainmeht@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0_vGxwMk5yObvCGvqjB8JO8FbZiNFA3Q
X-Proofpoint-ORIG-GUID: 0_vGxwMk5yObvCGvqjB8JO8FbZiNFA3Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 mlxlogscore=746 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180098

Rename qdss@88800000 memory region as qlink_logging memory region
and add qdss_mem memory region at address of 0x88500000.
Split mpss_dsmharq_mem region into 2 separate regions and
reduce the size of mpssadsp_mem region.

Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 9b93f6501d55..6f0abcc87a3b 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -366,7 +366,12 @@ uefi_log_mem: uefi-log@87f75000 {
 			no-map;
 		};
 
-		qdss_mem: qdss@88800000 {
+		qdss_mem: qdss@88500000 {
+			reg = <0x0 0x88500000 0x0 0x300000>;
+			no-map;
+		};
+
+		qlink_logging_mem: qlink-logging@88800000 {
 			reg = <0x0 0x88800000 0x0 0x300000>;
 			no-map;
 		};
@@ -377,8 +382,13 @@ audio_heap_mem: audio-heap@88b00000 {
 			no-map;
 		};
 
-		mpss_dsmharq_mem: mpss-dsmharq@88f00000 {
-			reg = <0x0 0x88f00000 0x0 0x5080000>;
+		mpss_dsm_mem_2: mpss-dsm-2@88f00000 {
+			reg = <0x0 0x88f00000 0x0 0x2500000>;
+			no-map;
+		};
+
+		mpss_dsm_mem: mpss-dsm@8b400000 {
+			reg = <0x0 0x8b400000 0x0 0x2b80000>;
 			no-map;
 		};
 
@@ -388,7 +398,7 @@ q6_mpss_dtb_mem: q6-mpss-dtb@8df80000 {
 		};
 
 		mpssadsp_mem: mpssadsp@8e000000 {
-			reg = <0x0 0x8e000000 0x0 0xf400000>;
+			reg = <0x0 0x8e000000 0x0 0xf100000>;
 			no-map;
 		};
 
-- 
2.34.1


