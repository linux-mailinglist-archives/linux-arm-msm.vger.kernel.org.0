Return-Path: <linux-arm-msm+bounces-69459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E6EB28F13
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 17:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B1D75C6869
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 15:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F26C02F659C;
	Sat, 16 Aug 2025 15:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EvINhH8F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3170F2FFDC3
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 15:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755357597; cv=none; b=DFa+OU+2IeHFCA4P8ZL5BPYZqA5Zbw/EYOjfbjpMTIxPDQziKXlBXISbES4Q/g9hUFsBxxzGZKja1dhvTEjMPoI/23ugFoc5oBCEKbCYzQxcNbRgN7PgV3z0bY2XcRRGj5+FiT0BA+jwvEFSCcjVlTz20RPhnELTJVcjfg8rQNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755357597; c=relaxed/simple;
	bh=AaZVjuS1W7Ukw+8AzT9N6e3I54ede+nAI+GfJJ8GCnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IcmavSNCy9hcwdvzenLvsECfX5jhYd1a7JjJ617OvOPGoWfEKChXDpiLnBkKNiyrukPJEqFkbfC81nO3MVmYGMlYmJZdV94SdJCeLDGBc8EQI+C6M4KRQTuTQG6mLI4nHoYoR3nF/TNp7HxYnuFsGAWqnH4ynFb9r4khIvqPuaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EvINhH8F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G3PpD4030372
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 15:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TbQAYOijnA+OwP4fT62BQ14vH/cW4cuE/yCXav6j8bE=; b=EvINhH8F0hgbF8KM
	5qk0gSsN+3bHotJ0bJ5hK3CMF8K0NLv7uptGLSKcto7vUYnGwAKmSQgBvWRUJ530
	zrn7TwACfuYdmzEHkRLcUKQkQWBmB5Ep2aAl9+Oy9nuJ/AatZtTcYu/ViiCwtxuR
	PYwDNh37DiJU5wsPg5xKCQ7Cyn+xnya8NCqciVIcKofiLTChW33HqTHmqeWshUTh
	VlQlQnZpBKWwnIAs/UmQs/Dj427ekhyYyki8cFirsYcHxjcCzzJar9yzhbrT3BFh
	HPaXdgh9AxeBzDJQWhVa0mq6VM+NCE2XHj5eBZA6SqNBbu5i1U2Q5t8PKdjUYc/D
	FW0sAg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj2u8u0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 15:19:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a88d99c1cso60969816d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 08:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755357594; x=1755962394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TbQAYOijnA+OwP4fT62BQ14vH/cW4cuE/yCXav6j8bE=;
        b=VPjvQT/aOmBAV7kPZdcrECt3tMog0UpM/8ROdLMghJVLndj2hp8p48u7B0uFKgCV6A
         kZUESDntcKSH8W7WJN4IZ/WijA3vCWlRAluim23Ulg4qi5xo5hWsZvALBTdSPp5ynUzu
         yddYHY3Fdz+OxUg+FfKID9or/p4LPYgBqDWMNCDSlDiwtXsSM5qYkSPhnR6rI/ZWzDzS
         yfy9zBvsrk+wbCBP7nHKUvFvZZeYmq96n01qN3UQQZjbQKt3FA8V69dCTiJsRhfCTFBd
         ZTRdj/WLNLqzV2PH+D0qpG3sw3kxyzefJdDrauBANtIfSKNtZhNI3HNFaF8rrSEh3H+D
         O8sQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3BFiDSs5vxXoB8R+9CKjXylfh2UfAghU5TiZ8JR+GGBY+iE6QiuMwEQ7vmKa0aKdUJ/GMgk3wOfW7/lS0@vger.kernel.org
X-Gm-Message-State: AOJu0YyLUrMvCoSNMSU4uQhxiTFl9/VuW2t26cyM2eF+r5qfAIiPCjAS
	ZCD/Nkr/1x7gc8IMk9wF/842dNpdgrtAqOrYa1cWxwNLIxE/OWtkNlBk/7MABpb7U3wH/frmsZE
	02aWYDJi8mtGKvaM3pRdHl//h532kGeZE59SY9ceB4C4O35Xgj3aCcKnNlA+DQZ2/k8+c
X-Gm-Gg: ASbGncvHTn4fiwqbNLAZLCb1xcwAcbrRo2gO6f5Pp7em3KSsIJ8+H3pZrYx7px28VvK
	047Gg+8q/Y+s02ig5tVZB9ysvOS8LEBwYcLAFQwoLxwmKKSM79imVubb4bJEkFSuprnsB6tecKe
	7+wmOplWMR5UsKUaZgAzbCBsbg7gpyhmG9IhNHm5rezh4FAysZiEeogKWMOdDoVln2nXPaOViZT
	l0mJRiUg2PQ9P+oZTQp4aaavDKMA/qD7AKK+MbhNKHS8t42tQ9MQTyLwFG+cailBhfrmW30yGT6
	y9+yinJjUfjZ7MkZqu2Va/AxPlYn1BfNjqSRPW87DJFiCVI3tGefJ+DpiI7r0tukBIJWHA6snN1
	X4yZFBSXUnqAaze53DVYZwq4WaS+ryXa4BIO+IhZALZFEooaKucch
X-Received: by 2002:a05:6214:ac7:b0:709:b92d:e84 with SMTP id 6a1803df08f44-70ba7ae80c1mr81199406d6.16.1755357594441;
        Sat, 16 Aug 2025 08:19:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHhdLfF+QII0ufvMc+c1Td2k4+GoblWcwEEncKFspxyk5vAWtgqLRyB8GatC2wFnN2BRckcQ==
X-Received: by 2002:a05:6214:ac7:b0:709:b92d:e84 with SMTP id 6a1803df08f44-70ba7ae80c1mr81199036d6.16.1755357593955;
        Sat, 16 Aug 2025 08:19:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35965fsm907579e87.37.2025.08.16.08.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 08:19:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 18:19:42 +0300
Subject: [PATCH v2 8/8] drm: writeback: rename
 drm_writeback_connector_init_with_encoder()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-wb-drop-encoder-v2-8-f951de04f4f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3126;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AaZVjuS1W7Ukw+8AzT9N6e3I54ede+nAI+GfJJ8GCnM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooKGJYpPrdEi6HVTifOyYs/TwBkaE/wZcLttBb
 dHmFyn9qPuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKChiQAKCRCLPIo+Aiko
 1TpWB/9pVqcOdq3X6uUsOd6BlW9YVLDGMvNAlGtBquoyjHsI9eErZLJKu29rJ6TztxyiQ7q0i08
 jhfNJ0QGtJnijOlndgpf3L5upqul+kGrj0NtrEGWUc/DMB313lePVT/6AJ8Fn66/y5F0U2K2YJh
 sYeO5+KMWvj9ZGirQtyaJLtDZ7j1P8NgMByPHWub7osZupbOECo9VtFnKoFtsTWB4xtp0xLRgpY
 fyrmP1520fajz+ht3NawHqe1d20Hr4uhoGwn/W+joxOzUYs40p5yAbDA40ZbsclFKknpadmDD8u
 bvigSvNbXvi1tsVzPhQYUP5PmRjL/8RPxzLmdvUFBcq5talE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=MJ9gmNZl c=1 sm=1 tr=0 ts=68a0a19b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=yAS5wIYi4md-6cvEWsUA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: 8KqRVnmdoEA53xwwMlComKhNpSAf5xfq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMSBTYWx0ZWRfXwaWyDNmiidnb
 NhUpCvh3RKC63be8FGaYLnHVTw+K8LcA2n+qWlsr9SUP8Jd9MdyvFhkNrAEve1UeFtUejOSjwqc
 n0MH/+ExAouOvm3vaHla3/oo1uvar51ChPfp0Wlpf2CLilPeaacSVe01Xil08ULj4K+Y0EXpoTh
 RYDFt9Oi3jizJFSdPLJ7WevrtcX/TOelbaoOy0DgS6MPgmgVDrw00EmpDVgZ0ES12xlCR3udV5e
 W4c0kf06LO6xhHFtN6yzacG/5X/kjm+lHBwn55bb00mm5iJpRpndhcqKYDPx+znEVIS8q0A/UN6
 2szOKc6mQ/r9pRje7CAKBAf9RZMZ5/TTAT26x1ScA0XIdrgLATI5wr7W8mql0wYvENPixZE43w/
 Ok3boHww
X-Proofpoint-GUID: 8KqRVnmdoEA53xwwMlComKhNpSAf5xfq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160031

Rename drm_writeback_connector_init_with_encoder() to
drm_writeback_connector_init() and adapt its interface to follow
drmm_writeback_connector_init().

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_writeback.c | 14 +++++++-------
 include/drm/drm_writeback.h     | 10 +++++-----
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 1a01df91b2c5868e158d489b782f4c57c61a272c..ec2575c4c21b7449707b0595322e2202a0cf9865 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -235,7 +235,7 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
 }
 
 /**
- * drm_writeback_connector_init_with_encoder - Initialize a writeback connector with
+ * drm_writeback_connector_init - Initialize a writeback connector with
  * a custom encoder
  *
  * @dev: DRM device
@@ -263,11 +263,11 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
  *
  * Returns: 0 on success, or a negative error code
  */
-int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
-					      struct drm_writeback_connector *wb_connector,
-					      struct drm_encoder *enc,
-					      const struct drm_connector_funcs *con_funcs,
-					      const u32 *formats, int n_formats)
+int drm_writeback_connector_init(struct drm_device *dev,
+				 struct drm_writeback_connector *wb_connector,
+				 const struct drm_connector_funcs *con_funcs,
+				 struct drm_encoder *enc,
+				 const u32 *formats, int n_formats)
 {
 	struct drm_connector *connector = &wb_connector->base;
 	int ret;
@@ -284,7 +284,7 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
 
 	return ret;
 }
-EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
+EXPORT_SYMBOL(drm_writeback_connector_init);
 
 /**
  * drm_writeback_connector_cleanup - Cleanup the writeback connector
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index 879ca103320cc225ffb3687419088361315535fc..958466a05e604b387722610fc11f9e841316d21b 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -137,11 +137,11 @@ drm_connector_to_writeback(struct drm_connector *connector)
 	return container_of(connector, struct drm_writeback_connector, base);
 }
 
-int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
-				struct drm_writeback_connector *wb_connector,
-				struct drm_encoder *enc,
-				const struct drm_connector_funcs *con_funcs, const u32 *formats,
-				int n_formats);
+int drm_writeback_connector_init(struct drm_device *dev,
+				 struct drm_writeback_connector *wb_connector,
+				 const struct drm_connector_funcs *con_funcs,
+				 struct drm_encoder *enc,
+				 const u32 *formats, int n_formats);
 
 int drmm_writeback_connector_init(struct drm_device *dev,
 				  struct drm_writeback_connector *wb_connector,

-- 
2.47.2


