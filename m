Return-Path: <linux-arm-msm+bounces-41602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACC89EDC1B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 00:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 412BC188058F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 23:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071CE200116;
	Wed, 11 Dec 2024 23:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y0fypTEO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0A11FE45A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 23:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733960537; cv=none; b=EkTcuC9zbpPgry8uM4d9shrd4RWhW0xyqEGmUddxjb4NMlJbALzENHQKIGbcmfNDLCA2a9cr+m1RRWME3uqG3mDfjJdfY+L1c8cBOL9dCBX9ahY6vKQFN9K6HlTLkDu22z3VSgbGTC6im7sfVPwdSQ9AQCHguBdgljuX8OPE9/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733960537; c=relaxed/simple;
	bh=07bzKTzskIVI/q9n2mCU9Sl5yWHixeA9E75gnkk3cpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DaFAwk67vN9KFvdmqyzJKdoORwbs6SU9dkBSlNLFKldnElA+xzZPsLRGUTq4BP2nIGldjyV2Nz4UTQJ7Nc3j1rLzwUMZXdKe4U/ZAtawjD2iUqSxVCihYIH1brZUgQ95bCD3hVZmyYzLtr526fg5n70CDGHJyRG1MIPOrq7qojk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y0fypTEO; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30225b2586cso12270301fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 15:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733960532; x=1734565332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqZk3Tq5fCD5CxCGxjQunAPcXw7TlzumxBBq+M+xg8w=;
        b=y0fypTEOMFEGZhTRLAQME3FAxJ6f5uuZCzxtEcCp1ohWC3VVqIJ46XiOCW5fS1mJC9
         whZ3TNSYKy5av6J1gAzMfeXW5yMV+qjPa/AmKwoRAcOkcjF6J7ssqWevm/uWPrOtZGE8
         whpHXDlT0DXFwGtyfixoVjfS8E7efcefc2LgZ+pzhXeUISPf2KDWujOVEZuQS2Nwsj5D
         oxsKeWkITrQBizYNgIhmTbAjOnS3BMAD8DeI4gm4r5AnxYob2Xi8In8WIjZY3QLXartU
         5/KzwLh7SsOQUiZpBvl9/cy64gOJJguxxCpN6WCGrULWrXC7R0lUlc6jphnxf8/wcrK2
         r2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733960532; x=1734565332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rqZk3Tq5fCD5CxCGxjQunAPcXw7TlzumxBBq+M+xg8w=;
        b=V7ouGunyLo1BsbjH4gGaqlS7V3Crs+7Ki1cpi88FlHOR7maBoyXuOLZ5tLWgpfNlO+
         f3+WBv6Ux+lwsdS31T+9AukFs+dps70fgVa3xATFZqEqaTlmQ0+lpqrqNIS/K6BhCWwD
         RzCltFAVQSRBsPLsFzqNR7HjTuRG9DmkkdpgFCiOv+L3bbMC09pGbUhGHfOOgMKuTLxd
         3kbHwU3dSNwW2dMyPyYtnYdTSB+OvtV/MieVVRZhgkEqIp1zxVbIsvCA0P2ZUYn92kBh
         sJIU/Hd+YCWbHf+yLIkAzGdoYQmlrm4e6Gfne1SMlsgvqbawvlMScX8AUGakOrx9GXhZ
         +Q/w==
X-Forwarded-Encrypted: i=1; AJvYcCU0EJpmSECzfsRz+e6TPmZIPq5Xi3Mp8d+fCT672yxOB1ONgrnfJzbc/DHFQzeQp7IJh7pBhKnaSo5KtQmq@vger.kernel.org
X-Gm-Message-State: AOJu0YzG1z8xxIJjEq1GCjVRi/TGYnKLBsKkN65W6l7Tupn23RhhxNuq
	lu4BnAxLzNPFHDwjH5URVKW22ZlidB3tVFELIgRU3pKii1NOgenf5cNQTrSIkWc=
X-Gm-Gg: ASbGncsFRF07LBaccmf8teY1CWVG2sdQE5hb7HLhbYXevVvdjpaEPkO4oD4KuwVamjF
	LOi2QdvudcFQzhudzJjUoSl5x8uDxlbChdfC9B8Q1NWrxGyNFsBYNSVUwSj8ZK4Jc6Jg6Yh7Gpw
	gEEUpnHtGvGb5b7mJ/V3VmpxtZ6lti8WLIKycj7h+fUvoGdcLYU0Yl36edg6zSDZq6GgZHjSjUO
	X2Sd7Lq3sgAzQtNBN0t8tpOL752KtzOednSzu9sVL62qxKPwamnGTPTB140Yg==
X-Google-Smtp-Source: AGHT+IHQJxXVg7oUqoCxrKBCYDWSNziSaeipgx0uMcv1PGhRvvElpMAwOp78E97VVfBYsHxBPRArdQ==
X-Received: by 2002:a05:6512:4010:b0:53d:f769:14cb with SMTP id 2adb3069b0e04-5402f96473emr325964e87.9.1733960532528;
        Wed, 11 Dec 2024 15:42:12 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401cc76909sm1222207e87.58.2024.12.11.15.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 15:42:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 12 Dec 2024 01:41:45 +0200
Subject: [PATCH v3 10/14] drm/msm/dp: drop obsolete audio headers access
 through catalog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-fd-dp-audio-fixup-v3-10-0b1c65e7dba3@linaro.org>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
In-Reply-To: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5710;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=07bzKTzskIVI/q9n2mCU9Sl5yWHixeA9E75gnkk3cpk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnWiM55LP5AjgeqKTF4Cp1FK2osYOe0MoctlG7i
 C+LwG6UROKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1ojOQAKCRCLPIo+Aiko
 1ffwCACd3VFpro7OROy5FLGRbgVRuEnWjFc8Gd+7MWbyyhww4noXWXKpIxYiheUZ/hw4ZR1NvBF
 +WZAYlNocT+w2WaB9V42xPU3cIdig5stuMKNureZdruReM/hO8z252KB4TQcwrdkV/y8m4GLfqw
 39bvyTAIx1sZgg7r7/Gi0n9H6yflJZ02HjIvTkmizdiNDD1TgM43CkSBroVfsNGdf8Fvi9sY6BT
 PvMnOfgh7GPMky1FLRwES9Ys7/eE/WNN4U5167PZe6GkEvvfdcK799CmeTUpmi8wGP986SWNBlj
 /zdYiu8D8qhDX3dt5neMOcMP2QMH/fx1T8YwZVyqGddwGX+F
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Drop obsolete functions to access audio packet headers. The dp_audio.c
now writes them using msm_dp_write_link() directly.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   |  2 -
 drivers/gpu/drm/msm/dp/dp_catalog.c | 76 -------------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h | 24 ------------
 3 files changed, 102 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 1aa52d5cc08684a49102e45ed6e40ac2b13497c7..24b62faa875437e184895c6d03df19884ebb1fd6 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -405,8 +405,6 @@ struct msm_dp_audio *msm_dp_audio_get(struct platform_device *pdev,
 
 	msm_dp_audio = &audio->msm_dp_audio;
 
-	msm_dp_catalog_audio_init(catalog);
-
 	return msm_dp_audio;
 error:
 	return ERR_PTR(rc);
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 91c580b1ee312595f3cca886c61ec570069eff03..c1c30da001ed881e1524370be9082d959bdd8bc7 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -62,7 +62,6 @@
 struct msm_dp_catalog_private {
 	struct device *dev;
 	struct drm_device *drm_dev;
-	u32 (*audio_map)[DP_AUDIO_SDP_HEADER_MAX];
 	struct msm_dp_catalog msm_dp_catalog;
 };
 
@@ -304,40 +303,6 @@ struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev)
 	return &catalog->msm_dp_catalog;
 }
 
-u32 msm_dp_catalog_audio_get_header(struct msm_dp_catalog *msm_dp_catalog,
-				enum msm_dp_catalog_audio_sdp_type sdp,
-				enum msm_dp_catalog_audio_header_type header)
-{
-	struct msm_dp_catalog_private *catalog;
-	u32 (*sdp_map)[DP_AUDIO_SDP_HEADER_MAX];
-
-	catalog = container_of(msm_dp_catalog,
-		struct msm_dp_catalog_private, msm_dp_catalog);
-
-	sdp_map = catalog->audio_map;
-
-	return msm_dp_read_link(msm_dp_catalog, sdp_map[sdp][header]);
-}
-
-void msm_dp_catalog_audio_set_header(struct msm_dp_catalog *msm_dp_catalog,
-				 enum msm_dp_catalog_audio_sdp_type sdp,
-				 enum msm_dp_catalog_audio_header_type header,
-				 u32 data)
-{
-	struct msm_dp_catalog_private *catalog;
-	u32 (*sdp_map)[DP_AUDIO_SDP_HEADER_MAX];
-
-	if (!msm_dp_catalog)
-		return;
-
-	catalog = container_of(msm_dp_catalog,
-		struct msm_dp_catalog_private, msm_dp_catalog);
-
-	sdp_map = catalog->audio_map;
-
-	msm_dp_write_link(msm_dp_catalog, sdp_map[sdp][header], data);
-}
-
 void msm_dp_catalog_audio_config_acr(struct msm_dp_catalog *msm_dp_catalog, u32 select)
 {
 	struct msm_dp_catalog_private *catalog;
@@ -421,47 +386,6 @@ void msm_dp_catalog_audio_config_sdp(struct msm_dp_catalog *msm_dp_catalog)
 	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, sdp_cfg2);
 }
 
-void msm_dp_catalog_audio_init(struct msm_dp_catalog *msm_dp_catalog)
-{
-	struct msm_dp_catalog_private *catalog;
-
-	static u32 sdp_map[][DP_AUDIO_SDP_HEADER_MAX] = {
-		{
-			MMSS_DP_AUDIO_STREAM_0,
-			MMSS_DP_AUDIO_STREAM_1,
-			MMSS_DP_AUDIO_STREAM_1,
-		},
-		{
-			MMSS_DP_AUDIO_TIMESTAMP_0,
-			MMSS_DP_AUDIO_TIMESTAMP_1,
-			MMSS_DP_AUDIO_TIMESTAMP_1,
-		},
-		{
-			MMSS_DP_AUDIO_INFOFRAME_0,
-			MMSS_DP_AUDIO_INFOFRAME_1,
-			MMSS_DP_AUDIO_INFOFRAME_1,
-		},
-		{
-			MMSS_DP_AUDIO_COPYMANAGEMENT_0,
-			MMSS_DP_AUDIO_COPYMANAGEMENT_1,
-			MMSS_DP_AUDIO_COPYMANAGEMENT_1,
-		},
-		{
-			MMSS_DP_AUDIO_ISRC_0,
-			MMSS_DP_AUDIO_ISRC_1,
-			MMSS_DP_AUDIO_ISRC_1,
-		},
-	};
-
-	if (!msm_dp_catalog)
-		return;
-
-	catalog = container_of(msm_dp_catalog,
-		struct msm_dp_catalog_private, msm_dp_catalog);
-
-	catalog->audio_map = sdp_map;
-}
-
 void msm_dp_catalog_audio_sfe_level(struct msm_dp_catalog *msm_dp_catalog, u32 safe_to_exit_level)
 {
 	struct msm_dp_catalog_private *catalog;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 8dcc029d87315d5777c9c48c0df403be8dd447ce..5ac89a11a503e2abae9f4cc4740b18f2f3b6da5e 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -31,22 +31,6 @@
 #define DP_HW_VERSION_1_0	0x10000000
 #define DP_HW_VERSION_1_2	0x10020000
 
-enum msm_dp_catalog_audio_sdp_type {
-	DP_AUDIO_SDP_STREAM,
-	DP_AUDIO_SDP_TIMESTAMP,
-	DP_AUDIO_SDP_INFOFRAME,
-	DP_AUDIO_SDP_COPYMANAGEMENT,
-	DP_AUDIO_SDP_ISRC,
-	DP_AUDIO_SDP_MAX,
-};
-
-enum msm_dp_catalog_audio_header_type {
-	DP_AUDIO_SDP_HEADER_1,
-	DP_AUDIO_SDP_HEADER_2,
-	DP_AUDIO_SDP_HEADER_3,
-	DP_AUDIO_SDP_HEADER_MAX,
-};
-
 struct msm_dp_catalog {
 	bool wide_bus_en;
 
@@ -147,17 +131,9 @@ u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_
 struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
 
 /* DP Audio APIs */
-u32 msm_dp_catalog_audio_get_header(struct msm_dp_catalog *msm_dp_catalog,
-				enum msm_dp_catalog_audio_sdp_type sdp,
-				enum msm_dp_catalog_audio_header_type header);
-void msm_dp_catalog_audio_set_header(struct msm_dp_catalog *msm_dp_catalog,
-				 enum msm_dp_catalog_audio_sdp_type sdp,
-				 enum msm_dp_catalog_audio_header_type header,
-				 u32 data);
 void msm_dp_catalog_audio_config_acr(struct msm_dp_catalog *catalog, u32 select);
 void msm_dp_catalog_audio_enable(struct msm_dp_catalog *catalog, bool enable);
 void msm_dp_catalog_audio_config_sdp(struct msm_dp_catalog *catalog);
-void msm_dp_catalog_audio_init(struct msm_dp_catalog *catalog);
 void msm_dp_catalog_audio_sfe_level(struct msm_dp_catalog *catalog, u32 safe_to_exit_level);
 
 #endif /* _DP_CATALOG_H_ */

-- 
2.39.5


