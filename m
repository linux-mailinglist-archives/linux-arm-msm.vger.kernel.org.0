Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC1D7C5F49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 23:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233582AbjJKVrO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 17:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233578AbjJKVrM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 17:47:12 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A42C9B7
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 14:47:08 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-503065c4b25so492008e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 14:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697060827; x=1697665627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ob6zHKwHJe5DxnJ96DbFvUViHrwYllqlwZyDWW9S4Hw=;
        b=quZs8jD2+LRk/TT6qSlsDPU5c+HHFPFdNld1p9AoxowvVnTO09oPh01ZHGmSstUzA+
         PgjhFAJL2ORKr6KnpgX9H7DhU5bwoKLVOlNIskmSfBguU+bp7orcVUWXRF+OoKpXjqfl
         4FR0Zw5Np5H7BMYUet3esUDRfQB2RNceSX/jvnpSnrnV1WqifDHR9UvqKBCnV+F+yClx
         6EHa0fJiOQgfbiFu6wmPikfKtlEQkaXBTk4m8Ll5zKM/stNpCoiq0CA0HV200rXhWpvO
         NdcN2mOsPewp2X7hSStL8R0T2Z0Qamm93e2XlxN8Ws2bW1JL+N8lugvKsWeophtaD9fT
         1d+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697060827; x=1697665627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ob6zHKwHJe5DxnJ96DbFvUViHrwYllqlwZyDWW9S4Hw=;
        b=hVUzuiLKzPjUr3GGpFHRAZl4lRRqJtKTo1gNj+ld8NGk4ayO6xmEcZC/UgOP+D1i8V
         ARsAF6uXCk3B91Q8tco6g2ObIFeKjjlOP/LFMxy5h+8EXFbRGfi5z95Cl7lqwMNnYyVj
         4AmfyQkg/Y8VK42G1CrL3JqV+pzbQQ2+mrs29SAvjjDpUBDkMJp/x8nTmAbYX213VF/h
         WT/aeZlT555SYQP+f8sfDU4KBfnNTqGlj78IxSQdLhHnnLX0bf1oJEQuUlYkJ6Dz9wBj
         yXIjdq3O6n54VY76gm4HgBsA+f9RpDzvyrzKlkvExRR7o8zH/iNE8i/NVJyIbkYX8Ntg
         GI7A==
X-Gm-Message-State: AOJu0Yw3+IS6DAi5Nf9qKUhc6cJ1LLY1UbsJZLvltrbXUIM5MtN+LZpo
        ErxocuPM1aeGFwFGX6/ExVh0Iw==
X-Google-Smtp-Source: AGHT+IG+Jx7gvthKXOrv1eS5yhlvxjJN951Md2sT933/0bkGwRR9gQgLcgv3WVHRKMFaSmnk0mnxSQ==
X-Received: by 2002:ac2:5443:0:b0:503:34b8:20b with SMTP id d3-20020ac25443000000b0050334b8020bmr16731665lfn.65.1697060826927;
        Wed, 11 Oct 2023 14:47:06 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o15-20020a056512050f00b004fbab80ecefsm2452485lfb.145.2023.10.11.14.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 14:47:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 1/3] drm/msm/dsi: use correct lifetime device for devm_drm_bridge_add
Date:   Thu, 12 Oct 2023 00:47:03 +0300
Message-Id: <20231011214705.375738-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011214705.375738-1-dmitry.baryshkov@linaro.org>
References: <20231011214705.375738-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The lifetime of the created drm_bridge is attached to the drm_device
rather than the DSI's platform_device. Use correct lifetime for
devm_drm_bridge_add() call.

Fixes: 5f403fd7d5c2 ("drm/msm/dsi: switch to devm_drm_bridge_add()")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 17aa19bb6510..896f369fdd53 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -485,7 +485,7 @@ int msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi)
 	bridge = &dsi_bridge->base;
 	bridge->funcs = &dsi_mgr_bridge_funcs;
 
-	ret = devm_drm_bridge_add(&msm_dsi->pdev->dev, bridge);
+	ret = devm_drm_bridge_add(msm_dsi->dev->dev, bridge);
 	if (ret)
 		return ret;
 
-- 
2.39.2

