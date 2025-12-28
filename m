Return-Path: <linux-arm-msm+bounces-86758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2261BCE54A5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 18:32:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 761D4302818C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 17:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623122D8360;
	Sun, 28 Dec 2025 17:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fCe7uPA3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CF08gueA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C482D780C
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766942520; cv=none; b=fA+u1vP26FbE2Ht68KxAUX+l5flLQ6NBWKrMdXhEkR1xDvs1v/Lioo35SvhguUzGK7BIcgFgRCBX8Y/Egj4oxiLBQFqsmJ3OGmRdhieAVbqdqArNkVAou9BjoL3ldQTC8W+zzXprTI1OWrCkjvRYdaeLsCdChtEs7eg6SiMtGew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766942520; c=relaxed/simple;
	bh=90ODFHe66Nfjl7yi87n5IICLXsZ4owytXCS3KVu4EDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K+uXwQo3uEEpTQvq0laqZ7D0hDUyEtupqQdJPCiGZUvE8ndVRfAeNBWQXXK7SwtkuW6kJu30dSoNC8fLTRpwt4eLdlbd62Th39XPs/Std2DrYj0ahx8kVf/mdttHfeCuAW0yNXgs0+NAcZ54p1nLj7JMSPBS0QJ+aJ7AlxdhV8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fCe7uPA3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CF08gueA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSCNUfM2857841
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b9ETFH4qFVnd8+4vgMuarPmX3yRsMvDDnuUweRJUeYM=; b=fCe7uPA3Xkqmh1sr
	GK1R8fNjyEDbYn9uNvNzUBt10Mwwm4f85c+JJXolwuUPIOQQ9wOm3beWQ+mWllFz
	ReuyK8p2ew7oCfzP2vXlsqxStD0d2b8tzAuyhNfhdPOPfcirIgHYP1kgFelh20G/
	0+BLd2+5syRlaBKo0mRDyjaF3XlXNF4AE0kSnAolY9bOp+sm3VTFKO3/F9MtdoZa
	lMinfMZmaAcbPKid89XdkcDNOVuFE15xoFJTK78dj35mbMfaVfBPLphbNA0Xvglg
	1lvLpsATW1yMPf7YL2Tcs/ez1RKXEM3Zlk3ZDFaQrEup02/QVVaaomfQswGkkVM9
	vjEGyg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7hsafxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:21:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a3a4af701so232428736d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 09:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942517; x=1767547317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9ETFH4qFVnd8+4vgMuarPmX3yRsMvDDnuUweRJUeYM=;
        b=CF08gueALR2vkFeGjLeJz2vq0F7unP2/YFZ8hLl77GLVKrvGav/QgVISyAxv0CAOYM
         IsuvtpMBLqga7JKh4/8AOubfD3eWBh4F8aV8twpwEUCo5tlT2syqCJ0EsSimAG4DIU6O
         QOYS0quIle4BXw2BD6znvjT9Yf4sKnrlg8fAtRxON4mXSQf4O913BXELBEP9NkXerKGB
         cKhyEx+YjArCenRRDZ4LjlY/dio+yTwSxRa+o3izw1VRjqciQdPt3oR66fwwsxe/lRTC
         LSFX3E7YugCaPNMpSXjCmC6ZMZJlKDeKUGyTVDPx+GecB0kIqShPv/rlAqCmL9wf1hRG
         aHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942517; x=1767547317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b9ETFH4qFVnd8+4vgMuarPmX3yRsMvDDnuUweRJUeYM=;
        b=uIovAN+xvzSlOi9r/DjkyN3+ZcWxKrIK/Gr1+b7BKIQc2B9/3gMJ2rU4SNeIA88jUt
         MoM9cUTszUhxIXcnYhpvhkppmqVLVJZBqPaO6JgsHnDaO6qyPBlN504WSFuWJRA9EKF5
         J9lLgdHnDnCfa+ZynK0ouc9mZ6DiG0olPFkUZzYd7Sg1lcjbP32/ztZBZjVNoVhmDLfn
         ORu7HwsHCUkt1aqyZ/EpF2BF4AxdCe7ITvyqBKWO0NpUbkWi7kquKq2xzp8INqDlfsPk
         YrhbKTj513c6wVT+uDa73xm+0UvSHpS5QHD64G5lYRhw44rNS6On1jqkqQa75SrP5u2a
         DMZA==
X-Forwarded-Encrypted: i=1; AJvYcCXL++PBrmb/c43kp8uraPvqqqKeuw+4DWfgEXJ4NWv26qqbWBiVZif0m8DKHxyGScND/PrrPbNki502x1yt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Z0D7L1/QJhlEa0ZMG6woOG/6AHutCJ1rfBcBYUc5hqA6Y3TB
	0oSiX/J7sMU4piUadDAPFeCOLU7JP936mUgAJ/uKd+Xmiy2Q5f+XA3C1gnRyKriJMZBiAOJPoPt
	IiP0adyaFtgWNCJ5YkBvwVL3YWcvE9ZYUdbl99HzwWJAZpx+HA0fiHFrG7jB3slyCEz7s
X-Gm-Gg: AY/fxX7B2XH1+mXAGdnJI9ZSiaD+z6KLOZZYUwZji04VCoP0JZGGfxdU3y+o8d4hmS4
	AHR065x8rVV0YZ2wjYAH80Z9BZIA0d4WtTv+pyHS55jS0Rop65zgU90pZGwBiOlIO0D32W229ws
	xb2H+61q65UlMq0Qguhfg83Vcn3soBMjn47U86vFcQoByhiuOSkJgEw8G/Z5S3/MeJwB6LzDn8F
	58CRwBcRlH3FJsSIYGWeuQWkDi3U8TSsiiAkv184UP3PD1S0c78PjY/TaIyZ2Jlzpva0oamh+9c
	IaihPthzuLOcukFzFb/E7Njkg8+uG1032HqUo+85Tm4bEO8w6jJBejKawrvoZjOXyQhjXQh3OT3
	Fc2pm5tSjzffyhe7XLu5ZNnQNQ7G1vLKpzEIGeZYjmIVBJ/UlimmRfuZXYzs36Nze82SeHumZFg
	tu009XK0Rzs+Xfv5g9nHZj2A4=
X-Received: by 2002:a05:6214:62e:b0:880:4eac:8689 with SMTP id 6a1803df08f44-8901a046480mr56329936d6.57.1766942516749;
        Sun, 28 Dec 2025 09:21:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGB8qEu1RTRfneqwLmQfLZtXdWTJwcJICHquzn4/JCVt3C/Ojms0Lzrm+TZNYbI+Vc4LxRkpw==
X-Received: by 2002:a05:6214:62e:b0:880:4eac:8689 with SMTP id 6a1803df08f44-8901a046480mr56329426d6.57.1766942516229;
        Sun, 28 Dec 2025 09:21:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812251cfffsm76871031fa.19.2025.12.28.09.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:21:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 19:21:40 +0200
Subject: [PATCH v4 8/8] drm: writeback: rename
 drm_writeback_connector_init_with_encoder()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-wb-drop-encoder-v4-8-58d28e668901@oss.qualcomm.com>
References: <20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com>
In-Reply-To: <20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
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
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Suraj Kandpal <suraj.kandpal@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3014;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=90ODFHe66Nfjl7yi87n5IICLXsZ4owytXCS3KVu4EDE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUWcj9BzTRYnVcWpH+HOdUmVZsP41SRvbgNf65
 r1tUWUIDeuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVFnIwAKCRCLPIo+Aiko
 1aRnB/44LaHrh0nL9t+l8Vm6jhnLOGva6JBnRavBIlXxZ9z4WE23lIX3WiEyrT7KyQ8m4e+qphJ
 2shMVOTKNp4d6IxIslu0RPfEZCcVynOUm+haZoWH0fbul6FKjHsfixttxMmhSBgniCaDpLn2Brm
 uf8MWBCmTndEK8JE5W+piAGszU88bTKxCU4YYh/eOFEb+LYAvwddqnzNk+FhaK6TL7s8H2t8cFq
 Sabt4YABaMeoD9UxOrjRnVuHwPET5x8fysxDQxsl/kF3qxqjF0D/Oac/p0bhLm4UPMCacwKdezp
 mnSB6VzLqdlVyoSSju677WRGgUmJZV98vHj3hVcEValfOlVq
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: LP5ATLcidqaa9EwyStszuUrY910l3vkq
X-Authority-Analysis: v=2.4 cv=O4o0fR9W c=1 sm=1 tr=0 ts=69516735 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=By2WwYRBACVvdXAjiroA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: LP5ATLcidqaa9EwyStszuUrY910l3vkq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OSBTYWx0ZWRfX4mlIkPvfmIC3
 s0PM2KFOvLww0dAfQwFvIeyf5EWzHIF4i08KcwhGl8dJe/jldC90CvKcYVdf37rHMXpOtEedQl6
 R370HCxLmZEgiw6EYgZGw4QZRHlTivo6q69Vc26qfeYHoxAvVU3u3rB0d7D6iE6VnD4VwapCKDY
 cVymJLgl81bnlz4tbU6t+F4lyPLDRcRNwM/Oal/tefbnYAoabO0F5KTa45pSvq92Cbhz9Sa1KzP
 Me0MjSkl70xFNUGT1yTE/qqYn6JEy0lsacZNeDmRAo+ZHTx5OZOGoWuxwoDSP2LafmA5CwV2Ilm
 gbO4XGhyBj2HcbIniTPVef4jsRt/uTZbYQ7p7cYyo/+x1AHUYhX6CpTFpfJ/ecbIbyfLWyNsLCn
 Y1yrcV0MHgGuNFtfBI71m0INOhJHv09FlHF7/ETDoj2rKfGhLZOeC6XxhRByWipMau+jP5A9fb7
 nVnkuUuIa+6cLa9lrIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512280159

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
index 1a01df91b2c5..ec2575c4c21b 100644
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
index 879ca103320c..958466a05e60 100644
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
2.47.3


