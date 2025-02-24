Return-Path: <linux-arm-msm+bounces-49119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BF3A4157B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 07:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6E713B0A1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 06:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0C21DC998;
	Mon, 24 Feb 2025 06:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NrS4If4w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477F41DB34E;
	Mon, 24 Feb 2025 06:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740378958; cv=none; b=GSxveoJUQfJmZcC3IUj2hM3WUJUFiRBnZR7VvVqVMDjNsSyVwCcGWzstTCsdsaPlnrzvCvYjoRnT3D2i32sQrTTmEnlejc2NJi2QqO8bH0wxsd0AJYMHTRN2IBypixRXq5A75pjZ86lCtTxSCQ0djbap9RvBIJlGHvS9HINsBfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740378958; c=relaxed/simple;
	bh=P1RlylqimOkH5TTsCuHUS/9hFfS42PQMTsQwSrcCMRg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U8wRTqloSDJ7+FPvqSv1pPtDDELOYcMBp9FqWqd4yEu3N1Kd23M7GWigQieOqYH7h1Vz8NT8eoL52GTY+poAhdPj/U9G6wHCvuQ2WWm3WTA5ssQoT3MAhVcddAoLFWTFEUCnE3SgJoY7cyqIztg6/PVBEmSi4nKB9IPuSyKVepk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NrS4If4w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51NMPJ3c004412;
	Mon, 24 Feb 2025 06:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i5ssspl19NxmOg/LgSnKukDdWfXhHnx8DeBWEJ7eVi0=; b=NrS4If4wRJFfTEBd
	3A3lHS98yOpQxTaQdfaoUyc686K2kxjUWcgBOXJHOHWtfhqLNYyHp+pkrzJ6iyAL
	n46eNdsesl+4szDjasBfOnx4Ng8gkrV0FLsvfpSdPmg8bLBMtiHJS82wHFYmOl+l
	J2sXOkkSLEhz8UB8eQyGbYz2rVsFM3FOtbnI2y1Fqe3n3QFsUbewjO5/VIws+Ko3
	cdx+DuIVxELor1XutqA36nr81SUwKGCZNM2VkCAfjiZqzvMZCk22xUSLCHSCtXy+
	qej0oRe+nPs66pFCl67bdnAq3fQpCPrAC3ttbTnaMU8WpL746fEXf4CBBk8rN9mJ
	W/KoFA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y3xnc32k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 06:35:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51O6ZpUk013001
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 06:35:51 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 23 Feb 2025 22:35:47 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH v12 2/4] arm64: dts: qcom: ipq5332: Add thermal zone nodes
Date: Mon, 24 Feb 2025 12:05:29 +0530
Message-ID: <20250224063531.2691961-3-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224063531.2691961-1-quic_mmanikan@quicinc.com>
References: <20250224063531.2691961-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: N3JHREjY2RAh5LIrClG3ot4hHcX1NmnJ
X-Proofpoint-GUID: N3JHREjY2RAh5LIrClG3ot4hHcX1NmnJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_02,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=934 bulkscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502240046

From: Praveenkumar I <quic_ipkumar@quicinc.com>

This patch adds thermal zone nodes for sensors present in
IPQ5332.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
Changes in V12:
	- No change.

 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 69 +++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index cb3657bb8aee..69dda757925d 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -547,6 +547,75 @@ frame@b128000 {
 		};
 	};
 
+	thermal-zones {
+		rfa-0-thermal {
+			thermal-sensors = <&tsens 11>;
+
+			trips {
+				rfa-0-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		rfa-1-thermal {
+			thermal-sensors = <&tsens 12>;
+
+			trips {
+				rfa-1-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		misc-thermal {
+			thermal-sensors = <&tsens 13>;
+
+			trips {
+				misc-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-top-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&tsens 14>;
+
+			trips {
+				cpu-top-critical {
+					temperature = <115000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+
+				cpu-passive {
+					temperature = <105000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		top-glue-thermal {
+			thermal-sensors = <&tsens 15>;
+
+			trips {
+				top-glue-critical {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-- 
2.34.1


