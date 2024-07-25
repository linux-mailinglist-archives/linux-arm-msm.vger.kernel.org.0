Return-Path: <linux-arm-msm+bounces-27060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F8E93CADE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 00:30:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90F5F28304D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 22:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F83813CFA1;
	Thu, 25 Jul 2024 22:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JlUPZCSJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C726F2F3;
	Thu, 25 Jul 2024 22:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721946614; cv=none; b=ls1N+FrLZ2ennWsQ3LgzHCJVTUgILX2EnEnEvC1AuW47HspwBko4atlR9B8sVrgbz4ZhqW+7XMbQaRiBDMntAtQfOrCr+P8LByDsB0r31+xSUAg8a9oqpVVCeS4/gvEYl9Ul5Kdb1W1cY0TrWet1DptK+29eO260nh5YZzmK64A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721946614; c=relaxed/simple;
	bh=gpy2dhVspGBsG6WWJs9uvbqjVwshQAiwoXiYJUKhAl0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hfnpGM4S7G5WhusyuYlUF8L4WMsZhvU915lbyXJSgtUWtW+/m6+cmHQoW9+HzTt012/SbVDaMesP4NF3JcixNf3+cgbXKVAi7ULNUkW0s+IurXwaO4wpETaykxWxIH9DZwPq2W1ev6lMFcH3QeOh8XXumdsmW3pT1PxN9PCzdu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JlUPZCSJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46PG79dZ000482;
	Thu, 25 Jul 2024 22:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=29P7jUtxDUg5fYSSqgdXTD
	JXVQ8pB3+4Wq0BtV9sPpA=; b=JlUPZCSJllpnKUqy9lxGrQdWMV8yOWtp1vaKK6
	6bKolaWPk8Urg3gxoRWjpcymf2UOidTpri+7b3fSbx1k/pR2L2Jzun54eyXnkR71
	YY121xZfgzIrb99BTfneJjNopFnS7zPmyBQBqKjni642MrIvfjuvTd1HHoypDtNI
	NddPk1rKS2KOuoju3GmKFa6HF6L8jCcpX6XKQIntD21nKoQ5IyEWJ5Z6XirxQeak
	J3Lhv2GpJIP/JRkIsKzthGootvXfy1GkemMU2d9yd3wgbqo24TDSuwdEeKl/mbrh
	pI0oTnotBXmuKOqEIOlkBBijkxyQbQfFldLgbNdxs7tp/hFg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40k5nvup78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 22:05:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46PM55nE030155
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 22:05:05 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 25 Jul 2024 15:05:05 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
CC: <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
        <neil.armstrong@linaro.org>, <swboyd@chromium.org>,
        <abel.vesa@linaro.org>, Rob Clark <robdclark@chromium.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/msm/dp: reset the link phy params before link training
Date: Thu, 25 Jul 2024 15:04:50 -0700
Message-ID: <20240725220450.131245-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.44.0
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
X-Proofpoint-GUID: -gGwwakxAG3sS54tUteagJ_YdX__MC4K
X-Proofpoint-ORIG-GUID: -gGwwakxAG3sS54tUteagJ_YdX__MC4K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_22,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407250151

Before re-starting link training reset the link phy params namely
the pre-emphasis and voltage swing levels otherwise the next
link training begins at the previously cached levels which can result
in link training failures.

Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index cdfcb54a3618..c7a89ab21e09 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1286,6 +1286,8 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
 	link_info.rate = ctrl->link->link_params.rate;
 	link_info.capabilities = DP_LINK_CAP_ENHANCED_FRAMING;
 
+	dp_link_reset_phy_params_vx_px(ctrl->link);
+
 	dp_aux_link_configure(ctrl->aux, &link_info);
 
 	if (drm_dp_max_downspread(dpcd))
-- 
2.44.0


