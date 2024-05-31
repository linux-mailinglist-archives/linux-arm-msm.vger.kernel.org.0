Return-Path: <linux-arm-msm+bounces-21328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B088D6727
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 18:47:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22BE61C23151
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 16:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D87517CA14;
	Fri, 31 May 2024 16:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SoinMffk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36D317C220;
	Fri, 31 May 2024 16:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717173951; cv=none; b=U1AS2HnHs4KEBQxSHne8UKVeeYP80jZhmh7Blrmc9KsFg4vKMHCM/JrYjAPMEg6mTbuekZmoNc908aX5f8ILuwl6kzBizmDqMimLnL59Tv8UPUxdjppPTX7HAiBBU/1aEFMnpw0YyKqjZnKdQu40RJFis4Pwe911F7vNOgT/9hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717173951; c=relaxed/simple;
	bh=RaVTZ1tMC9JIMAgPFf22CRoger7ALH48t021Oo/wQB4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kUlKBYECepxFiP4YLqf5aZH4UgUxHKRL8v2Z7/C5n8SmQJDYNShW5trkiJvQhs6c9D8U5hHzMJ+p+9Vlr2aAKYoEMdrimgxI9D/ueW226Fg2TcfQbyg7DC9f/WFRryB3+qf1brMMa7uOeFb05tL2Caqc1QquO3kjFZfgb/L7c2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SoinMffk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V7kapc013484;
	Fri, 31 May 2024 16:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=y2xl/mIqKgO
	aPHdNMUq17UH25G07pcdUn2qQeaaOB+A=; b=SoinMffkcPNtP254lvKs7CEDbqv
	MCw212NHTUfhFuPDkkHHJnYJnadhZVC3I3sOmA498jrrQD3KW1edRirKKBHxx4G5
	j2fupDnH3NriBTA1+BbSU6w5p+67ztJzDXR4i5C9lmLHbq35Y4pzx4z0dLsuAH2G
	FvwToaqTS76XXqGLidkgMsQqwASXLqGyDgO9WBxc6WGdLBGjh7ObDR5pz9AqlUhq
	y+5ONwno+AJ0URL7sQeHgPuipaskQSSt+c7gFDRFiAX/oWKv/LV/Sh8UfaOs7O/5
	GP8nv7iTbk3nSVGkd58/iMTY3Wbmp2AXMieUuF73vzkQhlMts+BYGceN8bQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2n7gsd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 16:45:45 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 44VGjiVw015913;
	Fri, 31 May 2024 16:45:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3yf6w1w566-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 16:45:44 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44VGjiBO015907;
	Fri, 31 May 2024 16:45:44 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-uchalich-lv.qualcomm.com [10.81.89.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 44VGji9r015906
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 16:45:44 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4184210)
	id 9EE8AB16; Fri, 31 May 2024 09:45:43 -0700 (PDT)
From: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Unnathi Chalicheemala <quic_uchalich@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: [PATCH v6 4/5] arm64: dts: qcom: sm8550: Add Broadcast_AND register in LLCC block
Date: Fri, 31 May 2024 09:45:27 -0700
Message-Id: <9bb6e086adec4d3b2134462d504822fb79b009e7.1717014052.git.quic_uchalich@quicinc.com>
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
X-Proofpoint-GUID: 5tbSA-ar7TRQbEjJJWAAnkTao7TQR82N
X-Proofpoint-ORIG-GUID: 5tbSA-ar7TRQbEjJJWAAnkTao7TQR82N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310127

Chipsets before SM8450 have only one broadcast register (Broadcast_OR)
which is used to broadcast writes and check for status bit 0 only in
all channels.
From SM8450 onwards, a new Broadcast_AND region was added
which checks for status bit 1. This hasn't been updated and Broadcast_OR
region was wrongly being used to check for status bit 1 all along.
Hence mapping Broadcast_AND region's address space to LLCC in SM8550.

Signed-off-by: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index bc5aeb05ffc3..d0ba6cf6c27e 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -4295,12 +4295,14 @@ system-cache-controller@25000000 {
 			      <0 0x25200000 0 0x200000>,
 			      <0 0x25400000 0 0x200000>,
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


