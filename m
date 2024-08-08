Return-Path: <linux-arm-msm+bounces-28165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D985694BF10
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 16:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E24E01C24F61
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 14:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A7F18EFF1;
	Thu,  8 Aug 2024 14:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mBYaE+Ll"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4413518EFC9;
	Thu,  8 Aug 2024 14:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723125867; cv=none; b=q6zqQMC3Gqp68SLywcHom9byfg4Z38IDe1IMbb36e2KsoZFFZAJFboOVyC1oQcFq5ALk+YaeKl1yDcm/Ub9rWx20DbRrJh79AUKvUEwIfwB+525uECH8XEfvJcNRVtYPy0QHNwMCx4ce2J3iaxJ9bRcKOpUSvmTu43lVW1gWfp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723125867; c=relaxed/simple;
	bh=3WH0aRycawtTd+hwuDHZymvMm+tSFS7uVvav4SszNxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=gIYeYOTtN+IVporTBx7sGPOofPRNDyoIaYpkN1TCxwfACtshVDxQbPn9eY/NjNCDiYT9+wO3+mkkOJkrefUqJtJ6cgsv1/VX4Q2NiJpNM77bKlE/Zv9MG72cS5nsjnr3f+2TaPIWnwYrWn52Ek/o+1HEfuxcEghDjdqH6LwLPbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mBYaE+Ll; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 478A1PGt006866;
	Thu, 8 Aug 2024 14:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nJ8vsy1F4vyNtasevygBxd3nGUZUhHi+Dut76YwdACM=; b=mBYaE+Ll+bLZ4XrS
	dgK3yXP5DiERaueEBUnJU5WENJ40AknF3yB1Ms+tX2fYoitj1DwnG5J+gvlNYlvx
	3i0RcMAMpO971Ine/OcUROFaF4jlTcVnaKo5xmnl2n87boV1S/3eirp8D/E7ShLz
	ZlTXVEmFH+Q67kLb+7bH4mKDY47Bvs/2xSciVNbo22JVOXtvAEIWqYiNaRjvlcmx
	rZEkiNTu/FwDdC5A/M8rCV+msdJFMFO3pxB3CYGfJhy4/q2vmOM7SHlcv3eDxtgu
	QnlHdD7zcZMw1Xj86PHR/r44HZkCUfFHUXTa4kRqDNNtvfxVudnmF+3Q5SDjb/ND
	bLi/yQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40vuwarm82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Aug 2024 14:04:15 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 478E4D2f023745
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Aug 2024 14:04:13 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 8 Aug 2024 07:04:09 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Thu, 8 Aug 2024 22:03:14 +0800
Subject: [PATCH 3/4] arm64: defconfig: Enable Qualcomm IPQ common PLL clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240808-qcom_ipq_cmnpll-v1-3-b0631dcbf785@quicinc.com>
References: <20240808-qcom_ipq_cmnpll-v1-0-b0631dcbf785@quicinc.com>
In-Reply-To: <20240808-qcom_ipq_cmnpll-v1-0-b0631dcbf785@quicinc.com>
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
        Luo Jie
	<quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723125835; l=686;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=3WH0aRycawtTd+hwuDHZymvMm+tSFS7uVvav4SszNxo=;
 b=kGcKVI1IIqlsnIpJUVp4Wvp5JBSjUnrEDMg00b6augQQQ9OmZ2xKK9W4mBQ3NA8gQJuUhKD4L
 3jgYTdjvUF2AafjRuQptnHOG4RIldlCY8I+GJIm2jv2WVymj7tazHrv
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GXmzUaUR0WRy_t2u9KTmYF4K_Tt7r2ir
X-Proofpoint-GUID: GXmzUaUR0WRy_t2u9KTmYF4K_Tt7r2ir
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_14,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 mlxscore=0 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=730 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408080099

The common PLL clock controller provides fixed rate output clocks to
the hardware blocks that enable ethernet function on IPQ platform.

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


