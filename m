Return-Path: <linux-arm-msm+bounces-19451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 115F38BF41D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 03:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93A24B21A35
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 01:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A2CD28D;
	Wed,  8 May 2024 01:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="anrn9WgW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562B9DF42;
	Wed,  8 May 2024 01:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715131893; cv=none; b=JDvfz3Q8OwIOZXjnu04VQ8QM7g/iZ34umeWdAqWnzQZrvRXDLx/3zGd2iHGY7NgYgY171gSHAfdBEfQGuPWpaX6fw/m9mb3azJIBbLNQqCWJP7CA/JvxVMs8OEfD7qdLHC+BU3zk7lz7znuP+KIELV8z10YuFNSvmgJ8NChsLxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715131893; c=relaxed/simple;
	bh=2exA7yLFQbhNn3eNWt/r8G2eYLCBZ/kA6N6FLZFepDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=MnY+0Onzp4GHPXlV2vuNw1Di1u74dhk7dykkqvxihWSO3xY6Z5OMKKQc4DkVMoyw5Hae0pUsCUjPDZbWsDIpdFi88z8lMjd7kkaF+ONy0KuJI1AQSW/o09L3tSGq7Oqg7UAST+KJQ9bYlZd4xOjnwzS0/7eoi6mssVgOXvJ8Yg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=anrn9WgW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44814BbL027443;
	Wed, 8 May 2024 01:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=ICBtYv1wGSMy2DzLvddD6aUGBcfCoQNu14uA5LQ/U3Y
	=; b=anrn9WgWIvjrJEsEM/UIG3AXRK558PiqSUabz2+G/Gc5hB0GqMA6wX6AT7j
	6W007nSgJc5foqUOgcjhRlkWdPBx1x1/QJIZFn4gorj/SLLjryBHyH0/nHdXI/5r
	oCpZKVn7K7gvJEnQZzvg9AsdzjgmFur1f1iM34BZmAIvJVRL4rn+K3f0MQISjKdw
	0GpG7bjKHI2dV0F8YMQNmTx3VX+qbFjbkP5n4GSbfmSduGvooltfyObVQ5a93PTa
	Fspd1aaR0cm4K8v9ak5J7DsblkF638q9MqY6xtkuN1tidqN+mm9Fv0HEhr3Wi3sb
	3ZPxCKBRa71jCLabbx8nfWbA7xg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xysph0nr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 01:31:21 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4481VKm0024746
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 01:31:20 GMT
Received: from hu-scheluve-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 May 2024 18:31:11 -0700
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Date: Tue, 7 May 2024 18:31:00 -0700
Subject: [PATCH v3 1/2] arm64: dts: qcom: sa8775p: mark ethernet devices as
 DMA-coherent
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240507-mark_ethernet_devices_dma_coherent-v3-1-dbe70d0fa971@quicinc.com>
References: <20240507-mark_ethernet_devices_dma_coherent-v3-0-dbe70d0fa971@quicinc.com>
In-Reply-To: <20240507-mark_ethernet_devices_dma_coherent-v3-0-dbe70d0fa971@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>,
        Andrew Halaney
	<ahalaney@redhat.com>, Vinod Koul <vkoul@kernel.org>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Bhupesh Sharma
	<bhupesh.sharma@linaro.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>,
        Sagar Cheluvegowda <quic_scheluve@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3yhjFzqCaO0WrYjCUERI5uu85wMqANdT
X-Proofpoint-GUID: 3yhjFzqCaO0WrYjCUERI5uu85wMqANdT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_16,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=666
 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405080009

Ethernet devices are cache coherent, mark it as such in the dtsi.

Fixes: ff499a0fbb23 ("arm64: dts: qcom: sa8775p: add the first 1Gb ethernet interface")
Fixes: e952348a7cc7 ("arm64: dts: qcom: sa8775p: add a node for EMAC1")
Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 231cea1f0fa8..5ab4ca978837 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -2504,6 +2504,7 @@ ethernet1: ethernet@23000000 {
 			phy-names = "serdes";
 
 			iommus = <&apps_smmu 0x140 0xf>;
+			dma-coherent;
 
 			snps,tso;
 			snps,pbl = <32>;
@@ -2538,6 +2539,7 @@ ethernet0: ethernet@23040000 {
 			phy-names = "serdes";
 
 			iommus = <&apps_smmu 0x120 0xf>;
+			dma-coherent;
 
 			snps,tso;
 			snps,pbl = <32>;

-- 
2.34.1


