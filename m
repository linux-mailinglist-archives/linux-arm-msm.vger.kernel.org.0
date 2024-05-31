Return-Path: <linux-arm-msm+bounces-21327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D8D8D6722
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 18:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59F0F1C2249D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 16:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A716176AD7;
	Fri, 31 May 2024 16:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BJXlTdHd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E342B8061D;
	Fri, 31 May 2024 16:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717173949; cv=none; b=MC0y8wGhDInFwDjZymfrZSFkVMeVmmJu1q1PFSiX+/OQCRvrIvAufiti6ElyGvEMO3ZyZCNUlwBCSbeCPf1Y5VqXOBmcsDxbXKA1stSF+kzZmm7ZfNgoOQDseMwRd+lbAWxcma05UTrYgbzoPHuPRCsreHQelCJbkQyJlxVM43Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717173949; c=relaxed/simple;
	bh=9w8oEZ9tuiNdQdzxbnY1EJDcn68le36atRAGcn00n0s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ErLbDuJmZWSSkxujaW2an+A++Od2ZtJMS/21cNt3QZkzngJxEqkE23fKYr3P3axRAiZJc3vz+c+EJi9M1YjFpYXlOmPXx8HwFp4p9hJWbdVM115FNDtjzQzjbAU/eNeAaX61EXXzCnNXR15V63zSx/b1Hry1QcOpR6Kume2CoQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BJXlTdHd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44VFOIZc031603;
	Fri, 31 May 2024 16:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C+SvioagX/M
	10WbxVMajBeELKwOUfWjj35jr4x6wBsg=; b=BJXlTdHdM+DtGpLqtZRfN5ov9Y5
	DI33aPMCqJtsh/lIonwpvZtQC9otQRl68Hn1dC9/K4JoFJmqj0niyHBtY9T0wMsZ
	EUmusMRi8Dnhy9W3F1QmJeofIciK09BX+Tc0SqJ0S0mEMTrMa0ID4e8/BUGQbl2u
	kFM8h1GX9K+LhragSAUAgHO7OKj6Uuzip8wq8pQOFyYMUFdK2QcdpE4XH4RhDIth
	2g3AtNs+QUl2sTOLpPwigPBazjz1x3+1h+VHKNygXQH6j1a9kaO+vGTp3CsrlrVT
	9WABJre7uSbFo22M/GJlMwLiXNuLRWhSHDRt+9SKX3AdCoHYkMgbM7O1vIg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yf8xa1gs0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 16:45:44 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 44VGjg28020259;
	Fri, 31 May 2024 16:45:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3yet2kj3qp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 16:45:43 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44VGZwuU008395;
	Fri, 31 May 2024 16:45:43 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-uchalich-lv.qualcomm.com [10.81.89.1])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 44VGjhTq020271
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 16:45:43 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4184210)
	id EC1DD658; Fri, 31 May 2024 09:45:42 -0700 (PDT)
From: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Unnathi Chalicheemala <quic_uchalich@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: [PATCH v6 3/5] arm64: dts: qcom: sm8450: Add Broadcast_AND register in LLCC block
Date: Fri, 31 May 2024 09:45:26 -0700
Message-Id: <bfc817da4188abdf5b543bedafb9cb0eb82806c2.1717014052.git.quic_uchalich@quicinc.com>
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
X-Proofpoint-GUID: mXV1NkP550Ce25rwE_cNrIF7P9d6Hzcj
X-Proofpoint-ORIG-GUID: mXV1NkP550Ce25rwE_cNrIF7P9d6Hzcj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310126

Chipsets before SM8450 have only one broadcast register (Broadcast_OR)
which is used to broadcast writes and check for status bit 0 only in
all channels.
From SM8450 onwards, a new Broadcast_AND region was added which checks
for status bit 1. This hasn't been updated and Broadcast_OR region
was wrongly being used to check for status bit 1 all along.
Hence mapping Broadcast_AND region's address space to LLCC in SM8450.

Signed-off-by: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 616461fcbab9..f947cacc81b3 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4362,9 +4362,10 @@ system-cache-controller@19200000 {
 			compatible = "qcom,sm8450-llcc";
 			reg = <0 0x19200000 0 0x80000>, <0 0x19600000 0 0x80000>,
 			      <0 0x19300000 0 0x80000>, <0 0x19700000 0 0x80000>,
-			      <0 0x19a00000 0 0x80000>;
+			      <0 0x19a00000 0 0x80000>, <0 0x19c00000 0 0x80000>;
 			reg-names = "llcc0_base", "llcc1_base", "llcc2_base",
-				    "llcc3_base", "llcc_broadcast_base";
+				    "llcc3_base", "llcc_broadcast_base",
+				    "llcc_broadcast_and_base";
 			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-- 
2.34.1


