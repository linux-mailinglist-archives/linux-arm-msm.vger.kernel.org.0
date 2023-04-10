Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA8AC6DCD95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 00:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbjDJWkj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Apr 2023 18:40:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbjDJWki (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Apr 2023 18:40:38 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8493F1BCC
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 15:40:37 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id bx15so4692741ljb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 15:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681166436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ExpMxaiAsYSC/kxMJmZJo/lYKKpscHCMufENOoO0Jss=;
        b=LQtBg78Rc3RIjK/NZdxj45la/WmU3KKsbqGoThwHmVhqr3sy6wHRVnWkYRDTAvL1gj
         A2QPJYb0iISeYpolqz32lfMnFZD/beoqQMmWmbFbG7qE2qZCv+23MhSJwlY3i3nkd+FW
         JW7nTn8cza7x6vw/Rw8fOH/gM97LocbXHoy91RAP7ewNzl7zhNHjIupJbPT3yhi6jwbc
         jQjCtBOZ7GK4ODk6HkE1XaL27zXdUCOA4T0iI5sCn1hXsWa0SvbpPg6glS7ou/9QTrHR
         YW32M0rBskdbBsueG1Ba+I6KTSG1jJaFNxErCLgEvFOjO2KSn9OoBmkTcJQ6YAvJ4Oa/
         yXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681166436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExpMxaiAsYSC/kxMJmZJo/lYKKpscHCMufENOoO0Jss=;
        b=hmXPi5uUsImsswj113NNMgPt4nrziPgegxFCMsAjiqklMhuEKTTF/kDidjIDP0WGiR
         9/RCFXsUH/0DeexQFXjccKNIcLfa7TxdcWTnJfgziIn2CDuCX/YQAdW3pdz1O+zpPo7n
         3JNojVQ/H1nXXzM7wDWZQRbWj3IomBMpT3CNlKuhlwswoS0UY4KD9jb/uaH9tLItpJE+
         gX0NXBSLqjzJN+6IgVHfgOLFIdqU78L2lAud5BItAhFQFY+y/L78yh3F5dYQ3v6ISrj+
         bFY86sAva34APRs1Ug8jPsuYKJLo0sNiFnHH8Ioa9ItsaeOoeLqD9eNh4X4qc9XjalOq
         EvGQ==
X-Gm-Message-State: AAQBX9fixkzRt37ihwxfScRg7y7/kJo94isw8su0MJpbnFOJJJvpBZLl
        yk9aKskQ5Z6JTWYjRc9avAZZKg==
X-Google-Smtp-Source: AKy350aZM/Dm9IAVjkzrpnrNGKkAnyaxL3kEvMMKkv5S1Zqvl3B8sQgi0Z5WHmQ0jjUxAcOa5vxccg==
X-Received: by 2002:a2e:9d08:0:b0:29a:1f7d:38b1 with SMTP id t8-20020a2e9d08000000b0029a1f7d38b1mr3633969lji.28.1681166435783;
        Mon, 10 Apr 2023 15:40:35 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y4-20020a2e95c4000000b002a77e01c3a0sm518102ljh.23.2023.04.10.15.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 15:40:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
        Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH v2] drm/msm/adreno: fix sparse warnings in a6xx code
Date:   Tue, 11 Apr 2023 01:40:34 +0300
Message-Id: <20230410224034.443210-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1: removed whispace after the star (Stephen)

---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 0bc3eb443fec..4759a8ce51e4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -51,8 +51,8 @@ struct a6xx_gmu {
 
 	struct msm_gem_address_space *aspace;
 
-	void * __iomem mmio;
-	void * __iomem rscc;
+	void __iomem *mmio;
+	void __iomem *rscc;
 
 	int hfi_irq;
 	int gmu_irq;
-- 
2.30.2

