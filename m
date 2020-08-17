Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA0072479DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 00:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729585AbgHQWEi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 18:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729291AbgHQWCa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 18:02:30 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F43FC061389;
        Mon, 17 Aug 2020 15:02:30 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id f10so8220415plj.8;
        Mon, 17 Aug 2020 15:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FspYJi5b1hDkayAuxe5bJyODfoD6HOjHOWIvusSE/vI=;
        b=fqbybyBm7z5qHp16UsUH3SOGLylsTrFEsZzyxPJ14MD4pMo7A7oyruGBH/RYNESpDA
         zA49RiuTo8tr6pJHCAdVih9UxTi3DW5cuEPgku2ES3eGQM9+EopWW2qEzLilMwVRxICy
         TsZaF4BKDnSK8sWv9FGM503OLhe6y7vNcuSG3QmOGzR53mxXirF10ITO95xIz1zT1FgE
         RNQ04aKBj+CF6bVv43LJCV355jCDhJWNKOEF6H06BGY2joiysSb4/1U/4ZoQoSabe7Fs
         mVT30wpWeQd5eQHVob+YO+vcbDHB2cE9Ubyfmw5GhvVpxYAq6VITYrXX7gqIuumaWq0a
         xf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FspYJi5b1hDkayAuxe5bJyODfoD6HOjHOWIvusSE/vI=;
        b=TKMlXWkR9W7XhTjikzMkY8MJBjWLAbRasGpar8awD77ySvY6m3VYGsf65Ej3hy7JDU
         RD9fFhnhQr2OBICtnUvaU923sdfYxGFlKuZLIQvQGaIyKEpdcS434lGHKZWlfmE7uDvz
         3SoZwupOD4FcgMXGzEoIGL70OHSbs5JEaL02v+eFzvVxrcTB5k+a9iiF3lXDFvzSpIQn
         +EKC6zqnNEghepvYAk9mE2+5lGI118OuKZ+duFrR7v7h/cZVJiLT/n6VxHhPn6NAs3Zv
         aO5OYjUX2BytEbnh/ten+hTLoQxZSn5gMeCo9CUffHVDitNP7TMmY3p1UaXyIHx0bjsS
         OWtw==
X-Gm-Message-State: AOAM533hXja6zjI8G4KkEmVcgePMLcN0cMNFBtXDJ0yYmk3SbY+dLcjm
        LQlbhA/lU1k1f+DZlbvGSX0=
X-Google-Smtp-Source: ABdhPJzb87wot0OJq3pKRI1lcGXVEJD9eArYIfi7vaTspllxzoTevR0H/Rhizmew9avqzmLEP2cUHg==
X-Received: by 2002:a17:902:4b:: with SMTP id 69mr13118700pla.245.1597701749719;
        Mon, 17 Aug 2020 15:02:29 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id r7sm21658693pfl.186.2020.08.17.15.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 15:02:28 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robdclark@chromium.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 05/20] iommu: add private interface for adreno-smmu
Date:   Mon, 17 Aug 2020 15:01:30 -0700
Message-Id: <20200817220238.603465-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817220238.603465-1-robdclark@gmail.com>
References: <20200817220238.603465-1-robdclark@gmail.com>
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

