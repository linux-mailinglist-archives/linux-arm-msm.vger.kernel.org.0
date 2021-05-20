Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9E3C38AEB4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 14:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240386AbhETMom (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 08:44:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242573AbhETMn5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 08:43:57 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9BDBC05649C
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 05:03:15 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id n2so17468469wrm.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 05:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LEQDjer3vbO3TY4ZLRkV2RG2nkyiXc42+Td4BCQWM9s=;
        b=Ki/5vsccVM8UHJjBDGFEOMuTjOicSQZ1oz/OgLD4xv2Mx1VnM2VGHXxQik26n7huqz
         z+M0QggmLyEdbh5Z6f5cvjF26hkbqkjqZdRsDY/uCBFP9XHELAfxkgmlEHLWuxPcKDl0
         +ueptwbIz3rdVJVYcrJrmXoJISOoWkn/qWGuX0w8/oNZzsrv8zDCSW3V+lYoFDY+4mwx
         DdAQ44Bz3ymEqFpMxp+VFW/PuXEBgA6+C2u6IQfhVS7FCXUKQIRax56FYq3e5u94hjxV
         uJWLg8jT4C+/uABqpXoJ1pHREuWwxGXHwSP+D7wfEOuHJtO2jUvCHoNKxlCDoschLjdq
         N70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LEQDjer3vbO3TY4ZLRkV2RG2nkyiXc42+Td4BCQWM9s=;
        b=GkTCXsgJwe/ymFteQIiw/wTggKC69k750Uxr1VzswYMFzc2nFNWF6nKhXS3oT/2q8e
         iGtvJcHxJQODQK9aztF9Phsyo+I9pAJylw5zefSSlzk3vO5GMxcRSRWIJn2Tu17Wh1oa
         KTCDVE3ApXNYoBF6qgp2GKZUzc1Rjw1IFYaUQ2PhqjkpEWee87uuDNjLiEVD/2mYgG0L
         IxPasMTdKp7SQahycX45M0o4kwOh4vHwoCh7MBL/P8LHSnfuGDOYHkStTupbeiLxHu6x
         LiYIEbDQ0hZLpMAJYgF71ciwA2OmTwAv5f6diq1n+mbZb0FLhv7JZOFOdwkofrD1VF+T
         8hxA==
X-Gm-Message-State: AOAM530O0f64H3cS5O46Mj4Ikgip2QQEDniVwyxIsZgjmUhmAUu3bpDr
        tSTeR9ffy3I9Zi9GfUTvzGKaSQ==
X-Google-Smtp-Source: ABdhPJw4bICpRBMx5HeraldCYJJDz2R+rg+I59syE9V7H9hsq2MLfMyrxB9ejwWsFz74csOg7ggUcA==
X-Received: by 2002:a5d:44cb:: with SMTP id z11mr3998746wrr.159.1621512194487;
        Thu, 20 May 2021 05:03:14 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:03:14 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 22/38] drm/msm/disp/dpu1/dpu_plane: Fix a couple of naming issues
Date:   Thu, 20 May 2021 13:02:32 +0100
Message-Id: <20210520120248.3464013-23-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
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

