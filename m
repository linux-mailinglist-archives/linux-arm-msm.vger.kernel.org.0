Return-Path: <linux-arm-msm+bounces-19954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3604A8C7EA5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 01:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDCB11F222A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 23:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628CF2D781;
	Thu, 16 May 2024 22:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SQ13+Kn8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D4B1799B;
	Thu, 16 May 2024 22:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715900386; cv=none; b=JoZtPK/SmzNjlXFnBP/N0YFSAWLVL44L7/vJ34bzs3ozF71XsNg75Ko6k++n1zGep4wh5vvn22DY5s0Wz8HbZxoZcobGbY6DwTcLiJt9VN1HBE2UEfQ5vdoj1SHvhAsRtpkJTPeiAHW6rC2UAEVaP2a3ZX15wOcX8BJYrQQjUM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715900386; c=relaxed/simple;
	bh=hFxFX/P+1Xf0QbXT9siXfHWO9C1XUTE9mcYGKnLjrow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=mvLMuJ4I5Pz3zSy3/87dHZomzmty1nWPb//qBX9h0KVuO3QIUllis0/v3+MF7AmqgZNZsqvKPBToX2KqyfjjARlKbYlo3NjA1tQU260tS++Ni2wu969ddU71zUqQ2DhtJ+BQ2ryqmwN3VNFe9xrNsy2SzV+eyPiCZSGE4mD8LV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SQ13+Kn8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44GKMaiE007096;
	Thu, 16 May 2024 22:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=LzjhrQmf8UA2KR/o3BaIC0rUEdGHcFyVo2lKB/hiOsI
	=; b=SQ13+Kn8WV+26fMyT9rbt8gi61YP2btR2GK02MCDemF8GUxuyBCUcH9UIA8
	jqme0fAP6mdLunC6dWygoJTtOWwigI072jmTB/nx1wwuZIoO1o2kN4+CALq8rBtp
	oLngKNIykL9SmDbndWjHHZE6uM9v25shZ92wmDwrYw0hI6pwVe1SkzjtR5iKbKmn
	ujW2E2npNPtD5lheBoEVxnqbghHVV35UcYwS51agIv7IfAHt6JPDM7kKGd2TekCF
	F7nQt3lc1QY9gNVGbjViQtxHJLLJiT43kWRnw8JmI+db4j9SWZCvRSTKPC/hKxgR
	DXOMrmXlfJsjDhEYjlRwpMIwWeA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y47egeu3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 22:59:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44GMx7P2030540
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 22:59:07 GMT
Received: from hu-clew-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 May 2024 15:59:06 -0700
From: Chris Lew <quic_clew@quicinc.com>
Date: Thu, 16 May 2024 15:58:25 -0700
Subject: [PATCH 7/7] arm64: dts: qcom: sm8650: Add hwlock to remoteproc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240516-hwspinlock-bust-v1-7-47a90a859238@quicinc.com>
References: <20240516-hwspinlock-bust-v1-0-47a90a859238@quicinc.com>
In-Reply-To: <20240516-hwspinlock-bust-v1-0-47a90a859238@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Baolin Wang
	<baolin.wang@linux.alibaba.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ingo
 Molnar" <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Waiman Long
	<longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
        Jonathan Corbet
	<corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Chris Lew <quic_clew@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715900345; l=1173;
 i=quic_clew@quicinc.com; s=20240508; h=from:subject:message-id;
 bh=hFxFX/P+1Xf0QbXT9siXfHWO9C1XUTE9mcYGKnLjrow=;
 b=I5SYBz9Nf94hE3Yx5311CrGrep1WDH0WRJk28EKdr8iNad3/P2iDPKNEpI/kbASUgSW0xFHXv
 YWxYGqaKwsCA53CxRmI7KWxVFKiGfePdSAGNhY27YRp+9eapsUucDaG
X-Developer-Key: i=quic_clew@quicinc.com; a=ed25519;
 pk=lEYKFaL1H5dMC33BEeOULLcHAwjKyHkTLdLZQRDTKV4=
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0p0uoeeB00LfWMHmsvG-8YWEQ7SxuDeY
X-Proofpoint-ORIG-GUID: 0p0uoeeB00LfWMHmsvG-8YWEQ7SxuDeY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 mlxlogscore=766 lowpriorityscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160168

Add the hwlock property to remoteproc. This enables the remoteproc to
try and bust the smem hwspinlock if the remoteproc has crashed while
holding the hwspinlock.

Signed-off-by: Chris Lew <quic_clew@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 62a6e77730bc..a65a1679f003 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2878,6 +2878,7 @@ remoteproc_mpss: remoteproc@4080000 {
 
 			qcom,smem-states = <&smp2p_modem_out 0>;
 			qcom,smem-state-names = "stop";
+			hwlocks = <&tcsr_mutex 3>;
 
 			status = "disabled";
 
@@ -5024,6 +5025,7 @@ remoteproc_adsp: remoteproc@30000000 {
 
 			qcom,smem-states = <&smp2p_adsp_out 0>;
 			qcom,smem-state-names = "stop";
+			hwlocks = <&tcsr_mutex 3>;
 
 			status = "disabled";
 
@@ -5183,6 +5185,7 @@ remoteproc_cdsp: remoteproc@32300000 {
 
 			qcom,smem-states = <&smp2p_cdsp_out 0>;
 			qcom,smem-state-names = "stop";
+			hwlocks = <&tcsr_mutex 3>;
 
 			status = "disabled";
 

-- 
2.25.1


