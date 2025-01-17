Return-Path: <linux-arm-msm+bounces-45395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D00A14E2D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 12:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 097F9167CC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 11:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CBC01FBEBF;
	Fri, 17 Jan 2025 11:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jQ1DKQJj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4C01F5611;
	Fri, 17 Jan 2025 11:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737111985; cv=none; b=qAjaWSb2VU9q+iOzdIJ2nyN5v7OyMuP6P0Yn9+gIOaoDsgatV7k+RjcxERsCY2SY0KPbYVD/1YRD3zrn9zHnlhaQLBiN0K6Ihue/8b1VydrSaU5dvRakoh9HvTNewDVrs15dD4TP0u9YVl/Cz5ijLIsxDUniyudTud9PT81c72w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737111985; c=relaxed/simple;
	bh=gWQGzp34YGOJg/WlRDrQfCtX/F5SzNrWF+wHX8uyTy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=cYyrdM3X9o3BMteCtufI9J3gw+mwc81DYSXWLIqNi9jCjMyDE3gBMh0M1vrw1FrUM+3EDhAsoy75HINX0nLd4VOnls0WPYfxflZYla3R87whSAWyQK6SSUBSxCqkbX6bjOqQ+VcQdZUN/sLPoZ5EFZd0ifLAktVMDpVvokLONo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jQ1DKQJj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50HAuqoC028702;
	Fri, 17 Jan 2025 11:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ubPmfS108o+i8bQNtEXM2u
	XlX05rg12se5tojkJ1MBs=; b=jQ1DKQJj/OWugHZJmLES3OcTUKG+F91SbpxwG1
	/t/cWji+e7VHOA+0qMCULc5qg/ngebI2BNHDJ/1C6TLiDOP+KUh2x89R4sQlNlMh
	5onKZQ1xnwBskJ7ctqBNraRSTG/RX5cVi6HGjYF7AtPLRrR1XGVgWrPKZQze/waG
	wLcequIQXkcwCit/iubruLbTKOSL4O2cI2tlCWS4XQ5vH23NTuuzFz7KxFPfAt8e
	1LM+MixQGjgAHYJqbwcTUbaUkjJvb9uN1/aIKZbj9BPT20nSqaSZgurtRWNqSUB7
	JmJe55ERh4E2p6AERxdx4R0A5BZoSqm7mdu0EyMy4CJzfr4A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 447nw900te-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 11:06:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50HB6A7J030588
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 11:06:10 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 17 Jan
 2025 03:06:06 -0800
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Fri, 17 Jan 2025 16:35:54 +0530
Subject: [PATCH] arm64: dts: qcom: sa8775p: Add LMH interrupts for
 cpufreq_hw node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250117-sa8775p-lmh-interrupts-v1-1-bae549f0bfe8@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAJE5imcC/x3MQQqEMAxA0atI1gZspbbjVWQWZYwacGpJdBDEu
 09x+Rb/X6AkTAp9dYHQj5W3VGDqCj5LTDMhj8VgG+saYzxqDN67jOt3QU47iRx5V3RTiJ15daH
 1FkqchSY+n/Hwvu8/iFF9S2gAAAA=
X-Change-ID: 20250117-sa8775p-lmh-interrupts-5f8a61968372
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Jagadeesh Kona
	<quic_jkona@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: s1rV6bG4Ar2MKrJJVxCO9ZDTSFw1Q38j
X-Proofpoint-ORIG-GUID: s1rV6bG4Ar2MKrJJVxCO9ZDTSFw1Q38j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_04,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 mlxlogscore=782 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501170089

Add LMH interrupts for cpufreq_hw node to indicate if there is any
thermal throttle.

Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
This patch was previously included in the below SA8775P DDR & L3 scaling
series:

https://lore.kernel.org/all/20241112-sa8775p-cpufreq-l3-ddr-scaling-v2-0-53d256b3f2a7@quicinc.com/

Based on Bjorn's review comments on the above series, included DDR & L3
scaling patch in it's dependent interconnect series and posting the LMH
interrupts patch separately here.
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 3394ae2d13003417a15e64c9e47833725ec779e6..1408b946dfd589aef49f25d805c5fa63d1e64543 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -4660,6 +4660,10 @@ cpufreq_hw: cpufreq@18591000 {
 			      <0x0 0x18593000 0x0 0x1000>;
 			reg-names = "freq-domain0", "freq-domain1";
 
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dcvsh-irq-0", "dcvsh-irq-1";
+
 			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
 			clock-names = "xo", "alternate";
 

---
base-commit: 0907e7fb35756464aa34c35d6abb02998418164b
change-id: 20250117-sa8775p-lmh-interrupts-5f8a61968372

Best regards,
-- 
Jagadeesh Kona <quic_jkona@quicinc.com>


