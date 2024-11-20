Return-Path: <linux-arm-msm+bounces-38442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE589D37AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 10:57:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A5C31F21519
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 09:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3E371A38EC;
	Wed, 20 Nov 2024 09:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Fl9G7RpE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF4B1A3029;
	Wed, 20 Nov 2024 09:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732096519; cv=none; b=JiwvHWUpEVcAouP+p0yidExdUI7fN6XHPS+TUNbENHLAXUhdRIoarsvXVvbpFHSC+lAwww6gbhLxd4uJlDLMezNT9Xaiznc4VFqua4babXbQ9RPEfHweggpH+2l7ndxrbaJ+MNzheKsjm5Gft8ECwlFcAej+Yw6sFxEQ3JVFIuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732096519; c=relaxed/simple;
	bh=OSauWbuIvdcOirACBY3aawYXLFSkq+Xp1vHcpmJAnoA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gjzsDJ24fvnCKSVB2gGE1xDtVIeSbZ7ddbizZaJ3OrLQujAZApv4WhLXWVRPypEhug7bRFR+Ul2Jz8WUohoFkFgpHGSRBlVxXh/S2RmKSeaKhBeGgXxUBvMm6tthHh6kUarthkPqbrnhphaEepFhRuMUCHbb8eBfMyK48uN9iso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Fl9G7RpE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK9FP9T002563;
	Wed, 20 Nov 2024 09:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VhomC2qd3xDweP8cXyazbZh0fcvRxBZAg+RV0Gflm/g=; b=Fl9G7RpE7hQImlvY
	TAMV9zpYVXnmGJ4A9+aFSounq76wCsDn/yXvyQKtMVz75MPp1oE5qYGwjBbtZq/I
	CEiTzZz8OcTNUHLBQYdG/NrVZ+8Ixe4ycP6GDjt9DnEzv/hI90SMqVdwJdxPbY+v
	tLPMgkgWAcf98Upy8TjKkEtsgXHaDTxtu48P8BK4ROQ/hR2zGsQWqFkC8Mu1kayE
	s9uqyigLVen2rWchQ/t/ve5Ls6Nd5xzMetJ3K8BW4F6rdyEBAMz5mhH0KMGzxtBC
	+21GYqceBNeD7qbNad+lWdnM8Cl/XWDJ3qT1eYx6j5rNtAEzPMQfLDB3urbJHUiJ
	EFa5Gg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y85cqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 09:55:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AK9tCIL019683
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 09:55:12 GMT
Received: from chejiang-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 20 Nov 2024 01:55:08 -0800
From: Cheng Jiang <quic_chejiang@quicinc.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz
	<luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Balakrishna
 Godavarthi" <quic_bgodavar@quicinc.com>,
        Rocky Liao
	<quic_rjliao@quicinc.com>, <quic_zijuhu@quicinc.com>
CC: <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_mohamull@quicinc.com>, <quic_chejiang@quicinc.com>
Subject: [PATCH v2 3/4] arm64: dts: qcom: sa8775p-ride: update BT nodes
Date: Wed, 20 Nov 2024 17:54:27 +0800
Message-ID: <20241120095428.1122935-4-quic_chejiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241120095428.1122935-1-quic_chejiang@quicinc.com>
References: <20241120095428.1122935-1-quic_chejiang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uvicmctqxFeHkibgYzQlIQ2e6SkBGoAa
X-Proofpoint-GUID: uvicmctqxFeHkibgYzQlIQ2e6SkBGoAa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxscore=0 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411200069

Add product-variant property to specify the IoT product line.
Update the chip soc type, SA8775P-ride platform uses the QCA6698
chip, which is compatible with the WCN6855. It's necessary to use this
new SoC type to distinguish it from projects using WCN chips.

Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 3fc62e123689..da52f425c676 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -856,7 +856,8 @@ &uart17 {
 	status = "okay";
 
 	bluetooth {
-		compatible = "qcom,wcn6855-bt";
+		compatible = "qcom,qca6698-bt";
+		qcom,product-variant = <0x20000>;
 
 		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
 		vddaon-supply = <&vreg_pmu_aon_0p59>;
-- 
2.25.1


