Return-Path: <linux-arm-msm+bounces-40695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E83879E6634
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 05:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98F73162A14
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 04:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E019201019;
	Fri,  6 Dec 2024 04:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d4liHUeY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0FE1FF7BE;
	Fri,  6 Dec 2024 04:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733459606; cv=none; b=I71JlcGOOpTAdrgv6ShChtFiP/TwPfno5x0uNM1eIcbyFp/8EklqNW+TTru3KLtTHT2miJTVYt7/WtjNktH7jiyBJzVSoHXooYm7BgioNoH8hg2JdUC3YHNd6e7rkglySdDadodQpOcOhHPYYH546wSNZ3W5qi3HwWf6RYSu+7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733459606; c=relaxed/simple;
	bh=LEEfUhfRKbBEc4uyaIuwH4gqtkTHamsReU8x6C09rnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UZ5cw0NNNCmw4NlTCdG+TWWmEvBUfX+dGCwQgvnA7tPgMfqPQyyaO9NHj5ZqVZDjMvyDMZIqJ/PvuWK463sIyOWmVxfHDoIIZT3RetaC2D8vA3qvyU4GR9HpXkLB9iLFS/dM2jRCKDcY0VUbX6EEJ8rT1OCrS0gMiL9SoI/NhJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d4liHUeY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5Ha0CZ016950;
	Fri, 6 Dec 2024 04:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPzUDL0BP3vH4nOdJYXcEYH0hjmJBDP4ZaRfnqjC8y8=; b=d4liHUeYjnBEKTr4
	kA3anCF8qSuDbgSeAHA7W+IljuvfUmmD4ej/jgrFvGr/BhkRJfmr1dibnSNkHDJi
	tQLVHDvXQr4XlU1IthCEEB/C0i1LngeIgTiCVfaPNsXeOl+X6c6qPPZL4C3rG+/1
	Un/xY5R0Cf9nCkwro+0JCMOVKJp2xPD0N4HOa7wv5Rbq+Y4uOxD+8QA+AWq7CwWW
	okKMwyFwd1NHtbNsEB0com0AUH2s9knKHxJv2Pmi82m7X4rpLjTugw6iory9lbQn
	qvEPSPuiU/h7Vk4LQCtNZneTMgujLxdIAKC9PDKGDI8wgj5cJDPOSCzxCt/buJ15
	C38aZw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbnj2a3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 04:32:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B64WmZB017289
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 04:32:48 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 20:32:47 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 5 Dec 2024 20:32:12 -0800
Subject: [PATCH 41/45] drm/msm/dpu: use msm_dp_get_mst_intf_id() to get the
 intf id
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-dp_mst-v1-41-f8618d42a99a@quicinc.com>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
In-Reply-To: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        "Chandan
 Uddaraju" <chandanu@codeaurora.org>,
        Guenter Roeck <groeck@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>,
        Tanmay Shah <tanmay@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Jessica Zhang
	<quic_jesszhan@quicinc.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733459543; l=2728;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=LEEfUhfRKbBEc4uyaIuwH4gqtkTHamsReU8x6C09rnA=;
 b=AEgASmCPXiJBJm6KrXJt+Vr5NwdKzztOueP4hKt+jwY23SJjX11Pk/vpX8SlW4fDp/RPG0KZJ
 aJEAT2K2EhmC1Rhdi6ki3ZxgGE1IMZ8WvnyloviLHZcG105rM/5ic6S
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FAYP3OEDAtTrFPBQmm5326FftiJA9QT3
X-Proofpoint-ORIG-GUID: FAYP3OEDAtTrFPBQmm5326FftiJA9QT3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412060029

Use msm_dp_get_mst_intf_id() to get the intf id for the DP MST
controller as the intf_id is unique for each MST stream of each
DP controller.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 83de7564e2c1fe14fcf8c4f82335cafc937e1b99..ce2f0fa8ebb1efd1a229a99543593965dbccd752 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2512,17 +2512,23 @@ static int dpu_encoder_virt_add_phys_encs(
 
 static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 				 struct dpu_kms *dpu_kms,
-				 struct msm_display_info *disp_info)
+				 struct msm_display_info *disp_info,
+				 int drm_enc_mode)
 {
 	int ret = 0;
 	int i = 0;
 	struct dpu_enc_phys_init_params phys_params;
+	unsigned int intf_id;
+	struct msm_drm_private *priv;
+	struct drm_encoder *drm_enc;
 
 	if (!dpu_enc) {
 		DPU_ERROR("invalid arg(s), enc %d\n", dpu_enc != NULL);
 		return -EINVAL;
 	}
 
+	drm_enc = &dpu_enc->base;
+	priv = drm_enc->dev->dev_private;
 	dpu_enc->cur_master = NULL;
 
 	memset(&phys_params, 0, sizeof(phys_params));
@@ -2559,9 +2565,18 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 		DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
 				i, controller_id, phys_params.split_role);
 
-		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
-							   disp_info->intf_type,
-							   controller_id);
+		if (drm_enc_mode == DRM_MODE_ENCODER_DPMST) {
+			intf_id = msm_dp_get_mst_intf_id(priv->dp[controller_id],
+							 disp_info->stream_id);
+			DPU_DEBUG("intf_id %d for disp_info->stream_id = %d\n", intf_id,
+				  disp_info->stream_id);
+			phys_params.hw_intf = dpu_rm_get_intf(&dpu_kms->rm, intf_id);
+
+		} else {
+			phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
+								   disp_info->intf_type,
+								   controller_id);
+		}
 
 		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
 			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);
@@ -2662,7 +2677,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 	mutex_init(&dpu_enc->enc_lock);
 	mutex_init(&dpu_enc->rc_lock);
 
-	ret = dpu_encoder_setup_display(dpu_enc, dpu_kms, disp_info);
+	ret = dpu_encoder_setup_display(dpu_enc, dpu_kms, disp_info, drm_enc_mode);
 	if (ret) {
 		DPU_ERROR("failed to setup encoder\n");
 		return ERR_PTR(-ENOMEM);

-- 
2.34.1


