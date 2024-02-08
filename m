Return-Path: <linux-arm-msm+bounces-10137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6284884DA20
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 07:29:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E8D428A6D2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 06:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B8CF67E7F;
	Thu,  8 Feb 2024 06:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dNl0AHXo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56BE67E72;
	Thu,  8 Feb 2024 06:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707373744; cv=none; b=AfTcBGKHs4uM9lJwPhjJN4rQ55991OVE/pitO8UvcS8b22o8/wb02/g8C/Uw4KKgFR7LPOunu4N1F78fuYZ5G6lBbB7H1u9PA0HkbMm+MnFQwUWCiFYKoVepd2JWT3/sGTkWdci1RPF9ZMQEDIuT470CGIHUeMjDM1LPrz8lBXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707373744; c=relaxed/simple;
	bh=pKsVO5242kdzo3okA6mi0FwmleFZKWQz3DD0dAXJFsI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mc8qOWdUHSPLMzXxrPi0Zg+MCIAh+PqBTc3xSvmnxbHy1slc4YMzSHi63pV/rJchnetgoz9NgUJPL3v/ovoVIPLnUWtvQgYOK6G9f/lUwAhae6kL019U9sNnuiZ2WfywWSZVi0vEcK0k7Vj7pEW2fvKkd3SsfzUfDFYvQm8Uyw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dNl0AHXo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4185WAdw027512;
	Thu, 8 Feb 2024 06:28:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=Ax/064/wvMZZ6T93/FC0
	v6hsOCR++RNMNvGnVBYniiU=; b=dNl0AHXoaUgmPnrmF3pRVEKBm2bzOtK70zD6
	sOoA3akjpjY0x3HM01nNpuX0YwdjTUu9cK2Wx/cKURflnLpUkQCViM7D6pCM3q57
	FMtsg+4ix1lCnodiS5xsEsUDxbLtg95WsXjtAij1ytU42dmy5lxWaR4M81j4zUHW
	VMISlFVfE91RMm0lJPjYtGHjSq6ibR0pU3k5Z1N3n3zlXEyY3ic6LKz9BhBXYML2
	fEg5LiH82pcUajKA0wIWQQ+RtSgUyfueD7LdC3qm7b8yjm68WLWYn+qdf/spysP2
	EJODUAKHAEn6fK++DFqprZTRm8E/8iSMiR6qglMF48BuPXdiQw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w46r82g1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Feb 2024 06:28:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4186SwNL030121
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Feb 2024 06:28:58 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 7 Feb 2024 22:28:55 -0800
From: Taniya Das <quic_tdas@quicinc.com>
To: Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?=
	<mturquette@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH 2/5] clk: qcom: lpassaudiocc-sc7280: Add support to skip PLL configuration
Date: Thu, 8 Feb 2024 11:58:33 +0530
Message-ID: <20240208062836.19767-3-quic_tdas@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240208062836.19767-1-quic_tdas@quicinc.com>
References: <20240208062836.19767-1-quic_tdas@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: E3b5LX0EY22GnNu68ucjYk5fZhkhrYsh
X-Proofpoint-ORIG-GUID: E3b5LX0EY22GnNu68ucjYk5fZhkhrYsh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_01,2024-02-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=951
 spamscore=0 mlxscore=0 adultscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402080032

The PLL configuration needs to be skipped when remoteproc brings the
LPASS out of reset.

Also update the lpassaudio_cc_reset regmap name and max register to handle
the regmap conflict warning between lpassaudio_cc_reset and lpassaudio_cc.

Fixes: a9dd26639d05 ("clk: qcom: lpass: Add support for LPASS clock controller for SC7280")
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/lpassaudiocc-sc7280.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
index c43d0b1af7f7..2619a8ced9d5 100644
--- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
+++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
  */

 #include <linux/clk-provider.h>
@@ -766,11 +767,13 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
 		goto exit;
 	}

-	clk_zonda_pll_configure(&lpass_audio_cc_pll, regmap, &lpass_audio_cc_pll_config);
+	if (!of_property_read_bool(pdev->dev.of_node, "qcom,adsp-skip-pll")) {
+		clk_zonda_pll_configure(&lpass_audio_cc_pll, regmap, &lpass_audio_cc_pll_config);

-	/* PLL settings */
-	regmap_write(regmap, 0x4, 0x3b);
-	regmap_write(regmap, 0x8, 0xff05);
+		/* PLL settings */
+		regmap_write(regmap, 0x4, 0x3b);
+		regmap_write(regmap, 0x8, 0xff05);
+	}

 	ret = qcom_cc_really_probe(pdev, &lpass_audio_cc_sc7280_desc, regmap);
 	if (ret) {
@@ -778,6 +781,9 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
 		goto exit;
 	}

+	lpass_audio_cc_sc7280_regmap_config.name = "lpassaudio_cc_reset";
+	lpass_audio_cc_sc7280_regmap_config.max_register = 0xc8;
+
 	ret = qcom_cc_probe_by_index(pdev, 1, &lpass_audio_cc_reset_sc7280_desc);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register LPASS AUDIO CC Resets\n");
--
2.17.1


