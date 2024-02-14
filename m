Return-Path: <linux-arm-msm+bounces-11052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F76B855203
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 19:22:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28169B2F8DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 18:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D46B1292DA;
	Wed, 14 Feb 2024 18:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CR/aILZd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CF112C812
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 18:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707933859; cv=none; b=G5qzJ+MDRauKdeFDopYSMGg75WiYronXoy5rp7kWg7VA95g+QuzkHHQU9xjc6wDBN8pFbxwZGVoK/UiCwXM62LxokCGeyj6E+7e36+tZ1LIf46qoadjRfLexNC6yK6GCWRs7xhwvichLnsFubT6Zpjvx3SKgc79Q7t+jTdaB7ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707933859; c=relaxed/simple;
	bh=HwEMC88XO+7a2CGDjEaUL0eGO3Cbbq8lAz+ZvEx4dkE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XQPc1QA1pmi+R17vpCmOvSAiU9WLEXCjMrfjoTJU5ZhjyChriq6nwETW6sIvyY8MQ6MkrAxkVLoPGwXrMrueqpe03rAW9TE2j3AW3JL3yVWA3SVzJi68gEstfY1Piy1g1mD75rm1NPVBYPvfUAqqPRnZAQ3nxwLCzVPTSoiE8Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CR/aILZd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41EDk6W3017833;
	Wed, 14 Feb 2024 18:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=cNPNes2kBNFHGgoDx+nWoH3vQXAPhWmfs6aX3rGbr44=; b=CR
	/aILZdjAGaYLwkqWcGpZjxyyXHOT0WW4WNrEX0AUWOdKtZEhZg8gzoF7lWZgBGfr
	qcEz2AhaZeGqlwg8hNislhB7PTCIqLm7Nzaq9FHuqOu+y27Jky4aana/aj2ns3uU
	5xMLnpoeR8B1ciHhuym+iFDx9tr46T6+IIYYnnFZgx4iEHThMixGs9cziTFNUIA3
	/z7fXs6nOYsWF8LqCgD1FL58TdJ9Xk3VYmcPoYug6uLov2OywHlaRRZjP9Rm48Av
	gF1GqfJsCvwAfXeHx1GaA3QR549Dv7S1Ki6VbOdduQJ9yExQ1u9biemLPzz8sxTe
	uQN78HRqkpsYmaviyw4w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w8nt41p3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 18:04:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41EI4Bjt009343
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 18:04:11 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 14 Feb 2024 10:04:10 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v3 10/19] drm/msm/dp: program config ctrl for YUV420 over DP
Date: Wed, 14 Feb 2024 10:03:32 -0800
Message-ID: <20240214180347.1399-11-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240214180347.1399-1-quic_parellan@quicinc.com>
References: <20240214180347.1399-1-quic_parellan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: r3e0e00_dh7jFZ_rClNEBW7G37Dlo05j
X-Proofpoint-ORIG-GUID: r3e0e00_dh7jFZ_rClNEBW7G37Dlo05j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_10,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 mlxlogscore=854 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402140141

Change relevant DP controller related programming for YUV420 cases.
Program the configuration control register to indicate YUV420.

Changes in v2:
	- Create a new patch only for configuration control programming

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 77a8d9366ed7b..da8f0d9f98718 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -128,6 +128,9 @@ static void dp_ctrl_config_ctrl(struct dp_ctrl_private *ctrl)
 	/* Default-> LSCLK DIV: 1/4 LCLK  */
 	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
 
+	if (ctrl->panel->dp_mode.out_fmt_is_yuv_420)
+		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
+
 	/* Scrambler reset enable */
 	if (drm_dp_alternate_scrambler_reset_cap(dpcd))
 		config |= DP_CONFIGURATION_CTRL_ASSR;
-- 
2.39.2


