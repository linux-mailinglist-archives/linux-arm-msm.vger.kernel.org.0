Return-Path: <linux-arm-msm+bounces-33768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA70997B74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 05:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 409C0280F3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 03:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA8BB1714AC;
	Thu, 10 Oct 2024 03:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lORFP4Mm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F133179A3;
	Thu, 10 Oct 2024 03:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728532010; cv=none; b=BRbQrD22JorhZB0n/vf9496k3CCF2RK9Nl0qMSjJNfz48vaKBhwwa3y6Pon4PA+7PNPqVZ6SQbPPCtv19u66aEGC57rr/W4086Zzr0JO7Zuif5YkmQd8WP+azmddlS+umW7WKDUbF696zuP272v/ZEW3Avc8uFJhIMhcMN+Tig4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728532010; c=relaxed/simple;
	bh=3whM16PpQf2IzK1/AOQ9/zt+yTnGGJIHLIGO6pjFUYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=DsAp9sCcRTiJyj/sxiAQShNli1QGCBeGEM1eIF9LiZCeGuO+XvD+Q5Na1vC+Ns6G07hpez4nepJsS3XxEg6oJQnj+b27PzdNdzdzHIHtl9KSu6XCBcfRKKpkLcGJF6Ivvi3Cph0qvFV2qO+9/n6vHLZq6Yz2TVLt2kwnC4UxJR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lORFP4Mm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A1c0cQ025140;
	Thu, 10 Oct 2024 03:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Fcu8hXjbnFfTmolyundrTA
	YXiz2U4LT4P1FNsYA3srk=; b=lORFP4Mm//Lk4FLnAJCjdfMxT2ShklxhEUM4+s
	gb8gvje+65G2VVLqmJtK/vgDpwpqPsi8Gxv4XUv1ovLHR1WobO9C0Jw1hI1amW93
	Dm3EVGUG9XSKQgp7dAJtuJWyZnKRRZ62ViPhbIRl/MvilpuOXQHJ82YCqqKjgp84
	/SiujxE5kbfntlOad4F7+SC15b9lT0oxlxHNPSg1kLPD26qbHW7/RAb1ODm2R/f8
	kcDFIc74DI3fkFedVUfYp/sdaSUa3WdVNApjqgw2ZMHIL1+I3wp8RjCPgqC0tx4O
	35K8sPbx35NEj5rW3/jVqZ+keVHjppET5pi4vU3KFLl1jAbg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424wgs77pc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 03:46:41 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49A3kene014019
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 03:46:40 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 20:46:40 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 9 Oct 2024 20:46:19 -0700
Subject: [PATCH] drm/msm/dpu: don't always program merge_3d block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241009-merge3d-fix-v1-1-0d0b6f5c244e@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAApOB2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCyML3dzUovRU4xTdtMwKXcNEixQDA9NUYyNzcyWgjoKiVKAw2LTo2Np
 aAFe0lfddAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728532000; l=1393;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=3whM16PpQf2IzK1/AOQ9/zt+yTnGGJIHLIGO6pjFUYU=;
 b=QWpkkFglqtxIxB0sFwFc/pUNxLGRZex0Z1EfRrUjOSlmUEpzc8QK/kuD0n4kPJ/GZmotqrmTw
 JLI/q4a6L55ApBkxfmqyeujllJcHU5jJwu2vvMrDgSlk3zNh2+W6IC9
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eJRIuslEkzm7r1-Xi9O8i49UW1hm0DBC
X-Proofpoint-ORIG-GUID: eJRIuslEkzm7r1-Xi9O8i49UW1hm0DBC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=898
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100024

Only program the merge_3d block for the video phys encoder when the 3d
blend mode is not NONE

Fixes: 3e79527a33a8 ("drm/msm/dpu: enable merge_3d support on sm8150/sm8250")
Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
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


