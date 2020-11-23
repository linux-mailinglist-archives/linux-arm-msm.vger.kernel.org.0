Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C74A72C0445
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 12:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728557AbgKWLTk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 06:19:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728883AbgKWLTj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 06:19:39 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88699C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 03:19:39 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id e7so673115wrv.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 03:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gCZKU3j8clNV9/z+mSJexBSfvTb0PXc+UA+5nG1PO4U=;
        b=Oj2jCVRp8mxrSBXicPTrJ6Cjb3r3OcnFBR/iK8m1Di+xA+yQCWzhNblwi55dAJuP5k
         NwGqq/oSo6tOSdhXKl22884gM+qdojICcXDS6fKp1X6Yf1kRGTAVCR6jtXM6SSNhCbEu
         bOzqEuOL1BtF0ukiS0k6kT/r8jALx6ZhPbMbRUxxG0x1MV3fBOWRaKXKYUQiKNpMAJde
         1bl0ThxjbqxbOo0fhFzBXfz+wfM62m+CyojimphzRX27w3UcEJBUjfizhXvPHp/wxgew
         QS33fM+XutaxzEwsZEvpaDqKMNWEQ/YO8rF6CcEWoqBWkNq7hjl6hCND+wHeFX+fXHeZ
         V/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gCZKU3j8clNV9/z+mSJexBSfvTb0PXc+UA+5nG1PO4U=;
        b=eIkWqrI5snHjK57pGZ/9nlY0/rtz1hbBPB1paisxisvVKJa/s9tXdP66NGo6sboOGM
         oiWG+5kk9Po4RC7l7PZeDMrY4TyhDYqAU09JEdrZSeWjKc4tWoz/6ptXmvBu86EfIyJ0
         yVKEEizq558HVMjCLasCmp2hyuZCNyZFQO4t+bjc9xFP+Py/9tZ0wn1NHlJc/6nH+apg
         rHPYhXJRWrDctbvCqqDeDv79iaca+73jpFsdLDGDWM38/WSD7tmSCJfhXXQZim4H2XUW
         Bfigs338h+pbQv6MwkWGLnHmrrbisqRMuU8bpMegJ01/etBpZkKwk9xxXkGVnxjq545C
         a7ug==
X-Gm-Message-State: AOAM531RZfBo7gtaeJK1soS8P9eCekSaT2kY9BpVQJql2Vg2veraZi/J
        n3KARzN3kHaFCmHm5f3EicHaSg==
X-Google-Smtp-Source: ABdhPJxK2djg0cErC0kW+yAJbREEdI98d1J1Lyc4tpab95gJ+j8Oxsfni5KxA196urUkBeY9GRoXig==
X-Received: by 2002:adf:9d49:: with SMTP id o9mr30390561wre.413.1606130378268;
        Mon, 23 Nov 2020 03:19:38 -0800 (PST)
Received: from dell.default ([91.110.221.218])
        by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 03:19:37 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Fritz Koenig <frkoenig@google.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 12/40] drm/msm/disp/dpu1/dpu_formats: Demote non-conformant kernel-doc header
Date:   Mon, 23 Nov 2020 11:18:51 +0000
Message-Id: <20201123111919.233376-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'fmt' not described in 'INTERLEAVED_RGB_FMT'
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'a' not described in 'INTERLEAVED_RGB_FMT'
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'r' not described in 'INTERLEAVED_RGB_FMT'
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'g' not described in 'INTERLEAVED_RGB_FMT'
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'b' not described in 'INTERLEAVED_RGB_FMT'
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'e0' not described in 'INTERLEAVED_RGB_FMT'
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'e1' not described in 'INTERLEAVED_RGB_FMT'
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'e2' not described in 'INTERLEAVED_RGB_FMT'
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'e3' not described in 'INTERLEAVED_RGB_FMT'
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'uc' not described in 'INTERLEAVED_RGB_FMT'
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'alpha' not described in 'INTERLEAVED_RGB_FMT'
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'bp' not described in 'INTERLEAVED_RGB_FMT'
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'flg' not described in 'INTERLEAVED_RGB_FMT'
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'fm' not described in 'INTERLEAVED_RGB_FMT'
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function parameter or member 'np' not described in 'INTERLEAVED_RGB_FMT'

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Fritz Koenig <frkoenig@google.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index a05282dede91b..21ff8f9e5dfd1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -22,7 +22,7 @@
 #define DPU_MAX_IMG_WIDTH		0x3FFF
 #define DPU_MAX_IMG_HEIGHT		0x3FFF
 
-/**
+/*
  * DPU supported format packing, bpp, and other format
  * information.
  * DPU currently only supports interleaved RGB formats
-- 
2.25.1

