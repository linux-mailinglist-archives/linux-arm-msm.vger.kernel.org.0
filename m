Return-Path: <linux-arm-msm+bounces-33838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A9B998333
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 12:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C896128385B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 10:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689A01BE84E;
	Thu, 10 Oct 2024 10:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h5ODJud1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEEE1BE852;
	Thu, 10 Oct 2024 10:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728554984; cv=none; b=lGYAZzcsuOmUE3vJxvAgf3ZBwwQID7jeIPahoRyv5jO6VMaRCjZg5XvIYedSzbcqS/AjJuIm51fe41bJ9gSlmB62bZnKWYb4UsBpVjMnH1ttXfoRr4wp6gjoTjDyqgFKifXsoAu78RXN2Z2PSf2iPJIdjVApe51zeOssjWn2D0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728554984; c=relaxed/simple;
	bh=t9yatWe7nRQ838m04ADXgxXzpCRxPKfR9lSe5kVb5XA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Pji6Xd+Tb/9jrxFAf0qh7D7FcAE8fI9x7GLZTx7sZosUPbYf3RMUpYR0qw2YCTeLyipCGf1FKr6fnSsNFelWkY1FtZ6txGcQGkYYo6Q9XxMAhlRThmFS3emcxYbKNViRwbsrOthp7FSchyw22FbLfiaIo3LvK1ZvEesH97Vp+D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h5ODJud1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A1axEH022650;
	Thu, 10 Oct 2024 10:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+AkLIV4OxWHIhC3ef1Eb6zLyhLcKjp6xJ9lLLhNVFbc=; b=h5ODJud130hgCicw
	b33N06ZvYG9mQvjhruMf0oVSIqE6cEEwuYij7fohHxhLFcUq46g2OhdHYZzxzb2D
	zWRIDLfmh70De5yHoUMNvYUN4tG/Y0feHgI+6Fq4c63R59axOKoQ3SIbdThkRehp
	zxev4kgYe52E0msN2Hh1ODmpQSifRU74h91IRHHRNrz1LWsuA3Jv76N+SGY3BEJo
	jX1hixkLViWjbxYD1UCXOoGC1GKVoNlXV2uMFzuUtpkn8VeFVy00AxcHCfYc8KIj
	F9wpn0DP8uRTATbS77+m2l4hrn88Zbo10b599mPBW65WHwI7HHb2zdZLubwy94w3
	bWseag==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424ndyh1p3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 10:09:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49AA9cWV030323
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 10:09:38 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 03:09:34 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Thu, 10 Oct 2024 18:08:48 +0800
Subject: [PATCH v2 3/3] arm64: dts: qcom: qcs8300: Add LLCC support for
 QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241010-qcs8300_llcc-v2-3-d4123a241db2@quicinc.com>
References: <20241010-qcs8300_llcc-v2-0-d4123a241db2@quicinc.com>
In-Reply-To: <20241010-qcs8300_llcc-v2-0-d4123a241db2@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        Jingyi Wang
	<quic_jingyw@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728554962; l=1183;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=t9yatWe7nRQ838m04ADXgxXzpCRxPKfR9lSe5kVb5XA=;
 b=L0eLUPC0Aw6j+qv/KAimPTF405L0RKOIANJ5qPsqdUgBBbrENixOOEN+zzT527AVWAyzVY6FO
 zEoHWG4sH47BmPRSFJ7rQ2nUj+f3wY13aemjwUm2hznGzOyWVZ19Y6U
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3fTeOdKjuJ_JtrLw6mv1QY4Q5gkTBit2
X-Proofpoint-ORIG-GUID: 3fTeOdKjuJ_JtrLw6mv1QY4Q5gkTBit2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=613 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100067

Add Last Level Cache Controller node on the QCS8300 platform.

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 2c35f96c3f28..811c926c94f4 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -882,6 +882,21 @@ gem_noc: interconnect@9100000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		llcc: system-cache-controller@9200000 {
+			compatible = "qcom,qcs8300-llcc";
+			reg = <0x0 0x09200000 0x0 0x80000>,
+			      <0x0 0x09300000 0x0 0x80000>,
+			      <0x0 0x09400000 0x0 0x80000>,
+			      <0x0 0x09500000 0x0 0x80000>,
+			      <0x0 0x09a00000 0x0 0x80000>;
+			reg-names = "llcc0_base",
+				    "llcc1_base",
+				    "llcc2_base",
+				    "llcc3_base",
+				    "llcc_broadcast_base";
+			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,qcs8300-pdc", "qcom,pdc";
 			reg = <0x0 0xb220000 0x0 0x30000>,

-- 
2.25.1


