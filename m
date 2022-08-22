Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D00A759C4F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Aug 2022 19:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237123AbiHVRZA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 13:25:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235835AbiHVRY7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 13:24:59 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7FE92FFEE
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 10:24:58 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id m3so10570497lfg.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 10:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=JWuoaMhPoCYrN68iQTiKw3Xyik+rAwN10Yl4sr/ahzU=;
        b=f6q6TIV3VK+J93nQI1kLTXaNNxYsE3V9/haK8AfzXCOYGvLAHr3vKN+ZT39d5Lm5Zl
         y4JQhizivD0Ss+Cg00cS+Y8b5GQpKoG5q81CdI8+u1/CAP6gwWnF4scUffxoEyDjNCs9
         ih4xmf4MRwlBIioVpPQ8AsZBvFx5cF1TK5gSwVjnQCWMfKsYVXQEx+6BLIjFJ6rvbHFB
         Agi8RWW+JYDsjT7cKrnVhbZ7Dt3rjwStt+2qGF4aHTSoeBsbGnMLmudy6VKKjwKHw4o8
         cE1GAWSWfu3iFv69p7ileM1n3GzsuuiwQzmpCiLYe8zvoaAOB+wnfnZTArtN3JRzYS2p
         JVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=JWuoaMhPoCYrN68iQTiKw3Xyik+rAwN10Yl4sr/ahzU=;
        b=DqV7nysQyyazFoYSqElCt6pB9qqf/E4c49FgfQUXy9e4ToMzRf5q5wDX2/qxZb/9KV
         O1soJXB0tpN/iKkOvoG8rYHjlpmCdIuHnrtia+5DsxB6k9YNvt0ToQcMhyPLK4EQ6Utd
         vo3PQ+eUIEHMs5NM1b1hJ9CF5AfC39k7/2atm4/HMGCp2U6svaVLnS9mD8DQtFx/D/7h
         gSncHRmw6wBRvveFNLdMKrAYi4Tlfj3mXePefQDt9QvXdJF/PtKu91A/Z2YYSTLrtUDP
         Yov6Te4ujwauZMZ5YV7kzdhruQETP50mVLLc78OalM+phpIxNvBjbQuKbrbSis3taCQB
         6jsw==
X-Gm-Message-State: ACgBeo1BkcoBIoO9GkJYP/DCVrPZgJfgzrJRT121EQv1ARPAVc5WXYSj
        lmpUw4hp/w2KHWCS0ko7drUB4g==
X-Google-Smtp-Source: AA6agR6alkF8nw1SuE7MWnj5Ag0t/49LhC6nM8UItPjcfwKrwY9mh3KdwAR2h9UYfS7mybb6ZNs6oQ==
X-Received: by 2002:a05:6512:3409:b0:48a:ef04:4ec2 with SMTP id i9-20020a056512340900b0048aef044ec2mr7905189lfr.230.1661189096986;
        Mon, 22 Aug 2022 10:24:56 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v15-20020ac2560f000000b0048af4dc964asm2012603lfd.73.2022.08.22.10.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 10:24:56 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] drm/msm/dpu: drop unused memory allocation
Date:   Mon, 22 Aug 2022 20:24:55 +0300
Message-Id: <20220822172455.282923-1-dmitry.baryshkov@linaro.org>
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

Drop the dpu_cfg variable and corresponding kzalloc, which became unused
after changing hw catalog to static configuration.

Fixes: de7d480f5e8c ("drm/msm/dpu: make dpu hardware catalog static const")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0239a811d5ec..50ab17c9afd2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1939,11 +1939,6 @@ static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
 const struct dpu_mdss_cfg *dpu_hw_catalog_init(u32 hw_rev)
 {
 	int i;
-	struct dpu_mdss_cfg *dpu_cfg;
-
-	dpu_cfg = kzalloc(sizeof(*dpu_cfg), GFP_KERNEL);
-	if (!dpu_cfg)
-		return ERR_PTR(-ENOMEM);
 
 	for (i = 0; i < ARRAY_SIZE(cfg_handler); i++) {
 		if (cfg_handler[i].hw_rev == hw_rev)
-- 
2.35.1

