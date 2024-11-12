Return-Path: <linux-arm-msm+bounces-37556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 846D49C4FF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 08:52:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4439E284D18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 07:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FED420A5F7;
	Tue, 12 Nov 2024 07:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UkAlTon8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F04B1A707D;
	Tue, 12 Nov 2024 07:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731397809; cv=none; b=LiXXgIxZxAbM+grcRly5qAq3twAxEVYimczyDdyuEvfByJInVKI7C6KRtWCM2NaYos70Wwy5V+oNZmvOk20e4EG5uzymW3ij1EeGTC8BrEejZpyK21J7bKPwtmgFHDabydRoKoQtsgtl5FnMPFFq9pgL1ACQPoBBpntTzmfgIcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731397809; c=relaxed/simple;
	bh=hguJKXKfkn+RuhgXWLO9Ls0nvSLVVgJ6qw8gcAVi4VI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YfvLLPCNFmz+uD+a1pMi6lAh70dMx4CCqOjQovbAzEDkSZT91lWN01n90j99E5B61uuALHLJqwmnpo2CTkoYP+G/WmHi2eVA/MESHfr1+IqXmjj0nOqEcs+v3jMygs4FA1+Q7owQ+8adOVOeyTxUoHzpuERuL02OJJt+Y4oY3jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UkAlTon8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC33pta029346;
	Tue, 12 Nov 2024 07:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lzZY4QvJpBx46ng64uGRXj
	WGVcNQZLrk9uwzNWI1jC0=; b=UkAlTon8J7wTQw+4hLkTr6S9CbVIZ70VEeBjAL
	OjPm2qN8c41KnMTQPi9s3tyBGSlVXA8whQFmAYKV6I5OFC6H2IiKzLefCLVa0RTv
	XOxMW2Lp+j1VowfAZeFjwMXCfDiI0cB3jDrG96i+8e0MQUir3BrjsH2XTwSxaIXO
	NYovFtmDct6IXTtj1a7iv3xQmjgiFmPa+C+XhMdjWZ4juhM7l8SPZWak1yAaIhYS
	wiWXslgLyT5LB0y3u0rtD0muL3gOnOWU+v0w01q6slMnic09eTcoXWasCY3ERTQ6
	8j5losgn2/0Uz1S4dpPhiI4p4cZ54QeDkzeWEDjUEU5I/xsw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sxr5xhvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 07:50:03 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AC7o230021614
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 07:50:02 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 11 Nov 2024 23:49:56 -0800
From: Ling Xu <quic_lxu5@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <quic_kuiw@quicinc.com>, <quic_ekangupt@quicinc.com>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ling Xu
	<quic_lxu5@quicinc.com>
Subject: [PATCH] arm64: qcom: qcs8300: Add ADSP and CDSP0 fastrpc nodes
Date: Tue, 12 Nov 2024 13:19:45 +0530
Message-ID: <20241112074945.2615209-1-quic_lxu5@quicinc.com>
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
X-Proofpoint-ORIG-GUID: eaBECjwlkFFe-LzjAKnj2anXPurraeb7
X-Proofpoint-GUID: eaBECjwlkFFe-LzjAKnj2anXPurraeb7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 mlxlogscore=681 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411120063

Add ADSP and CDSP0 fastrpc nodes for QCS8300 platform.

Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
This patch depends on patch https://lore.kernel.org/all/20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com/#t
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 85 +++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 2c35f96c3f28..af3e9ae2bc48 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -762,6 +762,35 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
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
+						iommus = <&apps_smmu 0x2003 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x2004 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x2005 0x0>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 
@@ -1361,6 +1390,62 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
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
+						iommus = <&apps_smmu 0x19c1 0x0440>,
+							 <&apps_smmu 0x1dc1 0x0440>,
+							 <&apps_smmu 0x1961 0x0400>,
+							 <&apps_smmu 0x1d61 0x0400>,
+							 <&apps_smmu 0x1981 0x0440>,
+							 <&apps_smmu 0x1d81 0x0440>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x19c2 0x0440>,
+							 <&apps_smmu 0x1dc2 0x0440>,
+							 <&apps_smmu 0x1962 0x0400>,
+							 <&apps_smmu 0x1d62 0x0400>,
+							 <&apps_smmu 0x1982 0x0440>,
+							 <&apps_smmu 0x1d82 0x0440>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x19c3 0x0440>,
+							 <&apps_smmu 0x1dc3 0x0440>,
+							 <&apps_smmu 0x1963 0x0400>,
+							 <&apps_smmu 0x1d63 0x0400>,
+							 <&apps_smmu 0x1983 0x0440>,
+							 <&apps_smmu 0x1d83 0x0440>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x19c4 0x0440>,
+							 <&apps_smmu 0x1dc4 0x0440>,
+							 <&apps_smmu 0x1964 0x0400>,
+							 <&apps_smmu 0x1d64 0x0400>,
+							 <&apps_smmu 0x1984 0x0440>,
+							 <&apps_smmu 0x1d84 0x0440>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 	};
-- 
2.34.1


