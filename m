Return-Path: <linux-arm-msm+bounces-35310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7319A9411
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 01:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63A531F216DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 23:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D40200110;
	Mon, 21 Oct 2024 23:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AbNZRRE4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD8B1FF7B8;
	Mon, 21 Oct 2024 23:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729552904; cv=none; b=pprt4s7bC0Nq6wcp42vFGzaXvvw79NInjEVEUk5Q8R5nozQxRXRd3eomimvo4POPMw9xiSjq+jlf1L/KpZSAub+mfbEnlnoS5I2IgkSVIFnvmRxWI+QlHtP2n1ueNRwKDFYlfxFNcZQMb40lx+9rA8wRtikZjB3vFWoeNk24cqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729552904; c=relaxed/simple;
	bh=R8Tgu/al/IyoPiXao8mrdv1VYP/b87RqL1Knv+S/lQ8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PYQniVO6ICNdkCTl4jAxOmuK3Lxs/l2M7Zp8bs4/ceNrhCwXLYDX5+gcoDqrxvwfhlYl3W30X28CHuAkRv4pyYbTmKQUkFDbYpRLxA8Z9SEENayrkGLFLWHofBPdhRQ3q6V7YQdUO/iJSwWciTbERiEKynscVOOREAc/SNtz+0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AbNZRRE4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LJo21F003362;
	Mon, 21 Oct 2024 23:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+8Gk5I+LL47CEEpe2pozUJyXyIvJ2IvZI+XHUKO8BXo=; b=AbNZRRE43/ZKXxza
	Ikse079gBDGWOU937M35Xmh3C/gCbIDRu3x0j8wwTzu6p7FZouZAZdo3njweopH+
	C1SVPAEu7qpx7/8I/hxaI259ZoZJOyrYPcl86KPlvxHQvaMiRhB9fuzMvkpJI0u4
	csYf39gNn8VeW13DL7sDOCeC51O2Ugq3fqFHRjsdvmejhHD7N8B6RiW9orYmGqkH
	En6jNFT1UmW5Hoc/zJ6mCywP6NxqEwiwtafb+c7H/XOJQoKauVtYkwn5lcXHJGDt
	CM4ZvaVGx1dyEV9P5hhYNdOe7Aa8GhB5VUw802N61pclMBD03pGb2WFg8UEk0jK7
	XdaeFQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6tux9w0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 23:21:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49LNLTQt001615
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 23:21:29 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 21 Oct 2024 16:21:29 -0700
From: Melody Olvera <quic_molvera@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones
	<lee@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>,
        Stephen Boyd <sboyd@kernel.org>, Trilok Soni
	<quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Raviteja Laggyshetty
	<quic_rlaggysh@quicinc.com>
Subject: [PATCH 5/5] arm64: defconfig: Enable SM8750 SoC base configs
Date: Mon, 21 Oct 2024 16:21:14 -0700
Message-ID: <20241021232114.2636083-6-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241021232114.2636083-1-quic_molvera@quicinc.com>
References: <20241021232114.2636083-1-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: etvbInicrZl2UuRAbz2N8winXsMlIART
X-Proofpoint-GUID: etvbInicrZl2UuRAbz2N8winXsMlIART
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 mlxlogscore=902 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410210165

Enable GCC, TCSRCC, Pinctrl and Interconnect configs for Qualcomm's
SM8750 SoC which is required to boot SM8750 MTP/QRD boards to a
console shell. The configs are required to be marked as builtin
and not modules due to the console driver dependencies.

Co-developed-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 36b33b9f1704..9d6507412ee0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -629,6 +629,7 @@ CONFIG_PINCTRL_SM8350=y
 CONFIG_PINCTRL_SM8450=y
 CONFIG_PINCTRL_SM8550=y
 CONFIG_PINCTRL_SM8650=y
+CONFIG_PINCTRL_SM8750=y
 CONFIG_PINCTRL_X1E80100=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_LPASS_LPI=m
@@ -1357,6 +1358,7 @@ CONFIG_SM_GCC_8350=y
 CONFIG_SM_GCC_8450=y
 CONFIG_SM_GCC_8550=y
 CONFIG_SM_GCC_8650=y
+CONFIG_SM_GCC_8750=y
 CONFIG_SM_GPUCC_6115=m
 CONFIG_SM_GPUCC_8150=y
 CONFIG_SM_GPUCC_8250=y
@@ -1366,6 +1368,7 @@ CONFIG_SM_GPUCC_8550=m
 CONFIG_SM_GPUCC_8650=m
 CONFIG_SM_TCSRCC_8550=y
 CONFIG_SM_TCSRCC_8650=y
+CONFIG_SM_TCSRCC_8750=y
 CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
@@ -1644,6 +1647,7 @@ CONFIG_INTERCONNECT_QCOM_SM8350=y
 CONFIG_INTERCONNECT_QCOM_SM8450=y
 CONFIG_INTERCONNECT_QCOM_SM8550=y
 CONFIG_INTERCONNECT_QCOM_SM8650=y
+CONFIG_INTERCONNECT_QCOM_SM8750=y
 CONFIG_INTERCONNECT_QCOM_X1E80100=y
 CONFIG_COUNTER=m
 CONFIG_RZ_MTU3_CNT=m
-- 
2.46.1


