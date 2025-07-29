Return-Path: <linux-arm-msm+bounces-66953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C06B146A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 05:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE0FC16174C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 03:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A2921884A;
	Tue, 29 Jul 2025 03:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aOaBV+L8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AAF286A9;
	Tue, 29 Jul 2025 03:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753758802; cv=none; b=d7RbBRAmzk0HyLMov5YqNGbAvsUGipNm+kG8KuzBPLhpVCezA4bth1t/6hqphKzPt5RlxVFs15ZOLn/IoTLWHsqxsMBRC9Ksk/ghcgX9v7X4wg2GN+F29fOVOLE1WmTTnUSQ5p7evZQT0Xt/qwNpc6opOuNRVetvFCLRfFCn4pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753758802; c=relaxed/simple;
	bh=iJMJCFZc9HDo/baFqJSNhgJVvq2qX3JgMKKPxj8XRlA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CylNLLqjf1izDdOjptzX+bZF2KSlZuJE9h8HVkQQbXnrsYSse9r9AhZl+LpApmy3omoknMqrucyH1OODQ/yUJl3LZ5mUY7yLDxnoLl7zpGriOb8wxThqaHDxok5lDzQo9iMVzy01iF0FvTFtd7PczJh4a7jsARvFzhv27xyT1Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aOaBV+L8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SLrFkh006723;
	Tue, 29 Jul 2025 03:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UbAkIX7/pZTGIlDBMkI7Lk
	J039dLexJgFoVOnC4Gd5A=; b=aOaBV+L8MZISVf9z1ETI3K0m2ONrkrKrgYF/iE
	uzhHfFO1wVGjtlB74OSVHtbYjqJhZnPQO04otg0JM7O5ejEsC34541hc9Lr4GkQL
	t+HOiz5YLgSN6CjAbHd4gjP5/ht+rhSLBabVo4yXXjaDWHC6xZmwSbXfXGooCRsx
	nmsdzM2BnmpYBVMRcOpaygMu/wBQdl2ueUh/tHXOYEdtJcA8ymDtVHAoO5BxraFR
	ZetEtjIP+rNx5NwN5j8immYo7SZ61Xqg8seAoB0kukUwmRBcLqXailczXVDC7eVI
	1G7/NttRLkB5yla2nvqWj5LD/7Wuz+QlR+waBpmSlH8EbIwA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nytxt33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Jul 2025 03:13:18 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56T3DHAl025579
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Jul 2025 03:13:17 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 28 Jul 2025 20:13:14 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ling Xu <quic_lxu5@quicinc.com>
Subject: [PATCH v3] arm64: dts: qcom: sm6150: Add ADSP and CDSP fastrpc nodes
Date: Tue, 29 Jul 2025 08:42:59 +0530
Message-ID: <20250729031259.4190916-1-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fyLGjDUOt0W-3g-XAsCUJiEbfP9fzHQS
X-Proofpoint-ORIG-GUID: fyLGjDUOt0W-3g-XAsCUJiEbfP9fzHQS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDAyMSBTYWx0ZWRfXyMnFMz7jnFw+
 nfftZpKMFSF323YSuriKNPguW1ghlb+xHX3Hdfjn93QmKVbXNuVGLOpMI/b5+UBj9TXAwk9KEvp
 chynVCeCHvk1jsjYuXsuyS4LgCzS7xiW/xzZz2euu8ZcnMIxYLRjlOHzT1CG6u2l8rtMaAxja4V
 zL6Bqp++KAekg1s2Mf0bTqvubp1DCkUDRpZE3rhEAeqUODL23W3y62/apAJGf8ix0flOUrBiTiv
 FYsM4niYtRuPFB22w7+ZKvULtYEbwjLGieR7Mnv9gCFXuYJOrlp30cMydMygeeOnnB55LwlgSVp
 r9Bg+E3T8ScbsY5ZfM44LZ5j/8EQ2fw4zYkzvQRYXHh6Coc11k8TzXKd+zF6lpbPd6H9h+lolav
 Eakg7lBa3mLsLIxi5djfE5c++xTmKS0q/akxm7UAXL2rpkJN68/vATHHpC3wKmIZM+0lBOkp
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=68883c4e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=YnpQG1V86MJULNi4tNkA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_05,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=565 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290021

Add ADSP and CDSP fastrpc nodes for SM6150 platform.

Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
V2 -> v3:
  - Add nsessions.
patch [v2]: https://lore.kernel.org/linux-arm-msm/20250703055532.2199477-1-quic_lxu5@quicinc.com/
v1 -> v2:
  - resend patch.
Patch [v1]: https://lore.kernel.org/linux-arm-msm/20250523103853.1538813-1-quic_lxu5@quicinc.com/
---
 arch/arm64/boot/dts/qcom/sm6150.dtsi | 87 ++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
index e033b53f0f0f..b01a7511b71a 100644
--- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
@@ -3172,6 +3172,56 @@ glink-edge {
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
 
@@ -3844,6 +3894,43 @@ glink_edge: glink-edge {
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
+						qcom,nsessions = <5>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 	};
-- 
2.34.1


