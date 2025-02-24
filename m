Return-Path: <linux-arm-msm+bounces-49167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F25BA41DFC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 12:59:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04A2417E533
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 11:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08593267AED;
	Mon, 24 Feb 2025 11:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SM/28QiA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C6B267737;
	Mon, 24 Feb 2025 11:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740397095; cv=none; b=OnbXjBaQh/5IQ4ixK4BkaBUT1kcqqBJiOH1MB82/kAI6ZuCxsgs9uLE94LOnIamtb90d6vCJQwWZy4frI+VmzIoGhY7N1fQlQyfzQgSYDqjWAEuymR6J904ef1cNKxmmfGQ/9uvrV0mEyEoTbrNDkyKa9sI4FuJMi+rPsfGZrRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740397095; c=relaxed/simple;
	bh=3PQejJkE0gpHGohShAXjArVwhhWu/Yl9gLw40Q0RPnk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=INNx5ylJc5obSLLdz2zaYkvgkdOfsMeQ6OoypT5bPbjqICL6s329qIbjc6P4Pa5m/tTpUN13uHck6huNAPWPt4D3sHJCOSHduvddqWcRl6a0y8XW8oo0pTFdVziZlxyxHzmRDXaSOg0AHsYVUjFnE2tz+d6f8Bhj0/HQ+nP8Rw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SM/28QiA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O76hh8024449;
	Mon, 24 Feb 2025 11:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BB082F9DMtbfZKWqd6QIZs9fgXTNhSvhEh3Sk25nQ5Q=; b=SM/28QiAG0JfGOwq
	+XKe+FXToPZ/N17HKo4kYMzfFC20Fdor5yqWcv0Cn+H2MiWv8Fk1tnekHTfv1hsB
	zMgBXcvi3oE5NF1NMaUV5SlAna3cD76Si1nh84qtZgUMqXExHQ8F/+LrtswnNWaD
	rzMABTB63S5/kPLYGyfPw9/eFsX3ph8CZIqoFyaRYTZFDSVRUfWx9xJGlowUY2Hz
	NOxj0WVQ6EWD1sCoA82u5x4+4EWIFzSJFGDhzpoZlb+XAVYyoSofCTbmhq8cjlWJ
	srTh3EPEdCoqxAwm2rtZ/Te0O3y4IFGI0wbT4uKmurRQWcFwSnNl6jHogr5kzuKU
	hp3ZOw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 450m3d90bs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 11:38:12 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51OBcBsF027448
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 11:38:11 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 24 Feb 2025 03:38:08 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 3/3] arm64: dts: qcom: ipq9574: Remove eMMC node
Date: Mon, 24 Feb 2025 17:07:42 +0530
Message-ID: <20250224113742.2829545-4-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224113742.2829545-1-quic_mdalam@quicinc.com>
References: <20250224113742.2829545-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Mtw2KJrAGC2pyAbn27EcUSnh2KJz3IXm
X-Proofpoint-ORIG-GUID: Mtw2KJrAGC2pyAbn27EcUSnh2KJz3IXm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_05,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 phishscore=0 mlxscore=0 mlxlogscore=640
 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502240085

Remove eMMC node for rdp433, since rdp433
default boot mode is norplusnand

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
* Added 'Reviewed-by: Konrad Dybcio'
* For full change log see - https://lore.kernel.org/linux-arm-msm/20241120091507.1404368-9-quic_mdalam@quicinc.com/
---
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
index 165ebbb59511..fa7bb521e786 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
@@ -55,18 +55,6 @@ &pcie3 {
 	status = "okay";
 };
 
-&sdhc_1 {
-	pinctrl-0 = <&sdc_default_state>;
-	pinctrl-names = "default";
-	mmc-ddr-1_8v;
-	mmc-hs200-1_8v;
-	mmc-hs400-1_8v;
-	mmc-hs400-enhanced-strobe;
-	max-frequency = <384000000>;
-	bus-width = <8>;
-	status = "okay";
-};
-
 &tlmm {
 
 	pcie1_default: pcie1-default-state {
-- 
2.34.1


