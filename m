Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 408FF76D6ED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 20:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbjHBShC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 14:37:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjHBShB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 14:37:01 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21BEE1BD9
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 11:37:00 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b9b904bb04so1627091fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 11:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691001418; x=1691606218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtnOSZ3n2/CymjBqeJkQ4cRZMCsGC/V1KtdFyH5+HU4=;
        b=HTHt+GQw19CduXQ997U6O6LHXJ0/5ydlTWhAhTfMCTlYn8UnXqmkuvVbBECJ9Laqsi
         hoX3S9N6rAfx3YvsKvSbt/CrJBJSIJBGE9BkH1lJHPT4l23P3A2TfiNTvE8Y13FFbDjJ
         r1uIjVZFEHPvpdRBDDXtp63vsW41AclSz0sLyG0u1jpcHvnqzz9Q9wSKAnKu8HMbxlQt
         NZdjAD2cI/EPL1tBylho/14ohGt+bTfzbKfqoNUZ9cTVk9N1MmCIMy1R/B4ug0+p++b7
         H+D3dXei+diDwKjhL0DjID4dlqxbFSSlmeM78ZLPUajz/odI5xz1JIW7oRWq4OuPHLDw
         8v0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691001418; x=1691606218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WtnOSZ3n2/CymjBqeJkQ4cRZMCsGC/V1KtdFyH5+HU4=;
        b=IYeKoVCtLD3f0sVdIdpdwguHyuT+82aa4BScTPOLRhmD5ZJdRubUOuvRQP7QYSrHCg
         IJ7AVxqtt/88arEG8XZW3WsPbRUUcGNVIMnf//BaMHw1AVFqtsviV1ZaPH80i5vS2GYH
         bHMuzOQsEJjVIwD5yIBgR0JQR7sBM18ngq8cNa6lVe/Bxxf5ek+5od1CxsN3QhvY5pOU
         dlK8+SAsOjNW3W38qOpNM0ipjUbIyxmu0DkwkSo9Mf/uVuRgHiZht96uD6i4lyyvaj5p
         aagsI7IVPvhzkk8XeGOpf5/L0HK9QKzahUITe1xbSUrzR8YbgxQfXGr4+5WfCwcpSFU2
         JjZw==
X-Gm-Message-State: ABy/qLYmEBEP1IGCRX04t0lO+RE5RXyITBxlPfjw6jQ2xEulhUTjl90Z
        gj6TxExN0po7RZNKEhJzXZRebQ==
X-Google-Smtp-Source: APBJJlEO9/nyUU2Mk3sSMr7Vvaf2bfj3p1EarkZ97421u+6v1iwV9IAMGoD65g4ZUgZFVJmxj6miyA==
X-Received: by 2002:a2e:9bc3:0:b0:2b6:fa60:85a1 with SMTP id w3-20020a2e9bc3000000b002b6fa6085a1mr5960940ljj.21.1691001417728;
        Wed, 02 Aug 2023 11:36:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h5-20020a2e3a05000000b002b94b355527sm3682821lja.32.2023.08.02.11.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 11:36:57 -0700 (PDT)
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
Subject: [PATCH v2 2/2] drm/msm/dpu: fix DSC 1.2 enc subblock length
Date:   Wed,  2 Aug 2023 21:36:55 +0300
Message-Id: <20230802183655.4188640-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802183655.4188640-1-dmitry.baryshkov@linaro.org>
References: <20230802183655.4188640-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Both struct dpu_dsc_sub_blks instances declare enc subblock length to be
0x100, while the actual length is 0x9c (last register having offset 0x98).
Reduce subblock length to remove the empty register space from being
dumped.

Fixes: 0d1b10c63346 ("drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
 - Rebased on top of the catalog changes

---

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 3ff07d7cbf4b..f1bac5e88249 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -456,12 +456,12 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
  * DSC sub blocks config
  *************************************************************/
 static const struct dpu_dsc_sub_blks dsc_sblk_0 = {
-	.enc = {.name = "enc", .base = 0x100, .len = 0x100},
+	.enc = {.name = "enc", .base = 0x100, .len = 0x9c},
 	.ctl = {.name = "ctl", .base = 0xF00, .len = 0x10},
 };
 
 static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
-	.enc = {.name = "enc", .base = 0x200, .len = 0x100},
+	.enc = {.name = "enc", .base = 0x200, .len = 0x9c},
 	.ctl = {.name = "ctl", .base = 0xF80, .len = 0x10},
 };
 
-- 
2.39.2

