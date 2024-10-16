Return-Path: <linux-arm-msm+bounces-34610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 949E99A0DD9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 17:16:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2352CB22529
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 15:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839C720FA9B;
	Wed, 16 Oct 2024 15:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GlmLUf8W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0136220F5DE;
	Wed, 16 Oct 2024 15:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729091774; cv=none; b=p5Hb+Ac9gxYSghGfA8wjn62lqrRXx8fha9zWdS3sZqGGwiVM8wEHj7y1IjLBqFbwuKLTfwA0YTuzk2ErgaW3pV8a9kK8mA6kqq4E8Wu1xQfcWLuJ46STQBySprHd+Hlpjcr1RhadZO+epC+zTc0Ibyt9/sQsfGCmZoEJ7+xJf0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729091774; c=relaxed/simple;
	bh=nLfvuGZFjYhAb5C/nrzqK7BuOVhqSe7PZwFp3Z+OcTE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i4fo43GsF0amzMbjpQ37gY0/U2r6O2jlOj+yQc05p34O5Q/ZqwbaKllaO8q81JGCIq0hs/7vSSGUrw1Ln3WkODD2XgKkqlpnyNt1nO6kdDWrvoSeaSTVRQ9/MFW3IHBU16lcF9t58g9zY++H3VJ+Q100Z3VHW/Am3/Ov6rh1KzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GlmLUf8W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G8Q2UW016929;
	Wed, 16 Oct 2024 15:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hbYqIUOQYZAVq5tYJ4Ufys1oieC5bKHg7OSIcJOvHaU=; b=GlmLUf8W8MSn4sIA
	dCgqZ4dbyAejbqbuz5oDCk00EscGgON3eXs5rWwSCstLLn02obaKREVnL96W9VUg
	AgInosurKFBATBVuCBAb7cuIeDuyNdzxhpTZp5DLmLl4U/U8VfKQF6SE/Hi2GW5Y
	lkbFKHEUp8bZyk4b0cIs3RdY417Yje29WujBa1g9aCakQJBjUCghaDs5l9pstT27
	fd2CT6/NCGqU+sq8xiXnCsezjXoQBmjd5SNUGV/znygIm4WveyCMq5/tFGdmVH61
	x6xyXfD6r5Gxacs5IaYKo3ynSHKWtVChWFGtN3zw8rdcfDGFXkLRFBahgPYhtWnO
	kvNo2A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429mh555hr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 15:16:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49GFG8iB004636
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 15:16:08 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Oct 2024 08:16:05 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH 3/3] arm64: dts: qcom: ipq5424: Add smem and tcsr_mutex nodes
Date: Wed, 16 Oct 2024 20:45:28 +0530
Message-ID: <20241016151528.2893599-4-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016151528.2893599-1-quic_mmanikan@quicinc.com>
References: <20241016151528.2893599-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SslFdVi_G6zc_fnSMwcQhAHAaKlWFhL0
X-Proofpoint-ORIG-GUID: SslFdVi_G6zc_fnSMwcQhAHAaKlWFhL0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 adultscore=0 mlxlogscore=771
 lowpriorityscore=0 mlxscore=0 phishscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160095

The smem is necessary for the socinfo driver. Additionally
smem requires the tcsr_mutex node. Therefore add both the nodes.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 76af0d87e9a8..5e219f900412 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -129,6 +129,14 @@ tz@8a600000 {
 			reg = <0x0 0x8a600000 0x0 0x200000>;
 			no-map;
 		};
+
+		smem@8a800000 {
+			compatible = "qcom,smem";
+			reg = <0x0 0x8a800000 0x0 0x32000>;
+			no-map;
+
+			hwlocks = <&tcsr_mutex 3>;
+		};
 	};
 
 	soc@0 {
@@ -170,6 +178,12 @@ gcc: clock-controller@1800000 {
 			#interconnect-cells = <1>;
 		};
 
+		tcsr_mutex: hwlock@1905000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0 0x01905000 0 0x20000>;
+			#hwlock-cells = <1>;
+		};
+
 		qupv3: geniqup@1ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0 0x01ac0000 0 0x2000>;
-- 
2.34.1


