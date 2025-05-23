Return-Path: <linux-arm-msm+bounces-59203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8789CAC213C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 12:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C620F1B668F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 10:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF42227E8A;
	Fri, 23 May 2025 10:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R6TfRK7f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C0E189919;
	Fri, 23 May 2025 10:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747996752; cv=none; b=ZiKNb90fVzj1ILTUQMRPKTuey/K74BMNPtqESBL+iG4dYlfBKRkHDOdLquFPojE6ErFW3nOmnOiSYTrbVKDc+ZIwF8VGVPbTj7yBZ8xqLb9k3Mx+4RvdeGN+SKY6hWkgMqSZFhsrZBGTSPnq4IE06zuryLvxONWiaTWvv5DlSvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747996752; c=relaxed/simple;
	bh=CA3TurYKXRnd3iP9JL7yXya5EYqNlsyugfobdqf3J1M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZtzbmDLZbRaRLkBnXZxw7kaxgm6JB1ttAt+fNCSKR3fdZz0iioae1794RHHUvVY77mZxb6YBvHha6PtE72MfvseNRU6BMEzO4cDUtXAwfQgMPJsSujFxj7eRQp/k5OZMV1K4gnamX3ZeO8wMCdPmxdv7bJRyIaBmv6UATUBvuqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=R6TfRK7f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N36ESq029063;
	Fri, 23 May 2025 10:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Zfz4mfHCpDf1Ep+sozPVoe
	sRYCt6pv+iWYw8Cgtgxj4=; b=R6TfRK7fFK7JnaK30KvGNiIjIKOCReMigbC75K
	F9r5vTfQ6HWHKLtDhKcF4bOStmn9YsPG2M98Ot1mfOZgJVlYXUOBRn/MYZvjchHF
	eR0ob+B3j0FZ6mqdi7cx5AjJzJa42BJGuQtL/MO1bDP87qT8typZlfC3UPz2VnXU
	ar1LuEHet5tszqXYL+KuYBF83/xewayOkKydoUOt7pCIMmqzLjazqn4OvPQmEjF7
	eDaHsO6Liqz6dJSwLXS7fLf6n21VDvnNO+znXQf4FrSa3EK0ivft6BwqkmoXwqMO
	Eadl5iC9Z+/ASKoYuMJ1zTF2cXrkRmpuOnCcAqpcDo85GEew==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf49sn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 10:39:07 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54NAd7O4029992
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 10:39:07 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 23 May 2025 03:39:04 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <quic_lxu5@quicinc.com>, <andersson@kernel.org>, <konradybcio@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ekansh.gupta@oss.qualcomm.com>
Subject: [PATCH] arm64: qcom: qcs615: Add ADSP and CDSP fastrpc nodes
Date: Fri, 23 May 2025 16:08:53 +0530
Message-ID: <20250523103853.1538813-1-quic_lxu5@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA5NSBTYWx0ZWRfX1B1brJMPWzhy
 +kfwAer/ddGnFrsQYD5IymZi5RIpdvoB1GKvjMpZ5jT2ltx7fJKQVKojn7R1NU7mQl7TSRJtd7k
 zOI7yIEf4UZZ+hTOf80pjSSjCFKEcRX8ubYLJyhpSXQcxJpFI9f9jL5E3cl0FbOWjNdxht1yXNO
 HjohLJNcHwt3nsYWYRPYubOauNZxtp4qc6fWccfXLdGVbgUK5zXAv1WDk/F18dGOm7iPTCD4bn7
 E+PvCOjl1VWgV4MElWq6OjiCoUw1A+eCOEehdH21z8TB8rvYvkOH1vXaYZfKcvR/lql5mGhL4XE
 nfDtMJanKLavMKKQ1eh7QXglhYZJP7LzaMcPWUEsjkCwTgY7N3uEJ5T91nTCxQ/eoTzfbBeU0Ia
 NJ6YJSeY7ejrAAKvJ5Oz7wS+KRdJ+2jy+eb/+U1aqQOhYg3iNqkGWNPr8xcx2pr0Y3o5/Pbn
X-Proofpoint-GUID: TowYo1oIwHFJVhvewZkeZJNu2GDLYjjO
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=6830504b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=frwCySuoJdczAoKQEpUA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: TowYo1oIwHFJVhvewZkeZJNu2GDLYjjO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=607 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230095

Add ADSP and CDSP fastrpc nodes for QCS615 platform.

Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
This patch depends on patch https://lore.kernel.org/linux-arm-msm/20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com/
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 86 ++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index b7d649822a35..3bece0e7e796 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -3162,6 +3162,56 @@ glink-edge {
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
 
@@ -3835,6 +3885,42 @@ glink_edge: glink-edge {
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


