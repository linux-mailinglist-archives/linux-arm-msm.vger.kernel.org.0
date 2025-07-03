Return-Path: <linux-arm-msm+bounces-63478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB48CAF69F6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 07:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 167834E2388
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 05:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1197291C10;
	Thu,  3 Jul 2025 05:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G6wxXthv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098D3225D6;
	Thu,  3 Jul 2025 05:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751522158; cv=none; b=Dpma8PGhfeji+Xp6bnBhiohM+Zun1TjwEBjVriWYwlZuDpYroSt5Sp6QlNQbraLXkG8TenHNkoczPycFqmFakuOsqtcXN4gNY5nXBfK84/y8pY/vKGs7yGMAECJExrlmIyycpfTznKfDMpxedmwbMBKlD/uK68InJ7bpFXZOiNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751522158; c=relaxed/simple;
	bh=S38JpONH6W8dZbBwYv5WWAtVirhkEf8Ih0JiRwpo9MA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eBZlSG3zo6SFUqirtq5AF/HEtL8KpqohTy6Y8dkcDVqQxprUD45g7VoNZp+Kz9WfilnILKRGvdPJpgCSMhtUZVtCEOgC4o8Dw+o2YW9glF0bkseYrXXQwONMGMhyA5OhlYugaC3bDDLoWo5xyxRtacWdkpUDBub2RF4UmRb2coo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G6wxXthv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562MwDSt030091;
	Thu, 3 Jul 2025 05:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JeY9R6QXpHeFJS6EQcb6j6
	0aqIhPOXjzXLqFIeCf1yc=; b=G6wxXthvfUMfWt28bmVTMQUHuSy+I1nKnYcLZ7
	Ju9IpjhuEbJdrboJyJNrFOADpA6Dy16BDJHTS7aB5Ynprh1T73Rne+M2xkVu0SBt
	wFgezrInEzZf5hkhiEnaUg8Ha5Jnmpn3JaOL60LovWsl47i6OoX6glaVNWxrC2m7
	097z7I9q3d0xr3a8CO2SILNXDBYNz2islH0m/53IGh4LOX62gK0C0A9eSezHqHmW
	T9LqNM7t1SkeAnUnLFghYgPo20fPGvgOYc4dYNU3MRcXpJm2u6LUqqYL8MGNmQsZ
	+ArFCXi9M6Mi9mphBxOc03ZDn3d98YhmRDkQ1iCjadM8vH7A==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn5utq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 05:55:53 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5635tqge029568
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Jul 2025 05:55:52 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 2 Jul 2025 22:55:49 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ling Xu <quic_lxu5@quicinc.com>
Subject: [PATCH v2] arm64: dts: qcom: qcs615: Add ADSP and CDSP fastrpc nodes
Date: Thu, 3 Jul 2025 11:25:32 +0530
Message-ID: <20250703055532.2199477-1-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA0NSBTYWx0ZWRfXzkoFuccDgLZ6
 T4UrjvcylpyT//h8LsLDJmJLRaJZGPxRWAbrIbvGxZwMfUr4iK4bryXMHOupZS2MgSlAOu5L7hd
 WMoXb4JfJeLBwVs04Ci9OQMS3yABl2OlPe1VV9/tTygsWLqX0BW/5yqm0LAoVbEE3Zq39q9yRvv
 WLU168d3hc9g46Rt5+j9TETDele0plWkaOpH4if8iYX1jDr35vCFbcNSoJUHHxql//SqUcJsKSA
 O1xjDyJiaKP0W+jxLlLUiBmgryF0F0Uz1XvEloRevaf78Xp5VzQhXT14reY7IAWv/VxI6wR/olv
 XQA/HSYUo7dFY19f8CTPy6PNK+JoRNs5pvo7vU2Tp62MIz/EagJqju6EfXMNe9khDBrLojWXPye
 nb013yEG91LsGW0Qyx3z3dbdbMzQ9f5HddaiK9j32xoMtATJzqA43k2iXwIpcKyg0Le9Hvw/
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=68661b69 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=XD3BUoiH-jNJIxuL50sA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 4ccLEQl74UUtp4TTnUuV5pXkaCFRwYV4
X-Proofpoint-GUID: 4ccLEQl74UUtp4TTnUuV5pXkaCFRwYV4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_01,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=566 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030045

Add ADSP and CDSP fastrpc nodes for QCS615 platform.

Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
v1 -> v2:
  - resend patch.
Patch [v1]: https://lore.kernel.org/linux-arm-msm/20250523103853.1538813-1-quic_lxu5@quicinc.com/
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 86 ++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index bfbb21035492..58e07c9c08c1 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -3166,6 +3166,56 @@ glink-edge {
 				mboxes = <&apss_shared 4>;
 				label = "cdsp";
 				qcom,remote-pid = <5>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x1081 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x1082 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x1083 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x1084 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x1085 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x1086 0x0>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 
@@ -3838,6 +3888,42 @@ glink_edge: glink-edge {
 				mboxes = <&apss_shared 24>;
 				label = "lpass";
 				qcom,remote-pid = <2>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x1723 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x1724 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x1725 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x1726 0x0>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 	};
-- 
2.34.1


