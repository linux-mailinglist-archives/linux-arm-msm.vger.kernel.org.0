Return-Path: <linux-arm-msm+bounces-11426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DB9858993
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Feb 2024 00:03:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A701B223F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 23:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 422B21487C1;
	Fri, 16 Feb 2024 23:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D8gwUcza"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AE314831A
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 23:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708124573; cv=none; b=CDatK9KfDVJJdWpmQrJVxQRXDDbQWbrvUkI3UhgJhodIN/LgU5hULt2revLmRL1PVW37WghUBiAJA/g9WxH9SsxMnO+buvu1qiiBaXI5KPcavRpBl4baRROGR1eTHp0EynQt9WJr+c1wNKD+Qu4X10Oes8R4rEz+a4c/1Dqnnvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708124573; c=relaxed/simple;
	bh=xOmyZjmzIEQjDjnVoR+CvSQY67kVbsUAdykTb3qNxjI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P0Rw6EWif6o3k04cui2OMpWtEbvYncMZ4jonW6uCS9LBEyHM1gyhgyEc/jJK60KY0AvWLV4RcpM9j3WFOWX75dLgI9AxaDyyfKF4pgPGRbU/uv0uG7uD+577fpbIxaE+/gaWdgHv2vknKCG6ulnhiEAyQV+gHMpZLwDp38HDSFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D8gwUcza; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41GMuxrs022274;
	Fri, 16 Feb 2024 23:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=t/Z+FLw/1yInBUBdBXYr3rD8txMOLSGk93/0ASkKRSU=; b=D8
	gwUczam31RilNzPVO1q8OqxsAk0ajbR4Be2EiLhJ2Xz0VqXTHdDagnIQKGASCfiI
	XBHaTcZ9ZQP9MtE6UIN/+UDkAmiWKtlyrDF5VsRFz4mDjHCB9dTF/l1Ln4ruOgR0
	40zPEIhpCrLEVHsnqveq/dAd/ZXYkmHpU3dMvl7MPG1Iu4TWhwKJwlDwjiZTlFJP
	vFvuBcNjle+jB9/fdmt2C+0SaMtsNHP2+YihpPeUoxI9mTiTrrW6ck5Z4fVVM7IU
	+kn6vkKqghidUDqAx1RaRlZSEahF7s6e+FUxwBRQsdFRMp0OrjXO1SNEjwLTk+PC
	PB+f9pPW6q1QCCUQ8l3Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wa3bh1r3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 23:02:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41GN2iHv032627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 23:02:44 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 16 Feb 2024 15:02:44 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v4 03/19] drm/msm/dpu: pass mode dimensions instead of fb size in CDM setup
Date: Fri, 16 Feb 2024 15:01:51 -0800
Message-ID: <20240216230228.26713-4-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216230228.26713-1-quic_parellan@quicinc.com>
References: <20240216230228.26713-1-quic_parellan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YFcXWGwdV976fDX_NpPh2gUnZZBXPrf4
X-Proofpoint-ORIG-GUID: YFcXWGwdV976fDX_NpPh2gUnZZBXPrf4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_22,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402160182

Modify the output width and height parameters of hw_cdm to utilize the
physical encoder's data instead of obtaining the information from the
framebuffer. CDM is to be set up to utilize the actual output data since
at CDM setup, there is no difference between the two sources.

Changes in v2:
	- Move the modification of the dimensions for CDM setup to this
	  new patch

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 4cd2d9e3131a4..ec9e053d3947d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -306,8 +306,8 @@ static void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc)
 
 	memset(cdm_cfg, 0, sizeof(struct dpu_hw_cdm_cfg));
 
-	cdm_cfg->output_width = wb_job->fb->width;
-	cdm_cfg->output_height = wb_job->fb->height;
+	cdm_cfg->output_width = phys_enc->cached_mode.hdisplay;
+	cdm_cfg->output_height = phys_enc->cached_mode.vdisplay;
 	cdm_cfg->output_fmt = dpu_fmt;
 	cdm_cfg->output_type = CDM_CDWN_OUTPUT_WB;
 	cdm_cfg->output_bit_depth = DPU_FORMAT_IS_DX(dpu_fmt) ?
-- 
2.39.2


