Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 477885164EB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 May 2022 17:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234579AbiEAPPw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 May 2022 11:15:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348016AbiEAPPv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 May 2022 11:15:51 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1452F633A
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 May 2022 08:12:25 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id v4so15811480ljd.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 May 2022 08:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ce4A8wMAvBJZnLY4Vg9L/lhIMXxs87k9mqHw26OfST8=;
        b=gjHGYTcvqx4d6Bv0cZY2fCzUjQWr4EPLQV7QknyllrvEV/EpvaI2hyEOySVyyutGww
         8BjCmyFZEI8GHnxU5AiJ9OkiUqtWJmNBeXoEmBfbffWjPhkUL18y5whPY9PMG6Hd+4Hb
         mEFHGb6ISo+XrEvj9CrryfK2Y9aHE34kTRBZrhf81a/K740/QZrLlCTZ11wMvH0DWOq8
         LNIiAjqXw/PM7JG3pss4txr1I3kkHTbInnp7yUxRxS6VXwBhdS0th8nV4AJtsrq2Kd+i
         UMienQEv09yytTSIQorxzSnUpPRxxYnWnrL9OIsqi9azzC/9RyVamuSWFlwLxwA4PvJn
         3Caw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ce4A8wMAvBJZnLY4Vg9L/lhIMXxs87k9mqHw26OfST8=;
        b=gfCu7u0fT5BCHe1s7tVToRWXwcnMEqW2bknXIB8Pq9BikJRJtkuXwab/Kq0Hf0LRfN
         N3miRzLBRWESM6W/9BbGM+gBWrm25JbtokV6XY91Dn6tk4T9c+0LUy6WUI0fTxoHB/sS
         S7vdQc8qnEJG86hhAVbDmHV39BC9kKH6R1C4evoGOyWHfn17ekDz6ot5DS38U3srtqNf
         2LvhxGjstrlSesro+leXgaFqaZS4VjeVUipIKTNMwMz7KpEpE2igi9IQjGSFjHWTak+k
         tqET7HCX1255TaWmPGv5jIYRc8bUuTcr/COxlGpBHS4ocd3/7L41oV3NjQzNFTmnDXxM
         0ZqA==
X-Gm-Message-State: AOAM532q0T8vuJjgxNpJP8gDZ95vwebxTFBN5YQ+mEIISYWvGPC4JNYu
        q5oPP9snhsvieq2Ui+VdLWaqSA==
X-Google-Smtp-Source: ABdhPJxYLBWRih7LcolP7XgihrHaq5BfPrrpzEQadwR5izXUNeUDfSjYqK/SKWFWz89qUTtf0OEgiA==
X-Received: by 2002:a2e:5407:0:b0:24f:64c:980c with SMTP id i7-20020a2e5407000000b0024f064c980cmr5783370ljb.163.1651417943463;
        Sun, 01 May 2022 08:12:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l16-20020ac25550000000b0047255d210dbsm461975lfk.10.2022.05.01.08.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 08:12:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 2/3] drm/msm/dsi: fetch DSC pps payload from struct mipi_dsi_device
Date:   Sun,  1 May 2022 18:12:19 +0300
Message-Id: <20220501151220.3999164-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220501151220.3999164-1-dmitry.baryshkov@linaro.org>
References: <20220501151220.3999164-1-dmitry.baryshkov@linaro.org>
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

Now that struct mipi_dsi_device provides DSC data, fetch it from the
mentioned struct rather than from the struct drm_panel itself. This
would allow supporting MIPI DSI bridges handling DSC on their input
side.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index a95d5df52653..173df1fd3692 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1690,6 +1690,17 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	msm_host->lanes = dsi->lanes;
 	msm_host->format = dsi->format;
 	msm_host->mode_flags = dsi->mode_flags;
+	if (dsi->dsc) {
+		struct msm_display_dsc_config *dsc = msm_host->dsc;
+
+		if (!dsc) {
+			dsc = devm_kzalloc(&msm_host->pdev->dev, sizeof(*dsc), GFP_KERNEL);
+			if (!dsc)
+				return -ENOMEM;
+			dsc->drm = dsi->dsc;
+			msm_host->dsc = dsc;
+		}
+	}
 
 	/* Some gpios defined in panel DT need to be controlled by host */
 	ret = dsi_host_init_panel_gpios(msm_host, &dsi->dev);
@@ -2164,23 +2175,9 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
-	struct drm_panel *panel;
 	int ret;
 
 	msm_host->dev = dev;
-	panel = msm_dsi_host_get_panel(&msm_host->base);
-
-	if (!IS_ERR(panel) && panel->dsc) {
-		struct msm_display_dsc_config *dsc = msm_host->dsc;
-
-		if (!dsc) {
-			dsc = devm_kzalloc(&msm_host->pdev->dev, sizeof(*dsc), GFP_KERNEL);
-			if (!dsc)
-				return -ENOMEM;
-			dsc->drm = panel->dsc;
-			msm_host->dsc = dsc;
-		}
-	}
 
 	ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
 	if (ret) {
-- 
2.35.1

