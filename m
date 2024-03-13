Return-Path: <linux-arm-msm+bounces-13960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DF287A015
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 01:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E87DEB22BDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 00:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804A8A930;
	Wed, 13 Mar 2024 00:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WJ4cjpfe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AF179EF
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 00:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710288845; cv=none; b=RohdIKpKmKuWrY3YY28VM7r4bRjElh3MzKWoxKWiniGtun3PCtid7EjG+AJVlcpuSjx7LH6KV0TtsGxe6aSQKJr1iJQkKeQwvGu3zt0/5foM6+3j4FSCEpzoSHNzz5mmObmam+nryW8ZIhKE1CBNlAOYL9LDUT1uG3/xylnUwpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710288845; c=relaxed/simple;
	bh=tz/keXsa37xWJ0MEaMsuV4ypOd5lshGQXM3Y1Ue3+6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XE1fTgANDI+yQRdwry8B7w04gPkU7lsdKvPrJUbeWPBz+FX0zQaSGw5L2FWDATjpC7cMzlVfOphO3gJsBW04ekN+oJBYEBTNzPu0T1UXlY/0wAJ5CoqpX5D19jG/fWkd0XlSeZSSBY7p1qnDE+mqXyl4+RvrAwg9M+z9PVYxFbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WJ4cjpfe; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1dd5df90170so3412165ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 17:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710288843; x=1710893643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojXHCUbSnEQhORVd/rWq7LKRiJH0Wv/f2AD6HriHOV4=;
        b=WJ4cjpfe50D2VHXM6Yn+wjZm6vTrfn9hLWLGzfotXI/LO0tJZ3AYy6qE0GQftTSyeI
         JCw/BdUyAPEycUAIUv5Y6Sfgdfl0DH8Gc9F4VB5Nmqq8Yp6cN8XjQ8C60iD3gLxxm100
         sK+taO65aJllH3v7Pp4EWkQZPFeLu0Ppuyr18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710288843; x=1710893643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojXHCUbSnEQhORVd/rWq7LKRiJH0Wv/f2AD6HriHOV4=;
        b=RHMqnLtGkt6WQKeR4bvOyznY4QCz1HABySkTMeR7bdk5xdTVQiqkky1jEkzoHOoDSI
         y3aSsUToD5W8G/yxdxl1+8o4TzbIShVapDnHWdzXumcpLANb50Yll796r/2bNKHy09Cd
         o7SxR5bwDznB5HkqVNdjNUo/S/Q6h0xtLWod7wsFvtHmKc1cntNeyDraEwztYxos8c3z
         Tt+4asCwIpbZdibrojrUWdY1JEBQVyLD475ZmooOx3cjbPRR8bHB24dn3cAiPSpjLggs
         6Z446nEroAXkQLVcZDJrUN+3Pc3MIE0jeB+fwYABL8uXmDebzcXAonO+DjTEstuozV8D
         T8wA==
X-Forwarded-Encrypted: i=1; AJvYcCXM4XL69vrOfcH4JR2nBsqkASaIMk0mOvHWBb4MyugMyee0NXuDbi9HLGfT+3UaNb7Oah6QHKTQf1PkYqrieYL4bBCmSk8KDv/mdKNOGA==
X-Gm-Message-State: AOJu0Yw8VPPXU5fe9rlDzzv3GONHUmGDrKwRxnN2wlMQsNaMcpGwb4ou
	+hhyZeQnwJySEWJiNjj5mfSypqeBLUdNl+HIWVsNdDPMKJT7TKO9rA0xv7X6rg==
X-Google-Smtp-Source: AGHT+IHg+QGPW6c7yNuVfIy4mB1qUblGBo63Tt7Q82dhAxfSHW8SU9MTfYSWrSGI9xpyWtMDyKwWUw==
X-Received: by 2002:a17:903:22cb:b0:1dd:8d25:f8a0 with SMTP id y11-20020a17090322cb00b001dd8d25f8a0mr1295429plg.24.1710288843216;
        Tue, 12 Mar 2024 17:14:03 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:f8dd:895c:e876:6edb])
        by smtp.gmail.com with ESMTPSA id x8-20020a170902a38800b001dd761faec3sm7432924pla.251.2024.03.12.17.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 17:14:01 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Sean Paul <sean@poorly.run>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/msm/dp: Delete the old 500 ms wait for eDP HPD in aux transfer
Date: Tue, 12 Mar 2024 17:13:18 -0700
Message-ID: <20240312171305.3.I535606f6d4f7e3e5588bb75c55996f61980183cd@changeid>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
In-Reply-To: <20240313001345.2623074-1-dianders@chromium.org>
References: <20240313001345.2623074-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before the introduction of the wait_hpd_asserted() callback in commit
841d742f094e ("drm/dp: Add wait_hpd_asserted() callback to struct
drm_dp_aux") the API between panel drivers and DP AUX bus drivers was
that it was up to the AUX bus driver to wait for HPD in the transfer()
function.

Now wait_hpd_asserted() has been added. The two panel drivers that are
DP AUX endpoints use it. See commit 2327b13d6c47 ("drm/panel-edp: Take
advantage of wait_hpd_asserted() in struct drm_dp_aux") and commit
3b5765df375c ("drm/panel: atna33xc20: Take advantage of
wait_hpd_asserted() in struct drm_dp_aux"). We've implemented
wait_hpd_asserted() in the MSM DP driver as of commit e2969ee30252
("drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()"). There is
no longer any reason for long wait in the AUX transfer() function.
Remove it.

NOTE: the wait_hpd_asserted() is listed as "optional". That means it's
optional for the DP AUX bus to implement. In the case of the MSM DP
driver we implement it so we can assume it will be called.

ALSO NOTE: the wait wasn't actually _hurting_ anything and wasn't even
causing long timeouts, but it's still nice to get rid of unneeded
code. Specificaly it's not truly needed because to handle other DP
drivers that can't power on as quickly (specifically parade-ps8640) we
already avoid DP AUX transfers for eDP panels that aren't powered
on. See commit 8df1ddb5bf11 ("drm/dp: Don't attempt AUX transfers when
eDP panels are not powered").

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/msm/dp/dp_aux.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index fc398e8a69a7..dd62ad6007a6 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -302,26 +302,14 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 	}
 
 	/*
-	 * For eDP it's important to give a reasonably long wait here for HPD
-	 * to be asserted. This is because the panel driver may have _just_
-	 * turned on the panel and then tried to do an AUX transfer. The panel
-	 * driver has no way of knowing when the panel is ready, so it's up
-	 * to us to wait. For DP we never get into this situation so let's
-	 * avoid ever doing the extra long wait for DP and just query HPD
-	 * directly.
+	 * If HPD isn't asserted then the transfer won't succeed. Return
+	 * right away. If we don't do this we can end up with long timeouts
+	 * if someone tries to access the DP AUX character device when no
+	 * DP device is connected.
 	 */
-	if (aux->is_edp) {
-		ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog,
-								500000);
-		if (ret) {
-			DRM_DEBUG_DP("Panel not ready for aux transactions\n");
-			goto exit;
-		}
-	} else {
-		if (!dp_catalog_aux_is_hpd_connected(aux->catalog)) {
-			ret = -ENXIO;
-			goto exit;
-		}
+	if (!dp_catalog_aux_is_hpd_connected(aux->catalog)) {
+		ret = -ENXIO;
+		goto exit;
 	}
 
 	dp_aux_update_offset_and_segment(aux, msg);
-- 
2.44.0.278.ge034bb2e1d-goog


