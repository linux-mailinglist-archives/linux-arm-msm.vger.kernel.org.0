Return-Path: <linux-arm-msm+bounces-43835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3999DA0050B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 08:32:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 143BA1613F9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 07:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4CC91CD1F6;
	Fri,  3 Jan 2025 07:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bNgFYp1I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7541CCEE9;
	Fri,  3 Jan 2025 07:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735889542; cv=none; b=J2z5dIxgwWV6/CL9toQ6J24QdAvT4ILN+UJd9zwnRxwDcRzZN7CthKU3Mfch/WpvIs25CzXfBuwkzHXHd2SPZpgUwI4RtK/JHxhTtU+8kR2fX6/DfN+TRyl/aQQ1cIAq6bRXWxE24GaARDA2O738H7pIJ5bbU7A79FCdjl1Q5tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735889542; c=relaxed/simple;
	bh=+OxXg2QXQ+OHrRphpirBbItOGJpslDJ3UrXWpTyc7hQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=vE7AVtsS6miThOpd3s7Cnx0JeMtbKkioED3xOc+vRa9S16jzKGWsJ5aiR/MKwUJK0iG/yPLGaB7GfdpSc3Q0x8J4WJi/o7AFWfiaM1IWV1g207z+FPdi5c1qT9J4zBow49m1Y3/7EA6SYbL1UYi3QEA/J7gSzzi0r57FWkMRimQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bNgFYp1I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5036jmNo004474;
	Fri, 3 Jan 2025 07:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BiCq/ggOy1Mj+xrCvS1MbyU2m25JjbVq+CFVxvMFFxY=; b=bNgFYp1Iw0kyreTg
	Pbp9s1mV9cNrRZ3ntOO4KPymN7xQpBjg/u9m40H5X4HKzaaVwrxfsOyUA5kYHUlf
	fW2GNiyTdap8TGZS56haBDZ6TCMtMn95ikJFZIBK6hFvDOrNNX3VsSoqfyZRST/f
	jGoNnLtxV7SlL32OCf7Du2ieNwZClc+nUCdmRIHzMdsJMiFUhUs1WevAQIIO6nvm
	pWmOMWHvhB/gQ0HSlMHD3dnNy2uIbHFT9iA1cLPqTXbhuE7E2htQWLPHFbdAz+Tk
	UfrnFzj4eYxT7h7MwddnLLyABr/TxlqcOP7AreCOarYzOmTJlfCBGLNazQwxfNLV
	I0tyyg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xawj83fa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 07:32:00 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5037W0PD032162
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 07:32:00 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 2 Jan 2025 23:31:54 -0800
From: Luo Jie <quic_luoj@quicinc.com>
Date: Fri, 3 Jan 2025 15:31:36 +0800
Subject: [PATCH v8 3/5] arm64: defconfig: Enable Qualcomm IPQ CMN PLL clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250103-qcom_ipq_cmnpll-v8-3-c89fb4d4849d@quicinc.com>
References: <20250103-qcom_ipq_cmnpll-v8-0-c89fb4d4849d@quicinc.com>
In-Reply-To: <20250103-qcom_ipq_cmnpll-v8-0-c89fb4d4849d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735889498; l=1117;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=+OxXg2QXQ+OHrRphpirBbItOGJpslDJ3UrXWpTyc7hQ=;
 b=VQu7K+vgwGmy8BiUU4WNoKmO+Kqg44U0/b6nD5BV38CHb4y0BZIip6bOS4i9wt8UXavHk9mya
 Yz01Z8aPHRjCyJlGUNxyKY7wxgIIm6Cj9vMEErWAljSpxNP3PC3p1qV
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: p-Nmy6jcNQHcQb9c1SUyQPaNWsB5igji
X-Proofpoint-ORIG-GUID: p-Nmy6jcNQHcQb9c1SUyQPaNWsB5igji
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 mlxlogscore=756 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501030064

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
index dfa5c8d5b658..92f60b04cbba 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1316,6 +1316,7 @@ CONFIG_QCOM_CLK_SMD_RPM=y
 CONFIG_QCOM_CLK_RPMH=y
 CONFIG_IPQ_APSS_6018=y
 CONFIG_IPQ_APSS_5018=y
+CONFIG_IPQ_CMN_PLL=m
 CONFIG_IPQ_GCC_5018=y
 CONFIG_IPQ_GCC_5332=y
 CONFIG_IPQ_GCC_6018=y

-- 
2.34.1


