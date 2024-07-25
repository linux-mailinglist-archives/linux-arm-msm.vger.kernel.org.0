Return-Path: <linux-arm-msm+bounces-27012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2E293BD0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 09:23:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96E061C21139
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 07:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF82316F827;
	Thu, 25 Jul 2024 07:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EpQR96/G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301382773C;
	Thu, 25 Jul 2024 07:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721892218; cv=none; b=gZEaEkhfhi3s4TsTgUnR6dJl6wY5UV3dMv2eXz3n1SrkfpKT6j9u2K5L9fD9vNn9n3Hgc3OICZCSX23xmVyQvevfebBVEksurZKWeL8J5RySO88M2vUMHDyyOKldmylvqXhCq2EEgmp0o2yfqVZCFa6iG7APlTCRCxqSwnvfPs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721892218; c=relaxed/simple;
	bh=GyPLGzIhpsB35WhyIkpQkrT+qzzPtaB3iH1SRs0EeNQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R6oYF/9NlUNGsXpZ0ahVFEe1UCCapnBjBQxDYkRVB2q08Tjq4Te9vEtw/F+6MrkzRaPreqUDMGONK5FpK31vpJdbBPpIzzwz7M7QAXAi6QvFO/D30EpgGj7OPNN9y+FgKTIonW6UwQAo8vCD5TJ/w9+I0aJ9dEP+gM2F7IVLpHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EpQR96/G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46OM4A73011243;
	Thu, 25 Jul 2024 07:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=bm0A+PZNNGOd+thGnPWT5MTS/GX57MqMYz9vyIwVTYc=; b=Ep
	QR96/G8XZVn+PqXbBUyrer9ILWxUcbKV+QrnIY5SYFKAggy+Fuhe3F8q7bcjBhp4
	uR9RwGfX71iTW/qWmcpNYxuXyF3pe/LLuyez0xXhCHE2Qs4QgdL10Gk8Jq5YtCKy
	ryxgs8+1vpj4vNYrRhKb6QDmCSdwWR62g9z0lQg/1t1uaUiSKp7Oi9PASObmU1Do
	Pb1ErlLqYTFI5B6JPmFnA59GcI6+Q2vm9DXo55qVq2VNQ70Vxgq+mr8e4bwOk5k/
	VBL/3fHbDLD2dwa4ifcfNdcX+uciXVe2//rXmzzkj+1HYMKi1OADwvWeVmVawKxU
	BvkZWbswMJYaFvmqW4FA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40jyrfjj24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 07:23:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46P7NT4N027276
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 07:23:29 GMT
Received: from hu-qqzhou-sha.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 25 Jul 2024 00:23:26 -0700
From: Qingqing Zhou <quic_qqzhou@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <ahalaney@redhat.com>,
        <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>, <stable@vger.kernel.org>
Subject: [PATCH v3] arm64: dts: qcom: sa8775p: Mark APPS and PCIe SMMUs as DMA coherent
Date: Thu, 25 Jul 2024 12:51:17 +0530
Message-ID: <20240725072117.22425-1-quic_qqzhou@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lYtbkWatx8K18YPQnJ8ZyEZrB7n6APKc
X-Proofpoint-ORIG-GUID: lYtbkWatx8K18YPQnJ8ZyEZrB7n6APKc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_07,2024-07-25_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=741 malwarescore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407250046

The SMMUs on sa8775p are cache-coherent. GPU SMMU is marked as such,
mark the APPS and PCIe ones as well.

Fixes: 603f96d4c9d0 ("arm64: dts: qcom: add initial support for qcom sa8775p-ride")
Fixes: 2dba7a613a6e ("arm64: dts: qcom: sa8775p: add the pcie smmu node")
Cc: stable@vger.kernel.org
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
---
v2 -> v3:
  - Remove the line break between tags.
  - Add the Cc stable tag.
Link to v2: https://lore.kernel.org/all/20240723075948.9545-1-quic_qqzhou@quicinc.com/

v1 -> v2:
  - Add the Fixes tags.
  - Update the commit message.
Link to v1: https://lore.kernel.org/lkml/20240715071649.25738-1-quic_qqzhou@quicinc.com/
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 23f1b2e5e624..95691ab58a23 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -3070,6 +3070,7 @@
 			reg = <0x0 0x15000000 0x0 0x100000>;
 			#iommu-cells = <2>;
 			#global-interrupts = <2>;
+			dma-coherent;
 
 			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
@@ -3208,6 +3209,7 @@
 			reg = <0x0 0x15200000 0x0 0x80000>;
 			#iommu-cells = <2>;
 			#global-interrupts = <2>;
+			dma-coherent;
 
 			interrupts = <GIC_SPI 920 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 921 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.17.1


