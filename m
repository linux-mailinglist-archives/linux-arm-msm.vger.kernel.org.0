Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 871D62C3104
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 20:45:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgKXToJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 14:44:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbgKXToG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 14:44:06 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 608F3C061A4E
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 11:44:04 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id s13so86141wmh.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 11:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DTo1OeJsTMi708YCunPWIPmexxKTRjfpe4q5AMYK+8k=;
        b=AdFPXVRq91HXvmzYsLOfIxNCl+1jVT27YrmgFCSoMfUOF/IJY75qGZkjBGPa68nVx+
         vgrGSGE/17aRzboCcz0qYX1UESnuJdo8J2zZxxj5YzEg2AYppSRdvIP0fhPMr/r10zCu
         1Tz8kM7LyZBytsrhbHvEyaNIGq3lqD6oZSwczk8BbL7+ZNsYIaXIp64ePN68spYVwfvO
         DgsaAr9GZBY1m/OIXOdcGGr3/BkRKzoDXXZf9ScAXxYHNvcIZsYXGenADIi8ryBFEDsf
         g1A2ywPf2/GAn7RmfvYoeL/Kxf9Mdc8OMSRt0RL18XxkC5BB5pZ/poO3Wf1jqsWcp6dM
         kOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DTo1OeJsTMi708YCunPWIPmexxKTRjfpe4q5AMYK+8k=;
        b=AtyRQVwwygfr6uleFg9XDEmSBmx+zcuuJQNRGuEhr6hgPhoYLNwQL4+ZBz3ktvK2rk
         atfjnMJn+Abz0pTDgGM11pFGFftM93VpBBYOr0F3FhOSiKviArpkauZBhs2l/lZGsx3L
         ojh7woTmg8tLh5OstWm3oeOVBVRWPYzweZNTlBDQ/1T6pJmEINTGHL5HxMDtpSbRE5+k
         yCwCsek/a4jK4DoSei4p+NtOqV0/eFaqYOLxsMJ1vE/qxgQa98qNGO59w1sQS57rWQ0m
         m9OWfI44Fo2aA4dzq2zcki2nZSJ6r5kpJTTJklAZwQwCmZcFVBL7lbqWsozCTknqVwtW
         ZXyw==
X-Gm-Message-State: AOAM532sXzBYG3GHlOAKnTyQKuuMjdf046vPWAJ2+F2+6TY4aAX9NrJt
        Ss5rtG629Ba2m724kmfeippuMw==
X-Google-Smtp-Source: ABdhPJxkibkRVGkcK95WR2K9W8ZA7y6vi0pEa1l+e3tU26brziMvgP66uY0Vo6rHrq+75BUtzOvGWg==
X-Received: by 2002:a1c:9901:: with SMTP id b1mr22910wme.18.1606247043062;
        Tue, 24 Nov 2020 11:44:03 -0800 (PST)
Received: from dell.default ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 11:44:02 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 03/40] drm/msm/adreno/a6xx_gpu_state: Make some local functions static
Date:   Tue, 24 Nov 2020 19:37:47 +0000
Message-Id: <20201124193824.1118741-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124193824.1118741-1-lee.jones@linaro.org>
References: <20201124193824.1118741-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:83:7: warning: no previous prototype for ‘state_kcalloc’ [-Wmissing-prototypes]
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:95:7: warning: no previous prototype for ‘state_kmemdup’ [-Wmissing-prototypes]
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:947:6: warning: no previous prototype for ‘a6xx_gpu_state_destroy’ [-Wmissing-prototypes]

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index e9ede19193b0e..c1699b4f9a897 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -80,7 +80,7 @@ struct a6xx_state_memobj {
 	unsigned long long data[];
 };
 
-void *state_kcalloc(struct a6xx_gpu_state *a6xx_state, int nr, size_t objsize)
+static void *state_kcalloc(struct a6xx_gpu_state *a6xx_state, int nr, size_t objsize)
 {
 	struct a6xx_state_memobj *obj =
 		kzalloc((nr * objsize) + sizeof(*obj), GFP_KERNEL);
@@ -92,7 +92,7 @@ void *state_kcalloc(struct a6xx_gpu_state *a6xx_state, int nr, size_t objsize)
 	return &obj->data;
 }
 
-void *state_kmemdup(struct a6xx_gpu_state *a6xx_state, void *src,
+static void *state_kmemdup(struct a6xx_gpu_state *a6xx_state, void *src,
 		size_t size)
 {
 	void *dst = state_kcalloc(a6xx_state, 1, size);
@@ -944,7 +944,7 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 	return  &a6xx_state->base;
 }
 
-void a6xx_gpu_state_destroy(struct kref *kref)
+static void a6xx_gpu_state_destroy(struct kref *kref)
 {
 	struct a6xx_state_memobj *obj, *tmp;
 	struct msm_gpu_state *state = container_of(kref,
-- 
2.25.1

