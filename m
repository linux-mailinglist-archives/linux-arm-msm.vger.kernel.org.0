Return-Path: <linux-arm-msm+bounces-69829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E026B2CE0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 22:34:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AE79582B87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 20:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF12343D9F;
	Tue, 19 Aug 2025 20:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcI7/53i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045AA343213
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 20:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755635597; cv=none; b=IBXHDJuiLHZ7FWmSbN3nEo42or8widab0lBdTev21/5h2WqIZFhdzFBlEzxJrT2b4xIzPpvZe76kbz84SAlXaWK5OTaZ4OQEmcKRewNdBGvGOyWt5G7STi2w8KoYI4YTmofQtAxIUw1peHQ+654K59rma3UyWihLoKi6Trkfkg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755635597; c=relaxed/simple;
	bh=9kPXh1enzh44Jx+JV9Ql6fG94nEVIAR8Tv81e1DfnG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QQR3ppESaY6l2ExecUKSX/H2RFZPqXWnHN8bDQ7+lA1B+xCIzqJr8z/4dvJTBN7GTQZwJtcERGwSDfpn7G++RuiGQW47tOt8grToih2TxM19BSJBp4JErGitlHTkzjB9+efelkvrO1nSGWdhLiNol5cPVivGuzberBXfBKR9fwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pcI7/53i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHWSIM008305
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 20:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ndEz2xbpBNb9n5L2RWMR2nJPekvJ4u9Qsxz7tSzeQZk=; b=pcI7/53ilcL/mke/
	pFPxcZ0iyDVn+aikqejKPYNI5M4gwpQ7Tcs9PHfZQKBYdpBLpCxatL+NffQnrg8F
	QEM85eoyQmp2/gTLmZNXcEOY9VWDtXSCE6t33xwfm2whXkLX+BEVU+12pF0OtL6L
	au9pE5/8IRHhA6h1udBdAG1dKXRCIEpev9TM31QSDWxgxx9VcELviP/dOu3mMS5k
	lo6t/TZV/YEUFSSoaS2Y+Pd9eoE1kDWuoY6KAIsj2SHCTbaS8ohFK/3a+Jxgf430
	4YNNdUUPqTfKazvmDW9a1TF303UM+QQZnc3uqpkMdVxW1OdzDyK0peAv49EEEGgX
	v/i8tA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99svfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 20:33:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a9f534976so184846146d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 13:33:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755635594; x=1756240394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndEz2xbpBNb9n5L2RWMR2nJPekvJ4u9Qsxz7tSzeQZk=;
        b=ECQTH7x3DdyHvQdQ+dRrkaAm6dAkxuE2MtxLzK352P6RQYqCcEK7JKCMYOYpcB8tCx
         zWHWR55/9mbzAaE7hUKbAcULq+L9dFTNHpnwFJwRTDjYyZ/g6JHoBcr3eqMGt4hqHJFJ
         AhMX0TAdLN+WeSdEBeXC0DYUCekQJnYWBcvk8XUhCVglcF7+XDf20IH7HiToDUjHc5Yx
         yAhRokgkPT61NYikQ7sSaTFRxqR2RQl1WIoMGEfblEJ/Q38UIEOIc9vmjh25JMbSkHT3
         sRFGlG+t91Xl2ws6ZQsSo3Dcy6jEr5Ud38e/lHTTXp11jYP+Ao9vxtCOOelqC3Z5yXTC
         j4kw==
X-Forwarded-Encrypted: i=1; AJvYcCWQuvZdaptk6phSzVqsVc3AQxsk/fQpBsGKw5WZ6buZu5qlkCosbIsjZSoXd+7W2f83GTUMZuBblvzorB1r@vger.kernel.org
X-Gm-Message-State: AOJu0YztOIcXw5n1UWCvBwZuchV1oaex1Nck8S0RwYwW8fuV47VUEMjv
	CfpMJT5YdFNlY3L9BW0mK7wU1kGjZQBpoOvK3Vv1zOCDUaHS+/VqekKNHqfteQWdmteMWeK4LlA
	B4y4439nRKyAZ8eKi+D8nI2rv7V69zwqgzgskLieVLrML9+kfB578cpfcXbyg9eLoyBgR
X-Gm-Gg: ASbGncsa4H1Uhn5r8/Bn5gHMDg46VllPbcvCQfiM2Xoyyz6q0H7F6tuOW1lLrJhRGLW
	cFivtoeJxeuE2k4/5b8Foh2G0dtYQhIXUqHx/0tMB9mm+wmGB/IT6s7bCgFVrfTgapG3RYHsiTl
	cO9zy6Oh0xS2QPsSxy0A25QCWeHlwbE0qrFEW+CbCB4KsSZ0P5O8gziSmF7BbeTKNxEOQj3S4Rn
	fq7Jh4bVZrlAlRoYu0jwk/DnjK4zmjXKMkD2APHpDRSogA3juAbkEVScdRuXQ9Pl90nK54sHQNh
	U12wyEj68zBaio9ic37GaD/yJOOxa0dZaD8zdeO/ltlenpqyO729Lq9W61QZaKotwgUnL3CIeL3
	ee7iZs9KJCsHV5NXk2zDN0cvMHy1tj33tsO4U1JCFwmthaRVL/ckb
X-Received: by 2002:a05:6214:2526:b0:709:90d2:4628 with SMTP id 6a1803df08f44-70d76f92bf6mr5417096d6.19.1755635593619;
        Tue, 19 Aug 2025 13:33:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxihLKXa7JhuwwkeFQ0p5zKqK7B3jNVOf3qZbLFjzpePpJRXKGGlC8e34zDhvw9cZPJCBDjw==
X-Received: by 2002:a05:6214:2526:b0:709:90d2:4628 with SMTP id 6a1803df08f44-70d76f92bf6mr5416336d6.19.1755635592861;
        Tue, 19 Aug 2025 13:33:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef351806sm2212969e87.13.2025.08.19.13.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:33:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 23:33:00 +0300
Subject: [PATCH v3 6/8] drm/vc4: use drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-wb-drop-encoder-v3-6-b48a6af7903b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1739;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9kPXh1enzh44Jx+JV9Ql6fG94nEVIAR8Tv81e1DfnG4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopN98FeUHqsRMxqI2y7bSGcGGmIQ2ngHpJlEtt
 7qfS9PHwcmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTffAAKCRCLPIo+Aiko
 1aEoB/0S0UbRv6Cn22F8M6h9l8cAG1g8kwox9gPMNA16YkeVOr6K95UiTo3MMjJp7r9L+aqIiYW
 4VY008h32adgxAl6T4rztlv/gbNcK6wpN5EIJcGDsFjXYG6mcjcx1tPbG9kOmBqd3reRp4s1wOJ
 KAz5KS/AtmLz2CYVi6vPsL1PZXzn0Uc9Y1E7/ZG52uZtIAvqY2e3ToYbYtmTF7RKaLy/uIYmZMS
 2VVTZTlmjclBLLn02HJiSZDsiFI9KByjQEssXDY1vWz0MOTsCsts7Jrp8LWNtE7St9nwsiUNJWz
 E+fzSaHhOeKC2+ykQjdy0xhRKprf1e1ISuEYVrlH7d6pc9Tx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: rOE0aW56XXS1bGdsU118anPBXHN5S9RU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfXxMEtk3Lo3CuL
 BWcO+ddehfYvtMhBpQMm7Wa7YzLHElCVYZ9ujGI0Lno2yNVkRZXToXAeWMSsooXXSUX4EeDJcl0
 kUNxqGM/DJL9IJZd24u4Mpx0Edtu30ARJfr1h6eJYSUTa7QpgAwEQWHgAtUmwGpdZmamORB/Le+
 CTOCX/Bg4dewL/dKw9p70e2Ng/drj1SBISpBaH9XRG2qQqAbiyPBZ4HMhZhJdsjgwRpGWcETnHV
 TOXlXTBuOYgHW2VTelWCR0bGx3u4+J5q6+rP6/Iwk9xSVDtHXfxry9B9+xqxPXvcx1gW71+nTl/
 /vLmSW61ZhDyYllJbf3M05HRbMIjNuYPVJRjva25Ma9tGk5ZomDLhr6owdcClq4uL+vbdn4ul3M
 Jp9VhUzx
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a4df8b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=P-IC7800AAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=hRdDZflY9wZGYtDLNskA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: rOE0aW56XXS1bGdsU118anPBXHN5S9RU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160045

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 42acac05fe47861ced226a4f64661f545e21ddb5..fef4e4ee47cf41d40de47c5201f0349dc36c56bd 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -377,7 +377,6 @@ vc4_txp_connector_detect(struct drm_connector *connector, bool force)
 static const struct drm_connector_funcs vc4_txp_connector_funcs = {
 	.detect = vc4_txp_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -601,10 +600,10 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 
 	drm_connector_helper_add(&txp->connector.base,
 				 &vc4_txp_connector_helper_funcs);
-	ret = drm_writeback_connector_init_with_encoder(drm, &txp->connector,
-							encoder,
-							&vc4_txp_connector_funcs,
-							drm_fmts, ARRAY_SIZE(drm_fmts));
+	ret = drmm_writeback_connector_init(drm, &txp->connector,
+					    &vc4_txp_connector_funcs,
+					    encoder,
+					    drm_fmts, ARRAY_SIZE(drm_fmts));
 	if (ret)
 		return ret;
 

-- 
2.47.2


