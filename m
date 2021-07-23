Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FEBB3D30C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 02:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232795AbhGVXlr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 19:41:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232860AbhGVXlk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 19:41:40 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80DFBC061760
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 17:22:11 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id e14so1250091plh.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 17:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dz0Mv44U7pSq0fpy5oNQADKe5lwuD2wgQVYhqR8kN5k=;
        b=WW1VbVA5TxR5D31JO8N5fA+f2CTE/dvdSS5sYzGDbCm67Euq7BGsFrmVbIgpcwAYtc
         WA0tvm24Q+Bn60dbdutps9sCZUgxe25PHpr7Yzil4d6UONN5Kg2aQta4fe5zagyXjQfx
         rNeIIiZzoQj1NjtFsGffBWZD6zoBLteoDtH3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dz0Mv44U7pSq0fpy5oNQADKe5lwuD2wgQVYhqR8kN5k=;
        b=kxgSANgrEkvSinJthFtQBdR57Rpz4qER7I9y4TMVsqsFSJETRWoTyW960rwnbBwd9t
         48vNDd3GVHV8j64JvPAeEIlz0cbE+ihF6uB8ngGdQVKr8vT+x2vJu9sip6eyNmYp0bcY
         jbs6IGdvNzZ0Jvc9COE6Dcb9kLveDgNjTJYDD9K2NoVm8CtK7zUcNiSEgy4CAjuKthrW
         fVHXLTkbaYaxGG8oyzShOFhoeWupNBpRiepu9n01Do+uwjV14zkd/4YSpkPbYp4v0DdG
         iniAywbAzYaBrpWEq5gCayBNoHlzB4CP9Ep9l9cmteYYGu6pXx9k2RAWd2CweH/VvkC9
         gCxw==
X-Gm-Message-State: AOAM531HYE1hG+yWO3SYgPdZi3cQdMjNgzWcDD8WYP1pkQyuZD5XL9Mi
        IPpCeIKUUNrC+BEzIOjP/dwLVQ==
X-Google-Smtp-Source: ABdhPJwurRVfcpuzGhIY95vFze3UNqdiJh89jbxbdWNNL1RY+jtbU8Qg/NcdAam6A9QzUH5W/zMz6w==
X-Received: by 2002:a05:6a00:1692:b029:300:7193:f67 with SMTP id k18-20020a056a001692b029030071930f67mr2020764pfc.19.1626999731091;
        Thu, 22 Jul 2021 17:22:11 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:5e70:6a49:67b5:2b7e])
        by smtp.gmail.com with ESMTPSA id iy13sm4072377pjb.28.2021.07.22.17.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 17:22:10 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-arm-msm@vger.kernel.org, Linus W <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/8] drm/edid: Break out reading block 0 of the EDID
Date:   Thu, 22 Jul 2021 17:21:40 -0700
Message-Id: <20210722172104.RFC.2.I62e76a034ac78c994d40a23cd4ec5aeee56fa77c@changeid>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
In-Reply-To: <20210723002146.1962910-1-dianders@chromium.org>
References: <20210723002146.1962910-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A future change wants to be able to read just block 0 of the EDID, so
break it out of drm_do_get_edid() into a sub-function.

This is intended to be a no-op change--just code movement.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/drm_edid.c | 62 +++++++++++++++++++++++++++-----------
 1 file changed, 44 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 81d5f2524246..a623a80f7edb 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1905,6 +1905,43 @@ int drm_add_override_edid_modes(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_add_override_edid_modes);
 
+static struct edid *drm_do_get_edid_blk0(
+	int (*get_edid_block)(void *data, u8 *buf, unsigned int block,
+			      size_t len),
+	void *data, bool *edid_corrupt, int *null_edid_counter)
+{
+	int i;
+	u8 *edid;
+
+	if ((edid = kmalloc(EDID_LENGTH, GFP_KERNEL)) == NULL)
+		return NULL;
+
+	/* base block fetch */
+	for (i = 0; i < 4; i++) {
+		if (get_edid_block(data, edid, 0, EDID_LENGTH))
+			goto out;
+		if (drm_edid_block_valid(edid, 0, false, edid_corrupt))
+			break;
+		if (i == 0 && drm_edid_is_zero(edid, EDID_LENGTH)) {
+			if (null_edid_counter)
+				(*null_edid_counter)++;
+			goto carp;
+		}
+	}
+	if (i == 4)
+		goto carp;
+
+	return (struct edid *)edid;
+
+carp:
+	kfree(edid);
+	return ERR_PTR(-EINVAL);
+
+out:
+	kfree(edid);
+	return NULL;
+}
+
 /**
  * drm_do_get_edid - get EDID data using a custom EDID block read function
  * @connector: connector we're probing
@@ -1938,25 +1975,16 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	if (override)
 		return override;
 
-	if ((edid = kmalloc(EDID_LENGTH, GFP_KERNEL)) == NULL)
+	edid = (u8 *)drm_do_get_edid_blk0(get_edid_block, data,
+					  &connector->edid_corrupt,
+					  &connector->null_edid_counter);
+	if (IS_ERR_OR_NULL(edid)) {
+		if (IS_ERR(edid))
+			connector_bad_edid(connector, edid, 1);
 		return NULL;
-
-	/* base block fetch */
-	for (i = 0; i < 4; i++) {
-		if (get_edid_block(data, edid, 0, EDID_LENGTH))
-			goto out;
-		if (drm_edid_block_valid(edid, 0, false,
-					 &connector->edid_corrupt))
-			break;
-		if (i == 0 && drm_edid_is_zero(edid, EDID_LENGTH)) {
-			connector->null_edid_counter++;
-			goto carp;
-		}
 	}
-	if (i == 4)
-		goto carp;
 
-	/* if there's no extensions, we're done */
+	/* if there's no extensions or no connector, we're done */
 	valid_extensions = edid[0x7e];
 	if (valid_extensions == 0)
 		return (struct edid *)edid;
@@ -2010,8 +2038,6 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 
 	return (struct edid *)edid;
 
-carp:
-	connector_bad_edid(connector, edid, 1);
 out:
 	kfree(edid);
 	return NULL;
-- 
2.32.0.432.gabb21c7263-goog

