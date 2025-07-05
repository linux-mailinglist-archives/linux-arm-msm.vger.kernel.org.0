Return-Path: <linux-arm-msm+bounces-63802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDEAAF9F9D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 12:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA8264A0C5C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 10:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E10E28C2A4;
	Sat,  5 Jul 2025 10:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlxieKwj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C62A28B3F9
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jul 2025 10:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751709764; cv=none; b=WQBvxhjsftD4zDpLy9kpbZgezDNzZtog5i0zuzNCxW4xwXQFh8r99j0NPq7kZldOvIpUUAdVlsP4AfR3E3UPLWOL+AtMG7duLSljyepM56CJarw8ZmykiqQoJ9MxK+saPK4F33A5FuMEV5ayxwbt1jG5Kho3hWTRU0wgbHvUKtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751709764; c=relaxed/simple;
	bh=TPCljJOCE+lAGVk6fcBbNqkJA6qavoaTCAklWifT78M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TFDaw3qrcb2Upl3DToNUjC5z4Wi+k9of9ytqkTg7hs11fPS6XnRQItgYTkXtQtDbz+24cKTY0+fD8fuV3h5Q8VgQF21e1gCqv242P211GhfqCz7eKMby0cFIWZdAUL1j+hxxqUsnYvR0zYW4x2h/5qfiJ5X99z9RlPei9psa6h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlxieKwj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5655Q98W000305
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Jul 2025 10:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4F90/3W/LUSFn38dXcUegvIFvXJs8yXbN6RnwBBqeTQ=; b=hlxieKwjlAhXJ2wM
	kaSl17R9dNl5jCLRHVouR96BkS6q+FcU83GvxCa500HtX9zVo/IWYT9hVtR9xqV6
	XeJ34Gngz9dyxzI4pIHBGB362Q1Di5vJbzvWDenmMrk4bRFqqMB7071oUForoJnB
	VUq4F+SaVt4Bdb7rwZjFNOth+bHFHX3qGszj9BNOdDSbFh6zUuJB88HU+EWQSMHj
	Okta6NioMo4Dn1xRX0o5bvODou++SSHDF+hLfwPbDBX9kSp7XszDqmBzCTrHcJ73
	vlMWDF8SGTJyUh7TYQC4pizU8Phbuuwk+DaItnBEQhhjzUEaaDBg7FQXjpRnGzyK
	f8P+Hw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pun20mb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 10:02:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d22790afd2so214484285a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 03:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751709761; x=1752314561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4F90/3W/LUSFn38dXcUegvIFvXJs8yXbN6RnwBBqeTQ=;
        b=LUshAfomSvvdAW9WvcEi3kNnrvEz48wQq/bcv8YcrDH56iGMT5Plet+86vqhd+1229
         AbIvNZsq9sr3cdw5BL21hN/V9IowsLYebykR1n75XOerdgfbpv51vqpUEgIKBhSG6Wh2
         QB75yzPG59q9M6j1PEu0XE/qZ2DJvcI+aD66APor2fRZfHGu5QvyvyF8QBteLLiJ6cYY
         CpSWJMVSNJOlWPrZT5GGfMT0f6A5VHTBWnznAujlruuGFyeZvlu0R3x5SHIE56ICBT9n
         iGqmlOWxxIJ7civHsvgSFtyPDFUOrbHPal9Lw9iykt2CsHQ4eLEZoA3GaZ9TfWxjBs4t
         J96g==
X-Gm-Message-State: AOJu0Yy/Q7l4RWMxj7tIsqt0KbiL4/ZapwtvIbVUcE7Bec2nmmwrmkhO
	WzI1TwDfWZkwvLTQ0J6wvySUp1jGwsFXPM8XEoTeIvWmRsE3kz8FYH6aNBBDxR711unJTUyASVw
	l8aiZGX4bYD24wrI8SAqAdRJ6mg6NZFLbW24pMuWyYRThI1zh19ntJKbEpljB5ypypD3T
X-Gm-Gg: ASbGnctu95fRtZ7sE0qgbEWppJKLVPeRbgTQgESiasZmsW73DkkyDpDnVN2t1nvtivQ
	/+DRzeaRebiwAkN0+iiOuRhRuErFYhVA+dkrgJcStx+uw2oS2OvK/olt9R/Som9hFL85oI3Jmhi
	A2f3Cpb2RqPxrSO09C+jJf2n7OlNhGQrZ45EBxCnfeeVBAl1Msui/o0Xqus1VGCa/I39hu3q2C+
	02Pej/JwwDzagRgbzIg3wciP8lG/J/z1JTPSWUME07g9U3v3rVzf4y5uvbhql8DgoFUs0iTNDM5
	dOuD3WL8ezO2uiurKt0TSDOcrBSow7Tb8o9WlRh51I467cSDD8jsqLSJvOX+iG9Ny8ZNBFvs4Do
	wl2iKKLf/RCq9Dcszy85JGU0BwJmsjWZSD8w=
X-Received: by 2002:a05:620a:2915:b0:7ca:f02a:4d2b with SMTP id af79cd13be357-7d5dcc7295dmr751766485a.12.1751709760456;
        Sat, 05 Jul 2025 03:02:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGulStBJHLwU8HwDOIF+guVJVHi5pOC4lXhzr0md3WFCORD6oDXM4sw08Hi8v5tjavsA5Phzg==
X-Received: by 2002:a05:620a:2915:b0:7ca:f02a:4d2b with SMTP id af79cd13be357-7d5dcc7295dmr751761785a.12.1751709759816;
        Sat, 05 Jul 2025 03:02:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c0558sm526274e87.209.2025.07.05.03.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 03:02:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 13:02:29 +0300
Subject: [PATCH v4 04/10] drm/msm: get rid of msm_drm_private::num_crtcs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-msm-gpu-split-v4-4-fb470c481131@oss.qualcomm.com>
References: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
In-Reply-To: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4457;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TPCljJOCE+lAGVk6fcBbNqkJA6qavoaTCAklWifT78M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaPgzYU4YT/9DG03zg0Djt3R1PL8JY+Bj6d5l7
 Jy5NeZZsRWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGj4MwAKCRCLPIo+Aiko
 1RNICACdfxbPAPjg77KvBwb9W88X1WwjulbLAGup29/00hSU5LfPUKuPHIC1AGOb47UA8NQkDgU
 csHLBA/YtesFD/a8GBOrrsPD/+U4hvdxgz1zB7pCYWEaQ6KkaIV8Ik6dYuq+IM9AyFot6npA+3q
 kNrQyx4GsanMOM/yabLUABnMF+FN6qLhWWIQuVjaylxysF6nfmQacD+bhsGweItMagZdarQN1Ei
 t7BBFBE6BsX0MzZu655r3l1k5VNRPfEoni093XRWjYqKspik/l318q1/jC97N3ucZBiNrO96DTZ
 Uvucvl2Bde5N16GieoyH7eLmNenk4HeTMwhg79l4TGcaM9Ko
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: TLV6TJla-JyO3xZWqEnzoBBbV7MDLsxD
X-Authority-Analysis: v=2.4 cv=GdUXnRXL c=1 sm=1 tr=0 ts=6868f841 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=F-HcN3iq_yGV61sY1bgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: TLV6TJla-JyO3xZWqEnzoBBbV7MDLsxD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA2NCBTYWx0ZWRfX2fI455MyG+V3
 FovKVi/dAcBvAlD7qUyl9HKF7ML2mZ94hyM3YpJAaZotoYs2Lmls6W92NeP2HQQZvjWKwOf6MdI
 fLB11+6ZV27ZvQXYjcvqZN29P2dCIIOrMGfW6VIrsMvcLVVVlQPRCIs2ykxS9eejdiRHQ2AhdlC
 TcL3lqPiFMhU1EH2A9MJd6Supp8IxZ/cwau2jfnOY04vg67eBdj7IdnRLNSlPEHhDUL2Bq+MGu9
 6jEQAMDDVCJiUTbcQfMCc941u6lBIrFvhcwun6640lpuhe9UNjXVQ4m7xyD8c8Rw0+ylI/hEwvd
 hY5w4O80B94ZFXS3oLCf9rsFuGMSTCHqWK2Y6bvexETl7po8iJmHgMZbd4JwQrh49c5Mie9WR70
 SCyt5ZS6IeDyemDHFJxQy0kE5jJtLmTzyxcqg3jN9t98FvvPcNAwasVpyownqeL1IEXX4D+Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050064

Drop superfluous msm_drm_private::num_crtcs in favour of using
drm_mode_config::num_crtc or MAX_CRCS as appropriate.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 3 +--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 3 ---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 4 +---
 drivers/gpu/drm/msm/msm_drv.h            | 2 --
 drivers/gpu/drm/msm/msm_kms.c            | 4 ++--
 5 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e63a62664f39d73033e65adab5a90fd43c844a78..7025f521b70e501eefa69ddcdba64d38e0ca5465 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -875,12 +875,11 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 			ret = PTR_ERR(crtc);
 			return ret;
 		}
-		priv->num_crtcs++;
 	}
 
 	/* All CRTCs are compatible with all encoders */
 	drm_for_each_encoder(encoder, dev)
-		encoder->possible_crtcs = (1 << priv->num_crtcs) - 1;
+		encoder->possible_crtcs = (1 << dev->mode_config.num_crtc) - 1;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 6d938abe29ee7283de2b1535d3d0159bf09d6dff..1aa7d65afbd0b4e8a231d1d4ff7a7120e8b7391e 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -297,7 +297,6 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 static int modeset_init(struct mdp4_kms *mdp4_kms)
 {
 	struct drm_device *dev = mdp4_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_plane *plane;
 	struct drm_crtc *crtc;
 	int i, ret;
@@ -347,8 +346,6 @@ static int modeset_init(struct mdp4_kms *mdp4_kms)
 			ret = PTR_ERR(crtc);
 			goto fail;
 		}
-
-		priv->num_crtcs++;
 	}
 
 	/*
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index b6e6bd1f95eebf890a8dced129854e8e19e60c9c..4c9e79fc00e9d8ca8de294c83559e72a2e48d1d2 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -375,7 +375,6 @@ static int modeset_init_intf(struct mdp5_kms *mdp5_kms,
 static int modeset_init(struct mdp5_kms *mdp5_kms)
 {
 	struct drm_device *dev = mdp5_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
 	unsigned int num_crtcs;
 	int i, ret, pi = 0, ci = 0;
 	struct drm_plane *primary[MAX_BASES] = { NULL };
@@ -443,7 +442,6 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
 			DRM_DEV_ERROR(dev->dev, "failed to construct crtc %d (%d)\n", i, ret);
 			goto fail;
 		}
-		priv->num_crtcs++;
 	}
 
 	/*
@@ -451,7 +449,7 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
 	 * crtcs for the encoders
 	 */
 	drm_for_each_encoder(encoder, dev)
-		encoder->possible_crtcs = (1 << priv->num_crtcs) - 1;
+		encoder->possible_crtcs = (1 << dev->mode_config.num_crtc) - 1;
 
 	return 0;
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 33d668a18ff3613b40341df540d504ffff65b2a7..88ce305792fd89f280b39bd92888a18abd0343e3 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -175,8 +175,6 @@ struct msm_drm_private {
 		struct mutex lock;
 	} lru;
 
-	unsigned int num_crtcs;
-
 	struct msm_drm_thread event_thread[MAX_CRTCS];
 
 	struct notifier_block vmap_notifier;
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 9541dd7f56c9ea0f1d63c77b8ad8e7bc8cb46508..a63d014c19039835de47fb3fb610ce67652b5d2c 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -245,7 +245,7 @@ void msm_drm_kms_uninit(struct device *dev)
 	flush_workqueue(kms->wq);
 
 	/* clean up event worker threads */
-	for (i = 0; i < priv->num_crtcs; i++) {
+	for (i = 0; i < MAX_CRTCS; i++) {
 		if (priv->event_thread[i].worker)
 			kthread_destroy_worker(priv->event_thread[i].worker);
 	}
@@ -313,7 +313,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 		sched_set_fifo(ev_thread->worker->task);
 	}
 
-	ret = drm_vblank_init(ddev, priv->num_crtcs);
+	ret = drm_vblank_init(ddev, ddev->mode_config.num_crtc);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "failed to initialize vblank\n");
 		goto err_msm_uninit;

-- 
2.39.5


