Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 444A7244344
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Aug 2020 04:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbgHNClU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 22:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbgHNClT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 22:41:19 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C5F8C061757;
        Thu, 13 Aug 2020 19:41:19 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id t6so3705772pjr.0;
        Thu, 13 Aug 2020 19:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FspYJi5b1hDkayAuxe5bJyODfoD6HOjHOWIvusSE/vI=;
        b=nZLLpPvjLe9K005QO2evIQ8MudrrODia0dJqPigpQsSxUTX4bwqLblnKrOB5qIW7vn
         9sIqUs6Q/ygw02YyUpYyn8xZz/+3guIh7kLS0ujNUmebOIrIG5pjB8SUyzYqoZCUV8pX
         ko6jlmysPqCVn13XpZESoEN0axT9C0pNYCz1ga2+lK75vlJV6zfx4p7udN3ZjgoUUjLi
         ZoYzoSWM09knlEWpq2+AhwxqjZe+UKNuoIatnN1LPxVzTNvjm0hY0KJ9S0+IlK++I6wv
         e4/CKnYalLkSZ3vtOPNMK4PtsmfTm5yoSo2QJR1nvcKBffEdtzgtLt6FQhtCmGy7JKhT
         gi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FspYJi5b1hDkayAuxe5bJyODfoD6HOjHOWIvusSE/vI=;
        b=B81FC6fFHdZ2eh2uFiJRhbMNyKTkQHkxlF2M161Wt6gmkiKHur7dY5TktPfgj0Us0Z
         1pu04xOAGnYq0x0CoVyONYYOa07tiklODUxkoSlNCv0hO0FeLEdJoVo9ZVuHA8/P19JS
         cUQLlnJ5ZheHxql3TD9n4lx6trePuH0h5DgIBgijiYfqiA+4YSgtUaZibV2AtH8e8kdT
         jb/rKSQeK764L1QInggeaWc7UBkp2rpxV7A2nFiJTTa6VLyrQv6+ANqNzn1NBfq8fwUX
         483XrJlD9npDYNHkkCJ6cNRgheFaNUNnFOr7CwHqs7Ss/0FLthWXBSQlQhVj/OaB97zU
         VbOg==
X-Gm-Message-State: AOAM532YXpAfVe82ip4o4m+3CECngUa/QSLZJUINoHHgPKIbgMNh9nEm
        6UkoykHSmggQnn2Naw+Puik=
X-Google-Smtp-Source: ABdhPJyApFifBdG/BErKYfSE+ROJky+gOYbvj/dZUwC4BZypLAHrLrDaPxIedf98VwYmNp+xA8NOYg==
X-Received: by 2002:a17:90a:ce97:: with SMTP id g23mr554277pju.216.1597372879026;
        Thu, 13 Aug 2020 19:41:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id il13sm6794205pjb.0.2020.08.13.19.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 19:41:18 -0700 (PDT)
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
        linux-arm-kernel@lists.infradead.org,
        Rob Clark <robdclark@chromium.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 05/19] iommu: add private interface for adreno-smmu
Date:   Thu, 13 Aug 2020 19:41:00 -0700
Message-Id: <20200814024114.1177553-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200810222657.1841322-1-jcrouse@codeaurora.org>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
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

