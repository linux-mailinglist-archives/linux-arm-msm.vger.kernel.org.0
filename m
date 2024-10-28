Return-Path: <linux-arm-msm+bounces-36122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 815689B29D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 09:07:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 401F9285BC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 08:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904AD1D0488;
	Mon, 28 Oct 2024 08:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cRJTk2eS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD741CC89D;
	Mon, 28 Oct 2024 08:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730102662; cv=none; b=h0ZVghrfHOANqEQjAByJSzJ6fxQs9TwxHz18w5RaI4AOYMPUvrwdrOKEv9SXjEXNKjO0NowobM8gFNt/Ig6fv4EkIHBjER1DebM3LO7FZdQ3wDXLUjahzxoKNyeuHXho+Y3Xymef451vR9We6MYITkXKa05I5X4cvKfl/DlcUmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730102662; c=relaxed/simple;
	bh=s3XZv6gf3stsT2L5XpO5hMBGN8Fg6HGRfvXTnGGbTMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=hRkPES7dioDOGTDU8zJKRH2E/E8J1iG9EiDvDjDAMgLXTIH1HnJG6i7AsgK5WEGMC2DJZ/5zbS1VAjM9efnc865gngnjsf0mSunn5DBNC6sSHJDa/0bBvBaZlN/NaVKTxiQbTOEeCS5m3MC0dpNdVWCWCYj2sI7oiWAiJDp2usQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cRJTk2eS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RNwd3m015786;
	Mon, 28 Oct 2024 08:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tQZYN8QInHdOcCV03qsrvs5ErWtsDY314KLtfWivkj8=; b=cRJTk2eSR6w8y/80
	uDxhde7jG6hKBdyYi7/lfvw2VkjdcWm3N9lSB/TjMmUu5upmtKEQ6MOW7/oOnSaj
	jYE1Njrz/3uPbbb7YVnX7QZRVyfQjoBJPvz4gfzX1fH12785nTCADsFEXQrvmE/o
	F7uoPN4xTp5gfyO85oQoFlW9Nq7mrEYENMcuN5A94XOsIsXn6+xTpZBwPGE3MESy
	v7/vq2/LsNWoD8bgYNI2hEX4fZh4ZPq48LhHvHFy3GsQNsTaPKwpQbLW1uIT0OIb
	UPraOP25Nt5FKey6MbQi4cTdsp3LyKoaNgTaA2cavYy8kaJtdQ8WfO5ElKSAgyAM
	jpHCtw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gp4dva0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 08:04:18 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S84H6s012201
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 08:04:17 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Oct 2024 01:04:11 -0700
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
Date: Mon, 28 Oct 2024 16:03:24 +0800
Subject: [PATCH v3 1/2] arm64: dts: qcom: qcs615: Adds SPMI support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241028-adds-spmi-pmic-peripherals-for-qcs615-v3-1-f0778572ee41@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730102647; l=1396;
 i=quic_tingguoc@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=s3XZv6gf3stsT2L5XpO5hMBGN8Fg6HGRfvXTnGGbTMw=;
 b=XrJmRBpz4LRiNprEw6dysUKRLrURnmGo0NiydOG1RACSTz5cYHLTFNfCHWIvs7J6F3qMANUiA
 vlyp0FozF0lD5CqzM+lcQLYfYYTwDRgO39vjxs5iWusSyNpUyvTtJ2n
X-Developer-Key: i=quic_tingguoc@quicinc.com; a=ed25519;
 pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6tYxJY3JKdYhj_b-4ldJcZYQd7iP_WHd
X-Proofpoint-GUID: 6tYxJY3JKdYhj_b-4ldJcZYQd7iP_WHd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=754 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280065

Add the SPMI bus Arbiter node for the PMIC on QCS615 platforms.

Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index ac4c4c751da1fbb28865877555ba317677bc6bd2..3fc928913239cfc61c24d1b16c183b96f38e589d 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -517,6 +517,29 @@ sram@c3f0000 {
 			reg = <0x0 0x0c3f0000 0x0 0x400>;
 		};
 
+		spmi_bus: spmi@c440000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0 0x0c440000 0x0 0x1100>,
+			      <0x0 0x0c600000 0x0 0x2000000>,
+			      <0x0 0x0e600000 0x0 0x100000>,
+			      <0x0 0x0e700000 0x0 0xa0000>,
+			      <0x0 0x0c40a000 0x0 0x26000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr",
+				    "intr",
+				    "cnfg";
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "periph_irq";
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			cell-index = <0>;
+			qcom,channel = <0>;
+			qcom,ee = <0>;
+		};
+
 		intc: interrupt-controller@17a00000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */

-- 
2.34.1


