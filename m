Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74A56424836
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 22:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbhJFUuY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 16:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232147AbhJFUuY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 16:50:24 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA677C061746
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Oct 2021 13:48:31 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id y26so15803842lfa.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Oct 2021 13:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R4j4McPlc/+lAeM9Wl4HLExls29kqJZ7/vF2Ck1kcqA=;
        b=E2FXwHy8vYhenDZFy+97/bSDcaYarSzPGF4sKDxUKKPWqdg5Tns39SAxX794DM65P8
         HcAl5sl3nnD40tEvkP9CRBxm9xNOv9W5DH6Z+iYtMnED+gg6acg7JwcrTHePZpOHFzNJ
         nTFURiSbmPdimg/Ukm00wyj2NOUfqk2ZdY1RRWENhfUKOcCUpZlMnJOcb5024ypR8vWj
         jAZKQ8h4kUY/GJEZezMmoYJCq12mLXHy+Zve0eDTz6dTKFabySzxDORciw9MmK/tGo0/
         06zLs98mKrC8GuP9KgEXA4kpRxyJ462SJWPtaRfkFmyT39NfZhcc6uLU6b9IfStCH9HA
         /wog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R4j4McPlc/+lAeM9Wl4HLExls29kqJZ7/vF2Ck1kcqA=;
        b=zOhB3Dw3XqKn/iLsSc7y3DU2tT2xMLXoxEPs08EUTCF5eM2N2iZJVxREzXkSg4buy5
         FEn7n0e7lDh+Q3kqSaY2Z8k19zyTVWCLXkQDTR8BYm3yG3XgeRg2b+ZsVSRC0ONUW7rI
         PfZCrlBheBzDQU3dPnljSmXN1UQXMCgUdfSbm9s7Gf8iM3UMWEwdYiMZYBudNIXudi8L
         DGr3k+HImFUGP6TRAPDAIDNqKyJBrfDfRXknD7M4QMtdjahwLAOT9NafyO75W/819RCg
         XKyeb2qi+NkFnF2SkXaXqqYy6YUWniCAX1TGLg6I/W0fbXRBoWgOXAoqi9JPzPn8B7AJ
         WC2g==
X-Gm-Message-State: AOAM5306SfXpFSxcc9xDvz/VHlIBse3P5HvSsBYSk92BiJ8tOBP8u0G7
        wMRMPgeR8xkJ60GJCPpdY+2y3w==
X-Google-Smtp-Source: ABdhPJwpskYvbnXFarxIr/6JKRf3qn0rHbCDumnq9HTNk2sRM5W2ywQqg1tBs2thLAAZtvu4S3Ejng==
X-Received: by 2002:a2e:7203:: with SMTP id n3mr229653ljc.195.1633553310086;
        Wed, 06 Oct 2021 13:48:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y19sm2378787ljc.116.2021.10.06.13.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 13:48:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm/dsi: untangle cphy setting from the src pll setting
Date:   Wed,  6 Oct 2021 23:48:27 +0300
Message-Id: <20211006204828.1218225-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move DPHY/CPHY setting from msm_dsi_host_set_src_pll() to new function
msm_dsi_host_set_phy_mode().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         | 2 ++
 drivers/gpu/drm/msm/dsi/dsi_host.c    | 8 ++++++++
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 3 +++
 3 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index b50db91cb8a7..7dfb6d198ca9 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -118,6 +118,8 @@ unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
 struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host *host);
 int msm_dsi_host_register(struct mipi_dsi_host *host, bool check_defer);
 void msm_dsi_host_unregister(struct mipi_dsi_host *host);
+void msm_dsi_host_set_phy_mode(struct mipi_dsi_host *host,
+			struct msm_dsi_phy *src_phy);
 int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
 			struct msm_dsi_phy *src_phy);
 void msm_dsi_host_reset_phy(struct mipi_dsi_host *host);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e269df285136..1ffcd0577e99 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2224,6 +2224,14 @@ void msm_dsi_host_cmd_xfer_commit(struct mipi_dsi_host *host, u32 dma_base,
 	wmb();
 }
 
+void msm_dsi_host_set_phy_mode(struct mipi_dsi_host *host,
+	struct msm_dsi_phy *src_phy)
+{
+	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
+
+	msm_host->cphy_mode = src_phy->cphy_mode;
+}
+
 int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
 	struct msm_dsi_phy *src_phy)
 {
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index c41d39f5b7cf..49a0a0841487 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -77,6 +77,7 @@ static int dsi_mgr_setup_components(int id)
 			return ret;
 
 		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
+		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
 		ret = msm_dsi_host_set_src_pll(msm_dsi->host, msm_dsi->phy);
 	} else if (!other_dsi) {
 		ret = 0;
@@ -104,6 +105,8 @@ static int dsi_mgr_setup_components(int id)
 					MSM_DSI_PHY_MASTER);
 		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
 					MSM_DSI_PHY_SLAVE);
+		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
+		msm_dsi_host_set_phy_mode(other_dsi->host, other_dsi->phy);
 		ret = msm_dsi_host_set_src_pll(msm_dsi->host, clk_master_dsi->phy);
 		if (ret)
 			return ret;
-- 
2.33.0

