Return-Path: <linux-arm-msm+bounces-29128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C028958878
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 16:04:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42519284556
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 14:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A94192B77;
	Tue, 20 Aug 2024 14:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jvYFVrNd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6862B191F98;
	Tue, 20 Aug 2024 14:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724162622; cv=none; b=FHBfQAsQHen4oCUOfFi6u+0h9sMvghdgRCG5auuaSdeO+KUrgIbDi6rtZjfdaDyKZKJgbZ6y1IRCAVlA+XoCnya1iT0hrvn3Xhg5xTpiQpxj7xxa81bYBP2cunCkSrKb/2V5J7XD6lsy/z/PUsT+zdHKoPABRoewBl0Xz7LQ57s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724162622; c=relaxed/simple;
	bh=BXLzjHsDdlP1HfH4WWl0ox24k0KbUFG4bZuTc/GS5QQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=PR3nEoluIPkXNFeMVuUi6mxC3fXHvu66btd3kA7Hf7ns9Sbeu3Ltog79ztos9NuWh8YF5PME4i7TjHCrd+KhDjon9YP71weTNpStlUMV8jRyr9XmPyXBdcfxa9IkNyeYj2gCfC3zcyl/P9m/UbwD67Ek5pXsxQMhnj6NPggJjW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jvYFVrNd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47K8oZdZ009642;
	Tue, 20 Aug 2024 14:03:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/T4gFxo7qcmwVAciHUmRBqQgxHU50f2+osgmPhgIk8Q=; b=jvYFVrNdxiHZVEn6
	jENClj6upvFFLkbxueq0QBykerKurhRM8OaxrFW9rAtk4S/SMqb5/NKW3Yh6nl6p
	T4vU59IcDgn7CQQPQ8zGtP9xp2HCWOP7ljgBjz4V4Saov67rINii/dpw7h6eoLED
	/7BZk1FI4IEMDtOZKpJuMzln/qpiaTmBYNH4d48H4RTGhN9LIsnO3zB/0m1VeuLb
	UNxOI+nGFI9a9j1Cp++kGKpyg4JbO6rhQR46Dy1R/BVIOHwSAoXZbNfxhmi5O0CG
	WtQXN6nq8+86A5mjHXHVNnyYA8nepA/sXtFVdT3sHiy+BUYwWBgcGE40/cOCOLo2
	pNqNjA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 413qxg5nqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 14:03:32 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47KE3VFR015467
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 14:03:31 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 20 Aug 2024 07:03:26 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Tue, 20 Aug 2024 22:02:44 +0800
Subject: [PATCH v2 3/4] arm64: defconfig: Enable Qualcomm IPQ CMN PLL clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240820-qcom_ipq_cmnpll-v2-3-b000dd335280@quicinc.com>
References: <20240820-qcom_ipq_cmnpll-v2-0-b000dd335280@quicinc.com>
In-Reply-To: <20240820-qcom_ipq_cmnpll-v2-0-b000dd335280@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <bartosz.golaszewski@linaro.org>, <srinivas.kandagatla@linaro.org>,
        Luo Jie
	<quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724162592; l=1050;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=BXLzjHsDdlP1HfH4WWl0ox24k0KbUFG4bZuTc/GS5QQ=;
 b=cOGpxlO7+t7dRBA0Jg69f2Ym6lTRsCBrxKnK3d1zZRlM8D8ewVvv+IEwxJ9sz0QtiYPYOGdEg
 d8g+9rVAVPBAJH97sGi4IOorCyXe9RYnD2OK4HSEiJ7rLI1CRLPUio4
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PCPVwOa3lcqGYIyTTxqdfyqgdeI3xkG8
X-Proofpoint-GUID: PCPVwOa3lcqGYIyTTxqdfyqgdeI3xkG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_09,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=759 malwarescore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 adultscore=0 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408200104

The CMN PLL hardware block is available in the Qualcomm IPQ SoC such
as IPQ9574 and IPQ5332. It provides fixed rate output clocks to Ethernet
related hardware blocks such as external Ethernet PHY or switch. This
driver is initially being enabled for IPQ9574. All boards based on
IPQ9574 SoC will require to include this driver in the build.

This CMN PLL hardware block does not provide any other specific function
on the IPQ SoC other than enabling output clocks to Ethernet related
devices.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 01dd286ba7ef..1bc7bd86e589 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1300,6 +1300,7 @@ CONFIG_QCOM_CLK_SMD_RPM=y
 CONFIG_QCOM_CLK_RPMH=y
 CONFIG_IPQ_APSS_6018=y
 CONFIG_IPQ_APSS_5018=y
+CONFIG_IPQ_CMN_PLL=m
 CONFIG_IPQ_GCC_5018=y
 CONFIG_IPQ_GCC_5332=y
 CONFIG_IPQ_GCC_6018=y

-- 
2.34.1


