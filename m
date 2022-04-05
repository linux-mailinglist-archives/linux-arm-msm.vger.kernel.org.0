Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 236874F561F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 08:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345944AbiDFFji (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 01:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1453189AbiDFCnE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 22:43:04 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D47B628CAA7
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 16:45:55 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id bn33so1060551ljb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 16:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1Iqbt8lWWr5PzRARKZi/p/Y11hVS9kTb+tshjhqgJ7E=;
        b=wRW6uTvNQyhoC+8+zMwMBjUsGSemFwkaIJ8xaNBFrridKcCvtpLpQyKrjQi92H0RXs
         1D/QOTXmnzYeouRzogg5XhCE2NbolhKi7R5bnxy0vwps03S5Kw6INRd3FQJNmj01+qPz
         xauU8d/5fQNStJjmZafsoSV03V45G4aKtm3lWT4i/jYtKvl9TDeSnsP9arkpL4sZm3a5
         847El/elkSrnN4m36pMvypC4m362PwtvyUhNsxl+pRqclq/77+e0knH7z6rF3T7L0Gyh
         PcQMS8E6R8iKI4SvjktmVpngyc9yrfgZA7SoDx3dX7mepxwHdlYbPNfer0R3yXioZ5DV
         QFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1Iqbt8lWWr5PzRARKZi/p/Y11hVS9kTb+tshjhqgJ7E=;
        b=gWBlWGoGKn1/nOZINoclQHPxuKONHEg5doE5lUBF6v3EaHGQ/PWV9qTFcS2UQA4JvU
         AvhgocMrqg5vSl0Q67df7GmT/16tmZ5TUJoH0MergR2wsybz2TrGYMGhWPQjILFt809p
         n3BUkyO8n72nOB2iO+pWhe8030Q29APpu3/o5M37y6ZkaHOiaEjt5Gp7ylRA4O8UFfWQ
         textgB44tBLTPn/6vC6zqy9pAPLF3e2jijJYyedNe3ZS+4tPHgaM3M0yL8dZWMuUAGRF
         5z7i7LMhX7CV4eXaFx4yLxroeB35rNDgS5vhbW6NGlLAI2ox3Bw+KoY8ITktizL2rPqf
         ZY3w==
X-Gm-Message-State: AOAM530cxPSr12UBM0MhJhF2kAnn+Rnw6dWWs3/uTg7pVuLmL75hQUim
        5v8u7Zp8iKBqxuHsIufk2PON3Q==
X-Google-Smtp-Source: ABdhPJw4ndQZB0hZbehYl/6rPiUUMMPM2zRus59KEaw1GkIplzOXt3oANnF+9oTn3gbdRdhjTxezXw==
X-Received: by 2002:a2e:b88b:0:b0:249:a45a:b9a3 with SMTP id r11-20020a2eb88b000000b00249a45ab9a3mr3670215ljp.48.1649202353964;
        Tue, 05 Apr 2022 16:45:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g11-20020ac24d8b000000b0044a3454c858sm1651897lfe.81.2022.04.05.16.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 16:45:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 2/4] drm/msm/dsi: properly add and remove created bridges
Date:   Wed,  6 Apr 2022 02:45:49 +0300
Message-Id: <20220405234551.359453-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405234551.359453-1-dmitry.baryshkov@linaro.org>
References: <20220405234551.359453-1-dmitry.baryshkov@linaro.org>
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

Add calls to drm_bridge_add()/drm_bridge_remove() for the internal DSI
bridges.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 0c1b7dde377c..918498e71255 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -665,6 +665,8 @@ struct drm_bridge *msm_dsi_manager_bridge_init(u8 id)
 	bridge = &dsi_bridge->base;
 	bridge->funcs = &dsi_mgr_bridge_funcs;
 
+	drm_bridge_add(bridge);
+
 	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
 	if (ret)
 		goto fail;
@@ -735,6 +737,7 @@ struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id)
 
 void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge)
 {
+	drm_bridge_remove(bridge);
 }
 
 int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg)
-- 
2.35.1

