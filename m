Return-Path: <linux-arm-msm+bounces-28931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A639B9562B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 06:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2E94B2096C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 04:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B77012C52E;
	Mon, 19 Aug 2024 04:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OBrN5FTr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C345B1870;
	Mon, 19 Aug 2024 04:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724043074; cv=none; b=H4plmhgxPZxdzErbdj681DkARLQDUSKN4S5Ryqyru333uH+T79Mm1FZKC8mHHWuddveaZyYk5pUzjfDVyPV6mYP+tlvENOkz00/bsNy0h8NB3coQN7H3dSNAcLI6OjmKUg8TwZNp6F6Fb+diwDDMxI3TElEyS0fIYjGCyrIYS1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724043074; c=relaxed/simple;
	bh=66NmTOIU8LcloZQQD8SDEpR34B91KNwzzyB6zdiPhy8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bdUFWglfJaSZlM+SNSx0ChixnGHUPVreS/N/Tw3gwMU32VDZT+pB49vPutDpFZWzq5lpVN8i5NbBnAdURVqRKUJGhfi3xWUS9QqNGrSQIpLuFK9us/RbJCqpI1DKFtX6sZX1pPlZJPjfXed0UQYW3yshJ5ALfMR1mJ3wOkyJNMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OBrN5FTr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47IMtRGq031358;
	Mon, 19 Aug 2024 04:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3nkdJ08YDy/IDF1meDYgDa
	xzC3n3Yv65W8W9nvVsZLc=; b=OBrN5FTriJ2IUPLHDvfyzjgAf+PcBl7qF4Tzmp
	lxuLqw9K/d9tK2XZfyZjU5SZN9ireoSuf0Cy52ZWu01zKtsqQxOZBv0F8XR+FL9e
	CwgUdGkaQqsAEUy9zPo2WehrMHdDNcFhAroKcOZVz2NOCbRhzcO1cqrvmJ30XBW2
	UX2Il83h8GMoQA6BVpWgmKTGUV/uHwi5U7dbHwYlfd/+pkkaQhYp+BhzL9zMRG/g
	9LJ/uqdJQLfu+JhYIuRqg842XlmeChJIJZ1qOwLAOMNAAgjXwPjtdudDkSJFhpVZ
	/SD0gZYSksKcy4znW3y+MxwBS4gdnAyndhrB+/yInZTXYsVQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412hjdb4qs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 04:51:07 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47J4p6SD005135
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 04:51:06 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 18 Aug 2024 21:51:04 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <quic_kuiw@quicinc.com>, <quic_ekangupt@quicinc.com>,
        <quic_lxu5@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: qcom: sa8775p: Add ADSP and CDSP0 fastrpc nodes
Date: Mon, 19 Aug 2024 10:20:52 +0530
Message-ID: <20240819045052.2405511-1-quic_lxu5@quicinc.com>
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
X-Proofpoint-GUID: A64k5YvjaPyhkQmARS36KD-CLLJ1iAJP
X-Proofpoint-ORIG-GUID: A64k5YvjaPyhkQmARS36KD-CLLJ1iAJP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_02,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=784 adultscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408190034

Add ADSP and CDSP0 fastrpc nodes.

Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 218 ++++++++++++++++++++++++++
 1 file changed, 218 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 801e8a92359d..51e30cab5db1 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
 #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
@@ -3998,6 +3999,190 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
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
+						iommus = <&apps_smmu 0x2141 0x04a0>,
+							 <&apps_smmu 0x2161 0x04a0>,
+							 <&apps_smmu 0x2181 0x0400>,
+							 <&apps_smmu 0x21c1 0x04a0>,
+							 <&apps_smmu 0x21e1 0x04a0>,
+							 <&apps_smmu 0x2541 0x04a0>,
+							 <&apps_smmu 0x2561 0x04a0>,
+							 <&apps_smmu 0x2581 0x0400>,
+							 <&apps_smmu 0x25c1 0x04a0>,
+							 <&apps_smmu 0x25e1 0x04a0>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x2142 0x04a0>,
+							 <&apps_smmu 0x2162 0x04a0>,
+							 <&apps_smmu 0x2182 0x0400>,
+							 <&apps_smmu 0x21c2 0x04a0>,
+							 <&apps_smmu 0x21e2 0x04a0>,
+							 <&apps_smmu 0x2542 0x04a0>,
+							 <&apps_smmu 0x2562 0x04a0>,
+							 <&apps_smmu 0x2582 0x0400>,
+							 <&apps_smmu 0x25c2 0x04a0>,
+							 <&apps_smmu 0x25e2 0x04a0>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x2143 0x04a0>,
+							 <&apps_smmu 0x2163 0x04a0>,
+							 <&apps_smmu 0x2183 0x0400>,
+							 <&apps_smmu 0x21c3 0x04a0>,
+							 <&apps_smmu 0x21e3 0x04a0>,
+							 <&apps_smmu 0x2543 0x04a0>,
+							 <&apps_smmu 0x2563 0x04a0>,
+							 <&apps_smmu 0x2583 0x0400>,
+							 <&apps_smmu 0x25c3 0x04a0>,
+							 <&apps_smmu 0x25e3 0x04a0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x2144 0x04a0>,
+							 <&apps_smmu 0x2164 0x04a0>,
+							 <&apps_smmu 0x2184 0x0400>,
+							 <&apps_smmu 0x21c4 0x04a0>,
+							 <&apps_smmu 0x21e4 0x04a0>,
+							 <&apps_smmu 0x2544 0x04a0>,
+							 <&apps_smmu 0x2564 0x04a0>,
+							 <&apps_smmu 0x2584 0x0400>,
+							 <&apps_smmu 0x25c4 0x04a0>,
+							 <&apps_smmu 0x25e4 0x04a0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x2145 0x04a0>,
+							 <&apps_smmu 0x2165 0x04a0>,
+							 <&apps_smmu 0x2185 0x0400>,
+							 <&apps_smmu 0x21c5 0x04a0>,
+							 <&apps_smmu 0x21e5 0x04a0>,
+							 <&apps_smmu 0x2545 0x04a0>,
+							 <&apps_smmu 0x2565 0x04a0>,
+							 <&apps_smmu 0x2585 0x0400>,
+							 <&apps_smmu 0x25c5 0x04a0>,
+							 <&apps_smmu 0x25e5 0x04a0>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x2146 0x04a0>,
+							 <&apps_smmu 0x2166 0x04a0>,
+							 <&apps_smmu 0x2186 0x0400>,
+							 <&apps_smmu 0x21c6 0x04a0>,
+							 <&apps_smmu 0x21e6 0x04a0>,
+							 <&apps_smmu 0x2546 0x04a0>,
+							 <&apps_smmu 0x2566 0x04a0>,
+							 <&apps_smmu 0x2586 0x0400>,
+							 <&apps_smmu 0x25c6 0x04a0>,
+							 <&apps_smmu 0x25e6 0x04a0>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x2147 0x04a0>,
+							 <&apps_smmu 0x2167 0x04a0>,
+							 <&apps_smmu 0x2187 0x0400>,
+							 <&apps_smmu 0x21c7 0x04a0>,
+							 <&apps_smmu 0x21e7 0x04a0>,
+							 <&apps_smmu 0x2547 0x04a0>,
+							 <&apps_smmu 0x2567 0x04a0>,
+							 <&apps_smmu 0x2587 0x0400>,
+							 <&apps_smmu 0x25c7 0x04a0>,
+							 <&apps_smmu 0x25e7 0x04a0>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x2148 0x04a0>,
+							 <&apps_smmu 0x2168 0x04a0>,
+							 <&apps_smmu 0x2188 0x0400>,
+							 <&apps_smmu 0x21c8 0x04a0>,
+							 <&apps_smmu 0x21e8 0x04a0>,
+							 <&apps_smmu 0x2548 0x04a0>,
+							 <&apps_smmu 0x2568 0x04a0>,
+							 <&apps_smmu 0x2588 0x0400>,
+							 <&apps_smmu 0x25c8 0x04a0>,
+							 <&apps_smmu 0x25e8 0x04a0>;
+						dma-coherent;
+					};
+
+					compute-cb@9 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <9>;
+						iommus = <&apps_smmu 0x2149 0x04a0>,
+							 <&apps_smmu 0x2169 0x04a0>,
+							 <&apps_smmu 0x2189 0x0400>,
+							 <&apps_smmu 0x21c9 0x04a0>,
+							 <&apps_smmu 0x21e9 0x04a0>,
+							 <&apps_smmu 0x2549 0x04a0>,
+							 <&apps_smmu 0x2569 0x04a0>,
+							 <&apps_smmu 0x2589 0x0400>,
+							 <&apps_smmu 0x25c9 0x04a0>,
+							 <&apps_smmu 0x25e9 0x04a0>;
+						dma-coherent;
+					};
+
+					compute-cb@10 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <10>;
+						iommus = <&apps_smmu 0x214a 0x04a0>,
+							 <&apps_smmu 0x216a 0x04a0>,
+							 <&apps_smmu 0x218a 0x0400>,
+							 <&apps_smmu 0x21ca 0x04a0>,
+							 <&apps_smmu 0x21ea 0x04a0>,
+							 <&apps_smmu 0x254a 0x04a0>,
+							 <&apps_smmu 0x256a 0x04a0>,
+							 <&apps_smmu 0x258a 0x0400>,
+							 <&apps_smmu 0x25ca 0x04a0>,
+							 <&apps_smmu 0x25ea 0x04a0>;
+						dma-coherent;
+					};
+
+					compute-cb@11 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <11>;
+						iommus = <&apps_smmu 0x214b 0x04a0>,
+							 <&apps_smmu 0x216b 0x04a0>,
+							 <&apps_smmu 0x218b 0x0400>,
+							 <&apps_smmu 0x21cb 0x04a0>,
+							 <&apps_smmu 0x21eb 0x04a0>,
+							 <&apps_smmu 0x254b 0x04a0>,
+							 <&apps_smmu 0x256b 0x04a0>,
+							 <&apps_smmu 0x258b 0x0400>,
+							 <&apps_smmu 0x25cb 0x04a0>,
+							 <&apps_smmu 0x25eb 0x04a0>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 
@@ -4300,6 +4485,39 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "lpass";
 				qcom,remote-pid = <2>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+							  QCOM_SCM_VMID_ADSP_HEAP>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x3003 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x3004 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x3005 0x0>;
+						qcom,nsessions = <5>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 	};
-- 
2.34.1


