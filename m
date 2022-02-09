Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DFFD4AF83E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 18:26:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235530AbiBIRZi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 12:25:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238155AbiBIRZf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 12:25:35 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A359AC05CB96
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 09:25:38 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id a25so4395112lji.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 09:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1BxIwaA+ghqxoRAg9KQeU7mQU/4hfs4ZFm3Ll8NcMIs=;
        b=xxXTMVE/i0e3F7YJkR5Dl+zIiNXbJ9Za55VjNBE8FqAbPkFYENeO3YLYEeH18BXOcy
         ImudhX4v3mOntUNkoeKhV23R8TUG45DWA4IB8zkpod6aoTM9AGeZQGkJk37huZGTrEU1
         XQI6/wu+dCXz2INNMuwJuISsfYf/KRiPRZQtRkQQOdtOvnkweaTBiW/bfGHUeB1c1dj9
         kRodCcdQ4t6HeNb/MIBc4EUk4BHlOEWcIJt0Q6PclBmGEHDMM4Zn8XCnxJOQREsK3Ysw
         H7ouQi5TKJUMpOL5BLUt0ZSnoa9YeySXgqVf5i4/6GiIgbR15Md9/aLrLa1ips7OGH5X
         SPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1BxIwaA+ghqxoRAg9KQeU7mQU/4hfs4ZFm3Ll8NcMIs=;
        b=aQLshyqH25Zh/jd2f5cEi9TSwTgPsRY5wpWUAt+zrPSN3uZCHBfXybKLWA432o0Y63
         9mYZMHELrmw6SGf+DECjxu+wgJ2xJUOPEJAwM5vP8XJBnkRBMKCPa4baUuuhNJHPGdLI
         OuycbWqAvHwW4PPpkKqRlh5LjEFPtttLWgiZUXzJs+C1YgieTVF1vOO+z6CKE+AbGPhC
         9kohpL0pKSBCbVZslqt8yPKJeD7oBrUlmbdnqX2j4T6vqQsuH/NfA0F/mnlnAWYxSpYx
         i/fuF9ufr0aCt2N1kjDQoMrH95rlnYUadV1kL0JpNFt8J5yQ06fIkhditSodKH7UfZy6
         XHrw==
X-Gm-Message-State: AOAM530coMToKmLffwvNvnsulXgQy4VuND7bZSKwqSH/084FzOLWpuhh
        pNHj1f1kEhbcT2JPFHVm9QUZmQ==
X-Google-Smtp-Source: ABdhPJwGzQlzds0Guizt9Oa7XHqUDyj1/iwbxJtZfOhFuPkhju8ICBXzePkYbjayRLE8pQaujqGkCg==
X-Received: by 2002:a05:651c:214:: with SMTP id y20mr2122568ljn.223.1644427537016;
        Wed, 09 Feb 2022 09:25:37 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 09:25:36 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 16/25] drm/msm/dpu: drop EAGAIN check from dpu_format_populate_layout
Date:   Wed,  9 Feb 2022 20:25:11 +0300
Message-Id: <20220209172520.3719906-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
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

Since layout is not cached anymore, drop comparison against previous
layout and corresponding EAGAIN handling.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 5 +----
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 440ae93d7bd1..5c7d739143f0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -927,10 +927,6 @@ int dpu_format_populate_layout(
 	else
 		ret = _dpu_format_populate_addrs_linear(aspace, fb, layout);
 
-	/* check if anything changed */
-	if (!ret && !memcmp(plane_addr, layout->plane_addr, sizeof(plane_addr)))
-		ret = -EAGAIN;
-
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index a521c0681af6..b2395f02f6d3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1061,10 +1061,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
 
 	ret = dpu_format_populate_layout(aspace, fb, &layout);
-	if (ret == -EAGAIN) {
-		DPU_DEBUG_PLANE(pdpu, "not updating same src addrs\n");
-		update_src_addr = false;
-	} else if (ret) {
+	if (ret) {
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
 		update_src_addr = false;
 	}
-- 
2.34.1

