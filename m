Return-Path: <linux-arm-msm+bounces-48596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD049A3D071
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 05:24:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D0903BB2EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 04:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583AE1E5710;
	Thu, 20 Feb 2025 04:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DfbY6NRi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B461C1E0B86;
	Thu, 20 Feb 2025 04:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740025414; cv=none; b=uyOylJabX2JkU9ErfkEGjGtQo9gZh997EkdoHA5RqnHErXkMNXTs846Y2Ogd/6MqLELUwRKp98/KXUbbNKBuujFDpU/K7gLKrBMF4PmGw3yzUk/Rf3TbISjadXBg2bAN5TGjKoWWa1UFDk1nvYr2YAd+LFTlqHXeUmwTsoMezV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740025414; c=relaxed/simple;
	bh=2LlSLq0Q9h1mOmh0g3tWUov96vdr+IkxaaloimRXVJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=CQSBVgz9bDRX2YqH4Wwx64BxubUxdyG/4tYjspc7ogN7LoY/pg2bXXS5SVBMOdJOlTKpjJ7UYpgVkcxFFE3n35BNcdV+UPNT4qo4/nb4aLXyxJ0b7GlP1FsB7NamnvQSxf0ppi1OVJdOmM1p6KlpSTCCwKyHqfOaMZpLggTo69M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DfbY6NRi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JGJxRn011610;
	Thu, 20 Feb 2025 04:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MygQiopjGSOuPdkBkz7WmdkHqJvYG9kn6r8Y6zd0ICw=; b=DfbY6NRiDLayZPgL
	xyLqgeDzO4Q1ImcsGFasiN8kxwR8E+UNoYFqpMiM2EWUXiujCHM21KIoilJ/UKor
	N2zI+16GFKUcidZoXYkEjFDGHXUJztodCsu5+o68lrshiLQftnEoFOnN3wS4wpYm
	mHhc1p06NmsgoZyw7ByUsP3OWmXEZGGDAfcMgLpN6s/sG7l2LBJQ2w8aYaIlrWZe
	gMTJinvqHxPEBYMGBOcAxj+HsKswwEBt/kY1Hpmpvu32FSrNHpIB2ZDZv6ZaA8lj
	Z6oJJffTkjqcIk/A/x+71YJuKr1zon8D8Z73GM5AFH3TLswNNfySBp8Jom6kCHRo
	9mvfoA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy3mt2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 04:23:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51K4NR11027243
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 04:23:27 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Feb 2025 20:23:23 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Date: Thu, 20 Feb 2025 09:52:53 +0530
Subject: [PATCH v4 4/4] arm64: dts: qcom: qcs6490-rb3gen2: Update the LPASS
 audio node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250220-lpass_qcm6490_resets-v4-4-68dbed85c485@quicinc.com>
References: <20250220-lpass_qcm6490_resets-v4-0-68dbed85c485@quicinc.com>
In-Reply-To: <20250220-lpass_qcm6490_resets-v4-0-68dbed85c485@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9YWJoEcpjA77UIPKyGmnHGkxVQ-J-Qis
X-Proofpoint-GUID: 9YWJoEcpjA77UIPKyGmnHGkxVQ-J-Qis
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_11,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=942 bulkscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502200027

Update the lpassaudio node to support the new compatible as the
lpassaudio needs to support the reset functionality on the
QCS6490 RB3Gen2 board and the rest of the Audio functionality would be
provided from the LPASS firmware.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 7a36c90ad4ec8b52f30b22b1621404857d6ef336..057bbb187ab35a7e6cca9cff6a3e4569ae045fe2 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -986,3 +986,8 @@ sd_cd: sd-cd-state {
 		bias-pull-up;
 	};
 };
+
+&lpass_audiocc {
+	compatible = "qcom,qcm6490-lpassaudiocc";
+	/delete-property/ power-domains;
+};

-- 
2.48.1


