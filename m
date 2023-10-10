Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2EC7BF274
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 07:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442155AbjJJFtZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 01:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442152AbjJJFtZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 01:49:25 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02A0492
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 22:49:24 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c15463ddd4so59301041fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 22:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696916962; x=1697521762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CFbHOAgZVXSg1kKOflBZaq1B31YfZJPkEFEvk9ENnLs=;
        b=Hc4FFnwiu9BEi/kRDVEv4JfVV0hu0K3BJk6KavC46+EzQBuwlUMjVmm8Ry96hQ0U/9
         y+yMDK4vGjZ5NovTfQgdBBNzPvMLfC1/3Htf/kmkJZJjDaLlesuudTpUke1IrZ+aUDhn
         EnHZg0DEAGiwCBjaLHQ6fsghvoVIVhU2Vu5WhUMCJL6ZN9E2KaxdJ6MyZy4fi6buOv/5
         PFE+lNt9rz5J0ofyZ/+T3kmXXTTPqVnYb7By/XCOkJ1Gl6Lr1ms1oly122ehSmGRu22I
         /JhbjqNxtD9snZ/HZrYStP4M+Cf/k8rxwwxJS0H/DKEPGBuoo3FDlVNpIgJJPj4SeVMU
         hXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696916962; x=1697521762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFbHOAgZVXSg1kKOflBZaq1B31YfZJPkEFEvk9ENnLs=;
        b=Es3OVJmElgk0ooMrR83j3bcVG0SwoQDCavhL3QvtnQ5uASvte8oxbYQlxQ52dZ9JWw
         pePZ2TaltcBhFarReCj6eA+IYX9YnIl0rmERPELrJ+uoLg06dmy49+icEwmx4GEnwYU9
         WNZygs1AgtZ8VQ1rZfJ4u19b1lcKNTVYGdpfFeF9UL7tJBWx5LNoCqLp5BFboBvT0+2S
         h1LZJ7XxMMGLr2aqYoG/yce949i/KLXSRPCIJps3CEcnApM8aAxfNLANC4Z48uSdlSBE
         IZ+rJVUV9YGOwLcOViTQrbIg7LtZ8lyHhcscfP7kmeVD2opoGEjUAVc8Nu3CRg6A8g82
         RSHw==
X-Gm-Message-State: AOJu0Yx5ySByWs6Qycb29IacullOuipjE5E7WAU1t5KERhzCoB6G5pdR
        LT1AtYBaeXerxi+c3Lpt58XYhA==
X-Google-Smtp-Source: AGHT+IFJ0hwFexb/Jn2jlVn3hI6Fio1n0bEXN8vdVrCP2YpJpdTs8EeiniK6yetHCXyfssGsOUG1oA==
X-Received: by 2002:a2e:7310:0:b0:2bc:fd50:573a with SMTP id o16-20020a2e7310000000b002bcfd50573amr14953125ljc.6.1696916962099;
        Mon, 09 Oct 2023 22:49:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w22-20020a2e8216000000b002bba9a4f715sm2280398ljg.11.2023.10.09.22.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 22:49:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/msm: fix fault injection support
Date:   Tue, 10 Oct 2023 08:49:20 +0300
Message-Id: <20231010054920.2821140-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Readd the header that was erroneously dropped during KMS code
refactoring.

Fixes: 506efcba3129 ("drm/msm: carve out KMS code from msm_drv.c")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202310100836.6E6zjEcE-lkp@intel.com/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 93c026d79aea..2aae7d107f33 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/dma-mapping.h>
+#include <linux/fault-inject.h>
 #include <linux/of_address.h>
 #include <linux/uaccess.h>
 
-- 
2.39.2

