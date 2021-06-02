Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E40B398D0A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 16:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbhFBOgH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 10:36:07 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41]:38670 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231535AbhFBOgF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 10:36:05 -0400
Received: by mail-wr1-f41.google.com with SMTP id j14so2550539wrq.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 07:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LEQDjer3vbO3TY4ZLRkV2RG2nkyiXc42+Td4BCQWM9s=;
        b=KvVi0c/OVMBV3walhJDo2eZIaOxaoxLvpytsz5zVRSy+FITa1KoS7LMnzgFD+E9mZa
         iVRAiDATO7BtKC1JctwKINg8Ch9Roa8aBSPb/z7bU6PEkcTuL9DrhA4ln0ilbQD9FdOS
         7kqfO2DUN7WzrYBtuj5eI9Wf9sdP0Lu4aU6O7zD3lUbZxwBMstWZpmBzgWY6QW6WpjXY
         9Wza22NBIhib6GkT5KaNYx6ViyPDN4ftldL8XW1752SWMMhhE29zrQeBaqAtEcfl0gmr
         xoItU6RsYKWV7ZePJ98sS7eFoWDplcUXbM/+eRsvYK806lV1ANS7sjoyVjqrTT4eLfre
         tb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LEQDjer3vbO3TY4ZLRkV2RG2nkyiXc42+Td4BCQWM9s=;
        b=QEVRpMcF5JaWL2qoyZ8FTHU4CZTMiecd8lNRgCCxHz4reQa+H2Ef+KwQOCK5d8E65M
         Aql5b2+IldkfVmW83TsipgirC2HWJIAzxOelk3pv5VOhKZb6NBs7tJHFuPj9yyPmzG9o
         duHY57JcDZAQK12uBdsxYa2V+2EvZwE1A314ijtKY5pD5vG5gKkfhapVEiOe/9/2U2BF
         0oarS/MN8TARsgMsy4CgiMkBlsBpGSzfLqrKxR0wRPWGfBTRXyMkRmsH4H2sN4IDNup9
         gM51DoXUJuk4SnA16WtiHJftCUI5IqO/AFLDiZJA+fCfbiKniHrSgGdiB6ryqHrvImji
         8l4A==
X-Gm-Message-State: AOAM533Qdg9/R6nanQ4V/wg0ARD9VxPa8eD/g8kq6eQ5SJYkn9r2YgC5
        NEWCR59wVmgz2j4bIfz6Fv7RnA==
X-Google-Smtp-Source: ABdhPJzd2vW6XihcitQ2K1uJ/JKMN3WhefV+sdm3kCF831XAnwjjgxWuHWBwqKhr/jNqVCOgDdA3/g==
X-Received: by 2002:adf:e8c1:: with SMTP id k1mr24708635wrn.413.1622644401710;
        Wed, 02 Jun 2021 07:33:21 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
        by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 07:33:21 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RESEND 11/26] drm/msm/disp/dpu1/dpu_plane: Fix a couple of naming issues
Date:   Wed,  2 Jun 2021 15:32:45 +0100
Message-Id: <20210602143300.2330146-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:373: warning: expecting prototype for _dpu_plane_set_panic_lut(). Prototype was for _dpu_plane_set_danger_lut() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:498: warning: expecting prototype for _dpu_plane_set_vbif_qos(). Prototype was for _dpu_plane_set_qos_remap() instead

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 7a993547eb751..ed05a7ab58f53 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -364,7 +364,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 }
 
 /**
- * _dpu_plane_set_panic_lut - set danger/safe LUT of the given plane
+ * _dpu_plane_set_danger_lut - set danger/safe LUT of the given plane
  * @plane:		Pointer to drm plane
  * @fb:			Pointer to framebuffer associated with the given plane
  */
@@ -491,7 +491,7 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
 }
 
 /**
- * _dpu_plane_set_vbif_qos - set vbif QoS for the given plane
+ * _dpu_plane_set_qos_remap - set vbif QoS for the given plane
  * @plane:		Pointer to drm plane
  */
 static void _dpu_plane_set_qos_remap(struct drm_plane *plane)
-- 
2.31.1

