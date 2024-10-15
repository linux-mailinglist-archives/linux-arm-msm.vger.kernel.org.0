Return-Path: <linux-arm-msm+bounces-34456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDC499EF25
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 16:18:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 438A51F25B6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 14:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693431D5141;
	Tue, 15 Oct 2024 14:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FDEfjjLf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30CD1C4A3C;
	Tue, 15 Oct 2024 14:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729001862; cv=none; b=W4yZwqQI/UmHcqMaSNnfQxuWAL/4DVjEuSZL6a/2IEJHkAAHX99XZNHbb4TJJ0X7zyZSZix0YEOkv2zb7q/Gp4yhxGK9c+5avojXxvvgTgejm3bLVm56by4wCBEdHys9sOoKrwt/i0/UH65puaIAyBia3RLu2JMEIxlaTnKxpbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729001862; c=relaxed/simple;
	bh=vG3DMDeDtIAizT7d5yDcrA3ylY/kTZ9djArHmSaKkT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Oh1pMSk2tRRtXeyzuxDrI97Vi3xRqd1+fgh12QEJGqjyjD/FkMzQ9eqFdL43UayFuCt0G09A/SKe19mBe1V3LsC6FtzlB8KEBBqLgM90jQhp4bRUjEvSPPO6B5KUfZOtpvLlWf6YSs8huubIVfAQ/vy/hI9xTQHHHNw4mMjJ53w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FDEfjjLf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49F81SoM007376;
	Tue, 15 Oct 2024 14:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a2RwsBlyYk5yXPCHBOPKoRRajFMjsEiv0ypIDwekaw4=; b=FDEfjjLfvgcfSRHB
	aNF1BYiW6KLENk2+BpcB/z6UZ1IqckkDYB/tebJnrZerguz53e2lE1NpaD5yp7U0
	PyWL3PRL6ehCmSIbAwcIJQcSCfJD34fyuDACIlKsYd5oshGk5QVMxImmwvWfnu8k
	JCvWVkXIDej5klsAFlaZ5wXog9uycDtswbbWNuJ3AfF5RS04zihI69V65PSyq9Tq
	opo/EciauNtmw93MaV7eezdW5VPsU+MZ+MNyT1QX3ZM5nh1ClPMc2VeLyJ4U97aj
	TdREyNvWFH873RRzbkjm3YHxdD8ZYFw5F/yP0RN+RrY30guK6QgbGtqeA7HWSzEy
	pQdt5A==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429mh50y9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 14:17:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49FEHTfc023251
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 14:17:29 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 07:17:24 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Tue, 15 Oct 2024 22:16:53 +0800
Subject: [PATCH v4 3/4] arm64: defconfig: Enable Qualcomm IPQ CMN PLL clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241015-qcom_ipq_cmnpll-v4-3-27817fbe3505@quicinc.com>
References: <20241015-qcom_ipq_cmnpll-v4-0-27817fbe3505@quicinc.com>
In-Reply-To: <20241015-qcom_ipq_cmnpll-v4-0-27817fbe3505@quicinc.com>
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
	<quic_luoj@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729001826; l=1117;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=vG3DMDeDtIAizT7d5yDcrA3ylY/kTZ9djArHmSaKkT0=;
 b=ifxSNWz0rDtFwC6mXiMn2NpjKzMXSczuKrSArLdc0GWliWS1kMwyhTx0/MMWgl+lNVg9/EAsD
 B7oqb4R885/BcxCV96vWPzZxYmdlB3vsislCGasn6vxAZnjyV8ya6FI
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 79TVmFYAbl9jnprZANutb5RJqyeYYvsq
X-Proofpoint-ORIG-GUID: 79TVmFYAbl9jnprZANutb5RJqyeYYvsq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 adultscore=0 mlxlogscore=794
 lowpriorityscore=0 mlxscore=0 phishscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150098

The CMN PLL hardware block is available in the Qualcomm IPQ SoC such
as IPQ9574 and IPQ5332. It provides fixed rate output clocks to Ethernet
related hardware blocks such as external Ethernet PHY or switch. This
driver is initially being enabled for IPQ9574. All boards based on
IPQ9574 SoC will require to include this driver in the build.

This CMN PLL hardware block does not provide any other specific function
on the IPQ SoC other than enabling output clocks to Ethernet related
devices.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5fdbfea7a5b2..11aefa9ef7b8 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1308,6 +1308,7 @@ CONFIG_QCOM_CLK_SMD_RPM=y
 CONFIG_QCOM_CLK_RPMH=y
 CONFIG_IPQ_APSS_6018=y
 CONFIG_IPQ_APSS_5018=y
+CONFIG_IPQ_CMN_PLL=m
 CONFIG_IPQ_GCC_5018=y
 CONFIG_IPQ_GCC_5332=y
 CONFIG_IPQ_GCC_6018=y

-- 
2.34.1


