Return-Path: <linux-arm-msm+bounces-8299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B5A83CCA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 20:41:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 452811C20858
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 19:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3B9F19B;
	Thu, 25 Jan 2024 19:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K/kR71Sc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C89D130E25
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 19:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706211550; cv=none; b=o2T+IjV+wWk7IZungLzplUhXPkgGkvO8ph7D8yn1azDlVPf782H9tuQlNJi7vAdGWf0oCHFS+qdAzo/qI+LgjgDSOYwDcyXGjKZzTAT/mixTWm2KMv1bid0po4c+Htva4/3Ajcmf3e9/tYnP1UovzT4aPpJndVcs6Z+HWKgGCTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706211550; c=relaxed/simple;
	bh=DAOSfayPIUncXGhwR2vSLVF+Z5zecen3HKJFRLdCKgw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B1+VQ2Q012Fv+FY+drUVfCkf3lS0L1BYlAEnlJ+OLWwBfkjOVtwy5Dxq5Gk3uix9LvzuZbVzzaNpVFNO3dDvZLVQODxx4cx24J+XLUiyrQrTtrBUK56pKE6a3YGuqE0Yiy1zidWDS2/glcTD2xXavKIgEp3yGXF2y1XgeMyQZTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K/kR71Sc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40PEshdx030611;
	Thu, 25 Jan 2024 19:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=qiGylZM1FcnqtR3vIFcW+NqZOPttvQ86KEajFtwxDvw=; b=K/
	kR71SchUE/wDMlmXQh4BLH3lPZl6QjEjFmMMz2Q0nq2BRuohQwHWaVXcLD/Y6ikl
	ndHz+bNracg38OVnYcs9ErVsoXEjelWf7YHTB4uy3CI/75zlwxP/ZGLLjmzap75o
	1JnouFy75EGfBtBpHER7xtcdQbRldeLOQbAKJ91tr5DAGxb/tU4Ir5mM00pJ6M01
	Vb2O8e/K6iD+OKAMh8zEx5wjnV8Csv24vOGTwO83hZF/s2VhzPyNra2x/jQAg/NQ
	R2sTZgZSN/jmyUlAgZu6De6+LCXqR5bgVodwXhG0UuV9laqDh8nCn2rFdyVj0Ikt
	i9HlNUztvIvIb77v7BXw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vufk9aap8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 19:39:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40PJd3hN013891
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 19:39:03 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 25 Jan 2024 11:39:02 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH 07/17] drm/msm/dpu: disallow widebus en in INTF_CONFIG2 when DP is YUV420
Date: Thu, 25 Jan 2024 11:38:16 -0800
Message-ID: <20240125193834.7065-8-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240125193834.7065-1-quic_parellan@quicinc.com>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pCpZuYhMNx5KSoz6VR8HR8l5U0DVJEkM
X-Proofpoint-ORIG-GUID: pCpZuYhMNx5KSoz6VR8HR8l5U0DVJEkM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_12,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=442 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401250142

INTF_CONFIG2 register cannot have widebus enabled when DP format is
YUV420. Therefore, program the INTF to send 1 ppc.

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 6bba531d6dc41..bfb93f02fe7c1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -168,7 +168,9 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	 * video timing. It is recommended to enable it for all cases, except
 	 * if compression is enabled in 1 pixel per clock mode
 	 */
-	if (p->wide_bus_en)
+	if (dp_intf && fmt->base.pixel_format == DRM_FORMAT_YUV420)
+		intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
+	else if (p->wide_bus_en)
 		intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
 
 	data_width = p->width;
-- 
2.39.2


