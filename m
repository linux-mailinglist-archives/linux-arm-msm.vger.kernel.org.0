Return-Path: <linux-arm-msm+bounces-34678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7F09A18DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 04:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC5BE1C21557
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 02:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD742146A69;
	Thu, 17 Oct 2024 02:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a4DSrky7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD02C7DA6C;
	Thu, 17 Oct 2024 02:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729133609; cv=none; b=Aglh5kZGBnkhRf5ZMCdkyRaZ2Y3vZuE0ZtFIQsab7xuHPy3i2OiiVy/sF80gV7uEmEwK1fOsvSIuVfUAkXr8CnYFwlaK4cW6K4RZQP+gDN264reBc0Afjo4tRxpEHX46sKGkgnkJ74rmdJM2v8VQSQI0mglc0I4UcCKXSR9vWJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729133609; c=relaxed/simple;
	bh=+dGH/HpYMfOnmBBWg90LH3mU7k/mHLl6NWin9j0RgDw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OmZH8C1oQGcRof4AtrUrzUPavCohaD2T5n8/268ONOsyF3lbsaENVrXxb9f5xtP1cjIl6+2pgUvrABCElaBf0GehGd5QrLFQxyDBTOFD1KBFVFaX+m3qfCSZTzsGlJZP6CZ+PkPdnBaKVIq0h9Ch99BvlASqBS9jsBJnY/K0Y74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a4DSrky7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GKU1Ep011278;
	Thu, 17 Oct 2024 02:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XPNKO+JYOb0
	NtvNLl4EykAcIODz7uJBHj+pQnQevEPk=; b=a4DSrky7prUv4RG7jjJWgAomsx8
	Dhgq9AgBycQvWoUsSEmLVy+NdVVHQySoIaNdf3/0XQ7AiJTK/2WHCNDdnuGQW0Rs
	WTNxPRkP2IYb6MZ3mZnKWBAODnDbu17zR0RsMonirFmtt0DHx6bjCAXcx2TowXij
	eEVsS/zOfz9Y7jGRITvy42xXlcYOV3SFgULydmUh6kd2hENcZR1o2A2ni7sABq35
	VLoATF0tFKBDyQaXSrE6NHoPqaKMPbA964CwhidUPh1gAh+KEaGM78Mv8MgOl+zX
	OVxZifZQ9mQ8vJNWXhRU3Du0iyi481hwbc82ZhJQ/tLiFXI8qV9RcDiVGVw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42abm5jgug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 02:53:21 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 49H2rIwu023692;
	Thu, 17 Oct 2024 02:53:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 427j6kxfhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 02:53:18 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49H2rI0m023678;
	Thu, 17 Oct 2024 02:53:18 GMT
Received: from chunkaid-gv.ap.qualcomm.com (chunkaid-gv.qualcomm.com [10.64.66.109])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 49H2rHJU023675
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 02:53:18 +0000
Received: by chunkaid-gv.ap.qualcomm.com (Postfix, from userid 4533072)
	id 6EB5B2206C; Thu, 17 Oct 2024 10:53:16 +0800 (CST)
From: Kyle Deng <quic_chunkaid@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_tingweiz@quicinc.com,
        quic_aiquny@quicinc.com, quic_sudeepgo@quicinc.com,
        quic_taozhan@quicinc.com, quic_jiegan@quicinc.com,
        Kyle Deng <quic_chunkaid@quicinc.com>
Subject: [PATCH 3/3] arm64: dts: qcom: qcs615: add AOSS_QMP node
Date: Thu, 17 Oct 2024 10:53:13 +0800
Message-Id: <20241017025313.2028120-4-quic_chunkaid@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017025313.2028120-1-quic_chunkaid@quicinc.com>
References: <20241017025313.2028120-1-quic_chunkaid@quicinc.com>
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
X-Proofpoint-ORIG-GUID: bQbRSCm1ht4rvObHDS7-2N78jBEeUzjX
X-Proofpoint-GUID: bQbRSCm1ht4rvObHDS7-2N78jBEeUzjX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=713 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170020

Add the Always-On Subsystem Qualcomm Message Potocol(AOSS_QMP) node for
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


