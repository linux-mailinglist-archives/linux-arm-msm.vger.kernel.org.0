Return-Path: <linux-arm-msm+bounces-39810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D53589DFD62
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 10:38:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6215D1618CC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 09:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3C01FBEB3;
	Mon,  2 Dec 2024 09:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PXCHcr4B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD7B1FBEAA;
	Mon,  2 Dec 2024 09:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733132296; cv=none; b=kkVkbHSv2RTKTT53nzCK6FEZYXg/fjLFG9u2YE0Xw59PvOReHa6o/EjxlQ+P285IMJn/AuiLbz72CjZp3hQQ4lKjVgtUswa+3tj/3nhOuJXwzH1iCNTOYH6RtaGM5Q9XdO05wSpGADtoCpurwTpGWxOs6YsBQJwmY5BTBiKtAEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733132296; c=relaxed/simple;
	bh=PUCL6IyC0pYB6tMfy6hltdUBwGeFHk3ER6ZVdQFYGHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=XUqam9fcEyWVzlgohYqsJe4XnLpOB+yOJOupuPFzruAEMmwst4AbYDTTL4JQKfEGcoee8e6YhThkBVvjCAfEOsEy+fHbhlpIIHMEY7ev+CQU0h1d7qvE3N2QqvzMYgFg559/iJBheD3FnY5kNoBXz16LOSCm5KimeIpq/YQ7K0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PXCHcr4B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B28aPwN003922;
	Mon, 2 Dec 2024 09:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+tonBH7YMIajOVt2imWKV44Tein9ZfCBMGwQpwb3VDw=; b=PXCHcr4BHbu8ICTl
	X6YLXYUbe+MREQDu8fUg4DY5IsaT95aCgPHTKxiaK7MZH7vvDSbLCjubAYX3cV26
	C3NBMrCqLO2fkQ+WyjeZFjNdVK3xPTx8F1m4ITGwdqKadw9x0LkMe8qHvG+QMzWu
	hNK9WfPRqZOxCJdVqqTr5XC4d4PK0S/BePz3VuwA9kgVF9t0jd0QljZvV+VEMa58
	s+mHL1CUGleOoFU5N05W3icqx39Qqv+EJ439KK30N6if4WIhA4A1IjAJQEbQRWNZ
	SL/8Kci3NpOPVfEH0xZn3YPDDTyGViZbyidmYNtz1FEVrdf/45hZUjtRgKzH0orV
	nwD9DQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437ta2var6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 09:38:12 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B29cB6e027154
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 09:38:11 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Dec 2024 01:38:04 -0800
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
Date: Mon, 2 Dec 2024 17:37:24 +0800
Subject: [PATCH v6 3/3] arm64: dts: qcom: qcs615-ride: Enable PMIC
 peripherals
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241202-adds-spmi-pmic-peripherals-for-qcs615-v6-3-bdd306b4940d@quicinc.com>
References: <20241202-adds-spmi-pmic-peripherals-for-qcs615-v6-0-bdd306b4940d@quicinc.com>
In-Reply-To: <20241202-adds-spmi-pmic-peripherals-for-qcs615-v6-0-bdd306b4940d@quicinc.com>
To: <quic_fenglinw@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <kernel@quicinc.com>, <quic_eberman@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Tingguo Cheng <quic_tingguoc@quicinc.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733132272; l=984;
 i=quic_tingguoc@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=PUCL6IyC0pYB6tMfy6hltdUBwGeFHk3ER6ZVdQFYGHw=;
 b=3GqWGsF5kt3GFXTxqk7iCmmXqmFeXcyMoHHD7NtvhrC/5umlJuNRzX3AvZYVPZGeR5B2c54yl
 Z/Sf47yTBiqA78Dh+CBUOLTA50j/U/M6CiwKplP+1rsAUDb9wVmk4Qi
X-Developer-Key: i=quic_tingguoc@quicinc.com; a=ed25519;
 pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Lx9SmBt4zxEVJPr13vTiQ4TntGzhC9oJ
X-Proofpoint-GUID: Lx9SmBt4zxEVJPr13vTiQ4TntGzhC9oJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxlogscore=871
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020085

Enable PMIC and PMIC peripherals for qcs615-ride board.

Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index ee6cab3924a6d71f29934a8debba3a832882abdd..4e2f39c78546b4a2a95914fd4aa55d92b9670cb5 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -6,6 +6,7 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "qcs615.dtsi"
+#include "pm8150.dtsi"
 / {
 	model = "Qualcomm Technologies, Inc. QCS615 Ride";
 	compatible = "qcom,qcs615-ride", "qcom,qcs615";
@@ -202,6 +203,16 @@ &gcc {
 		 <&sleep_clk>;
 };
 
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.34.1


