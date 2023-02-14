Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFFA5695667
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 03:10:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbjBNCKF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 21:10:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjBNCKE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 21:10:04 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8B781B577
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 18:10:01 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id u27so16828946ljo.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 18:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dg5npVEtTASzGcr4eJ+wVqqeUH6/+1vX9dbbBaUyogk=;
        b=BbmlxycFhE3h4MvUvNFd8zT591n4v4/EU0aisVF4e+55hZYOB42kTG74R4pGlLPki6
         NYAYux1rPnTKkb4Q6t+toPisCVWOz1k9DmQRcYWQFtgmE3YOc40c/9+tVzzzS/E1csx4
         SDu9M1hAIPwMUyJAsH/1/W++hwVDJV5AyE+Wjskp7LyB4+kkApKykU9Hr3+O7OsNA9DB
         mSYJv8XCnKnrfPRKSKJqDCoEFRcaTRH3Ym6DFOPHsjP+7TQtA3q8cywJGAuxvBPJPNAR
         MvPtireHDvJ0VUiY/ds8OE+28adRU0feMoHH9kgm9mHF3ksXU/Unu934Ju+Z+YWA9ECn
         nTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dg5npVEtTASzGcr4eJ+wVqqeUH6/+1vX9dbbBaUyogk=;
        b=vCKCg7s5eRubRJwk1mVvVbPR785H7spTZKuCsNvmkAh6Zm74lcZ5nwPitnhZCLv4h1
         4T9t8Lm4nX0bp3vxnqqF4Ca+jMw6WhIuXfOjiMXscbvzafeRwmUpqFEuSKsPAY4IyUk9
         jzSQrRUzsEnc/WMEh9TTq1aLJQJ1TGSSTcCxudIgpAVSocQZ3oxJcyaFEL81mRwHYlSp
         EQNPSYP+bgAE/uXuvqtV0uWzP89zEhM8xWNRa6tKbcabPPySQWjxgy54gRF3oKmlYhgD
         eeiQx6FkrZz0rqL8i1T48Pv5Ug5878nLO2yeTXxSYozyn3qXXFyAMn7grr9Mlxs7aJYa
         NgMA==
X-Gm-Message-State: AO0yUKUhmy7B/nzRuTDktigbdbpIaxcXPu2hwlc3mDa9asHFEue2p35a
        fNCJ7ZGuH5MPAyOf48l5pq3I4A==
X-Google-Smtp-Source: AK7set8FVMLGIVOfdD5mO52wDbfe3E+g/JNRA9zhUYix0s/deyvUjeuPyCPbl3Ydzfzfsfdn7EdEzw==
X-Received: by 2002:a2e:9106:0:b0:293:528c:c6c8 with SMTP id m6-20020a2e9106000000b00293528cc6c8mr260477ljg.33.1676340600300;
        Mon, 13 Feb 2023 18:10:00 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j17-20020a2eb711000000b0029066c8906dsm2239518ljo.23.2023.02.13.18.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 18:09:59 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Jami Kettunen <jami.kettunen@protonmail.com>
Subject: [PATCH 2/4] drm/msm/a5xx: fix highest bank bit for a530
Date:   Tue, 14 Feb 2023 05:09:54 +0300
Message-Id: <20230214020956.164473-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230214020956.164473-1-dmitry.baryshkov@linaro.org>
References: <20230214020956.164473-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A530 has highest bank bit equal to 15 (like A540). Fix values written to
REG_A5XX_RB_MODE_CNTL and REG_A5XX_TPL1_MODE_CNTL registers.

Fixes: 1d832ab30ce6 ("drm/msm/a5xx: Add support for Adreno 508, 509, 512 GPUs")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 8b2df12d8681..047c5e8c87ff 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -806,7 +806,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A5XX_RBBM_AHB_CNTL2, 0x0000003F);
 
 	/* Set the highest bank bit */
-	if (adreno_is_a540(adreno_gpu))
+	if (adreno_is_a540(adreno_gpu) || adreno_is_a530(adreno_gpu))
 		regbit = 2;
 	else
 		regbit = 1;
-- 
2.30.2

