Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD3F46A17
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 22:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbfFNUgt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jun 2019 16:36:49 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:35326 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbfFNUgs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jun 2019 16:36:48 -0400
Received: by mail-ed1-f68.google.com with SMTP id p26so5268952edr.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2019 13:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WUyS4oh7ne5G6guKuPCoJTFw8Ikiy+4dtCVWiWa5zOM=;
        b=HfaBpbziLn3BuwY5H6ZWUTIasJ+xUD/GK/Ox0TYfaYrMCqeTDXP8yaG0PKq3zPdTct
         t0BWDfruvSoOMjUI4DpjIyMDqAsJTD1v2VNzAuUjStwtL7kfJaWV1vRamk1ffA4Nsasj
         3GyqnJcO1iDWWvmxcBa6fuyxOQ2fEPdSB+myg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WUyS4oh7ne5G6guKuPCoJTFw8Ikiy+4dtCVWiWa5zOM=;
        b=m+I70n3V/ZbArBVWGeSQgLof5dAm0hqlJnv/d7fTrKTY3aEle5XkxzsdRitT2RWYV+
         L4mOJ9ciwn6OPa3srveTKqNeB7GWfytxzgVvNM7V6TBsZnv11wvHMGKWOysa4MwwDhET
         rAulTHCObZkbbCwib6HyBUH9zAeP2OG+KUxYyjhcCqxiaAkdvZu+UXSGPzYvNyPOKchW
         E/PXeR2JFz2MWRdrA2CKSzMoOrid5Kpqf8MfpBsyXhrpjMvWHjQvHREtJBw6lG8L3Wr7
         Mm7FfojwUDfhffvyLKslhPmyBMfhuwDQmOUIXoSKAcDjNBm9orL2XHS2Uw0lvajQOmAk
         mGTg==
X-Gm-Message-State: APjAAAUh1MhpcBas3LOuzb00ht/YZmzg1Z86pjvKQbhy2IUD1DxO9osc
        MLMXmcDv7H+HYB1epzeem78GFw==
X-Google-Smtp-Source: APXvYqzfaPfBwhE/kF9nG/z+DPo2wrV/gVYsQLX/wbCHGWEoZ9Jv+BOD9Ia3qbcMAD9P5neyGwORFQ==
X-Received: by 2002:aa7:d297:: with SMTP id w23mr30363401edq.128.1560544606834;
        Fri, 14 Jun 2019 13:36:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.45
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 13:36:46 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH 21/59] drm/msm: Drop drm_gem_prime_export/import
Date:   Fri, 14 Jun 2019 22:35:37 +0200
Message-Id: <20190614203615.12639-22-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

They're the default.

Aside: Would be really nice to switch the others over to
drm_gem_object_funcs.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/msm_drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 87f92d3906ab..da5a88413964 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1034,8 +1034,6 @@ static struct drm_driver msm_driver = {
 	.dumb_map_offset    = msm_gem_dumb_map_offset,
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_export   = drm_gem_prime_export,
-	.gem_prime_import   = drm_gem_prime_import,
 	.gem_prime_pin      = msm_gem_prime_pin,
 	.gem_prime_unpin    = msm_gem_prime_unpin,
 	.gem_prime_get_sg_table = msm_gem_prime_get_sg_table,
-- 
2.20.1

