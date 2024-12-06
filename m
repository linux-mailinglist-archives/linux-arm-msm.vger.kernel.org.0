Return-Path: <linux-arm-msm+bounces-40841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3397B9E79A0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 21:03:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEBE516C8E2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 20:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9B4204583;
	Fri,  6 Dec 2024 20:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ldRGGePg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4314621B8F1;
	Fri,  6 Dec 2024 20:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733515294; cv=none; b=Nx8L0QAgxhoSKaEuReVKK5TCR+C1xCSkb8DhxHOWsRktxZE84c90cHYLJYwhwIxHVGHovOLHH3DvusZTGpL/SU8Thx1JgtPt7a5Bjl2l97Bj8JSX1t2rnMogGyoRvLQSc6FKKoaxm8syXBMx486VwrYaCT6BKtmBPnL5onK1Jqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733515294; c=relaxed/simple;
	bh=1TqK6eFSBkkNlW1TcZFQQzM4tjytTsdv7DBHboy7dPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=JcZ/wDCmQrgc2cEESL0Nb32fc5DrI+dvAL2k73zmJRI0nGjTiYzblHMgHROa+KDVyQtktRTuiHkGi+GZF6/yL5ctSXibv5NBh/MSRhGh2hDhxD08N+Tnmv7IZScJJOGpxor03Ac1vw2+g6/pLBjRkIqE+oIOZOUQ7D3Abo7hJWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ldRGGePg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6Hf222015724;
	Fri, 6 Dec 2024 20:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yqAdPbCoJR/ojErb+Mcpir
	O1X++MJoZOr1YGUA3j40Y=; b=ldRGGePg/KUxFjzYSrjY43V5Uf2sYmZMZaThQN
	ODPpG+BERV56ILH89XV/yBWTnxajAxyW3m54pQzjKvhRVPxdeKAE+n0QFYT3OtdA
	coa9Dv5uE1eTGlke528yGTkHtTKsLUqE4Ib06rcLWySZ75evVll4q8jCi5JXdeDz
	6eCxZSgYIbCIuSLfj74KntEnGDq4N4K9Zge2Ic49etZ+CNZ8hV2COuEtKlUH4eA2
	DR/xeL8ryDDtrx+0Shj5gqfFwuhkLgxUMqy19e1isxvSHXR5nHQirfdlwxZ1ZW52
	u0BTJTth9rYIeeNS7zedfu9GWmwEODYLhFJCNX95GccccKLw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbnmmnky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 20:01:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B6K1OuO030690
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 20:01:24 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Dec 2024 12:01:24 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 6 Dec 2024 12:00:53 -0800
Subject: [PATCH] drm/msm/dpu: filter out too wide modes if no 3dmux is
 present
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241206-no_3dmux-v1-1-72ad2677a323@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAPRXU2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIwMz3bz8eOOU3NIKXVMjw0RT09REAzMzSyWg8oKi1LTMCrBR0bG1tQB
 Hd+JpWgAAAA==
X-Change-ID: 20241206-no_3dmux-521a55ea0669
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733515284; l=2102;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=1TqK6eFSBkkNlW1TcZFQQzM4tjytTsdv7DBHboy7dPk=;
 b=S9GR48JxM1rSX5BBm5daNzNP4zneoL/LNnGbgN6NwqHR9LJs/5fTMtEVOeac5yUtuiaZI+abR
 hQDHP2tr7SiBf1D2LsF2s/LD3azvl9aBqn5AJyIgeg5ZtiaHkd27ewh
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yauDBGK0qToCbbtXu3ZmJGxKBT1A4Ckn
X-Proofpoint-GUID: yauDBGK0qToCbbtXu3ZmJGxKBT1A4Ckn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=578 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060150

On chipsets such as QCS615, there is no 3dmux present. In such
a case, a layer exceeding the max_mixer_width cannot be split,
hence cannot be supported.

Filter out the modes which exceed the max_mixer_width when there
is no 3dmux present. Also, add a check in the dpu_crtc_atomic_check()
to return failure for such modes.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
Note: this was only compile tested, so its pending validation on QCS615
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 9f6ffd344693ecfb633095772a31ada5613345dc..e6e5540aae83be7c20d8ae29115b8fdd42056e55 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -732,6 +732,13 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
 	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 	int i;
 
+	/* if we cannot merge 2 LMs (no 3d mux) better to fail earlier
+	 * before even checking the width after the split
+	 */
+	if (!dpu_kms->catalog->caps->has_3d_merge
+	    && adj_mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
+		return -E2BIG;
+
 	for (i = 0; i < cstate->num_mixers; i++) {
 		struct drm_rect *r = &cstate->lm_bounds[i];
 		r->x1 = crtc_split_width * i;
@@ -1251,6 +1258,12 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
 {
 	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 
+	/* if there is no 3d_mux block we cannot merge LMs so we cannot
+	 * split the large layer into 2 LMs, filter out such modes
+	 */
+	if (!dpu_kms->catalog->caps->has_3d_merge
+	    && mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
+		return MODE_BAD;
 	/*
 	 * max crtc width is equal to the max mixer width * 2 and max height is 4K
 	 */

---
base-commit: af2ea8ab7a546b430726183458da0a173d331272
change-id: 20241206-no_3dmux-521a55ea0669

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>


