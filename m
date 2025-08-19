Return-Path: <linux-arm-msm+bounces-69826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B91EB2CE06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 22:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F41851BC7D91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 20:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252EA3431F5;
	Tue, 19 Aug 2025 20:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AOw0gzB0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9AE342C9B
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 20:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755635593; cv=none; b=YVGUExq4EKwU3ygMWDxcOPbTx4H8RFe9GqR4a4WWsKbeYmxCybzhH/bhIyBm0BA4FsgcFCwh0fmAm8jHdhvvQiuY8Bf7dcu01gQC1H6u1DpnagCAO8u1h+2CPDZh+O26D5al3DbMAq4geQvXPcY5ss57+nkyjTpNWqMDYL/FUQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755635593; c=relaxed/simple;
	bh=bSu7BtDX/FJ/CYhdTG49eD8oSIyWKKcC6qKfEjkvl9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kOTuuue4BLg91udnq7ZoNUjkPiC8JqXqqL8+CmxXyB4/0XVBlz4Cr5JbkJaWyYl7RE0/fV1Zf1MRClb6K2k7eThFCkEIlh9SKgkxXkRcsUGKhQ2JDY3SRx4V93JK15CzEFSHclrg3UG16A0FrxXiXQR1MVQayTSN6ViUdKsQn3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AOw0gzB0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHOEr5001874
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 20:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TRcyMGCl+30uALX35qrVjgv24YuvpY2moJlPtRkxYu0=; b=AOw0gzB094/vDr2i
	z2iu5TdlCo6XWCCXSc9Y0sx5QYAEBOj1Azj739aDVgO52hmdX14GEtx/lMzHirDa
	w1ezg4r0DxiL/qIciNJH3n5aTX3CoKP2nfgy8tk4eJqbugDVkykePpOIvQaoptGI
	2JEZXFIyPvo4sKDhJqO0WP6xr5NZMRc6A+lpA98BwggLLtDobFKxkFWDIQxkVUEp
	IBjWiR9zFKHh76Gc8LCRf50emHPMZYvDxkLMGt5nrky7vpmZ2Q3ceWRMHPg9ros4
	iOXelJWmZz5EWkLA5FJiVpzvf4jQ7fMquaDN/NI8Nv99ajmqB6dDZIpjqChu8qY5
	OnHvGw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh079vgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 20:33:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a88de16c0so131157656d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 13:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755635589; x=1756240389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TRcyMGCl+30uALX35qrVjgv24YuvpY2moJlPtRkxYu0=;
        b=RcXG1yz3X802H7Y4Tfs1R9MX4uxckjWHDzXdENxSL8nzmWuyNBAe/sFO5WIqZxv14D
         Rseh58DiRPtyhrbIO8W8M+yFJSE1i5EzI4J9Oxf/P6odMV/iNW9yMMA53eQW+4LPS3Ph
         m/qRn6BshkppqUKq7TMDe3BIV5lpdURHFCayzvKyFBalFJYQE3O+5N0wH/fpdO0wvs9p
         CQ4j35EgZMVijYRm/kBcgumMOhlhDDBtXHt/BKjbnHNsm1JbMcWTzB9cshAF6zyhkOhj
         l6St/rjUFyuddDf9rK1vOJPeOqkqbzrCTsgR2W0i0hRv+i0qxFziXeYMX7sgE7yBKixO
         9B8w==
X-Forwarded-Encrypted: i=1; AJvYcCXrNiKXaJBvamTdvTP45kSt4ESxm9jurqGJIkOMB8/y3xQYJQ8tsyMyydCpAM+MdT6nKHi0Cup+AvY2rQGs@vger.kernel.org
X-Gm-Message-State: AOJu0YyO9JDU1LMrAQIPi999/jiXPGEdhoIqN4IdhOZ+lsazL0FSMmsr
	7SkLPbq8bAea6KHEfNO9Ib7I078+2GSRei4gB9Nplac8T86T/VRKonrV1RBv78zPSj5tOl+abgK
	O+KTU1d53aByrE+1Y0XpqJjTyKEAZvnNu+TZfTO7d+n94XtUxYoC5T4GouIBuky2wk7wb
X-Gm-Gg: ASbGncvZ+ozYei9yYYvua3lZvVY0o4/wGtZT4jfGSLtgpdvSA6dsCE/w2OeRGMI2AgJ
	WamirAYcacrp7cC6ONZ/V1w993C7shXYW6tm8TFWjOfBQ4s8Hwr3XccS8t8ndm1tDsRhXeoiQAW
	04j+uXMUAuFiVw40ItCBvRDeJXb8RixuZWLej3HSyWl5ixKCckQF4Uj4VGdOBQQOvvYX4sPwm7t
	Py7hdjXL1icdF2YKnvFfQACMI8a7qp1pRzZTdh5hphymc1vAgW7fLs998dQ3+ImtVXvd4HlW3k6
	Ph2Qod4aLPs5W1s/h+Womj6H8iy2l4yw4a2El6yM/GvBD3ngnRrLHUsizUS6Hj4fkvjsi1IZPTw
	pn02jprFfKz0DAuRT40hiXENjdrykfOYbnoe+DnKCBDWH16t5F2GQ
X-Received: by 2002:a05:6214:1c05:b0:707:44d4:2962 with SMTP id 6a1803df08f44-70d76f5c35dmr5036996d6.7.1755635589211;
        Tue, 19 Aug 2025 13:33:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGNkRtmHZj2kwRc4y9joiW0/IdD954hX+cZa8EJqfg+DQk+Kuir2C5bEakrVSMmh74F9NL6w==
X-Received: by 2002:a05:6214:1c05:b0:707:44d4:2962 with SMTP id 6a1803df08f44-70d76f5c35dmr5036196d6.7.1755635588384;
        Tue, 19 Aug 2025 13:33:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef351806sm2212969e87.13.2025.08.19.13.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:33:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 23:32:57 +0300
Subject: [PATCH v3 3/8] drm/mali: use drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-wb-drop-encoder-v3-3-b48a6af7903b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2621;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bSu7BtDX/FJ/CYhdTG49eD8oSIyWKKcC6qKfEjkvl9M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopN98jRiShnU+tPqXA3NgCQCoCCCxsblmO85Nn
 1h8us24U1qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTffAAKCRCLPIo+Aiko
 1c51B/sErwvDMVP76IuxwrizrFdDwWxd1TIobv+DiOASR+c4gjQ1luTuJnSzftykasC1wY/qv/I
 egdxs5YNWQ+6aqMuw6GyB/W1jqi3zuaSvJl9Jf5djSqI167jMOYFXvbT+RTwSJVcNVX1EccXB2G
 0u/wRJ7ySKBTSxN9gLAXZ6cE23vdGrPt0nYKZ2vSMkVtFFc4V1WVsVbd7Fhq1aVn6g58KMBSWZU
 I/9zSRkIaFzUE0OGTsMAFXrCVM8V9ipB+YFoC+9NWZbMjSQD8zOMmyM/Zaa847DFNIzpziBw0Nf
 Motkscyd5Lwe6ogpT2PUjhdWq74CwRV6cUefxzNnte9KyU+3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: rA2MZU2vhLKCMROv8O4WwVtSFClBks9K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfXwjRNQZMFLp5w
 M1saub0+GcbxeDFKogOL4qcHPwN9eEaoZWkxhT6vYHDxhXuT1EjVbcBGQe6tJf+PKejhZ0EmQqG
 fWkTSi2bcMbsSEIfNQcwXMW1h8/iXdaoI5ulltHtzRBNDO3nkYUdY+vMjKx21lj8paZHee9GYoe
 rAJjP/nxv6R5lD6lmA0NhdkpFGkYV8yaXxuwdEUwG0pQei/sC8F19i43m9NYrAgstWd6dt2v/RJ
 vaRc1grdV/PWf4YjZE9qwb7IfAE9gZDyzAyH9xfvo2yWz9KQ/OoW9yElcMuL7n0mGuZV72Ng5/z
 50lxJjghN6/43wS6pRJ8LyiEiYAIrCwHmz6nQpeEmlVjyhORG4X1SsVvLuwKnwiTQW6EJUgFOPZ
 VpKIr3N9
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a4df86 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=mhD89yN676IZukTL2GQA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: rA2MZU2vhLKCMROv8O4WwVtSFClBks9K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/arm/malidp_mw.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index 600af5ad81b15d0c30f9f79588f40cca07437ed8..80f7f3474c4494554c6b6fb392e7f396b3b49c83 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -84,11 +84,6 @@ malidp_mw_connector_detect(struct drm_connector *connector, bool force)
 	return connector_status_connected;
 }
 
-static void malidp_mw_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_cleanup(connector);
-}
-
 static struct drm_connector_state *
 malidp_mw_connector_duplicate_state(struct drm_connector *connector)
 {
@@ -114,7 +109,6 @@ static const struct drm_connector_funcs malidp_mw_connector_funcs = {
 	.reset = malidp_mw_connector_reset,
 	.detect = malidp_mw_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = malidp_mw_connector_destroy,
 	.atomic_duplicate_state = malidp_mw_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
@@ -211,6 +205,7 @@ static u32 *get_writeback_formats(struct malidp_drm *malidp, int *n_formats)
 int malidp_mw_connector_init(struct drm_device *drm)
 {
 	struct malidp_drm *malidp = drm_to_malidp(drm);
+	struct drm_encoder *encoder;
 	u32 *formats;
 	int ret, n_formats;
 
@@ -224,11 +219,19 @@ int malidp_mw_connector_init(struct drm_device *drm)
 	if (!formats)
 		return -ENOMEM;
 
-	ret = drm_writeback_connector_init(drm, &malidp->mw_connector,
-					   &malidp_mw_connector_funcs,
-					   &malidp_mw_encoder_helper_funcs,
-					   formats, n_formats,
-					   1 << drm_crtc_index(&malidp->crtc));
+	encoder = drmm_plain_encoder_alloc(drm, NULL, DRM_MODE_ENCODER_VIRTUAL,
+					   NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &malidp_mw_encoder_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(&malidp->crtc);
+
+	ret = drmm_writeback_connector_init(drm, &malidp->mw_connector,
+					    &malidp_mw_connector_funcs,
+					    encoder,
+					    formats, n_formats);
 	kfree(formats);
 	if (ret)
 		return ret;

-- 
2.47.2


