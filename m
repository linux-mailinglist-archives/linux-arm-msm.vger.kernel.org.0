Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD6F92E887B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Jan 2021 21:27:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbhABU0z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jan 2021 15:26:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726627AbhABU0y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jan 2021 15:26:54 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D335C061573;
        Sat,  2 Jan 2021 12:26:14 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id 91so27026055wrj.7;
        Sat, 02 Jan 2021 12:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uuaswafA4TQVvz1UZDdvhjuiKY9mruy0RJy3iy5N0mA=;
        b=p3yCOhnYofMOj78YUL7K29Ms+2FxrUzvnsAF11Neo6tRCNTVQGMZd7lvKJrc/mCIfs
         /ften1O0U3MrV614/ggLyDGT8TqlzR23qZi7nsUg80nRFZeTh3qH3SYvkx+gwpSnFb11
         Dui+1C/tbdkTBs1XZJUBAEgm0417BZtl5SmNSd3I1LrOxI2iGoGiIiVSYrfUzWi+AJPx
         RxcZVtsrHxg78ZUuObilVVx/egGgkF5jp3jcwXKZqx9ImXMt3UdJ5a3sFsgRtQcOGqG4
         Jmb/XrZQlpdpQLGNfXeBy3ZVqZEhVTwnO43NaT+bUbLMnxPqHEnb+h6+Rpc+vI6DS9iY
         WXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uuaswafA4TQVvz1UZDdvhjuiKY9mruy0RJy3iy5N0mA=;
        b=j7l3Pgi7A7wiiDWbQHlALKrrGTPBsmLFA/QkitTRUmFwc3KIpDb39k9SNHBxDjmYoj
         bwwsqbxWH10saJEQ2SxFqdf0VMGtFNue85pdmojBNpCLA8Xwt+aHvuvqJzqhPK7NDZsd
         IiRAlzBgXstA+8NOrpuifDvQvZcHztARgBQ8sfFqZ6goxVDGK+RBXgjgLiWvBTiDvmao
         KfjIEVlK7DC6tt8fB7jnM1RKkdFHQZNyXoThM3ocbu7zENkt+6kDGincXS3CqocwcQ8d
         +xAvrTJhhbp0kl9lpY66hsLDRxMKM/HUYiUYfDtErzXB2I+vHsXV5ql7qi4+l6IeQkQz
         2kpA==
X-Gm-Message-State: AOAM531vLlPUPwHxES+ZvR8hzKihp0UgOdSDvuhUPzLzIb9iSqlhcjOS
        YSk7ZbAu2vrmU1YxALqTERk=
X-Google-Smtp-Source: ABdhPJyiDyyRt4hq1SXo4hGhsh+SBiY6KZ/2itqNLIp8w4wvHWusI0T9nN/nQQqg2i2ag1jf1MPGJQ==
X-Received: by 2002:a5d:4f10:: with SMTP id c16mr72164660wru.398.1609619173035;
        Sat, 02 Jan 2021 12:26:13 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id s25sm90902853wrs.49.2021.01.02.12.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Jan 2021 12:26:12 -0800 (PST)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: Fix MSM_INFO_GET_IOVA with carveout
Date:   Sat,  2 Jan 2021 22:24:37 +0200
Message-Id: <20210102202437.1630365-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The msm_gem_get_iova should be guarded with gpu != NULL and not aspace
!= NULL, because aspace is NULL when using vram carveout.

Fixes: 933415e24bd0d ("drm/msm: Add support for private address space instances")

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c5e61cb3356df..c1953fb079133 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -775,9 +775,10 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
 		struct drm_file *file, struct drm_gem_object *obj,
 		uint64_t *iova)
 {
+	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_file_private *ctx = file->driver_priv;
 
-	if (!ctx->aspace)
+	if (!priv->gpu)
 		return -EINVAL;
 
 	/*
-- 
2.29.2

