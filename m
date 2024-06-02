Return-Path: <linux-arm-msm+bounces-21405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 170758D7508
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 13:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48EA21C2107B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 11:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53DD83CF6A;
	Sun,  2 Jun 2024 11:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H/fRqIZ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C843D3BBF5;
	Sun,  2 Jun 2024 11:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717328732; cv=none; b=tyGOrZVr0yv3vwE+VJlP87uzsQg4CPeAePEmdRgtngnWhh1Arr50DQA2tgSVBfmSdyWH8L3WyLRMc9cjyNDZwAs/ItbPS8lHW+cBJXh+xobT5ZHaxJeYStGwYakOptLFdfUeu2IgdGrckkEnlSv1+S7/+JCk5YR4xN8djGHxX+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717328732; c=relaxed/simple;
	bh=507ao6veJvos8djQ/vkxSB93Ylf4TIG2MPrbWPIoPeg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lXgFu4wdgKYO9Xba8vc7PXa0SPUrrFCescxSD0xxe66ItoVGAUIHTBeMmpxvDGdd8eMCrUPdB1lWavfMPCTiHG39SR4j8AWTe+32eM8nmqHWMlpNW1qC6F7drUMA3z+rWELbEu+QeqaYeAVFAB10Mzd+h0oCbLA7z4jG8XPK4p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H/fRqIZ8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 452BcNPA001940;
	Sun, 2 Jun 2024 11:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NQg0UhSk2EZ0C6RKEJX8xxVV5b+m49TUFbA2iV97yq4=; b=H/fRqIZ8YIrg7Hdg
	DnTeQzC3f0PN3QhrF1QX848E2EqYa3tl1ZLGZnOOALKuLpOYk4iuuITY029H/6QA
	bJJVFP0aoos1fu7uPqE5dkNjBce8fVVtu3XojTwdutZ8zDRD7W06KF3NDX8Rg01h
	YUNiTvbiO+YWcu5NYEorKjhni2pck7h+YZeSEOoXyZUGUrTUlRJNAnVpBiW+Mg18
	i5hlXzKc3BFXTVBpj2epKepkmqAzvwuPwtSCdqjUQa4UuBXeAK6cB003fcp5rkHw
	L2CqFYdTm1vcOlTv5tDF9fcBOnAmosV0sQDdkOB1qDqeLf0bPIWNo9aFbMhR3i1K
	iq6MJg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw7dj0m9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Jun 2024 11:45:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 452BjPRk021721
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 2 Jun 2024 11:45:25 GMT
Received: from hu-jkona-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 2 Jun 2024 04:45:20 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        "Satya
 Priya Kakitapalli" <quic_skakitap@quicinc.com>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: [PATCH V4 3/8] clk: qcom: videocc-sm8550: Add support for videocc XO clk ares
Date: Sun, 2 Jun 2024 17:14:34 +0530
Message-ID: <20240602114439.1611-4-quic_jkona@quicinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240602114439.1611-1-quic_jkona@quicinc.com>
References: <20240602114439.1611-1-quic_jkona@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QlfSzC1OQqJsdC1HWxPvlsHDTyPwGlSl
X-Proofpoint-GUID: QlfSzC1OQqJsdC1HWxPvlsHDTyPwGlSl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-01_19,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406020099

Add support for videocc XO clk ares for consumer drivers to be
able to request this reset.

Fixes: f53153a37969 ("clk: qcom: videocc-sm8550: Add video clock controller driver for SM8550")
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/videocc-sm8550.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
index d73f747d2474..25133cf5a2b8 100644
--- a/drivers/clk/qcom/videocc-sm8550.c
+++ b/drivers/clk/qcom/videocc-sm8550.c
@@ -10,7 +10,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
-#include <dt-bindings/clock/qcom,sm8450-videocc.h>
+#include <dt-bindings/clock/qcom,sm8650-videocc.h>
 
 #include "clk-alpha-pll.h"
 #include "clk-branch.h"
@@ -380,6 +380,7 @@ static const struct qcom_reset_map video_cc_sm8550_resets[] = {
 	[CVP_VIDEO_CC_MVS1C_BCR] = { 0x8074 },
 	[VIDEO_CC_MVS0C_CLK_ARES] = { .reg = 0x8064, .bit = 2, .udelay = 1000 },
 	[VIDEO_CC_MVS1C_CLK_ARES] = { .reg = 0x8090, .bit = 2, .udelay = 1000 },
+	[VIDEO_CC_XO_CLK_ARES] = { .reg = 0x8124, .bit = 2, .udelay = 100 },
 };
 
 static const struct regmap_config video_cc_sm8550_regmap_config = {
-- 
2.43.0


