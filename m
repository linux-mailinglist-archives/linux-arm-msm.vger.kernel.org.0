Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD3AC4F55F4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 08:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241949AbiDFFij (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 01:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1847971AbiDFCUa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 22:20:30 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B96FF1D4C17
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 16:41:24 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id p10so1114441lfa.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 16:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AaD8XVb2K9YsDryXdi/t3jnaeSVSEnsi/78uo5IoYLQ=;
        b=DhxABEvwavM6pQQGdMwYcxzvuUfulhIl2UO3Iw4uIDBkOKMTG3szy6OS+2SPdsZswC
         J55roIMtDQLJPCh1yBiZ0Rw59wE/0po2RVMAtdfpzolQvfGqo8jACM9LZ/8jgHr0rHZm
         mGDObOT4ggnskoPYHXcbbSy3QahES8XmoZyq9nCJhbj3ZHEmjbRCDKSgbVO+Y4+hLpjH
         LnDlVc8IlUhDxdvNm5FLF1/HUH9PTlSc2QWniz2ZAE1trbZO7K5hiKIXgJL1xoMn0Zy0
         LvCXMf+SBBTejxEaVfF0y+Su9sYDrfEifpsJHJ4RuzRcpD3XzCmTr1NrbQ5LgspZTrUv
         wOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AaD8XVb2K9YsDryXdi/t3jnaeSVSEnsi/78uo5IoYLQ=;
        b=64Qadpf7Z1QzCEwovByOTWjv59L2LkVOfw1C8M544wuifIDWAGF3Yt40dbVfcph4a2
         i+ei1DHdcSZtVIc+mFnvxzkbLmcouY5d/2TECHPd7ssqWcWVo9bjhQ7dp6bJAu1GHJkt
         sp+oIKYhbooAuJegsmFFtiDzT3dd6SbX/lMG81ErK5O4AmWK39ZrVTdIb8+Y+3j8nTYn
         sjCWMJ+treKf7dNIiNmeacGRuV1g9tWYlROVRR2mJhQ5RWaY/rB+zb/CohOvXOow2MoG
         MSH5OyH0VGETUlPav10Aw60uZGJuH7rCiVvt1SYs0JKImbjWigbPGVtRWSmIOYdVvb2q
         QNOg==
X-Gm-Message-State: AOAM5313oBQXDQX3mGaXdM5j0prZpP4pIgTVxemchDa8plAXWA9GZKBL
        miCfaCI2EaJ120uNB08310dcmc6me0rw5w==
X-Google-Smtp-Source: ABdhPJzylEOY8FI7d1q+yqTJ2OScOOiaZYwKkxc/K+DV54fSUY82vbXM87xQNS/CwJownyXCVwdvjA==
X-Received: by 2002:ac2:4c4f:0:b0:44a:3922:2f22 with SMTP id o15-20020ac24c4f000000b0044a39222f22mr4149428lfk.69.1649202083027;
        Tue, 05 Apr 2022 16:41:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id br12-20020a056512400c00b0044a2c454ebcsm1648195lfb.27.2022.04.05.16.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 16:41:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: remove unused plane_property field from msm_drm_private
Date:   Wed,  6 Apr 2022 02:41:21 +0300
Message-Id: <20220405234121.358948-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove from struct msm_drm_private unused field plane_property.

Fixes: 7d36db0be3b9 ("drm/msm/mdp5: switch to standard zpos property")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index ee3093890d97..3bce127953ec 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -192,9 +192,6 @@ struct msm_drm_private {
 	unsigned int num_bridges;
 	struct drm_bridge *bridges[MAX_BRIDGES];
 
-	/* Properties */
-	struct drm_property *plane_property[PLANE_PROP_MAX_NUM];
-
 	/* VRAM carveout, used when no IOMMU: */
 	struct {
 		unsigned long size;
-- 
2.35.1

