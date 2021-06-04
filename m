Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 294A039B756
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 12:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbhFDKrW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 06:47:22 -0400
Received: from mail-lj1-f173.google.com ([209.85.208.173]:45965 "EHLO
        mail-lj1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbhFDKrW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 06:47:22 -0400
Received: by mail-lj1-f173.google.com with SMTP id m3so10923694lji.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jun 2021 03:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9h1yKD+LgXGUnoZj5bAFUkiqd1zySY4f07AJKJZ6sB8=;
        b=esj90VqN2pifcAXHyVCWCrqSCXOxARgl24V2l2stp5Kulet9jYYn/ArvQTTwu7I5xN
         M0WJI7CSHPeyb1jkxoc/XZArFAu5vNz84pbnSdalDr2EzcKBcrASJPU2LZHzHbpmwPuh
         vMjkuhL5+DC2eVZIopdrCd8WhQwcxUS4e3tEU1u3ueTvdBE//lcQJsGb9U40Le31pcMO
         PECaN2PP8aZQ1XLX3/ylgcNSHPDa6JFDdWQGU2F0ESLjGr0cGyfw4FR9ZwhA6CfJAu6K
         g9bQsFlm2mCfWZZVc40xVkGKiDDSQMOklWhkT8OL7L3584EyGptSBwN62HUeN925DIu/
         NpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9h1yKD+LgXGUnoZj5bAFUkiqd1zySY4f07AJKJZ6sB8=;
        b=ZYEcWzSJRW88vrtGpgqOqVlbeUsP+MVsfwZp+q0AE0Q59QBQQj2vpIvMs7rrINbTOS
         mMokRFww6twT555fPN5/S3RSemFHypFUNn9EoeY9j3dba6d9uGxpP6zEnBIhYVSWqr5K
         ZC4jYPlADWjpU1/vGJfevx2tKQWk4JRvIxg5WQngcNwTuPTyda9OVCX+5QVun+qCXdnA
         9Z6JW6Cy+hIJinZ5kqZu1yunuNJ6wz28lecuwbi14yR6JmFMDOLO7Fut2jk5ui2Acskv
         BEi2jkMEruC6d7HXHKHsh/fs/wZRqR6TJRnlLLGId9uUeSgzfdDRTrBU/dTfnWg9bmNe
         1qSg==
X-Gm-Message-State: AOAM530XuSPz294erZQ8KeNxB9AeTBMYCUQh6lqNOZJqkxbIHBLThlcj
        bU7yKsYv//fjxVjjj2DZKuZxyw==
X-Google-Smtp-Source: ABdhPJwdRAGWrohXulTTMqwK47ar+H8y5xiqlSo2SCohQGWRuR4wUm9D4HbCLMOYqQq/PCW9jf888A==
X-Received: by 2002:a05:651c:104e:: with SMTP id x14mr2987179ljm.345.1622803475248;
        Fri, 04 Jun 2021 03:44:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q17sm671687ljp.3.2021.06.04.03.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 03:44:34 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dsi: print error code when MIPI DSI host registration fails
Date:   Fri,  4 Jun 2021 13:44:33 +0300
Message-Id: <20210604104433.1442949-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In order to ease debugging of DSI host registration issues, print return
code of dsi_mgr_setup_components().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index cd016576e8c5..4df5defdbf4c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -817,8 +817,8 @@ int msm_dsi_manager_register(struct msm_dsi *msm_dsi)
 
 	ret = dsi_mgr_setup_components(id);
 	if (ret) {
-		pr_err("%s: failed to register mipi dsi host for DSI %d\n",
-			__func__, id);
+		pr_err("%s: failed to register mipi dsi host for DSI %d: %d\n",
+			__func__, id, ret);
 		goto fail;
 	}
 
-- 
2.30.2

