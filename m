Return-Path: <linux-arm-msm+bounces-43081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CA19FA803
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 21:14:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D884718867BD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 20:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D50D196434;
	Sun, 22 Dec 2024 20:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PIv97iZ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4D9192D73
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Dec 2024 20:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734898458; cv=none; b=C/WUhhuInn4HLYaskqQFKGUfqhHU4/JR0iuipJYygHXwcg1F32pyDo/hIDkLsrWyJ/Q2LpothOA2JK0RmALwPgrVmlpbQUnDnBzIJSBJ+MxUD2HRxx9Vy3LJL6S1GYgcz4EfwtYQ/1bPZQR4pydvEtU7c2QtIGemyswK3Qgz8bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734898458; c=relaxed/simple;
	bh=ZQK3De9spKq2bOT0Hl1HvbbvggyGKbTI3+3PIdSsFLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BSi0k2Rm/7RrzsXl7uO3qKjn6HBI+uQIyF/E4KZReTC/VoP7ZHtNqQR4pFceHOUUFtoRH5kuMztV7sWxw0uOYyR2UBVEyaSaCoc9Z2sVS91REfaGDOTUsctiNhlm4HpsHQeZQ3NxazEHElkua2ZIRDkqRdtoK+sdS4MVwotL/4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PIv97iZ3; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30037784fceso38059981fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Dec 2024 12:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734898454; x=1735503254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5tbBwnpZQbD0yfgDnGnJ8OogrrRF+xt8+ZXSEBMtmg=;
        b=PIv97iZ30uNNYnxftmYK/4oFkPTPT2eRUopYwABTFO26o7s3BKLjk2YFfmFuoUfpas
         or4dQtQgMTTLwWFG1YLNqUhj6mKCjY2iN84hpIMZd2orpcQFviX6JNlfndnrYrMqfEbh
         KGp5YZPOAcLBfslCSZvOuyOi1aZ/KrOBM+0iihf17UwRxzuwbqaHCA+0yMUq9/RRSE/P
         H9q/CxJhTMscE2wzz1iEl1gI48zDk0Emxl9obmO0PKgpW0sklG/tUc98OyzFlNba6XK3
         v1LPXbiRMKJfWGdTPn1uOWdlf+4WRw2HiZj9dzABheR3nAniFtQIhYZKIYfSTKNK7Dhm
         kODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734898454; x=1735503254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5tbBwnpZQbD0yfgDnGnJ8OogrrRF+xt8+ZXSEBMtmg=;
        b=guDnbrLXZp2+4cM/ngHz5bCy71zY3MVXJtJVBGHAp2JNkysrQLmFQL7jHXXQaqMHq8
         BeJAQ1q2AfuKtBdDKhoJuKYT/luF/P3aKUodK9WIeQqWjSKOdwDfJQFgo1krGv1Mao50
         CUw0B3WE8YbeDmy8nJxeIdUALkzwPP2qEnXy5P6FpQ6TMUCKnFW2rcZbqHoP8GT3DzZw
         4wrZOd57IexPI8eQ1Bmk3iZy5rop8G9VFqFD8gBXrX8ZW7cvgtmFdVTc3KUuf/c2Vs/w
         JwUZBEWYr3i7g8Z4gm0uKdr6L5Bni8LjVhbLoliYHNL4PqFIi+HIy5cA0G0we+t9oj/I
         jFnA==
X-Forwarded-Encrypted: i=1; AJvYcCWqt/fAxdudMMS003ytW9pGiU9PbcYpJW4+3LNBdKgApBmY/W/9ArbFhTqDpSuupZP0Up2dc6LeKmZaQN18@vger.kernel.org
X-Gm-Message-State: AOJu0YxTF9S0FgPNOtj0N2hLBoOhqh1mpL9xSEYayj6WHeAJg3rkqVmp
	bloxsqc7h+Kxfyh7xXhz9QGP4pU0GJSU8Hij3BwbY9hPCF3UnPuQP3kQdkrCkM8=
X-Gm-Gg: ASbGncu9zvswa8KQOOQVY56gajBcHxfJnwSM/kXe5JodhzgpfIK24PS2sIOzDyPa5SL
	1AR+FAJ79qITUs7HbUO2han68fEQDHM2H5RWP7Kx9VoZXaNmXaOiqw5peAaXUI+o+1XRzKswBu1
	hgznv6ys5LPN+EIp8vrHAkOeiwFjP+Mm0QbgbjapA0MtKaTpemJlGZfZF22gQLpEf9BcmMG8eyN
	cez0DjwxuPN636rKQXqfQSCmP8b3RpXW232oBcTW4L/43BhkSZBQQ4d+VS0V7GL
X-Google-Smtp-Source: AGHT+IH2Ic5ZdSEegl4EaJ4Q3EhXIU4z8X7lRiyvx+Sp/ZxjxS25B473GBusBgE3FZdXHSzCT0dYlA==
X-Received: by 2002:a05:6512:1055:b0:540:269d:3017 with SMTP id 2adb3069b0e04-54229533dbcmr3578999e87.18.1734898454265;
        Sun, 22 Dec 2024 12:14:14 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f7765sm1034331e87.13.2024.12.22.12.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 12:14:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Dec 2024 22:14:05 +0200
Subject: [PATCH v5 02/11] drm/msm/dp: read hw revision only once
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-fd-dp-audio-fixup-v5-2-370f09492cf6@linaro.org>
References: <20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org>
In-Reply-To: <20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4182;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ZQK3De9spKq2bOT0Hl1HvbbvggyGKbTI3+3PIdSsFLY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaHMN64yI3FonnpxfQhjZ/o9sM5NujZ5qSSL8K
 l2ZABxBqVOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2hzDQAKCRCLPIo+Aiko
 1bwRB/9ZnCYL7Vg7RlwIqjQ2vzjSxspFT7p9mRiAqtYAz/4CsH/oX15+mFkWFAdKfLFybiqtTc9
 QDx39d/QmAb4GH5bq73+Iq73gNQPO7LG5bXvgeF6Kipx3/PAi/kwj02fr2ElA0CZ/EIfRDhd3gU
 YwDn28J8pfBBryxNy4crlFebxSZqpJ3MjMWcwW44czxBEi66vNl/uVZS3T0gqqBlD/JG8Wol6r7
 lyhPa9+88jCt6j8Rtqmj2R+1R8xZLSVCdIf7rX8e/hjhlf2+7R9S3n3LF+pSbGWEZJNz2LJu7r4
 8IxLVDfULxJ4WO033BQTMg3WYqeBGKVrCbW81OZRX8toH6RB
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There is little point in rereading DP controller revision over and over
again. Read it once, after the first software reset.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 29 ++++++++---------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
 2 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 4f80eceb6ae19f542110d7379007f57c2ac16a8a..23f9fcb75123a58b3a4b69d3dad0598135108eec 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -414,14 +414,13 @@ void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog,
 
 void msm_dp_catalog_setup_peripheral_flush(struct msm_dp_catalog *msm_dp_catalog)
 {
-	u32 mainlink_ctrl, hw_revision;
+	u32 mainlink_ctrl;
 	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
 				struct msm_dp_catalog_private, msm_dp_catalog);
 
 	mainlink_ctrl = msm_dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
 
-	hw_revision = msm_dp_catalog_hw_revision(msm_dp_catalog);
-	if (hw_revision >= DP_HW_VERSION_1_2)
+	if (msm_dp_catalog->hw_revision >= DP_HW_VERSION_1_2)
 		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE;
 	else
 		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_UPDATE_SDP;
@@ -514,22 +513,6 @@ int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_cata
 	return 0;
 }
 
-/**
- * msm_dp_catalog_hw_revision() - retrieve DP hw revision
- *
- * @msm_dp_catalog: DP catalog structure
- *
- * Return: DP controller hw revision
- *
- */
-u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog)
-{
-	const struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	return msm_dp_read_ahb(catalog, REG_DP_HW_VERSION);
-}
-
 /**
  * msm_dp_catalog_ctrl_reset() - reset DP controller
  *
@@ -556,6 +539,9 @@ void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog)
 
 	sw_reset &= ~DP_SW_RESET;
 	msm_dp_write_ahb(catalog, REG_DP_SW_RESET, sw_reset);
+
+	if (!msm_dp_catalog->hw_revision)
+		msm_dp_catalog->hw_revision = msm_dp_read_ahb(catalog, REG_DP_HW_VERSION);
 }
 
 bool msm_dp_catalog_ctrl_mainlink_ready(struct msm_dp_catalog *msm_dp_catalog)
@@ -895,9 +881,10 @@ static void msm_dp_catalog_panel_update_sdp(struct msm_dp_catalog *msm_dp_catalo
 	u32 hw_revision;
 
 	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
+	hw_revision = msm_dp_catalog->hw_revision;
 
-	hw_revision = msm_dp_catalog_hw_revision(msm_dp_catalog);
-	if (hw_revision < DP_HW_VERSION_1_2 && hw_revision >= DP_HW_VERSION_1_0) {
+	if (hw_revision < DP_HW_VERSION_1_2 &&
+	    hw_revision >= DP_HW_VERSION_1_0) {
 		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x01);
 		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x00);
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 08bb42e91b779633875dbeb4130bc55a6571cfb1..379fa4fef9ceb63b20c4aec2fca1e09003dc738b 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -33,6 +33,7 @@
 
 struct msm_dp_catalog {
 	bool wide_bus_en;
+	u32 hw_revision;
 };
 
 /* Debug module */
@@ -61,7 +62,6 @@ void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog, u32
 void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog, u32 rate,
 				u32 stream_rate_khz, bool is_ycbcr_420);
 int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_catalog, u32 pattern);
-u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog);
 bool msm_dp_catalog_ctrl_mainlink_ready(struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog, bool enable);

-- 
2.39.5


