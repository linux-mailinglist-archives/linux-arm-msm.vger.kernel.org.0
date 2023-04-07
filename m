Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 343C06DA6CA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Apr 2023 03:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232409AbjDGBHq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Apr 2023 21:07:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231424AbjDGBHp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Apr 2023 21:07:45 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D50983F2
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Apr 2023 18:07:44 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id k18so4153299lfb.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Apr 2023 18:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680829662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w3a+69adOgPkxQyocC5BiinFT3JB1Qibigr0rq2G96c=;
        b=fIDZZ9v6947E0Q3J9sMM+dt8UO0ih+0RZNY8hHqTLr3H89mj4ZBLmEeN122vSa7uEc
         hAl1okX51h9tEX9GsdffWfTPjjTUnnmFRCepSggoM2GfdqABoaovIMGZIXcPbl+mHV0s
         C96a2n9avrnVw7QAZRRA04zcWZdH5qZL/+dc26EvISAZjzLfM7Jt8mmDAdpLZOrhe23i
         kTfskEd707+LTSqKZvWv1PFKBivt2aw21tUyFoevs4UXqUx01WagCpqZQSHr8y6TxOP1
         CKpuYnuEA1p118HFF1e7ZTR801HZNvxEUVx0WL030Ac7ppVEyYql71vvEb0JK0uD+plO
         xUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680829662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w3a+69adOgPkxQyocC5BiinFT3JB1Qibigr0rq2G96c=;
        b=2nGgXnLlWxKipMz2N/obSfNPcJQA2JRbe4a2/3d8/1hXRsNvzoAYmHXtM84JTxPpbq
         3cw+22A6a7Pl2SHgBn5PvB7KxZI3/o/bRAzX6xymQzPz1sjtm8mvdzKKHam52FLUxyhg
         /bzlPRCM8dcUCeBA2UvIfbjy7mynOiiwJfqTJ5fMhfcl523nwu5DdJHHoaT6jyLm2fCH
         cEL/W7V9UZEBNI5+fD+aE9x0H5g8P5u/ZbM/SU/gKt6RKE6d4VRnoP9MpjsMpIJltzJC
         QTSzG8Pg4IT4FqjfLjuYeOwa3pnTXSRrkiSXNyoegXxFEr8bRTPvTm7sbJUppV5FceLR
         Xslw==
X-Gm-Message-State: AAQBX9ctKZb0rfaabOuz503Sg8cD3GoHdfUYIWFdlgA7t+OIE51QsaBo
        5xXi/kH0eCzf80QTGAhjN/tRgg==
X-Google-Smtp-Source: AKy350Yoc10BEw0s6ojqNkBbVfQx5NeF7Cm9mBc3P0WyYr2s8+wfKC/vHgJbGCbbP8b3cjqsLqvV3A==
X-Received: by 2002:ac2:55a3:0:b0:4ea:f7aa:e778 with SMTP id y3-20020ac255a3000000b004eaf7aae778mr67466lfg.24.1680829662449;
        Thu, 06 Apr 2023 18:07:42 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w20-20020ac24434000000b004cb14fa604csm475800lfl.262.2023.04.06.18.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 18:07:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/msm/adreno: fix sparse warnings in a6xx code
Date:   Fri,  7 Apr 2023 04:07:41 +0300
Message-Id: <20230407010741.2033800-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sparse reports plenty of warnings against the a6xx code because of
a6xx_gmu::mmio and a6xx_gmu::rscc members. For some reason they were
defined as __iomem pointers rather than pointers to __iomem memory.
Correct the __iomem attribute.

Fixes: 02ef80c54e7c ("drm/msm/a6xx: update pdc/rscc GMU registers for A640/A650")
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202304070550.NrbhJCvP-lkp@intel.com/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 0bc3eb443fec..84d345af126f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -51,8 +51,8 @@ struct a6xx_gmu {
 
 	struct msm_gem_address_space *aspace;
 
-	void * __iomem mmio;
-	void * __iomem rscc;
+	void __iomem * mmio;
+	void __iomem * rscc;
 
 	int hfi_irq;
 	int gmu_irq;
-- 
2.39.2

