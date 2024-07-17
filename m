Return-Path: <linux-arm-msm+bounces-26426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2C5933A46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 11:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 340AE1F21C0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 09:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0329A17DE33;
	Wed, 17 Jul 2024 09:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KIPKWRBD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EC617C200;
	Wed, 17 Jul 2024 09:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721209762; cv=none; b=tifSIg27KeK3Cl14gBFyXNF8MlFtvE/XcVVkTJt7R3zMMEobEZ4dGv2kG5tkZFjU1r55LSMOrmhf0u0P25uW4pOXR5fq1bYGAH5hR1PRcJjKrBw6RpTR76ycll4z1enIskIexi0HvSdmqgIRtwh2mp/438dXSY+k/nxk42y0rcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721209762; c=relaxed/simple;
	bh=iWScX31Wls7UK6w8qpu7+dWpq24MD0HgoldyPR/xgsg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KD9pXilMc6l/ZA9p9Bbunn2PZmLum8fdsZGFxvLGg8hnM48hkF9fDglN3OBc2sTUgxgjmLVxXL7eDgjB7+lh4hh8m/QePmvwzJP/QKvibNEV0CWFaAGXoLuhUdqz4sH8H4U0wHkZKFkr9rQOjVS6XbV8rAmDpz0aUp2QWnB/hGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KIPKWRBD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46H7AFMr012799;
	Wed, 17 Jul 2024 09:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5kcW79TZgs1dfe247UhERDH3osXIHcDrA3UeYl5r2CY=; b=KIPKWRBDeWQjMiLg
	J4cIp923ofv6DcJwCqacHDbXiu/wLtVW+wY61ztj7Y6DVAvb+7LFVxxDIEi5E/X5
	LdAQ4jSBPu2rkQtyI2/qLmFK/kghNZmBcmYZZq1UbFzYLQzBm6UdTyus5MrWhC8o
	nELMhtaKL/9l0XTNR6/eLid5MiR43zlx+A40NtV2/S0yEF+4ZIhxgkm7HsNunkDJ
	BuWdRXL5rDo9quc5HZqAXWYtxqTpLioKNNw+/ekjYN1FWVkEoVjPyw8+iREikDw3
	nP+jUdGqCvFs9hbUarfqo3zU8KhkLY6Z5KS67mBc4KfnL5mDV0jrXEm0NSl8ZdTJ
	RQOPwA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfw9vkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 09:49:15 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46H9nEpg010137
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 09:49:14 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 17 Jul 2024 02:49:10 -0700
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <quic_wcheng@quicinc.com>,
        <quic_kriskura@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [PATCH v2 2/2] arm64: dts: qcom: ipq5332: Fix interrupt trigger type for usb
Date: Wed, 17 Jul 2024 15:18:48 +0530
Message-ID: <20240717094848.3536239-2-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240717094848.3536239-1-quic_varada@quicinc.com>
References: <20240717094848.3536239-1-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ucybO2nkGTVGl8r20cr3C7wRDFND0yDF
X-Proofpoint-ORIG-GUID: ucybO2nkGTVGl8r20cr3C7wRDFND0yDF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_06,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 mlxscore=0 mlxlogscore=499 impostorscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407170075

Trigger type is incorrectly specified as IRQ_TYPE_EDGE_BOTH
instead of IRQ_TYPE_LEVEL_HIGH. This trigger type is not
supported for SPIs and results in probe failure with -EINVAL.

Fixes: 927173bf8a0e ("arm64: dts: qcom: Add missing interrupts for qcs404/ipq5332")
Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index f58fd70be826..56304f996dbf 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -322,8 +322,8 @@ usb: usb@8af8800 {
 			reg = <0x08af8800 0x400>;
 
 			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 53 IRQ_TYPE_EDGE_BOTH>,
-				     <GIC_SPI 52 IRQ_TYPE_EDGE_BOTH>;
+				     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "pwr_event",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq";
-- 
2.34.1


