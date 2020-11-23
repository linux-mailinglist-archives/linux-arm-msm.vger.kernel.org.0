Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABA7C2C045A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 12:26:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729052AbgKWLUL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 06:20:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729051AbgKWLUK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 06:20:10 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC139C061A4E
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 03:20:08 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id x13so7471657wmj.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 03:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O0idKtGJTZ3eV2wLeGxjJ8blqSNYptwaWGPv5a5zic4=;
        b=hQxod/4O674zszb8RygkHLWu7NdAN+sjg/VYnQ1fWPLJQi+nO7oS/Q9B2PMoGUnfll
         u+d3BZWc4kp0yQUQXXMUoHnDNrgLelIdYT28LHhDGxoX17+8/oHPznTGWlh3N4BrKygd
         DMplyGtPJGFYBKof4mNSv2Y/5DuUfaJ7csCtOnuuOCNMMvI4IU7xiL7+hqdJaFoqHKiU
         /JzeUWNEJxi6vtabgHU5bE4Th+FL0Yuyw0sGYSYN8IiQykCkkczthgeTADQHfxbzuqfL
         ILU95YU9qbtYsl9Myx7i1hvj/fStJMZ5Y/HqcLvEIJb0pbliVeEyEV7HxZu/3HmtvbdP
         huqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O0idKtGJTZ3eV2wLeGxjJ8blqSNYptwaWGPv5a5zic4=;
        b=odHmRhuu5QfJ4zxJAgSiNBEsXU49MMv+Qz5YRItbxV+hSZ5HinPQRp179NjMKSItRR
         GN+s7OYvgdhzIOC747u9th8FQyWXY0XB5xnO7hLUrfUN0A0U6Ape4WE4Rp/wpfPMxlJr
         a7AJLUPVJGD9ppfHsnZJehqedTMhoGFkdWilh5RQQ3KzeGVKzIbqjgChljGZPFNhI+iN
         sc+gpNTobHhpAzv/Y24iXFlc7D64QRKSydW4abLYIp+G3GgSAOs/DbY7/MV7pcRimJxD
         68hWI7itT7L9185nw5DqEwpPBLQ5BAXbMQ0p2N5sGyVsD0C8ixOLc/Lumzlt/ibp476m
         4WLQ==
X-Gm-Message-State: AOAM5315YYxxJM9a1oXTnOKG4A/lPPynoVvXJHkDQXcMsz/VfS164QPF
        m6g6Mz7GaOBdXhPY985bqH4law==
X-Google-Smtp-Source: ABdhPJyY8lH30XYo80J+rnqQXr9BnzfsFnx27ygSUV7MIdA3y1Hs37Qs509j3j5OsS3eU3WorwBbrA==
X-Received: by 2002:a1c:f017:: with SMTP id a23mr23705686wmb.56.1606130407603;
        Mon, 23 Nov 2020 03:20:07 -0800 (PST)
Received: from dell.default ([91.110.221.218])
        by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 03:20:06 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 32/40] drm/msm/disp/dpu1/dpu_vbif: Fix a couple of function param descriptions
Date:   Mon, 23 Nov 2020 11:19:11 +0000
Message-Id: <20201123111919.233376-33-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c:150: warning: Function parameter or member 'dpu_kms' not described in 'dpu_vbif_set_ot_limit'
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c:150: warning: Excess function parameter 'vbif' description in 'dpu_vbif_set_ot_limit'

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index 5e8c3f3e66256..7e08f40e7e6fe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -140,7 +140,7 @@ static u32 _dpu_vbif_get_ot_limit(struct dpu_hw_vbif *vbif,
 
 /**
  * dpu_vbif_set_ot_limit - set OT based on usecase & configuration parameters
- * @vbif:	Pointer to hardware vbif driver
+ * @dpu_kms:	DPU handler
  * @params:	Pointer to usecase parameters
  *
  * Note this function would block waiting for bus halt.
-- 
2.25.1

