Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB855164E6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 May 2022 17:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348016AbiEAPPw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 May 2022 11:15:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235718AbiEAPPv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 May 2022 11:15:51 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6EC16347
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 May 2022 08:12:25 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 16so15813050lju.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 May 2022 08:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QgI1RLE4QjZBMdfYSm+1pfZAQh9ERx+LC2dX8V73DIk=;
        b=Sk5V9+hcGZ2vhjdPvbMVdA2+0QSRX1JUp4+W00RgJTYiFeJzairgk6e+bRMqd5TTpx
         t7dupZa/pDOL2bo2/Rh1F5D1OwYXlchvU/px8KGfuosWGXERh744o3ETZ3ktbDOhELR3
         6lqzQiKrlgx7U4+eysp3o/9fRYtUEv6G9j53fgiappsQgPdPIsevbIha1gX+BLGaULt6
         Uv1vqxxRJp38wJjIY2NyrgF/AiP/IlQUlsEA87onHuioBp+JczYNU0k7e/8Dbu4jq6ZR
         7pVejmb0NAH7cmk1DX/iV9AQw2UoabyeBQGLQv3Kbf39BJFMe+Ea6aa31Ve+/gY4K4gn
         xPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QgI1RLE4QjZBMdfYSm+1pfZAQh9ERx+LC2dX8V73DIk=;
        b=T9p0rHTRlYaCm8W2an0bk4EoJC7it7qRjRjYQs9S916ONDWwvC1HhOb/m3Xhe1MdQn
         CjUvO+TXkGhYojhr8ryaV21wwDoQfv22h+MP2wX38zyNjEMo41mCpOWBQI6V6+vCEzU0
         ox/oIcUiu7beHjqm8xj6RQDIVGiB18i/0Km2By1zO7lTxiixXcTCsZZnNK8T6NSZk31t
         ns0WiIfR0d1NZKcbPZt75U6Ujf4rufZ2sbe3XEepRes7B1jRJgxafWInJojjDL1raueJ
         Mq8yelJLjBVsHmf9oDUPipN7P+MLVFsJQfD17ga2G2EmVKLrBg11MxsSRy3mquXaAYXG
         2zgQ==
X-Gm-Message-State: AOAM531RHPV37FHtpVZiintpu4GgY/hi9SDQkSRGIvEF/FA7Ri0hukDJ
        QilJ49Fhvj359bSTJn+eYuWT5w==
X-Google-Smtp-Source: ABdhPJyc3fJfnPgQHWznkOtDdnF03pldZtT/k0xHZMBcfFyaS2gkFMw+G1J2k5EXTxVwhD08Qnwz4Q==
X-Received: by 2002:a05:651c:54a:b0:250:5b67:b7b6 with SMTP id q10-20020a05651c054a00b002505b67b7b6mr565451ljp.305.1651417944069;
        Sun, 01 May 2022 08:12:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l16-20020ac25550000000b0047255d210dbsm461975lfk.10.2022.05.01.08.12.23
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
Subject: [PATCH 3/3] drm/panel: drop DSC pps pointer
Date:   Sun,  1 May 2022 18:12:20 +0300
Message-Id: <20220501151220.3999164-4-dmitry.baryshkov@linaro.org>
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

Complete the move of DSC data pointer from struct drm_panel to struct
mipi_dsi_device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/drm/drm_panel.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index d279ee455f01..1ba2d424a53f 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -179,13 +179,6 @@ struct drm_panel {
 	 * Panel entry in registry.
 	 */
 	struct list_head list;
-
-	/**
-	 * @dsc:
-	 *
-	 * Panel DSC pps payload to be sent
-	 */
-	struct drm_dsc_config *dsc;
 };
 
 void drm_panel_init(struct drm_panel *panel, struct device *dev,
-- 
2.35.1

