Return-Path: <linux-arm-msm+bounces-69824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 799AEB2CE00
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 22:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0EC91BC7D2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 20:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5DA32C32C;
	Tue, 19 Aug 2025 20:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IiUQr4VV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6107E337698
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 20:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755635590; cv=none; b=g7FjcLqUfP9iQlkwXaiJPlHCQPSSJDhi2gfeBTxWdK0HGc+VEW1ezyCsdU9uHj/lR4NbUZo0xqBoG0DurcPMPm4eUIsFMIXtoo8fR+WLYNk1ZnE9ykwdujSdTa+ZYQFVvsL6X1i1e/Lli1KIxvqowFgQXgE+3q6wrWvIIFRzvPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755635590; c=relaxed/simple;
	bh=pfarMdKTP3PKuK/rYN2PwD9JvqS3ROd0ZonPoWJ3yhg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s9BJkNafFzB3e1GnsU+GIwdETU9LXx7MursxHgeztZ/bDFTJJyuPl+mUp4iG3UsLJw+KE/BaXHIHH7yZIiCP5kImUDTBn3CZwSaB2I9H01ig10q35YIkBfuBr90TfGaGxAuVB3iQIEJ5KrCHjVycj/3nHqmkPIx10tFdOgGEPBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IiUQr4VV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JGZ2l4030484
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 20:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ovJO1XSWvs0KNakJASmsJP5sNHD1z0QwbqY++5/N+xM=; b=IiUQr4VV5TbyzTFC
	CN1iQjZqVwVVM/orFQS3P0PoGA1Pl93VgXACCmF+oOSbcxExjnyZ7dJ3BwVfTH5v
	vrol8L4OUtyeylkdzVy6WUHuRUHtXyDqIfl0NsIUzsrltwZ4xUEONym14TGAFzRS
	2Z5hXD+tfeEoZgOnAzsYYBYskF/9xEjZ+D073I0sE5Jl5QktSeP9/CXkALhB7/Zd
	b1JTJ28dkpcjZbHKQAnz6L2UDY2CtfpuEgn/u7P/15NZHnIVXUkA5sCc0IQe1i6r
	q78OjlfhywLdgYVAydE6CDO6dF4LMC40FcD9NfdjFLtBPF1D1ZJjtNKyRezZ8qpT
	jdN3rg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyunx4m5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 20:33:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a88dd04faso203217246d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 13:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755635586; x=1756240386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ovJO1XSWvs0KNakJASmsJP5sNHD1z0QwbqY++5/N+xM=;
        b=Ld9x2wGpwoTA5NDhBbOv+uPWAUWf+4yB5odLzTe4tkYS8pjWKJndetAtLeW3vT0mnJ
         PZGScqVF77+Zf+WgUaPzt6XQWYcajbvAfY4Inxi+Dnz3tJmKwvtx11qFaEKczaLaP7OK
         k+AicLm7YF2kC7VpPH6VgP4FwkPqqPMdYRp2o7c0pmeGQ1pAMn95VX02Et3oyyjjIIn8
         4Jc/42TKh7SYWtCTXEoNEdGlaGfITeJkADKFv/lxPLwo04n4Ue3nnlkq1ab4cJdTirQE
         iq4unu0psPWvB3mM3H+E2fcwmzbKl4uhoL5BAbATPbF4TIm6tDYG3LZS5JpIsyPxDqm9
         xsYA==
X-Forwarded-Encrypted: i=1; AJvYcCUfvHLLoU6QMTX2RywpbmyGrvIVZykYzek7xPLf7LkVXeBwtDGOXTVbK6JUX0RjSuz+z5dZkKErywJsEOfs@vger.kernel.org
X-Gm-Message-State: AOJu0YxlpWexv7N0Y6INaReQA0oxA7+WTlvw/dyb40yTzxfThMt0cNS+
	U6oSBSD+sMSSDLCCQjywtLUv3W2pvQj8h7eGDc+HayVP+OB1+/1T1iSPkY04sQePKBRtwRLuZJQ
	V9+iN3/GLmelDrAl9BQEEAvjb/kgQTlc0ZgTXED3IcQiqdvXMo1+We0Vma5NSwYmRax6C
X-Gm-Gg: ASbGnctOZIjGoZY/Uouf+UpmbI4cvTEFT1xYbAgnZNrqFClYR+As73NANf58r/p0jKq
	R+FjGK4v9Ezzc32j3ezKAyv6aDD5SoNhqFnTncGQacoNV1ITK9C5wkuHA19vat57gpEBF1a6atg
	aST/bKFr67lVP6iIPoAzDUAwi9r5l69VI1E7YXKmBBioRi19xcc9LY/yY7oE3ZhAmZU4zW3+x2d
	x+PjRxAo0HtmTO4YjUVgh3iDQqGykuNGoKGj3M/bVt5UVhqReL9EtT1Y51QAus7w3sfvHLq93P1
	FsRobUHMIU4v4NEAsHIMU+U7KcklDhd8AMEOgs8Dxes0lpF7PntAYrgXyJH4GsS9yhBGjyPHcHv
	BGHdW6NUyeeWQQv2mMIE+rgP8jTT1Acde+PvkyfZ6IUlMOdPJ69Qy
X-Received: by 2002:ad4:4eea:0:b0:704:95c6:f5f1 with SMTP id 6a1803df08f44-70d7709978fmr4710476d6.34.1755635585972;
        Tue, 19 Aug 2025 13:33:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExtlapPhC4VdvxehLvtICbE+wf4VkX5gXmldiks/+ryTub2wDdZG116DcdFZUySCphNajoXQ==
X-Received: by 2002:ad4:4eea:0:b0:704:95c6:f5f1 with SMTP id 6a1803df08f44-70d7709978fmr4709826d6.34.1755635585259;
        Tue, 19 Aug 2025 13:33:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef351806sm2212969e87.13.2025.08.19.13.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:33:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 23:32:55 +0300
Subject: [PATCH v3 1/8] drm/amd/display: use
 drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-wb-drop-encoder-v3-1-b48a6af7903b@oss.qualcomm.com>
References: <20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com>
In-Reply-To: <20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3090;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pfarMdKTP3PKuK/rYN2PwD9JvqS3ROd0ZonPoWJ3yhg=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8aS+zVx+7sDXTal/otbFF9xSvEB653da1pVu5wcjWZwb
 P9p8uJUJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmUqvC/t+J/b2vPYfQ9w8Z
 7fcdbLozXYrsLgarn7RWWJkyI+udhmF3TqT3PPkPXdKqr98e2FnOcfmUBZvjJ+OHMwzU1X+XzH4
 8c7+pkaBR0rXaRzuc8vSXn3diK2C38P76+qyPl7q9wOZFYfahPLmCqbfOMi/xPHvDW2eKlkVy8Y
 +g9f5/Wd5z/c26m3dp6yIb0RI+2eclWryLDPW7Mwu3sSZsFb+3U9X47reNOv5+gmX68zVeCnmUG
 Z3dzGW37vy7Mu6zvYK/753+cDXLcG25q4HNr4XPLrptYufLDu1/981izUrO9Q3xVyIvLYif9lZf
 LCz2it/0pWd+3vugZlfn92Vhc7tUC5Noamr9xabCb2XnAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: J6LQ8F_HKjbpBE4E8XU1k-boLbfBqjor
X-Authority-Analysis: v=2.4 cv=N6UpF39B c=1 sm=1 tr=0 ts=68a4df83 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=P-IC7800AAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=M-qvw7r3wQx8XY5Jx90A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA3MSBTYWx0ZWRfX2mdB7p0ZJDjX
 irqDHUa7IyPU4KGz1tThYRwz2osdbaxwVboRrtsfygrDp8AxWhFQa7OphFtw153sT72ufiJQE0m
 EAGR25LEYkzvRSCpb8Lv3KTu541Nw0hlhx6zu5WBIc1HZyNT8x3eaP9bFBpZUUz7qM5+fgKaHdP
 sEX+B6J2/OiJL69SDjAn2URuIfp6fjNOVNXiuY/TTkkYEfVQmSOhYU4sRdx+8gvPV9GTIloNpOH
 wJVbsOOFsXy/NubSqI/5dGIl3DjbK4hPWy6CX2mf4gPhhc5WjgiUV4sljYRIBu27meGNtZte2xK
 Ouxcj3vOape6wkWsR4vB5fsk6sH1wG84y5XV3mds2x2LZu1idRPxzHGmw6k0W8rUMSZMyrSY8C7
 K03lKccW
X-Proofpoint-ORIG-GUID: J6LQ8F_HKjbpBE4E8XU1k-boLbfBqjor
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180071

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c | 18 +++++++++++++-----
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index cd0e2976e268da41f576624c50ef0c76ede67414..0c9d347b1efc804a28fb3095df94e543a19e4159 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10006,7 +10006,7 @@ static void dm_set_writeback(struct amdgpu_display_manager *dm,
 		return;
 	}
 
-	acrtc = to_amdgpu_crtc(wb_conn->encoder.crtc);
+	acrtc = to_amdgpu_crtc(crtc_state->base.crtc);
 	if (!acrtc) {
 		drm_err(adev_to_drm(adev), "no amdgpu_crtc found\n");
 		kfree(wb_info);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
index d9527c05fc878ef6916782ff9fde847813938461..80c37487ca77c0494eaf769c5b9a3c53486aa52d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
@@ -171,7 +171,6 @@ static const struct drm_encoder_helper_funcs amdgpu_dm_wb_encoder_helper_funcs =
 
 static const struct drm_connector_funcs amdgpu_dm_wb_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = amdgpu_dm_connector_funcs_reset,
 	.atomic_duplicate_state = amdgpu_dm_connector_atomic_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -190,17 +189,26 @@ int amdgpu_dm_wb_connector_init(struct amdgpu_display_manager *dm,
 	struct dc *dc = dm->dc;
 	struct dc_link *link = dc_get_link_at_index(dc, link_index);
 	int res = 0;
+	struct drm_encoder *encoder;
+
+	encoder = drmm_plain_encoder_alloc(&dm->adev->ddev, NULL,
+					   DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &amdgpu_dm_wb_encoder_helper_funcs);
+
+	encoder->possible_crtcs = amdgpu_dm_get_encoder_crtc_mask(dm->adev);
 
 	wbcon->link = link;
 
 	drm_connector_helper_add(&wbcon->base.base, &amdgpu_dm_wb_conn_helper_funcs);
 
-	res = drm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
+	res = drmm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
 					    &amdgpu_dm_wb_connector_funcs,
-					    &amdgpu_dm_wb_encoder_helper_funcs,
+					    encoder,
 					    amdgpu_dm_wb_formats,
-					    ARRAY_SIZE(amdgpu_dm_wb_formats),
-					    amdgpu_dm_get_encoder_crtc_mask(dm->adev));
+					    ARRAY_SIZE(amdgpu_dm_wb_formats));
 
 	if (res)
 		return res;

-- 
2.47.2


