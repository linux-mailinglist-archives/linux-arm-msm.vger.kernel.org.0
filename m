Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8B772E6A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 17:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242944AbjFMPE4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jun 2023 11:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242950AbjFMPEu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jun 2023 11:04:50 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AFB61713
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 08:04:49 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 34B4A1FDC1;
        Tue, 13 Jun 2023 15:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1686668688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YrVTJ1PaefJMEwJtykBHJvvlyCd4uUwlo5aZ/cTyKVg=;
        b=YzeKXQVmMtk/Ctcl4+SU9FliAsX2M908VrkrP/97SkWGh/Zgi+oLtClYc0yVaPb2oYT7rU
        JPeKrwHEs+oQzCjbQ6R03Sii96qgfUrIEWLn6siaXCodNJIAAcVPENcZFrNxzcdjDKUvjq
        rHEqcgOuervp/sHOUjNSP2mhFrA4OC4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1686668688;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YrVTJ1PaefJMEwJtykBHJvvlyCd4uUwlo5aZ/cTyKVg=;
        b=GpbkiiEM3d1/KPG8NOk260QLgbZy4HY+egGnwFvYzCuF36SzKHX9FhI7hDvbxn0QeK0r62
        C2LaAo8OJKlmpxBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 06EC613483;
        Tue, 13 Jun 2023 15:04:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id OIfbAJCFiGSGFQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 13 Jun 2023 15:04:48 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@gmail.com, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/2] drm/msm: Initialize mmap offset after constructing the buffer object
Date:   Tue, 13 Jun 2023 16:51:32 +0200
Message-ID: <20230613150441.17720-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230613150441.17720-1-tzimmermann@suse.de>
References: <20230613150441.17720-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Only the msm driver provides its own implementation of gem_prime_mmap
from struct drm_driver. All other drivers use the drm_gem_prime_mmap()
helper.

Initialize the mmap offset when constructing the buffer object in msm
and reduce the gem_prime_mmap code to the generic helper. Prepares
msm for the removal of struct drm_driver.gem_prime_mmap.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/msm_gem.c       |  8 ++++++++
 drivers/gpu/drm/msm/msm_gem_prime.c | 10 ----------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 20cfd86d2b324..635744bc4765f 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1234,6 +1234,10 @@ struct drm_gem_object *msm_gem_new(struct drm_device *dev, uint32_t size, uint32
 	list_add_tail(&msm_obj->node, &priv->objects);
 	mutex_unlock(&priv->obj_lock);
 
+	ret = drm_gem_create_mmap_offset(obj);
+	if (ret)
+		goto fail;
+
 	return obj;
 
 fail:
@@ -1290,6 +1294,10 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	list_add_tail(&msm_obj->node, &priv->objects);
 	mutex_unlock(&priv->obj_lock);
 
+	ret = drm_gem_create_mmap_offset(obj);
+	if (ret)
+		goto fail;
+
 	return obj;
 
 fail:
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index c1d91863df055..2c846afe049e4 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -13,16 +13,6 @@
 
 int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 {
-	int ret;
-
-	/* Ensure the mmap offset is initialized.  We lazily initialize it,
-	 * so if it has not been first mmap'd directly as a GEM object, the
-	 * mmap offset will not be already initialized.
-	 */
-	ret = drm_gem_create_mmap_offset(obj);
-	if (ret)
-		return ret;
-
 	return drm_gem_prime_mmap(obj, vma);
 }
 
-- 
2.41.0

