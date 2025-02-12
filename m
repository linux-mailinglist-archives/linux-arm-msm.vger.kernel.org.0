Return-Path: <linux-arm-msm+bounces-47687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76969A31D32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 05:00:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28925165DD5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 04:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D441E7C34;
	Wed, 12 Feb 2025 04:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Lp+F64K1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2741DB124;
	Wed, 12 Feb 2025 04:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739332805; cv=none; b=LO2r1flpkZOqXG6QEr4jRRh/6+bDzH85ddPwkFDamde2UZNnNdSiunrb0iiiT04waBFPYphsnsEBe1J+J3Xw2W5tkrL3ofbtAIIsdujk2TChbwBvayPjaen7q5taTpHitH3vr4C/C7EW9A7d2RmkGyQ20E7HgPCiBVGkEwL5L+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739332805; c=relaxed/simple;
	bh=8kcper8CAFRodFkRMBu4A1TuuFMoHJub3pdsXDGvIgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=DUM5tJ9XhaybkPCna78eOQker5L5P/NKgjXG+5NZJpx0dFbGAwiTj9miBFXNYBjaSwjHwfoBWiRvUYBRwY+kd6mU1bOVIybdl/11au1UyVH1DLqq3Fxx5VJAXjXQBMOfcwlJ986eS7EtqNNC0esrKI4/xnUB3tP+NYCOsR4NytU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Lp+F64K1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BIEtd0001430;
	Wed, 12 Feb 2025 03:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hlrFOGNWh4gxUPbMjBQR/M
	gi+eoX17QXqjhfpI/BVUU=; b=Lp+F64K1KHncd6IxgvU9UujYwhlk62hQ4moltz
	Hj2kwdiVaPOJVycQh5vfQVKHmhNlrIeJUhV6pbNypU3/o1xWM3xRCe9+J1khKkih
	LG7ia+tLTx9AHrQZusBtmiUoSwS/XpzIjlPzzGsUiTELpZpPS+hbd8N8XZf9bEar
	uFCcp4sD7W1ba4c2Pv25Vo689QR/k2TmmNBh7IGsPelmJu+0bmgqEd6POnmxt/Ba
	OXJm0Kl6+RbwcliNKYokblCo9mlYGrKWlWy48Udu/MhaJGdzsozdNUk3ascMTWji
	nnZ0uY5XNFeS6BXpq7jphnjo+gWQSyFI3WWPxwo2lpDo5cEQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qepxp5c1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 03:59:55 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51C3xsXb010904
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 03:59:54 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Feb 2025 19:59:54 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 11 Feb 2025 19:59:19 -0800
Subject: [PATCH] drm/msm/dpu: Disable dither in phys encoder cleanup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250211-dither-disable-v1-1-ac2cb455f6b9@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAJYcrGcC/x2MQQqAIBAAvyJ7TnCNkPpKdNBccyEsNCII/550G
 uYw80KhzFRgEi9kurnwkZpgJ2CNNm0k2TcHrfSgNKL0fEXKDcW6naQzxiH1OBoToEVnpsDPP5y
 XWj8Bo4rbYAAAAA==
X-Change-ID: 20250211-dither-disable-b77b1e31977f
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-f0f05
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739332794; l=1589;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=8kcper8CAFRodFkRMBu4A1TuuFMoHJub3pdsXDGvIgo=;
 b=YcjriMXuxEwHpAJLvn2pYXby+nxL22zkTApcPQZgxH2kvcg5R1XVGLxETXPDdy37vvHhfSezp
 R7N/hxUCfn3BSIwVoTzqOtfoZlTc+7pt7PYfKcOvs28WIwTrxOlZ8Gk
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: si1Do7P2oqDc3Kr0s6RXFpDYmXpN33Iu
X-Proofpoint-ORIG-GUID: si1Do7P2oqDc3Kr0s6RXFpDYmXpN33Iu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_10,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=803 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120028

Disable pingpong dither in dpu_encoder_helper_phys_cleanup().

This avoids the issue where an encoder unknowingly uses dither after
reserving a pingpong block that was previously bound to an encoder that
had enabled dither.

Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Closes: https://lore.kernel.org/all/jr7zbj5w7iq4apg3gofuvcwf4r2swzqjk7sshwcdjll4mn6ctt@l2n3qfpujg3q/
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
This was tested on SC7180 Trogdor by pulling in the concurrent writeback
series [1] and running the IGT kms_writeback@writeback_check_output
subtest.

[1] https://patchwork.freedesktop.org/series/144083/
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5172ab4dea995..48e6e8d74c855 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2281,6 +2281,9 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 		}
 	}
 
+	if (phys_enc->hw_pp && phys_enc->hw_pp->ops.setup_dither)
+		phys_enc->hw_pp->ops.setup_dither(phys_enc->hw_pp, NULL);
+
 	/* reset the merge 3D HW block */
 	if (phys_enc->hw_pp && phys_enc->hw_pp->merge_3d) {
 		phys_enc->hw_pp->merge_3d->ops.setup_3d_mode(phys_enc->hw_pp->merge_3d,

---
base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
change-id: 20250211-dither-disable-b77b1e31977f

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>


