Return-Path: <linux-arm-msm+bounces-67363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A14CAB182EA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 15:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA51CA86258
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 13:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A01270569;
	Fri,  1 Aug 2025 13:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VjJ+wtta"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C7526FA46
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 13:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754056289; cv=none; b=ALkZXePZx9l6lTtt7UhigCCo53lhrAE0LC00f/Lwfk4V4ks7JaPo2PJuyq8PSJC7NO/xVqiZaEoRElMPBorCPnwlSOds/xjf09XA4NDdoqEJF+nmnKCdCVuABgtOpPahNGe4EoDSbHYUOma8VeUcR5HRRJQH0KtmBxIulAxPUfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754056289; c=relaxed/simple;
	bh=p1vIn/pLBbJ5zOAwN/G9XdaGKb83FPkfI1f2HSftzDk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=So6nbLJgSi6Iml3FAp4/8AxfYR4gt4brz7NELuHY1hGqbhQCFbskv6cKuxUUaQNKfnlGukhDKAUrYrhsjb5LEJittDTOXCOxKrdV1E9dXD/aZk09zFsEkoJBmpKDfP/7CblmVc9S2UW7UlBxDlLmdMVZGEmlE2kC9VMtXy55W6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VjJ+wtta; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5718t1wl024719
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 13:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W2UCi+malvB0ar8bb6DW9kSFC86prf8rvHe8q8tIWaw=; b=VjJ+wttaMaAyvo/w
	Jp5kH6NjJ4kszVYIFnbCxOw0/E9yoW10FgZrcO5RLvi/Kbfr/mAtYEMhvVQumaXH
	nQTyvuYeFYE+0nKGN5x35T1Nb4xPytiW8wf3Lu2PeYUrv4HItVqM69zKgjh33L9F
	EhpSEqU6KVVLjpnCG1hPIWwE+uLMC/ZsecUYpYeCqOz+c1bwDjU/xJbFsFllXdIG
	0ejkdZE7GPXkgWopZyMVGb9SKvOBA/zITP2odOuNECJ2nzvXfnCQBP9Cw4yUMUDx
	C0VDjmMMHajjU7xu4hcazhSMOkazuUh/7L5TVGL52BG3mKjFngQ1sLrW2ff2r1GL
	cTNtEg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48887g4fp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 13:51:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4aa826c9464so19162891cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 06:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754056286; x=1754661086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2UCi+malvB0ar8bb6DW9kSFC86prf8rvHe8q8tIWaw=;
        b=l3S0kJXF5/sN3VT5bUSSmvIwzDiLXTWXbAwthtAIJYwKf5R9Mm75cxSJJyS/GLlZ+m
         Um2MoACVmFvVrnObxQb/RBqm9RwVHDN7E/OycpNsunU9UL6xDbShKcEy3h1IK8/EshDg
         YX3xRCUbk7joPLoBDKtxxtnweFzmYDc9ZPNcauT7yeOEY71uVO6U0djL6fdLqIxw2kU7
         gylg9vJs31G+hrakapd/7M8dnou0xtNjZzV1PySyk1iTtP7gWYddVyZ4m+Fr76dm1QIb
         BdopnLkwqWiWNLEXp8dd8/dFnyFZO2JvMyIaViIU+OhbjCDTi8o6Guhd+rGge45NLzaH
         37PA==
X-Forwarded-Encrypted: i=1; AJvYcCXIDYPkzL7iXAEypTEaLoWkReuUamtjJslGG561KpGq8x7/QC9njhEsI4AeoYSgNgkF6oKsPWueAEmiz67v@vger.kernel.org
X-Gm-Message-State: AOJu0YyvqZHKb4LUenWtAHU0zPGW+2Uq82n8oM+vNv15W9Rqdq1vyr9t
	PblTo7XTPlfSg37BLqMnMGLeU+lszzELmk9zdrXWdnEzY95Pczqk18FOfuTPAij8a81ni8PJVzE
	K5bH9q6x4g5SV5C8wXWtyPZOiQiobo8qo+ursUKrVtKiQjMxzF0J9Hw5tfeltOLgrqWEF
X-Gm-Gg: ASbGnctNw+51AzJYDC0Ey+K83OUVRrYPkFoQqrm/tyqH2/xEV96opOzZ1DTv589KoXw
	AhOnuY9vM7Dqwv75Nl8PnouR0sA1/TDmB8mDiodCIDVIo7X3zxyOPtpBT6Uv9qirEGnYpQO3Z0o
	FpTigtTIqQa/YMR9/DCny7YGB382+3mjkBepK5xYzxTth/5n4As4weSbtK5E6qN8sVzCKS7z42u
	zA4Obg8BM8oMH1qyF251n6XRw+9N9xlNJq5WIED05zS7wnneyYNUdNobARg0P2LokzhHr/lxTci
	5MmhujkRWoogjY64sijuTPjrg+uff9vFvyTxdjLk1hoGWbzul8TYFiCoK8b/nkARYq/Bg5/q3uU
	B8IWtfvtGvcCWQp6lo9Wy62B9AG5k/G19fBm6SvN7uwmhFJ4U/XTC
X-Received: by 2002:a05:622a:4fcd:b0:4ae:f1c4:98fe with SMTP id d75a77b69052e-4aef1c49b02mr76647801cf.34.1754056285905;
        Fri, 01 Aug 2025 06:51:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAwqWqcrYsHbU0F2gj2xmMxu0CXmwPTRpB2ryFYEdGwGRHG1UFGg9MBUQvZBikakoqd/cRgw==
X-Received: by 2002:a05:622a:4fcd:b0:4ae:f1c4:98fe with SMTP id d75a77b69052e-4aef1c49b02mr76647531cf.34.1754056285484;
        Fri, 01 Aug 2025 06:51:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-33238273006sm5917801fa.9.2025.08.01.06.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:51:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 01 Aug 2025 16:51:13 +0300
Subject: [PATCH 5/8] drm/msm/dpu: use drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-wb-drop-encoder-v1-5-824646042f7d@oss.qualcomm.com>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
In-Reply-To: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2200;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=p1vIn/pLBbJ5zOAwN/G9XdaGKb83FPkfI1f2HSftzDk=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0bPsWCx0yvsNgYcls5I+plW1j3Fjjm+X0px0rzqd0vs0
 k3EioQ7GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCRty0cDE2u3dqvkrq7bmfF
 GxbJfBK+ZLJFuKaj26z4TYAFw/fJBZ2aYT3Gdf9/PWAxvbefn01Pz+WJmX4Nh7rCawmJhRy1706
 af0ncqHWyLqckPz6+/8blWQf0tQ+x+89a5TX7S45x/TNzlh3qyeFRl37Ezzy08rXZJ8bL6ooyoV
 EfHX5Ebo1krQ1gmbFK0crxnYXlZhXrdSGia/STswu9wpY82y07y9lQNGfJ8xOBFYyxVkrZOx+qb
 Vw16+qNB63ze6WmWzmfX/E88/ZurZg1MdG+O4LnBeR9/WLr+eX0wq2SAr+u6EnEO5o6eYV8PfnA
 vv3RupYU979rBV5UGpx5cvFAoH1d+/sSiX/KJit4UycDAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Vdn3PEp9 c=1 sm=1 tr=0 ts=688cc65f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=mhD89yN676IZukTL2GQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: jV-l0pqo-a-0uhUOJDeZLZxDN9J_-Qti
X-Proofpoint-GUID: jV-l0pqo-a-0uhUOJDeZLZxDN9J_-Qti
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwNSBTYWx0ZWRfX640Vxx0syy1c
 w+5eDGK+avW2EPHP/U6i7Ai0hvd+WfNEl3AqMW8/kX0lRMeiFdVdP7Hog/iY77J08cU4Mh/4SbN
 jnQSfIs9GAvRJ4Shcg56+sFPwE89PzSczqTjeXgY/PjtQT7XMIL60cqyV+N1G6es1eumdObwS5h
 GG1mBfTht3fWQP2hqobqy7FrYBdGC+u2FGL4O7+Fu6lpNANmj1MjRUnUR4AgFeMkBr7hWAgmd2m
 spg5+Tw6ZS+Gs1CKqkkxadx3/dgpZORAA6jU/G2SMBAH9vqWj1kUhOZ2T9WhEunZ0qhWTvO7PtF
 PX2WjpD+GPp/F2yrXYBSGi67I3pKqgGRJGo4sRMIfKuCUBuL3eeozTgQCabbTZnMbIYeibUVCbD
 T7IHFmP56i18frJKSUApcq8lIR135Vme3IRehOKouc6JilSwglOHzweL9eyYM5X50EX1ASUa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 mlxlogscore=911 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010105

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 23 +++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index 8cd37d7b8ae281cbc1fd8cbb243c621174517e23..9986a10e8114680e9da48986f4ca3ce6ec66b8cb 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
@@ -134,7 +134,6 @@ static void rcar_du_wb_conn_reset(struct drm_connector *connector)
 static const struct drm_connector_funcs rcar_du_wb_conn_funcs = {
 	.reset = rcar_du_wb_conn_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.atomic_duplicate_state = rcar_du_wb_conn_duplicate_state,
 	.atomic_destroy_state = rcar_du_wb_conn_destroy_state,
 };
@@ -202,15 +201,25 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 {
 	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
 
+	struct drm_encoder *encoder;
+
+	encoder = drmm_plain_encoder_alloc(&rcdu->ddev, NULL,
+					   DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &rcar_du_wb_enc_helper_funcs);
+
+	encoder->possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
+
 	drm_connector_helper_add(&wb_conn->base,
 				 &rcar_du_wb_conn_helper_funcs);
 
-	return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
-					    &rcar_du_wb_conn_funcs,
-					    &rcar_du_wb_enc_helper_funcs,
-					    writeback_formats,
-					    ARRAY_SIZE(writeback_formats),
-					    1 << drm_crtc_index(&rcrtc->crtc));
+	return drmm_writeback_connector_init(&rcdu->ddev, wb_conn,
+					     &rcar_du_wb_conn_funcs,
+					     encoder,
+					     writeback_formats,
+					     ARRAY_SIZE(writeback_formats));
 }
 
 void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,

-- 
2.39.5


