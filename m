Return-Path: <linux-arm-msm+bounces-36123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE8A9B29D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 09:07:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C0341C21964
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 08:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A526C1D3644;
	Mon, 28 Oct 2024 08:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nisJ7SSt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC941D2F73;
	Mon, 28 Oct 2024 08:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730102670; cv=none; b=QCeXaTAXFrZgikilyB10y0A9BvME+8XRHZvZvVSD4NfIKeeM9C9v8MDhoaHV6lHfakMTkBi1vCVfoCXyThFSs5LuGFeuUr2il7ZF1GdYm4r9gQ6/AgJbd3wyywWU+dl5pgXBI0sRF5+E/mT5L+Ks6cYWhuK5HnGKgWFkhrigO1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730102670; c=relaxed/simple;
	bh=SfWMCDrw37k+QlNp8lTM1T2TiCypdeWGvkX0wbHZ4Fo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cgF32Fm0EtGvEMZo2Z5idBjiyiGnku/dasRRfkWIf0U6Cgqspu/ITO+/Fm4K4wWRkAozEH3gT+9ZwC1KYDWel+5Eu+QMK5RZalGRqjR9Lq/IfSWmu4KY1U/XZYvUDclU2NG0R3xdb76CCLF3GeAuLyZFMAlCmvrspGFwSxTiCKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nisJ7SSt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RNt2nO001704;
	Mon, 28 Oct 2024 08:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SSQZt3AbTqDfYD3OY3yo9jNzMh0cfZhesYRY0PCALrQ=; b=nisJ7SStkQYcXm/H
	vEoRco0nB6LDaKO1EDvrLvdPkJnWXMm4VLzsOnpP1m9JbmVURGa2cPcfjC99NOXz
	hlhSpKZp8C0q4af0/M8sunEZ5VtkxI02l2czl1ATQAwqRiql7uY9eeed+aAQwtYu
	gw0GGVpNONa+WF0tv+DPD62Jii0MBzVVDGEbZJp88QC+JVGtLhUFWPuT60ORJ6l/
	P5jg6VcQpMCiUtvk3GAwFlb4yfRtgTs+CQfuFdU3q34zGDYGc6FiN8nviYz6Ybws
	ytZTPDWHh4jV9oKOKlxVWJo7yIZhU2LMCxkKxev9iepBXjT+h9/6JKhMQFDD+5Hs
	wweExA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqcqm6u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 08:04:21 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S84LLD032007
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 08:04:21 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Oct 2024 01:04:15 -0700
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
Date: Mon, 28 Oct 2024 16:03:25 +0800
Subject: [PATCH v3 2/2] arm64: dts: qcom: qcs615-ride: Enable PMIC
 peripherals
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241028-adds-spmi-pmic-peripherals-for-qcs615-v3-2-f0778572ee41@quicinc.com>
References: <20241028-adds-spmi-pmic-peripherals-for-qcs615-v3-0-f0778572ee41@quicinc.com>
In-Reply-To: <20241028-adds-spmi-pmic-peripherals-for-qcs615-v3-0-f0778572ee41@quicinc.com>
To: <quic_fenglinw@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <kernel@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Tingguo Cheng <quic_tingguoc@quicinc.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730102647; l=1084;
 i=quic_tingguoc@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=SfWMCDrw37k+QlNp8lTM1T2TiCypdeWGvkX0wbHZ4Fo=;
 b=8j6KOV7Z9cy89+jiAPCiTzdJk16wxqBzrWLCJzR4dIjDNOupVOuAyD3xejsO6xscw4dygKdzT
 /ZeXk4ji2JXCvhWCFQPYCTGioMlKsIdWM1oucoPoakhWZpuo+cBamfM
X-Developer-Key: i=quic_tingguoc@quicinc.com; a=ed25519;
 pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OQ0fS_3plxuziYK2srEh4OjJQPsQa5oK
X-Proofpoint-GUID: OQ0fS_3plxuziYK2srEh4OjJQPsQa5oK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 mlxlogscore=754 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280065

Enable PMIC and PMIC peripherals for qcs615-ride board.

Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index ee6cab3924a6d71f29934a8debba3a832882abdd..37358f080827bbe4484c14c5f159e813810c2119 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -6,6 +6,7 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "qcs615.dtsi"
+#include "pm8150.dtsi"
 / {
 	model = "Qualcomm Technologies, Inc. QCS615 Ride";
 	compatible = "qcom,qcs615-ride", "qcom,qcs615";
@@ -210,6 +211,20 @@ &rpmhcc {
 	clocks = <&xo_board_clk>;
 };
 
+&pon {
+	/delete-property/ mode-bootloader;
+	/delete-property/ mode-recovery;
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };

-- 
2.34.1


