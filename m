Return-Path: <linux-arm-msm+bounces-33925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B17E9991CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 21:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CD381C23CDE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 19:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08FFE1EF08F;
	Thu, 10 Oct 2024 18:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YiG36trh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995741EF086;
	Thu, 10 Oct 2024 18:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728586773; cv=none; b=V5Qrp8xqz/MJoLP88EaKlgOuCkMkGxaB9unoR49Ybaqq0hQ5JELW9X5Q8wgOS2M8cHA9GVfiOXhSGG+7zqErAwMFYzmUGfks0GY42e3V5EpSPq3bTnjdGZaQNCxkA6TDqNeyLCE7apf6OBSQBOiV6xQmNuEc1IiOxn1Q0RouCWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728586773; c=relaxed/simple;
	bh=dm+97AuG6xqpHsfoXfkEmLJzfygkvZnYJpTzEswkyv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NB1jt5FBZm1JpAMb8CShgG7vTKL9OXIm458SgBkx4hilt4L0iUmth5RNMAgThTMPy09xbuXZxbHTkJ2Zd6kO/kIND+aRkFsj6HB9GR/7QVKkNQGDMT+cut+tCvyxZ+WZ84q/WsJbZWqVFy7juepjUI3hwd+XUoBcEGL1c2I5Rqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YiG36trh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AC8l6X022368;
	Thu, 10 Oct 2024 18:59:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A/LXlBKR1uTmFUnPX4hqMntDwsY1G6SQ1qbcSGaIIGY=; b=YiG36trhhL++kG37
	tILAZRacNDFxKtojxz2v9bnKUEMCMZOWmdtKi3hOHqJyDAHEKNpwZLsWViSIYhzI
	qoKtFXhdKtTY88Diqjj3Ce4DdZNizYQW2ebE0GAgRvskauGUgfS3Ev2hOJZQORO0
	1WZsOjvHICH7+Yrp2Nuiu3HXimMyXBGlam4wvEixY00rIkMZkKtXHfH8bcWGNszQ
	4DUHYk5mtje56CIgWoFRFCHXMO+raeSLS1RWoDhJIaaqBjWgheB6NZQ+5Uf+n4Cn
	GmTyV8Fb1K1bcK9HfPJzbD7trf9OHvor4KQBXz8H3hujoHSdgnu7bt0kITr6mvhG
	5BueKw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425xptuga8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 18:59:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49AIxRWH029535
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 18:59:27 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 11:59:23 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 11 Oct 2024 00:28:37 +0530
Subject: [PATCH v5 7/8] arm64: dts: qcom: Update sleep_clk frequency to
 32000 on SA8775P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241011-sa8775p-mm-v4-resend-patches-v5-7-4a9f17dc683a@quicinc.com>
References: <20241011-sa8775p-mm-v4-resend-patches-v5-0-4a9f17dc683a@quicinc.com>
In-Reply-To: <20241011-sa8775p-mm-v4-resend-patches-v5-0-4a9f17dc683a@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <quic_imrashai@quicinc.com>,
        <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TEeV404CtAu70fxxI6rWdHswrfWRe2wj
X-Proofpoint-GUID: TEeV404CtAu70fxxI6rWdHswrfWRe2wj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 phishscore=0 mlxlogscore=919 lowpriorityscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410100125

The HW supported sleep_clk frequency on SA8775P is 32000, hence
update the sleep_clk frequency with the correct value on SA8775P.

Fixes: 603f96d4c9d0 ("arm64: dts: qcom: add initial support for qcom sa8775p-ride")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 0c1b21def4b62cc65a693552983ec0bc7eec697d..adb71aeff339b564eb3acc42a38bba2f03507508 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -517,7 +517,7 @@ &serdes1 {
 };
 
 &sleep_clk {
-	clock-frequency = <32764>;
+	clock-frequency = <32000>;
 };
 
 &spi16 {

-- 
2.45.2


