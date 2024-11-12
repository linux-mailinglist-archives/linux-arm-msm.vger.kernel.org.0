Return-Path: <linux-arm-msm+bounces-37609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4999C5827
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 13:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE5B31F22BF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 12:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81AF12101B8;
	Tue, 12 Nov 2024 12:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IMSwHSXn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F133D20EA37;
	Tue, 12 Nov 2024 12:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731415486; cv=none; b=FptXKhNhgQwJMpx3z9ZQdm2e1MptXIfdMUA+Zxp59Y1NlRuLJaFP3OdZfvk+IuTtadd0obFOGr6sKeYWc/grElGPZ/H5vwfnUBCHZTeyTvBriOiSnYdUhNpSfBOmYyVOK7bMeB0x+fNai3YDMtKNTrsh6LtjnMHBwPn21vIZ+rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731415486; c=relaxed/simple;
	bh=N9mlZ8J6KdZGAQ2Isl9kVIcg/h1GJH9GWbDyWrwc5Y0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tn8kQL2ia85d6NIUnkp3S9H4V+H88v2uvisHv3MUkNgN6JyRuVXAKRo6ayE1sbGVLY45N0D25RRLBXJ+IJB+wf5A42k2IAx2XnwLphJACENwJ7QR1rjSqZ740A59QvUPrUNaKNmmG+0b8FvClNiCFWO/UiEKwNoNM5fpXlGYo24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IMSwHSXn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACCZr3D004988;
	Tue, 12 Nov 2024 12:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0BwYYTSRGHHFY2hWn8M5VccDmZlE2b06RKKNRWOlNYM=; b=IMSwHSXnPG/EVVBo
	wiYfwwcjYllfSFCkSFDMg/GbIQL72eefG8RjLjYBtWOubrl5xaoOQHynkp15B6um
	2wD5ig9LhFbkbcsYw88j5EpytGnnNipfXaWvRiOrfDbZRLXiOVq2pBbNdwvkLirh
	7IZ5iZBMRsw3fDjOXNplOG3fnqiuJGb/WeIzH1q5PGUycLNJIUNlNG78dyxWHfHx
	Bq6rQvkD+aL+8rr6fgRxkV/iOn1Z8+PbmyIfS+12zoHSgprPhBEE9t3/TegT+5W7
	ZO9ev8gDu9YFU/nTyeWZ+ExD0AnmJmRfRh/ugukY9uwP3WeAUD/WwHcTC3gUeTkD
	W4Pwag==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42uwt5hf0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 12:44:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ACCifeC003840
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 12:44:41 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 04:44:38 -0800
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Tue, 12 Nov 2024 18:14:12 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: sa8775p: Add LMH interrupts for
 cpufreq_hw node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241112-sa8775p-cpufreq-l3-ddr-scaling-v2-2-53d256b3f2a7@quicinc.com>
References: <20241112-sa8775p-cpufreq-l3-ddr-scaling-v2-0-53d256b3f2a7@quicinc.com>
In-Reply-To: <20241112-sa8775p-cpufreq-l3-ddr-scaling-v2-0-53d256b3f2a7@quicinc.com>
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
X-Proofpoint-GUID: suFO7UjlixLKUHM0MHoKd0bGFy0CMejN
X-Proofpoint-ORIG-GUID: suFO7UjlixLKUHM0MHoKd0bGFy0CMejN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=514
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=1 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120103

Add LMH interrupts for cpufreq_hw node to indicate if there is any
thermal throttle.

Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 1d2b45bde03fa28b47639ce4f4d7c38e352d84de..9a03a87bf2026516b6deb3bf3e87c7af95bebea1 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -4510,6 +4510,10 @@ cpufreq_hw: cpufreq@18591000 {
 			      <0x0 0x18593000 0x0 0x1000>;
 			reg-names = "freq-domain0", "freq-domain1";
 
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dcvsh-irq-0", "dcvsh-irq-1";
+
 			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
 			clock-names = "xo", "alternate";
 

-- 
2.34.1


