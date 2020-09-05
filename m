Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4C5225E9F2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Sep 2020 22:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbgIEUEF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Sep 2020 16:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728663AbgIEUEE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Sep 2020 16:04:04 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A024C061244;
        Sat,  5 Sep 2020 13:04:03 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id o16so4757038pjr.2;
        Sat, 05 Sep 2020 13:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tk5zPp0nu93VQrlRpBetxr1lff5xE8i/LH2EjPSUXEI=;
        b=rKBz6zBLD6wh4+Kw+P2n9npH4iZ6q7Knl2dAdBJHy153T/TZhFgFUbSd1LXAjvNn6d
         ZcwDZy830LF/SUEGCBmu3UBaCR+sebLnzSg84yg+1o7QE2jpuXyXr0W4PhRALAZuBzH+
         TbaIZ5bXtQRKY1908g1e8y9wgnGkXNmi6uVejlJr5e+i+UnDWlr0tg72hHnca0j5QP1t
         f6jDGIBJNGB1/yqj7xpz/M7G8rFX4CxrrdZgsPMxbraR3zJZC92QPvY7aRdo2fMzmnEM
         ukYbvRCt6dfbHI3HW7TgN4+Am36tuADwP/ywBRTd8SoRA/rrtaetUcmL44+VKkXIp8D6
         7gsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tk5zPp0nu93VQrlRpBetxr1lff5xE8i/LH2EjPSUXEI=;
        b=M61pSu1arwo/0Rs7b4cEW46LMdg2lkS9vhpftp222bNeicMNVgqzfpsKq18chRh1KH
         DL9nQ/LhCzcVYhTSKox6fF5ySaUFFwH4jkj5EgjVcPuqYYcOAgLRBCNA1gDuaFMSm2cE
         x1VV336phf1OLl+SmwnZgiV6WBglovZ3q1lavGX0G+10Dna+3pJgt1H0pR1JIxVcUUZz
         w36O8AqygSGjOI1DbSYx/tYJnQwfZiR+j1RkS7DRgURwSoEE3cPA7qGBXOshH1ajhcEw
         8JveRKt3+ydj5MIXs8kkRWoG45mWSm1iuaS42/nyVXfTfMrrk8qNf5vUMPuHa3hFc1Ji
         odag==
X-Gm-Message-State: AOAM530DmT5I4JhGLH70GiyvLgKS8A+F3h+E593JDzGno48y2ql+5Apn
        YZWLLFiKa+j+9Zwno/1jVVU=
X-Google-Smtp-Source: ABdhPJy+okIVRnu/tWAphoneYtMf8sSVRn+k3AenryR8jl/FlI5FzFE8AeHMdtRkcD/OF/JXZm8Org==
X-Received: by 2002:a17:90a:ca17:: with SMTP id x23mr12855250pjt.96.1599336243117;
        Sat, 05 Sep 2020 13:04:03 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id 194sm10566437pfy.44.2020.09.05.13.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:04:01 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v17 02/20] drm/msm: Add private interface for adreno-smmu
Date:   Sat,  5 Sep 2020 13:04:08 -0700
Message-Id: <20200905200454.240929-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200905200454.240929-1-robdclark@gmail.com>
References: <20200905200454.240929-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This interface will be used for drm/msm to coordinate with the
qcom_adreno_smmu_impl to enable/disable TTBR0 translation.

Once TTBR0 translation is enabled, the GPU's CP (Command Processor)
will directly switch TTBR0 pgtables (and do the necessary TLB inv)
synchronized to the GPU's operation.  But help from the SMMU driver
is needed to initially bootstrap TTBR0 translation, which cannot be
done from the GPU.

Since this is a very special case, a private interface is used to
avoid adding highly driver specific things to the public iommu
interface.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 include/linux/adreno-smmu-priv.h | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 include/linux/adreno-smmu-priv.h

diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
new file mode 100644
index 000000000000..a889f28afb42
--- /dev/null
+++ b/include/linux/adreno-smmu-priv.h
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 Google, Inc
+ */
+
+#ifndef __ADRENO_SMMU_PRIV_H
+#define __ADRENO_SMMU_PRIV_H
+
+#include <linux/io-pgtable.h>
+
+/**
+ * struct adreno_smmu_priv - private interface between adreno-smmu and GPU
+ *
+ * @cookie:        An opque token provided by adreno-smmu and passed
+ *                 back into the callbacks
+ * @get_ttbr1_cfg: Get the TTBR1 config for the GPUs context-bank
+ * @set_ttbr0_cfg: Set the TTBR0 config for the GPUs context bank.  A
+ *                 NULL config disables TTBR0 translation, otherwise
+ *                 TTBR0 translation is enabled with the specified cfg
+ *
+ * The GPU driver (drm/msm) and adreno-smmu work together for controlling
+ * the GPU's SMMU instance.  This is by necessity, as the GPU is directly
+ * updating the SMMU for context switches, while on the other hand we do
+ * not want to duplicate all of the initial setup logic from arm-smmu.
+ *
+ * This private interface is used for the two drivers to coordinate.  The
+ * cookie and callback functions are populated when the GPU driver attaches
+ * it's domain.
+ */
+struct adreno_smmu_priv {
+    const void *cookie;
+    const struct io_pgtable_cfg *(*get_ttbr1_cfg)(const void *cookie);
+    int (*set_ttbr0_cfg)(const void *cookie, const struct io_pgtable_cfg *cfg);
+};
+
+#endif /* __ADRENO_SMMU_PRIV_H */
\ No newline at end of file
-- 
2.26.2

