Return-Path: <linux-arm-msm+bounces-58016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FF9AB7A41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 02:01:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C71374A483B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 00:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD6722A802;
	Wed, 14 May 2025 23:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fcrQhX3f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE41227E8E
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 23:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747266769; cv=none; b=VeBSLu6edgsegDlAHmovP1Ckrd/RSfpTR0D+D/YM1zrqQua0yl5i9Nzv/2Onf8uokadZ6ewBrhCGuud8PdyH6IDg8kwNSA17t/3sX3hMZ7a7BeBj7rLrfGS+al7qEircKTaZFAQk+5aH84QKYtQ2pIpoSDcjE5bEqiy/qaoawJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747266769; c=relaxed/simple;
	bh=LJxoREKG1XL73gufxTJCA+SzAt6XGYHG0jVRmznmXOc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dumt375VoSBXEVzzTNzUwXf/AwBn+b7xdOu5D9EEIn+3oZ0zhcRzZ9nrD7cPOvdLp7KRuwB6V+V/wYOcDhB6p10qup7hRzGCRTwC7BlkyGRm/tgn6IDT7uiPz+NyNh/HKM2/PK0wB+5fuTwnufDhfuEU1fH9q487j50HVr+xKrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fcrQhX3f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EI6Iem002689
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 23:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BRhu8YwpNijobr+4MmZRMLh9GsM2sOZBqrXfVfnRJic=; b=fcrQhX3fdoFCcpD7
	AknFry9k2Xe+dFYn3N+icIbWQjQzXqxCPvSbpxxsW6a1anwubaB8BYUy2Pyo8X3q
	qCNTxwXs07TQtEYcHRD54ZjoBe7jkz1FkpAf1VelGod6Uix1ZA1VqRn8N6h09arA
	SprFx3kgePYVBINNitFc/Aa2JncrLt+zsmbWy9Q7V98k7gP1VNhaqXRtZDiIGjNm
	NXfZWW20b4ls5uwZn/UqvfuzvIB+Gyd2xrebZn4CTclm3gjdwgkZaABnerN+IJxD
	nb4Tp05VUIWdVzPEe+TcoSUmexVrW/X2GNen1DDk5e14+JjsUSKocMyl20gjibCn
	eFB/6g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex4c5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 23:52:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22e544a4c83so11856645ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 16:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747266765; x=1747871565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BRhu8YwpNijobr+4MmZRMLh9GsM2sOZBqrXfVfnRJic=;
        b=SgYspyy16FhKwgKs+vHwfAhDnadu8ewghDbyb2AkOYTVr4ernSBEq2aBk8n/wmhkIh
         xxEP5FsJEILsxG74DF4mCZaiwJAvYlIkTEdClZb1+/iWtCS6db6gMhfJ1FeT+Pxl3slh
         q4Z0ybJokxYkH0HM4aaJF/VOeUYXv5GeqQuBRTBCJr6vp46E2abBQYLvXQFVLuYKcTFv
         WAw5dzdvkqn+WsBX2TKY83HOJWOd0WrMLii+VOhRyV4xL9iatGGBzmtNX7SMIFnocK5r
         MKzbfaU8kxokqCl5tAsdvsZAoMjbmCka45UDmEm/yvkX70qfi5094lOAS/51MmDNZxLQ
         9VzA==
X-Forwarded-Encrypted: i=1; AJvYcCVlw5I2TypDJ+9qVPIrd6pYuuq4238nQaAESDKAMOOo4wEFwh8FBAUm9e/ahGLTzIeui1RtpTPnTsPhAMOa@vger.kernel.org
X-Gm-Message-State: AOJu0YyrNCpAjzHTXR+5b9Xd7N5rMmJG3d+l8a2nEE8MMeEtK/B97xE5
	1mKNS4hrlVHNJasuLobKGMXw2BgsHdopKqozhmTQVJGHAJ7SJAcLIGi13q1k+qbh9KYxCNx7Bcb
	tTzbW0lhmkUrU2kFOS9Hs2ns2i9Ddv3bhAg6cgLOx1EhNet6R17dt6K+Ng/Lqx2GH
X-Gm-Gg: ASbGncsLHRfSW1TuzzRqOzxzLHE5tUmyneBVMqqrKMJnI/xqnU7uDTCzmZNJgi3adM2
	iv11N+s5U7F/hE9aegXOm48Zvt6qDIPR41bNCSlEWwoo+t++XNzrVGPSYxl5p7sciCs2zSR2hVL
	xbk/GLx2rl+OyZSPV5z9YN1Prmp2be7yD2/mzgMENf6afZOCIlMXMv4zu0Pvw2K0lVzAyTMZnlv
	LvKOw6TATIosPFhA/7/3swJnzjaazw3dIYQpuK6dnfBrZeIumYLM6Bqu3qJT9bC3L/ItsXVegKP
	lwXPftCwYU7RDOaqqio+t5fYmWGi/Ok81iUsvSrw8WQPnInwHIP8SgKp/fFaTzSJMKLAmCgV
X-Received: by 2002:a17:903:1cb:b0:220:fe36:650c with SMTP id d9443c01a7336-231b39cd939mr22860345ad.23.1747266765429;
        Wed, 14 May 2025 16:52:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWl547Eaa1HuST8YsC2jvoeIi/sfGg5wLzo0RdOuox7kr71FkkOobMA7KhfIji7/1nw2Luug==
X-Received: by 2002:a17:903:1cb:b0:220:fe36:650c with SMTP id d9443c01a7336-231b39cd939mr22860075ad.23.1747266765016;
        Wed, 14 May 2025 16:52:45 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271aebsm104468735ad.107.2025.05.14.16.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 16:52:44 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Wed, 14 May 2025 16:52:31 -0700
Subject: [PATCH 3/5] drm/msm/dpu: Check mode against PINGPONG or DSC max
 width
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-max-mixer-width-v1-3-c8ba0d9bb858@oss.qualcomm.com>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
In-Reply-To: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747266760; l=5882;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=LJxoREKG1XL73gufxTJCA+SzAt6XGYHG0jVRmznmXOc=;
 b=PwYU3BVpIjrVur560crJv94muOZ+bjKPiVJMa6Mn80V71LJ+zJ4Nklg2I2Jdj6vcsAh0tD709
 ypiHuz+F2u9AGOg+Gk5SGrpZXYi/rkvb6Oddh+8RJPoNVP65Oxzx+Sx
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDIyMiBTYWx0ZWRfXw41wNBni9WGZ
 6EhQ+IzfHRcu8VOvM7QCua85oAbBN95x2lCz7T+45ywl4Q+TeY0Ky0Bogx/iu1UONpRzTjkXHkm
 tkafpW2Dsp3rZfsysj532TBvJGC274L5B9THVNNFtrfNxsOkXVhJfGVW76EYsYwvlbiFSYJWEpw
 0ddd/gsTDSpH5cPnPY03J+waopZFZ3/Q/jFJjnUMHsU4pbso1WuD96b91UzDvDwLXFKvaVboqyK
 SP02lq+evIWpyPJUa7+LFTkn2ooENphUAWp/aJ7pblHcFUdWqQdIe2Ub6DP20Sa2X/1yPMgv30p
 s3c0/JnAduull1WnNeKGu+H4Qfa6NTX3g6IjxoV2LqIGqC3pJVQ9W1wpbztTc4CGG0mY6cmZlRZ
 WAbbEkb/j2pM7EcdEbRYDa3QlAHCjM6VanbPmbWCq1sMnllxXikmjhOjBAtJ0N2EOXgHF6GW
X-Proofpoint-ORIG-GUID: lLXkjeAUqLcIlghNr_7ZV9AqjHjJH7QM
X-Proofpoint-GUID: lLXkjeAUqLcIlghNr_7ZV9AqjHjJH7QM
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=68252cce cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=EO3rimgR04ZbLxXHhHQA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140222

Validate requested mode and topology based on the PINGPONG or DSC encoder
max width. In addition, drop MAX_HDISPLAY_SPLIT and base LM reservation
off of PINGPONG or DSC encoder max width

As noted in the patch, while DPU 8.x+ supports a max linewidth of 8960
for PINGPONG_0, there is some additional logic that needs to be added to
the resource manager to specifically try and reserve PINGPONG_0 for
modes that are greater than 5k.

Since this is out of the scope of this series, add a helper that will
get the overall minimum PINGPONG max linewidth for a given chipset.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 46 +++++++++++++++++++++++++++-----
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 0714936d8835..6131d071b051 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -723,6 +723,31 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc)
 	_dpu_crtc_complete_flip(crtc);
 }
 
+static int msm_display_get_max_pingpong_width(struct dpu_kms *dpu_kms)
+{
+	const struct dpu_pingpong_cfg *pingpong;
+	u32 max_pingpong_width = dpu_kms->catalog->pingpong[0].max_linewidth;
+
+	/*
+	 * Find the smallest overall PINGPONG max_linewidth in the catalog since
+	 * max_linewidth can differ between PINGPONGs even within the same
+	 * chipset.
+	 *
+	 * Note: While, for DPU 8.x+, PINGPONG_0 can technically support up to
+	 * 8k resolutions, this requires reworking the RM to try to reserve
+	 * PINGPONG_0 for modes greater than 5k.
+	 *
+	 * Once this additional logic is implemented, we can drop this helper
+	 * and use the reserved PINGPONG's max_linewidth
+	 */
+	for (int i = 1; i < dpu_kms->catalog->pingpong_count; i++) {
+		pingpong = &dpu_kms->catalog->pingpong[i];
+		max_pingpong_width = min(max_pingpong_width, pingpong->max_linewidth);
+	}
+
+	return max_pingpong_width;
+}
+
 static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
 		struct drm_crtc_state *state)
 {
@@ -730,13 +755,14 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
 	struct drm_display_mode *adj_mode = &state->adjusted_mode;
 	u32 crtc_split_width = adj_mode->hdisplay / cstate->num_mixers;
 	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
+	int max_pingpong_width = msm_display_get_max_pingpong_width(dpu_kms);
 	int i;
 
 	/* if we cannot merge 2 LMs (no 3d mux) better to fail earlier
 	 * before even checking the width after the split
 	 */
 	if (!dpu_kms->catalog->caps->has_3d_merge &&
-	    adj_mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
+	    adj_mode->hdisplay > max_pingpong_width)
 		return -E2BIG;
 
 	for (i = 0; i < cstate->num_mixers; i++) {
@@ -748,7 +774,7 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
 
 		trace_dpu_crtc_setup_lm_bounds(DRMID(crtc), i, r);
 
-		if (drm_rect_width(r) > dpu_kms->catalog->caps->max_mixer_width)
+		if (drm_rect_width(r) > max_pingpong_width)
 			return -E2BIG;
 	}
 
@@ -1279,7 +1305,6 @@ static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state
 }
 
 #define MAX_CHANNELS_PER_CRTC 2
-#define MAX_HDISPLAY_SPLIT 1080
 
 static struct msm_display_topology dpu_crtc_get_topology(
 		struct drm_crtc *crtc,
@@ -1289,12 +1314,18 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct msm_display_topology topology = {0};
 	struct drm_encoder *drm_enc;
+	const struct dpu_caps *caps = dpu_kms->catalog->caps;
+	u32 max_hdisplay_split;
 
 	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
 		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
 					    &crtc_state->adjusted_mode);
 
 	topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
+	max_hdisplay_split = msm_display_get_max_pingpong_width(dpu_kms);
+
+	if (topology.num_dsc > 0 && caps->max_dsc_encoder_width > 0)
+		max_hdisplay_split = min(max_hdisplay_split, caps->max_dsc_encoder_width);
 
 	/*
 	 * Datapath topology selection
@@ -1315,7 +1346,7 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	 * count both the WB and real-time phys encoders.
 	 *
 	 * For non-DSC CWB usecases, have the num_lm be decided by the
-	 * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check.
+	 * (mode->hdisplay > max_hdisplay_split) check.
 	 */
 
 	if (topology.num_intf == 2 && !topology.cwb_enabled)
@@ -1323,7 +1354,7 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	else if (topology.num_dsc == 2)
 		topology.num_lm = 2;
 	else if (dpu_kms->catalog->caps->has_3d_merge)
-		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
+		topology.num_lm = (mode->hdisplay > max_hdisplay_split) ? 2 : 1;
 	else
 		topology.num_lm = 1;
 
@@ -1501,18 +1532,19 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
 						const struct drm_display_mode *mode)
 {
 	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
+	int max_pingpong_width = msm_display_get_max_pingpong_width(dpu_kms);
 
 	/* if there is no 3d_mux block we cannot merge LMs so we cannot
 	 * split the large layer into 2 LMs, filter out such modes
 	 */
 	if (!dpu_kms->catalog->caps->has_3d_merge &&
-	    mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
+	    mode->hdisplay > max_pingpong_width)
 		return MODE_BAD_HVALUE;
 	/*
 	 * max crtc width is equal to the max mixer width * 2 and max height is 4K
 	 */
 	return drm_mode_validate_size(mode,
-				      2 * dpu_kms->catalog->caps->max_mixer_width,
+				      2 * max_pingpong_width,
 				      4096);
 }
 

-- 
2.49.0


