Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24B2C350BE0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 03:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233002AbhDABYD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 21:24:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232782AbhDABX4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 21:23:56 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C6F7C061574;
        Wed, 31 Mar 2021 18:23:56 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id w10so533068pgh.5;
        Wed, 31 Mar 2021 18:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2OZG+O20zktXv8NsZQbXT4tTLbC2WfocmfwxuY758Yw=;
        b=W0nlURh/fdJ2uFh2SqFnYzWDiwK43B+uGadvn8W5L1ci6rFaDy+NdxT6/vKI7dxpY3
         QmKbODoln6safTTbvOf1W/Gtp/k8Qso+Bdrgvzc0LJQJEeI1W5AyywQCcvi2D7Q/lTY5
         0QRzjCapxDm4y2FroNsb49ga+WvyBhRKOrVnFarBIj6ug+ZQLxLp2BKMK7yjh2MhzKOq
         89yjiVvxwn7Dh7fU9hl/tUI5Ytl8+A/TD/KHXZm6WM+SofNF1g5R0B/btRz1TxvcWH+F
         wr9aMEtI12vmZaPzCyPWdgBNUJ5e2WXlsrHMHz85I7OsmwJJv/PI1qTVDmCej2pnw5Su
         QPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2OZG+O20zktXv8NsZQbXT4tTLbC2WfocmfwxuY758Yw=;
        b=EDL8zObCHcnQG5AE7pFLMkd1MGFAsWQCZr3Iy4FwSqbF4T6IY6vxLdFFKfpC9fGtHS
         MF0M++f8jlsIybO0QUoKhYtzqEY3ExGlX+NG2WKLiyzGuvJizuKfG2idUirO4NNBqhA8
         KNQBuNMi86AwdMMXjxR7enJKcAdbNj7W0MwAJov95fSyn2QYx4SUdP1oU6sXgV4FLVz7
         4Xb7zni1pz2zJxtq8vBzpNDewTZSMFO8vjVd5b6wBGN5QxTDt1fSvhxcbKjBqiOjE+zw
         jslUbG4usvq+8WUsGkk+ESiVvFw7fseAFqdPYUC/E0ScRXxxBIhTikfEt+vtUkUhSIVU
         5iwg==
X-Gm-Message-State: AOAM531b3y7TJ4q9yOJCOHMFRtgk7DlM+yoAW1B2+zRIAUdL67FKdLDt
        BMbjLy8O9mtQOlLgI2oXNyLUKIaZC/TvHw==
X-Google-Smtp-Source: ABdhPJxWNVCU8igKasbpVovJ1j4gGoVwVRMetgYIVXl1Uz4inRuJNKzWf3MODUk2A7/R07p/mphVSQ==
X-Received: by 2002:a65:4046:: with SMTP id h6mr5408383pgp.345.1617240235769;
        Wed, 31 Mar 2021 18:23:55 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id m7sm3351081pjc.54.2021.03.31.18.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 18:23:54 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/4] drm/msm: Remove unused freed llist node
Date:   Wed, 31 Mar 2021 18:27:18 -0700
Message-Id: <20210401012722.527712-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401012722.527712-1-robdclark@gmail.com>
References: <20210331221630.488498-1-robdclark@gmail.com>
 <20210401012722.527712-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Unused since commit c951a9b284b9 ("drm/msm: Remove msm_gem_free_work")

Signed-off-by: Rob Clark <robdclark@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index b3a0a880cbab..7a9107cf1818 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -78,8 +78,6 @@ struct msm_gem_object {
 
 	struct list_head vmas;    /* list of msm_gem_vma */
 
-	struct llist_node freed;
-
 	/* For physically contiguous buffers.  Used when we don't have
 	 * an IOMMU.  Also used for stolen/splashscreen buffer.
 	 */
-- 
2.30.2

