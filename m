Return-Path: <linux-arm-msm+bounces-21329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB35C8D672C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 18:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A57B828BA77
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 16:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2918817D893;
	Fri, 31 May 2024 16:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GzZuiMCh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B8A17C220;
	Fri, 31 May 2024 16:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717173956; cv=none; b=W/ybWWKmwTwxrF3NiQddjeUcwDfUn/JsCeMuC5cXXhCqdQv+DxS2IVfDRqCY4vdUg+XrVCY1/YdQII+pTeumSfVNHaA7pyqVUldlWrdgVj367JxVEydTjogVMRc/SFBfJXs9Drt6UnXUf8DJrM+V3C6kxIEAspM9v167TF/Dntw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717173956; c=relaxed/simple;
	bh=Nh2O8FIhtFzhQP1KnI0XM043YyDZ0yPx1udZZMoPsTA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RSdNru/poJoLULwq+E/M0FVh4g1dEgl3krewDyhRk+YHqAcb1n2/4lioeUum+73wQhl0gW8wikBKSaXjP1jqY+INDW8lB/EFzMBgp6pskaUySBA+eyRepOnuspYOAC9jmQN6o6wXQLRLXJQZ1PyIspoloJ3NYozlC6vTz6qZKjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GzZuiMCh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V9Ikh5015853;
	Fri, 31 May 2024 16:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gV84rD4isZX
	XxVhwvgvo1zdHoAKgwQvjhOvBiJSLZh0=; b=GzZuiMChQCktJz4Dz2jDLMGfW8H
	MPb+K1HtUvaUkfHD+jSD1nqV4na+YGUkAag6zLeslIRDckwb1hhxsgpo3/dYZup/
	e/e5uJzzPGZK8drO1heA4fMEd+I9gLe0waY+LhLQMKry9q+xoZrYuvCyYDyPCaKO
	UljxbqDRXIHWcCwPGzEFrog+0tBo1rDT/mgfhx4xgdkk6iTXNE8x67K/hlt3tC0m
	eq5Orgjnst7MztRqLnrdqgKqqq6LDuThuWzkiQv3EF3OOOrNv9FgAwSEyJtczgOp
	T2Lwl3oDeKBLV8Gnt8ipxQK7+yQ1AgPabw0yZ02NRUoj6onTNlclVio6fxg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yf23stakj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 16:45:45 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 44VGjjsG020300;
	Fri, 31 May 2024 16:45:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3yet2kj3qu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 16:45:45 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44VGji59020290;
	Fri, 31 May 2024 16:45:44 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-uchalich-lv.qualcomm.com [10.81.89.1])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 44VGjiPf020288
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 16:45:44 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4184210)
	id 72E11658; Fri, 31 May 2024 09:45:44 -0700 (PDT)
From: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Unnathi Chalicheemala <quic_uchalich@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: [PATCH v6 5/5] arm64: dts: qcom: sm8650: Add Broadcast_AND register in LLCC block
Date: Fri, 31 May 2024 09:45:28 -0700
Message-Id: <3a8804b35f44485637398faa9c0bda76813fe4d7.1717014052.git.quic_uchalich@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717014052.git.quic_uchalich@quicinc.com>
References: <cover.1717014052.git.quic_uchalich@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KFLJgIe2y4g1Ti95KI6HvE4RwBRaBxDD
X-Proofpoint-GUID: KFLJgIe2y4g1Ti95KI6HvE4RwBRaBxDD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310127

Chipsets before SM8450 have only one broadcast register (Broadcast_OR)
which is used to broadcast writes and check for status bit 0 only in
all channels.
From SM8450 onwards, a new Broadcast_AND region was added which checks
for status bit 1. This hasn't been updated and Broadcast_OR region
was wrongly being used to check for status bit 1 all along.
Hence mapping Broadcast_AND region's address space to LLCC in SM8650.

Signed-off-by: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 62a6e77730bc..0d71aa24a7ba 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4982,12 +4982,14 @@ system-cache-controller@25000000 {
 			      <0 0x25400000 0 0x200000>,
 			      <0 0x25200000 0 0x200000>,
 			      <0 0x25600000 0 0x200000>,
-			      <0 0x25800000 0 0x200000>;
+			      <0 0x25800000 0 0x200000>,
+			      <0 0x25a00000 0 0x200000>;
 			reg-names = "llcc0_base",
 				    "llcc1_base",
 				    "llcc2_base",
 				    "llcc3_base",
-				    "llcc_broadcast_base";
+				    "llcc_broadcast_base",
+				    "llcc_broadcast_and_base";
 
 			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
 		};
-- 
2.34.1


