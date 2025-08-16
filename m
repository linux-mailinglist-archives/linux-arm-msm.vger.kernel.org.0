Return-Path: <linux-arm-msm+bounces-69457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE0AB28F10
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 17:23:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 495F05C75DB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 15:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1462F60DC;
	Sat, 16 Aug 2025 15:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqY31cXi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD3A2FE05C
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 15:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755357594; cv=none; b=Hl9oWYAE7G7Htpd9+4jKZVjdDyV0cH4QOWFrnZQOMTnNg3DE2OiaHtCmWwEYnwhvdygi9H7QD/xLH/SyXwPmQ0Wv9YlIdnEkqTceTf7GhDLCBTskGuEJfTgJE2Xnfi0r38DjWVvZVpcx3AqqdOHY0uYH1H2Tti1Ln4+bj+s0mbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755357594; c=relaxed/simple;
	bh=9kPXh1enzh44Jx+JV9Ql6fG94nEVIAR8Tv81e1DfnG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CzBXM0DSufzP50OPQEQe5FYugtRgGuPOOcevfGTGLBdlUdDLx5Rm5zxJOYUHBghZS0XGGQKUdvbZU8tRjTp/1cJ8D6yABD143Kws68ldWhtpFER2D3JeBx3flSU+rkdcRR/KDyEwA5dBSLjZjJa9k3uDIsTtyRz/O7EcqihR244=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqY31cXi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G3AZNT030473
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 15:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ndEz2xbpBNb9n5L2RWMR2nJPekvJ4u9Qsxz7tSzeQZk=; b=AqY31cXiT6LNE/Wa
	gfDPIHid5llWAV+6h/L8oaVxSgGk7ykXtRHfxq9ITeYFd7x+h+dOgXww8mpMSWEB
	EOMxUY6YlNQZqiPz3Mb63xp0Y91aavwQCqk6BPtt4/xXxE+IcYxMQX//pXGgAsKx
	jqRl+Fa+nG3TjKdzeo1RGfYrwc8O2bMaqK57GtZARGvuVa33M8GoCdAb4w9qk9d4
	po9G9mEOb/Al0+GzrZgcnDO/BZwhGoeZ+XTD0TUoNCGSTMjJ7dKgZa1qY116e6iC
	zC7aacZZHGrzVPCxcFRNtNcv+0TQyBelKxl0Z72d7IMZV26/X7h5NIYGzSsNSZC1
	AsHgrA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh070w5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 15:19:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b109ae72caso73394561cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 08:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755357591; x=1755962391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndEz2xbpBNb9n5L2RWMR2nJPekvJ4u9Qsxz7tSzeQZk=;
        b=Gopp11IIvcf6Q9HgRu0kn/6SCE9SjvMB/+ZpMEtqnw6amnfkLa5cr7Ulg0tQDD0Qih
         Sy88v2a5Yk9w6ZYQD/YlQPq3mVYaHRGYTTxGXjiYof+DS3CK1wOXp6L039dzvOjAgx3N
         R/B95AsILpN/dd3vp5HJtpLFlSdcXAkJnP8hLfMxrPTBecDCrYOupXANy41RU2vaeno5
         opbUDd957+dmUMu/pQtwpag9C8glXPzt6V+wkyqXdJwIs9/cCi0JlXpTk5bm3Lrhcmzr
         ZQtp2r2Y2HjJZtZFXvYK147hq17sYM47nmjiJV0afYvApoEXYZTNJil4piBKee45j2fS
         MGTA==
X-Forwarded-Encrypted: i=1; AJvYcCWvvRLS0qIj+sPRmexGrsAUL10mpdszeNfPc34Diy5GWieFsEANGGjgVTPK/IHAoUi2shQeSDByHMGnf5+0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/ea/IWpL4Kybfxbyt0rWAdgr5jUYydia63J84izWjnGtMK/S1
	in7fmY/0v/zlZ9E8lfqNsMnJZ9dPjY7mVYyImecX00DVKJ/+HRc2PCinh8k4mp8OOMAqSFzGVMJ
	YhEVXm/I0FixzhhKLogwjlK61Doy+mq2NydMEEKP4lE/vC/HZXRGEQzX/6+A79Pzd/fbw
X-Gm-Gg: ASbGncuRjuSU0XcdsvEVYAXGcYd+7Xs3fi0PKpiTogiYZa+7lTqSl4jJnlW1M355bKI
	Dj4mtauESlMqS27DIWrh/0YP/RyBWWOwYkjbyKKFZ31S3PZjhOkohZvIBh307OJg5H8qyWhn6WR
	wLKgTWiVSW1XCDz7VytM/A+M/k35D9qXQPxyx0Bk00vtkDsPOyOn3WV50YcXFldwV2pYygeUlZy
	qAuZw7JjeS1BhORemlwzNR8/jbhu6zunQQolSNhUYmS0p1fo7B1wG47GV7IqxWFgsRwaowYSFcr
	3cgrNJPnl1OK1AtBgRdhPFZTr+NejfV+1HaZk+B3+eGljYMHIfG9msqNObu4jyDLuO6vbohSJ4i
	eVRpRqGd24/czq7P1xSnEPrFka+duNHYswACfLp1L3xNNSFHfwMVQ
X-Received: by 2002:ac8:57cb:0:b0:4b0:69d6:85a2 with SMTP id d75a77b69052e-4b12a72d48bmr37236021cf.31.1755357591143;
        Sat, 16 Aug 2025 08:19:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKh/+i8IQ8KfC/PGtL5WbCPyvf0DWbyUBL4UoteG6uU57Gcw4lUvCyN3nBm4+guZJlXMKsYA==
X-Received: by 2002:ac8:57cb:0:b0:4b0:69d6:85a2 with SMTP id d75a77b69052e-4b12a72d48bmr37235531cf.31.1755357590637;
        Sat, 16 Aug 2025 08:19:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35965fsm907579e87.37.2025.08.16.08.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 08:19:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 18:19:40 +0300
Subject: [PATCH v2 6/8] drm/vc4: use drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-wb-drop-encoder-v2-6-f951de04f4f9@oss.qualcomm.com>
References: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
In-Reply-To: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
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
 b=kA0DAAoBizyKPgIpKNUByyZiAGigoYmi7Z2qV4qHuc0EhD2k/N7ZfvDfuxN8wZARRRVrlbSLw
 YkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJooKGJAAoJEIs8ij4CKSjVHcQH/3sm
 ploBZcGyn9igFEwOb7KK+duurcQL+8IUikUxpNTsSBzPUpiPsu1e2gHAun/BzV28c7qAbGwav92
 TaclcXxDkLxqc9FMEZJ1M3OC0myfyvBNMomGmZNtKq8+WdLN/tEfh2JO0Vl3yUV8wOs6aPtLZ/H
 l0C2G+hwInuwe4NU0htEWKNERFlXfSTW6Z8j/+rMDxp5WjrESKCLI+Pd4iHWfg/rVESJNzH52G1
 NmBfh+DTMCXVvLwtvWMwgN2QdOVl9O0pFeflRZX/gd04fcYREOyi3UzGvHdVXPgAoYpkiHw5mqi
 LABSKrPzJMFKH49LcYJDRuJcbaGH+5TXRmkLwzI=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: asgEZIRfQ_nByv-wiom75NGcuOZqn3Wd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX8Pr14vti3eGS
 kPsLfcd4tcCVl/LTPFaDDgdqzz7DPnxFB4iX01GNW3sWz9iIBBp28fmFxFsVKBI78GcsWT12RPx
 XqJk1WpiFP6ZFTZXsyARQr5h6YS2rmMRDHdGFEEjTGPYehQVgXOLuqzbSfkiSPCfF5Xv6ZIoH7R
 B+2b2s+KUAR1X2fBkE3RLTu79KcJyRmNITefqC+gyEesrpH0L2dmJEAQ3YGh6yNgJ/+FTZETvgu
 sh9BlyDz8hJv8nicyNl4PPrmDFTi5qw0PcqVLozU330IeLsKwarNrtYmaprMq1NV2gz/neXvVW1
 4Qj6WFkjH1cdmz/sMSvnrIf6yv3pqO67nT4Js1uUi9BSlL3+Jzh1Lb8/XIdpzixh7PJToZZ9Z78
 SxJxtujP
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a0a198 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=P-IC7800AAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=hRdDZflY9wZGYtDLNskA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: asgEZIRfQ_nByv-wiom75NGcuOZqn3Wd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020

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


