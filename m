Return-Path: <linux-arm-msm+bounces-34144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8236B99A9E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 19:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A3D31F229E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 17:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3271A08BC;
	Fri, 11 Oct 2024 17:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Khp9Sxfc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E8984E0A;
	Fri, 11 Oct 2024 17:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728667530; cv=none; b=bPixs8z399gvbdOoUWB3+1qDQqbdpcsTYR7p9AG2l1p06/D1R/upze4dX5bizIcgFNvpvU38fWCgoDBjRQANO37fxlgOdi3LR7nAl8+AD+fqoLpl4WrXVGrF4FND6B/KnftK5lMVmXGEeK6iJlQkLW/pSXrzetVeDZjCY7lmTYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728667530; c=relaxed/simple;
	bh=7gKo3yfQbtf682tI2CBMgRz5iYurKpzkmcCft6FC4gs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=qnADRP0VQaP4RTqKB1yJvlsi9AgeQr3HeG2cgN93z6BJYXfBqV7gX8DbgeO46KQw5r5iy0j1uO/XW3xV0L+hheQc4lbM9jj9cX1oI2Vkz/5J5BBGkQyAlImprSgEJYUspYFyBP5cgi6OvrGfUHnkUCIQ9ocniIobLCBQ2RxqfXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Khp9Sxfc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BG0srI023945;
	Fri, 11 Oct 2024 17:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=USif0rGIKgTqepWQydU1/A
	WW05Ve570RSc7Edg+BTy8=; b=Khp9SxfcY6C3KWZbSxMljDRaL42vvEGZGdryng
	VJ8God/FiBKzMY49DNqqPxEz+ol+gSmIZ2g7cSoojhzY6XovesUqADBpazn0Urwo
	rk1ZjLluxtpxQ4kOl+RKVBnUmNL6aP4ojK2eb7tK1BSwtMI7afXgMzEeBr+o3kjv
	8kd4zon4O1oR2PySgsjDpSwqYgX2aUnUN4/oXcaqjJFPfNEGZebFgpIYHkP6uEuI
	UKPqvIg/x0mknbEOg5da8Xhmng4Y2mN47MbxhzTi8snTsvME+ooz7IKrhGnRkP4o
	jEVMhXD/c8Vu/8YF5t+7nKpiuVR+RCc5ep1ZepZyWNYOehSA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426y3vstq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 17:25:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49BHPJb3014244
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 17:25:19 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 11 Oct 2024 10:25:19 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 11 Oct 2024 10:25:13 -0700
Subject: [PATCH v2] drm/msm/dpu: don't always activate merge_3d block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241011-merge3d-fix-v2-1-2082470f573c@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAHhfCWcC/1XMQQ6CMBCF4auQWVszHYqgK+9hWGA7wCyg2CrRk
 N7dys7l/5L3bRA5CEe4FBsEXiWKn3PQoQA7dvPASlxuICSDDTVq4jBw6VQvb6W7xiFWXFJdQ34
 sgfO8a7c29yjx6cNnx1f9W3dHI57/nFUrrdDh/dRXlozh6+MlVmZ7tH6CNqX0BcldeXCoAAAA
X-Change-ID: 20240828-merge3d-fix-1a8d005e3277
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@chromium.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        "Jessica
 Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-2a633
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728667519; l=1640;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=7gKo3yfQbtf682tI2CBMgRz5iYurKpzkmcCft6FC4gs=;
 b=ReHRBe6XXxKBGEFfM5svE4kO+fJtHDfuZUvy7WK5tWqdTawQKQSN1duVqxxA5wYkCp0qovEzp
 TJnKy90EnyMBGRqE3KO8TadCUjhKUvfEXGSXEWS9LjeFXhQ3uM1Ck69
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: H6MuThEwCCo9shs5F3Rb_WaOAznXY87G
X-Proofpoint-GUID: H6MuThEwCCo9shs5F3Rb_WaOAznXY87G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 clxscore=1015 mlxscore=0 phishscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410110121

Only enable the merge_3d block for the video phys encoder when the 3d
blend mode is not *_NONE since there is no need to activate the merge_3d
block for cases where merge_3d is not needed.

Fixes: 3e79527a33a8 ("drm/msm/dpu: enable merge_3d support on sm8150/sm8250")
Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
Changes in v2:
- Added more detailed commit message
- Link to v1: https://lore.kernel.org/r/20241009-merge3d-fix-v1-1-0d0b6f5c244e@quicinc.com
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index ba8878d21cf0e1945a393cca806cb64f03b16640..c5e27eeaff0423a69fad98122ffef7e041fbc68e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -302,7 +302,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
 	intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
-	if (phys_enc->hw_pp->merge_3d)
+	if (intf_cfg.mode_3d && phys_enc->hw_pp->merge_3d)
 		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
 
 	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);

---
base-commit: a20a91fb1bfac5d05ec5bcf9afe0c9363f6c8c93
change-id: 20240828-merge3d-fix-1a8d005e3277

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>


