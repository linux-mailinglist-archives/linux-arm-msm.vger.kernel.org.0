Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0147BEC1C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 22:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378096AbjJIU5f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 16:57:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378034AbjJIU5f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 16:57:35 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64C4F9E
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 13:57:33 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50337b43ee6so6352948e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 13:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696885051; x=1697489851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FsVPh0iTyvo+/vzHQV8VGhwEhSRLAhFjYHzI1LkCqoU=;
        b=HFTZkLWAG0j7MCCPF7n2h5NfpKTGI+dPq0710ueX77iX6QLojLpBI2ZEDGP1pQ2zd1
         dTc+YWEBisVKnf/gBAdf2LtEtgYb1Yj/JtuN4tclQk44qM8hcOWZZ6QVYNLd9V2qcvT2
         HikX1gT7AGOm/Lxf0tyXAclZEtgxXm6gV9sZe6pTHTbu0ZXeA6p4YD/ic0Ktc784lG2O
         U3kg9ikRFUp2yEFHZDc5mWZt/SkFw2+7+UjqgIeigaP9qleUfSrPOucnfLmfO1eVrnv4
         S0vdue+LNJmxxRvPfgJ7rKMEqR0oggRpyxjgp+sh5GaaEnkbSSQbj+lrXpekC5mu2ZaD
         23jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696885051; x=1697489851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FsVPh0iTyvo+/vzHQV8VGhwEhSRLAhFjYHzI1LkCqoU=;
        b=o6BOfHtmOW5IyfIqvr9CDE6OlHytyItPIUDSGPZQB1ncJdm0w6JEicArXNvm3D2HUp
         Odm3/rY9RUzsQjUwdHptNnsMoyrsQxmXdIhhovSjL7P0vgJShg+O5NFXgYmap11nLmtp
         y3o/spbPmpZz/4jOG7I55rUYqMDjqWtw7urbTS6OYnKKg1uvbHRVHagkIEYyDn8rgL9w
         2fH0P3k72E0uH+An3nQz1snKxhNDmZjD3SfKGIokUDKkqE+A84h8xdOLwSV4UWcGAMi8
         iGuTsblFioeAQN+F4g0z5DWmIVXRXiiVcs6H8KJ5FnhOvabXa+O67j/SM+2wCRLR4+H9
         6bXA==
X-Gm-Message-State: AOJu0YxusFM5rph90iA5aBtYEV8M8dX+r7qNFqyYwmlU4rtsVuJInVvw
        ElcpZL/7Eu2d4qPYUq1+v2k18A==
X-Google-Smtp-Source: AGHT+IFJGy2KJmPdttBhioSDz9qzigsu77WQDa9aMgmNBJ9OPd2PNRDZd1XwmqmSd4bs014nxx5NOQ==
X-Received: by 2002:a19:e010:0:b0:500:b74b:e53 with SMTP id x16-20020a19e010000000b00500b74b0e53mr12915898lfg.46.1696885051661;
        Mon, 09 Oct 2023 13:57:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f5-20020ac251a5000000b0050300e013f3sm1540844lfk.254.2023.10.09.13.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 13:57:31 -0700 (PDT)
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
Subject: [PATCH 3/5] drm/msm/dsi: stop calling set_split_display
Date:   Mon,  9 Oct 2023 23:57:25 +0300
Message-Id: <20231009205727.2781802-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
References: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since the commit 8b03ad30e314 ("drm/msm/dsi: Use one connector for dual
DSI mode"), the second DSI host in the bonded pair will not be
associated with the encoder and will not get the bridges, thus making
condition in msm_dsi_manager_set_split_display() always false.

Technically that change broke bonded DSI support in the MDP5 driver. But
since nobody complained in the last 5.5 years, it seems that nobody
cares enough.

Drop the msm_dsi_manager_set_split_display() completely and stop calling
the set_split_display() KMS callback. Also remove the
msm_dsi::external_bridge field which was only used by the mentioned
function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  5 ----
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 35 ---------------------------
 2 files changed, 40 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index b7edcb7b3ddc..525c7ba22227 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -38,11 +38,6 @@ struct msm_dsi {
 	struct mipi_dsi_host *host;
 	struct msm_dsi_phy *phy;
 
-	/*
-	 * external_bridge connected to dsi bridge output
-	 */
-	struct drm_bridge *external_bridge;
-
 	struct device *phy_dev;
 	bool phy_enabled;
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index af840a1e9fc0..8eb73287dffb 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -198,36 +198,6 @@ static int dsi_mgr_bridge_get_id(struct drm_bridge *bridge)
 	return dsi_bridge->id;
 }
 
-static void msm_dsi_manager_set_split_display(u8 id)
-{
-	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
-	struct msm_dsi *other_dsi = dsi_mgr_get_other_dsi(id);
-	struct msm_drm_private *priv = msm_dsi->dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-	struct msm_dsi *master_dsi, *slave_dsi;
-
-	if (IS_BONDED_DSI() && !IS_MASTER_DSI_LINK(id)) {
-		master_dsi = other_dsi;
-		slave_dsi = msm_dsi;
-	} else {
-		master_dsi = msm_dsi;
-		slave_dsi = other_dsi;
-	}
-
-	if (!msm_dsi->external_bridge || !IS_BONDED_DSI())
-		return;
-
-	/*
-	 * Set split display info to kms once bonded DSI panel is connected to
-	 * both hosts.
-	 */
-	if (other_dsi && other_dsi->external_bridge && kms->funcs->set_split_display) {
-		kms->funcs->set_split_display(kms, master_dsi->encoder,
-					      slave_dsi->encoder,
-					      msm_dsi_is_cmd_mode(msm_dsi));
-	}
-}
-
 static int dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
 {
 	int id = dsi_mgr_bridge_get_id(bridge);
@@ -504,8 +474,6 @@ int msm_dsi_manager_ext_bridge_init(u8 id, struct drm_bridge *int_bridge)
 	if (IS_ERR(ext_bridge))
 		return PTR_ERR(ext_bridge);
 
-	msm_dsi->external_bridge = ext_bridge;
-
 	encoder = msm_dsi->encoder;
 
 	/*
@@ -538,9 +506,6 @@ int msm_dsi_manager_ext_bridge_init(u8 id, struct drm_bridge *int_bridge)
 			return ret;
 	}
 
-	/* The pipeline is ready, ping encoders if necessary */
-	msm_dsi_manager_set_split_display(id);
-
 	return 0;
 }
 
-- 
2.39.2

