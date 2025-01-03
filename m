Return-Path: <linux-arm-msm+bounces-43826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E19A8A0046D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 07:37:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 646A97A1795
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 06:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D631B0424;
	Fri,  3 Jan 2025 06:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gaz9UZk3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E9316F8F5;
	Fri,  3 Jan 2025 06:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735886252; cv=none; b=ZErM/hny51Gq8uNCZRC3g6wMrx0xTqAZgZmyHSaMVNaOs+WZSyVkhDyHrHY5phy7mhPQ6+/HbQEw/+aZm/DMhXkwwmgDxcoJdwY6TRBMOLGcGUaspheSMDME/thCvjx8XBLhUaPodQnQqaQygFy19FEoEHSpu6wCWrgAzDWLlH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735886252; c=relaxed/simple;
	bh=ctAYZxUNtAv+23j9JqRfH1I0Gf+RGb9MtE8oOnethfU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KF8p/CqtX3yp1mHLErHofzzMWb/sieIIuUBYqxXwTL6VefF4EhTMuj0u2vKR32/DZxY0nDP9LQSyNRAL0kex3prkvWg1f3VthpIc9nDyRjqVd+AFMVROc2MwdCs0xJbnEjzlYtkB3+mbtqG6RCKxVXQ0FOTw0Sy4Q7n1RmiEL48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gaz9UZk3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 502G1LW3005804;
	Fri, 3 Jan 2025 06:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yyq86aoK+gQcA19FXhE8/hmBMZJgphER5nyyhuk+zAc=; b=gaz9UZk3T4+CrMjh
	a0Pqz1PEMj/3VKbdLxnk93RmIZWdtAxLlxXYvDkYqQdpQVbuOgkOBy+azn/mQR6z
	gJa6vfkVDJuCqoUyfo3pudsQpcUxpSpindlFYjNPxiIF2GP7Nc9IWVmckVtz125V
	VOnY2NCaRqIUDobVVwaylLC+Jsllk4Tni+YJQYlnWAf0fdzAl6XZef8P6Izmt90Z
	daJmUW1hh+BtYXTT4rE3wFkfnZeYe8fkstmOVrIQOdc/9jc4FXIRk/ji7QVrKiS+
	YX97vW4LyQ7oxxRm2iLifHP5+RPcLNY92jdxCxGVh9liv+FWd3dm/AJrf2+5Yg1n
	onGvTQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ww1p1p7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 06:37:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5036bRLV027026
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 06:37:27 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 2 Jan 2025 22:37:23 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
Subject: [PATCH v4 1/2] arm64: dts: qcom: ipq5424: add spi nodes
Date: Fri, 3 Jan 2025 12:07:07 +0530
Message-ID: <20250103063708.3256467-2-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103063708.3256467-1-quic_mmanikan@quicinc.com>
References: <20250103063708.3256467-1-quic_mmanikan@quicinc.com>
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
X-Proofpoint-GUID: -iP-rRB-V3apfTUdsbieBFY8n1v6dfjg
X-Proofpoint-ORIG-GUID: -iP-rRB-V3apfTUdsbieBFY8n1v6dfjg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 adultscore=30 phishscore=0 spamscore=0
 mlxlogscore=884 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030055

Serial engines 4 and 5 on the IPQ5424 support SPI. Serial engine 4 is
exclusively dedicated to SPI, whereas serial engine 5 is firmware based
and supports SPI, I2C, and UART.

The SPI instance operates on serial engine 4, designated as spi0, and on
serial engine 5, designated as spi1. Add both the spi0 and spi1 nodes.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
Changes in V4:
	- Revert the 'renaming of spi0 to spi4' and follow the existing
	  naming convention such as spi0 and spi1.
	- Update commit message.
	- Add spi1 node. 

 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 5e219f900412..5ad250c77a1d 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -201,6 +201,28 @@ uart1: serial@1a84000 {
 				clock-names = "se";
 				interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
 			};
+
+			spi0: spi@1a90000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x01a90000 0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_SPI0_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi1: spi@1a94000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x01a94000 0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_SPI1_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		sdhc: mmc@7804000 {
-- 
2.34.1


