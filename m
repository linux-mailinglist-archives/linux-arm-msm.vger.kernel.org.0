Return-Path: <linux-arm-msm+bounces-37213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8489C016E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 10:51:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AED85B22B6F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 09:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC7F1E3DE3;
	Thu,  7 Nov 2024 09:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eVXJJL3z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEA21DB54B;
	Thu,  7 Nov 2024 09:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730973065; cv=none; b=ArKcKRsyhiLIiSht4ZdTYSitTvPcPrkUetxVJV6cuZ8T39NRfnHacWDzif5JQ/wW2Albc9Yc9rPJtvUt1teIFqNk+jZ60whpGx8rPabILdseIxLDL5iGeY7f89pGtJhHvozUF1siSTqUDpxpGDYbnk7YV+VE3Kc72lOEKJYweI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730973065; c=relaxed/simple;
	bh=vG3DMDeDtIAizT7d5yDcrA3ylY/kTZ9djArHmSaKkT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=TZ2zIrT3xtMfqR9PF7QeB9ovw3Apg9y/2HglIvVYn63p3N7n37+qYMFE6uUOeb5acOfXHDqHMuazljv1Xq0v/YmxHLANBcSaOx+i5Z+oLayoiSlpJkeMTUKFIUuua+0y0YDjTAvQRqMC8qx/URNR9vjMgk9BTz305Kcfz1jhjQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eVXJJL3z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A79LfwZ009713;
	Thu, 7 Nov 2024 09:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a2RwsBlyYk5yXPCHBOPKoRRajFMjsEiv0ypIDwekaw4=; b=eVXJJL3zzZpTaC+l
	RmEOAa/aaNNSgnp+DDcuMqQUUV/lKjR/GjxUOaChRBb0y1MKHqexqulHXkaT2P2l
	w2UZxY7onOY2lynGuf+NZfHS/EJINd/00HU327FVo2I/oaLFSpPoRxaHt3AKdXwe
	lVfAqcinpdbKP8GmHXTqNrxAwv0M4GU+Rjk3ann7W/2PRkcgADr0Pj7YVecctvz5
	haYXIt+TGbk7ccDt8Q5dVZWXFO+wthIZzb0Ogg7tlnsHCbWzDCVU7aNZAzEsfESO
	cCONMJvfgrKJumGpQirII8kZQur8OHK/q/x42qPG+PVnzfYXLdDAblrc+77tCCMy
	LhBAEw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42rtupg2c6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 09:50:50 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A79onNO017669
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Nov 2024 09:50:49 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 7 Nov 2024 01:50:44 -0800
From: Luo Jie <quic_luoj@quicinc.com>
Date: Thu, 7 Nov 2024 17:50:24 +0800
Subject: [PATCH v6 3/5] arm64: defconfig: Enable Qualcomm IPQ CMN PLL clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241107-qcom_ipq_cmnpll-v6-3-a5cfe09de485@quicinc.com>
References: <20241107-qcom_ipq_cmnpll-v6-0-a5cfe09de485@quicinc.com>
In-Reply-To: <20241107-qcom_ipq_cmnpll-v6-0-a5cfe09de485@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730973028; l=1117;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=vG3DMDeDtIAizT7d5yDcrA3ylY/kTZ9djArHmSaKkT0=;
 b=Mu+sNnSc5CGgURzYspUyutiCdQGWFGwSBOwsCHH0phHjNIymRGgMCSOkjDtQsL9036qXMJkEO
 JUqBoK2LlUsDh3ryZp2yXT4jQEnKticxR43BtlMAaCSqycmlUn1Fz3N
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WdovhbopHQD0kQtqc9Ob7hIfIYlf2x1O
X-Proofpoint-ORIG-GUID: WdovhbopHQD0kQtqc9Ob7hIfIYlf2x1O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=778 clxscore=1015
 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070075

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


