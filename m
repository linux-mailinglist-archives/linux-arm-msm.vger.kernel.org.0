Return-Path: <linux-arm-msm+bounces-67366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4AAB182F5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 15:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E14D8A863D7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 13:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC154264A65;
	Fri,  1 Aug 2025 13:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eXVQ9LVF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0734D272810
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 13:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754056293; cv=none; b=Reoi2dvvjR+A29JiRfiSE11nQLEVZpoAlxvMs/SHfoY194euY5fWuAuQytHunXhFr0cq1O0tWNfrDrNdOKQ5UQ462OqpL0pdmbrDAoJfHH+FvAjN2sM+NjDa7lJIG8i29jarg2uIp8jsm31Ut9ooLGMz0DxC+ZVzGF3kXz4aQ5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754056293; c=relaxed/simple;
	bh=pqburrqLe4QINUtvUHnD5bh/z2B1X5GNCfeW27TyBDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tOzLkm0G8Et+jv/bMThDt4gNp4FLSWucLlmX6bb9uVQhu10lN5GU7EgZJMgt2bIVqS3r8s2JKW41jzScEjjRX3ZW5ZhuYoP4UlK8Fw8tZz5ozGPKCZWsoYMRGTZFVYV7wd9HNSiS31COm+18/notzltfbA0Dszcq0OzuFg0+hrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eXVQ9LVF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57193Dfk021706
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 13:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/+B92RCJ6sUHTgOKCSTnvICSpksHijR6GnMpjqqV4BE=; b=eXVQ9LVFhvEmF8lP
	p9sioUtRWNt9qlqVfwKTdPd1dZALSuCSCvuZW72ZEejYAPH5sWUFPxZdU4BkUHY6
	R/8s63SNsGc607WfI7Cd2xNxJYTgezciEz7y1mc6Ne+7LgSYkC59/ssXEcgOShbc
	kRZKCH/4jd4WbuTIdT4Gy0mFisGvULyws82hWZ2gWBevfGFN7msYcdVI1ZS9EMUU
	/Z/L70BgzcNyrTIsgpte9+9Do3S/Xvewaot3JKueUJjFszQxfsCwoUHbQ468TZB1
	dvk90tLfShZfp5ruHToipUTTXme5/zz/XdnyGXhwvVVj3A7Pwxwp3YC34lf0pdVm
	4/xV/g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mcrm7qm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 13:51:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e2c8137662so160737185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 06:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754056290; x=1754661090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/+B92RCJ6sUHTgOKCSTnvICSpksHijR6GnMpjqqV4BE=;
        b=Sn80tzR7ZbX1PKpcwx2aE81X/UN5Et9BPAkw6CjItEq22tDPdg0EJ8IUyvwUrS+2Ng
         LZGZ2OzFL7nvNMSMgmDHAUjZNWiHy1T1pRW9o1POgeW9tZ1qbXpCs766yzN/ioQsbXif
         I5WNmhKIJ38f9DU86p1DyKlc/C4BVOGnwcSMk4Px8kJzsAkdQQFPdt5g2pG/nA1sHuic
         pqHVRI3hqR45q1MvyhuIc/NbSRzHJnANQuqgE1JOVgHu/VEDdIbIanBnj9fCWYP5i4hJ
         UpSOz/xIhUJYyGO+UR/isbMxL3Sx3gW2DL1z0/1/KXhqfrgju/0/JttWJ4sN4xX03W1M
         TGYw==
X-Forwarded-Encrypted: i=1; AJvYcCVpeS3ChM02K5qowLZQT53wUEElx8ZeKyTlWjtwiRPqR/H35ulE/240nUFsoBp2piDqK9nImJcmuW4hcCOe@vger.kernel.org
X-Gm-Message-State: AOJu0YyMPzWDSksTYDlFmp0lLwaBEe4wADSS/PFAZ93CpbmVp7hNvSwu
	AEzKmIuaaMUM2HPcvirUiTkuWNiT9W/E+lNpwR1za19HYr2p8AA8WWpw8NxCzWpj/FdZOAaqqe5
	SFjZ/95yHwwz1NGuLCEJnDblKJTXIXWzlrJtfkUVTL0q7/dTtfmUWetJZSfSeughZEDIf
X-Gm-Gg: ASbGncvySLsLs25ptGDd0LGJTAP6e6Wmt2bndx0V2ESId3cBXRdaOL/eod/uvGi7ejh
	/aZGFo/3ziJo6cczaot9xwE3T5ifGVELpo8Clo8vJT8bCNMLpC5ukP/IKd35CEwIb5xKwmFvpZT
	0fC0XiwXOFVa5LLvdzJdGrV4HeNZ7c7dytfB8v1e4TODIIS1ziiEg8xAalKv4Q2zyG2f/geB3u4
	D2q2Q3GO7PN1grs1JmOa9JiCCvGmboo1x7w3jMmJuqjOBF56Ou56Tp6nuLSA9cVKJRvHo9VQ5gn
	qu7EVfMmNs2vasZCGjsyNpjqR+xo1q3M5LQjn4er++tsl3/vG+3WgjYiw4J2jczjhGqoFDSBPit
	RDdrXzxWITT3qdGpFeqqhYno9e8iiPUOifIYLCc/H5SCiOZStKLh0
X-Received: by 2002:a05:622a:a20a:b0:4af:c21:41b1 with SMTP id d75a77b69052e-4af0c214570mr6065291cf.55.1754056289656;
        Fri, 01 Aug 2025 06:51:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbygvQYA6zDq+LhVmG3CR/4GN/47/XqDWnOK52WBf4RbtBM6/jIq15Eol7L7jNRSofKyA/8A==
X-Received: by 2002:a05:622a:a20a:b0:4af:c21:41b1 with SMTP id d75a77b69052e-4af0c214570mr6064831cf.55.1754056289082;
        Fri, 01 Aug 2025 06:51:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-33238273006sm5917801fa.9.2025.08.01.06.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:51:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 01 Aug 2025 16:51:16 +0300
Subject: [PATCH 8/8] drm: writeback: rename
 drm_writeback_connector_init_with_encoder()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-wb-drop-encoder-v1-8-824646042f7d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3016;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pqburrqLe4QINUtvUHnD5bh/z2B1X5GNCfeW27TyBDU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0bPsZDobW4vfKRTTQ7I9IreLqleOCt7nltN8yGzxgf5O
 5s8egU6GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCRC/rs/4z+eBz0TL8iMp9x
 23dr/dQ1Qe+samT3Pm8yl4y0nTyTneN5y1e1HP+LUzWNVyv+fP3yw47Ygqk7Ou8KBvubXv/Z+ml
 v6wkr1itul793iittLc1Tu/GGfXu7OrvKnYlPZldYVMr+u7XGR1zk4Kdk5R3r3i04My1iUb1tpe
 al6ZesUs2YWnZ913bV2Ht0+8fsj2yFrhqx1Yq7uRgU6hb8DGpoC7ygm9C57ENL87bC+itts3SfT
 V7+Qe5sIteVwprDjHtjy//v3cXwTWnjW530O8VerTGKwX8P9fW/3xkWmH/WUDaWM25a/fba0ozp
 +QyFjHOYhBljH9fvkjvlXJ7d6jF3q9kRH6/lpiqmoY+4AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwMyBTYWx0ZWRfXxOu98H8FlUul
 gwb8jBwVVj+VXdOrF0vrtYeeyNVaSjEcdm/5KjoIEErshlCXcJvpdbeCW6vGvuypiFwWd7ABA+m
 H17lv/3whx0P9/BasjAtHw0yxkDyDaZGa99KXNHWjBjyOB/K95ljU4yqIUXW8JHBlzqwKNmiEWM
 SPdRzKvSCjEcFIdw4Zu+SCmuGeJ7AqKf+L6Wu63sv7MreAyZSvqRdyFWBCcPXiu0PyThCcQuhYy
 WVQVSMaUEpeTOEo4bcEmkqKWZODzAwe06S13yO7+v556dgiYiRiR47wvbAyFxMeZe+1rp6UHpnp
 xZx9NbXzs2okA24t8Xtqv90KOyLnqfwjzILkTeNYT1/6kiXXpliKNJn4PZF2AdG0JSr3YXRREn6
 mLMOZoLAN9jN8lKDTu3qNQWiyVUZnluPuWqSdLtQK0yfmDGeb8Sxb8WDJMdST56JbWpA2fvT
X-Authority-Analysis: v=2.4 cv=Hth2G1TS c=1 sm=1 tr=0 ts=688cc662 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=By2WwYRBACVvdXAjiroA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: nSqy4A7TK1DEb0XkFiXdO1Wb3HHdAs5e
X-Proofpoint-ORIG-GUID: nSqy4A7TK1DEb0XkFiXdO1Wb3HHdAs5e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010103

Rename drm_writeback_connector_init_with_encoder() to
drm_writeback_connector_init() and adapt its interface to follow
drmm_writeback_connector_init().

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
2.39.5


