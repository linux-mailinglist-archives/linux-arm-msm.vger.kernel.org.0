Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58E7B400C34
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Sep 2021 19:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237088AbhIDRCo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Sep 2021 13:02:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbhIDRCn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Sep 2021 13:02:43 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05FBBC061575;
        Sat,  4 Sep 2021 10:01:42 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id s11so2224046pgr.11;
        Sat, 04 Sep 2021 10:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mohOV55ASQ/Ivu2xRbf2qUap8SG8LaRQ29+P+fune2Q=;
        b=qUIe62qU9KbUjrEoW22clG39BN0cFY7SePe0mIZS+K3rnDm9slErJ6LmeYCdQKaQcY
         ravRzITi3bSBgZMGRhPfqIl53tZWmwBfJaoiAYivN2RsKQix4ndDwf36knlkBdMrmSQa
         G9AcdLbNOpuiEFKdkQLOck7Frl9asSoCnx+fbLzU9JaE1Pi1wKIiy5qykJ5MWx6jLFXJ
         HpKEjI7LK/nSv2OtBm5j0FOqruMJVCa01+5vq7EYV2PaSi8v4e+l2MAh9UO6vSzkEUZ0
         YG9E94b+R4j/qpkQWH4PdzOanAdsypvd147hxW3QTC/r9BOqBJwUYK3A1nbsL2VNFg6O
         sxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mohOV55ASQ/Ivu2xRbf2qUap8SG8LaRQ29+P+fune2Q=;
        b=k0NWttwacUsqoNaWACoqmL/lVVzXRHOy0h4dW+iGJVkQq8TPHRN/3AtN5NuUO+goHn
         blV02x3hyyqvyt3Y9h2XGrHS46D9JeFwMZc2aPTa+vtle1NyD1romUfikfkAJh39jWot
         bNc0bO/m6xtFpmqyAyTl3RiNG/czXKKY/pnp9TV3No64+TXMXFST/QNr/uYMCJ2KUCS2
         18WSgFkimKZqmgi39EfFWw8m4Tc0UOseTOjnTkoFYXqqmYhD9DNSnWytbkMaZQualdnF
         HBtH0H5rSGYRg8gYum4wrJ4wMnlLhr598ubaOIRdHMhyHiDT9Tqv2th9d9Epf5q4jWZ7
         C3LA==
X-Gm-Message-State: AOAM532t+WGFUbUerycw/EtR/0KHmimLOqUdgOFLa/Mwdgnwct5zSlmi
        HHKEnpM5+CcXVJvh0svl2JE=
X-Google-Smtp-Source: ABdhPJyoLqe+unEHPexpOGf8I5lnpz2DyWGeODfwsS4UwcxCUO43fuNGR6BYyIf33H0TDm7pDH1YKQ==
X-Received: by 2002:a63:d250:: with SMTP id t16mr4270991pgi.95.1630774901472;
        Sat, 04 Sep 2021 10:01:41 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id i132sm3523029pgc.35.2021.09.04.10.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 10:01:40 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/fourcc: Add QCOM tiled modifiers
Date:   Sat,  4 Sep 2021 10:06:03 -0700
Message-Id: <20210904170603.1739137-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

These are mainly used internally in mesa, although I believe the display
should be able to scan out the TILED3 format.  Currently we define this
modifier internally in mesa for use with modifier based allocation.  But
we can get rid of that hack if we define the modfiers properly.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 include/uapi/drm/drm_fourcc.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 9f4bb4a6f358..8cb0c702aeca 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -590,6 +590,28 @@ extern "C" {
  */
 #define DRM_FORMAT_MOD_QCOM_COMPRESSED	fourcc_mod_code(QCOM, 1)
 
+/*
+ * Qualcomm Tiled Format
+ *
+ * Similar to DRM_FORMAT_MOD_QCOM_COMPRESSED but not compressed.
+ * Implementation may be platform and base-format specific.
+ *
+ * Each macrotile consists of m x n (mostly 4 x 4) tiles.
+ * Pixel data pitch/stride is aligned with macrotile width.
+ * Pixel data height is aligned with macrotile height.
+ * Entire pixel data buffer is aligned with 4k(bytes).
+ */
+#define DRM_FORMAT_MOD_QCOM_TILED3	fourcc_mod_code(QCOM, 3)
+
+/*
+ * Qualcomm Alternate Tiled Format
+ *
+ * Alternate tiled format typically only used within GMEM.
+ * Implementation may be platform and base-format specific.
+ */
+#define DRM_FORMAT_MOD_QCOM_TILED2	fourcc_mod_code(QCOM, 2)
+
+
 /* Vivante framebuffer modifiers */
 
 /*
-- 
2.31.1

