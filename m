Return-Path: <linux-arm-msm+bounces-34895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7169A3749
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 09:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96CDDB23B88
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 07:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A7D18C035;
	Fri, 18 Oct 2024 07:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B48VS0t0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E8F189F57;
	Fri, 18 Oct 2024 07:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729236870; cv=none; b=L3WfLBB0G/YSnSDEirr8sWck+DNheJy78xyVvKhEWOGQa2+MdBA31o1TKrFbiALnF2ZGP0qF18EfGQfS5IbLvO3RD+xsjVzyydwGaOPsggOYArFh7gYDVqFvAlIyz8duMchypNXRF9E0WqYAfmYWRgUttK94/66goqFUz0Bg4rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729236870; c=relaxed/simple;
	bh=Sp6BRb6z97UF3k/PM3lcbtyZXgUlurGDHVzA5sHFpKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ef73r/f/vJyOAsCcQWT4ysVrwJ/g1cK3U9pG5XUuIGDJXjdaVj1xA50i9Ix4+1K63wGVN/iBG5l8uyAGmrn+24DVtAQJYbAXOhlksDFg0qqH90L7hDPKpscyOgKJ/y9zTC6SiZYBjppheXpaozqsT/B8GodWfyvVfjSSkj1Dw7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B48VS0t0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I5VHLc008326;
	Fri, 18 Oct 2024 07:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3EZTDR8k5oY
	4N7qcqlHaAd0AtLOkriPtF8jGFblgV1o=; b=B48VS0t0fhCJE65cU0hqA9YeEuq
	9kWQ72YlFWgxiHHYr2Ek7cfGUbI2xDeWZgaZQLpCbGGCGosiP6fWeku7y1zdabWB
	JUdznUMzmUhmMxjkW4/sC6QAsvH36FXlNrbTP3cGlZHYmAGar/klXw/3Rz4I8EE6
	v3gpziFGMVM7wWvZlrELhVMDioqSXAeinGkknoZqLA+M7oNxGbeMYGcatALMZTLc
	+PERWBFSLVUkz+1yXdv1lz2qsCLOg26921duu+76sROGs8xQGauiR39XNOLp9lBM
	ibFXCPqtG9B8WGdDsnuQhfZUN/6R04mmIkP2a9OIInfeJhKFTlyWiNpzfLA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42b5hst76c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 07:34:24 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 49I7YLCv001446;
	Fri, 18 Oct 2024 07:34:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 427j6m3yj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 07:34:21 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49I7YLlv001436;
	Fri, 18 Oct 2024 07:34:21 GMT
Received: from chunkaid-gv.ap.qualcomm.com (chunkaid-gv.qualcomm.com [10.64.66.109])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 49I7YKY8001434
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 07:34:21 +0000
Received: by chunkaid-gv.ap.qualcomm.com (Postfix, from userid 4533072)
	id 5127321C63; Fri, 18 Oct 2024 15:34:19 +0800 (CST)
From: Kyle Deng <quic_chunkaid@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_tingweiz@quicinc.com,
        quic_aiquny@quicinc.com, quic_sudeepgo@quicinc.com,
        quic_taozhan@quicinc.com, Kyle Deng <quic_chunkaid@quicinc.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: qcs615: add AOSS_QMP node
Date: Fri, 18 Oct 2024 15:34:17 +0800
Message-Id: <20241018073417.2338864-4-quic_chunkaid@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241018073417.2338864-1-quic_chunkaid@quicinc.com>
References: <20241018073417.2338864-1-quic_chunkaid@quicinc.com>
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
X-Proofpoint-GUID: 1-be_SzY6A6ofXDEoOSUI7pBKug_Tql8
X-Proofpoint-ORIG-GUID: 1-be_SzY6A6ofXDEoOSUI7pBKug_Tql8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=696 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180046

Add the Always-On Subsystem Qualcomm Message Protocol(AOSS_QMP) node for
QCS615 SoC. The AOSS_QMP enables the system to send and receive messages
on the SoC and uses the same hardware version as sdm845.

Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index ac4c4c751da1..a36debf36f82 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -512,6 +512,16 @@ pdc: interrupt-controller@b220000 {
 			interrupt-controller;
 		};
 
+		aoss_qmp: power-controller@c300000 {
+			compatible = "qcom,qcs615-aoss-qmp", "qcom,aoss-qmp";
+			reg = <0x0 0x0c300000 0x0 0x400>;
+			interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
+			mboxes = <&apss_shared 0>;
+
+			#clock-cells = <0>;
+			#power-domain-cells = <1>;
+		};
+
 		sram@c3f0000 {
 			compatible = "qcom,rpmh-stats";
 			reg = <0x0 0x0c3f0000 0x0 0x400>;
@@ -528,6 +538,13 @@ intc: interrupt-controller@17a00000 {
 			redistributor-stride = <0x0 0x20000>;
 		};
 
+		apss_shared: mailbox@17c00000 {
+			compatible = "qcom,qcs615-apss-shared",
+				     "qcom,sdm845-apss-shared";
+			reg = <0x0 0x17c00000 0x0 0x1000>;
+			#mbox-cells = <1>;
+		};
+
 		watchdog: watchdog@17c10000 {
 			compatible = "qcom,apss-wdt-qcs615", "qcom,kpss-wdt";
 			reg = <0x0 0x17c10000 0x0 0x1000>;
-- 
2.34.1


