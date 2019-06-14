Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FFF746A76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 22:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727525AbfFNUhV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jun 2019 16:37:21 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42978 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727032AbfFNUhU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jun 2019 16:37:20 -0400
Received: by mail-pf1-f194.google.com with SMTP id q10so2086795pff.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2019 13:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A+t0h4nVblVvZYulUBGn9aN/xZy5FOwJcbo8LMPh4qQ=;
        b=dBlquXhPjgGgLvr7m4AgCAuAPPcUJUHxskD4pnuikxR7pXr7hUJfCLa9ImBlrh+a/A
         85yxyyeDjFl05BHs5z9eNQqBNs1L4Fv+ctswWOsZOMoj//qEqVrKrAM+POANyKqn2UQQ
         9vNgzMGXylqJ5dSFM97EcpL/sJq4aIzApJ/zA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A+t0h4nVblVvZYulUBGn9aN/xZy5FOwJcbo8LMPh4qQ=;
        b=o1vXJjV1D5P6St668KhalZRG+yzPMqoWPXMtxK0EUPQf/ofxF4BdVq3RBkC5KcXvPk
         2mwF8XTvOALHyaO0x28v9s+MGN8z9os8k9d3b86twZFJpV46eUrWx1pZY2xlhIUYWwDD
         S94+vJU587jCCzYIV/joBVuEHkCbBPwB2cZFv+b7rALlM197aRjSo4eHNRfspoF3Hoia
         iWL3Zb/fPD529uPYf0cSqxtiJB69B0+xKML/rqzSiOpPOG9ujvDXMCz5e+Of0i06ip6O
         2O2ZpmS32R3bFCLMij98j2HF8OH/IzYsJPBuo1+Jn6sWw9qtZOHx5OY/SwcZNgADKDTN
         AfNg==
X-Gm-Message-State: APjAAAVsq/enFgDtTV3C89dwPxchBcj9Qlu8TxCL/eCQY6lnnzzdFcMj
        nlPqtDxqW663gV4bVSYymOgQsQ==
X-Google-Smtp-Source: APXvYqwiXfjpuAggV25+7Xk3+IrXycT32y/V7hOuLWra++ebdAXpx24dHgMCsaR6GqV4FUtSjU7zDQ==
X-Received: by 2002:aa7:8143:: with SMTP id d3mr98294624pfn.143.1560544640065;
        Fri, 14 Jun 2019 13:37:20 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x5sm3673187pjp.21.2019.06.14.13.37.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 13:37:19 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Dan Williams <dan.j.williams@intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/5] reserved_mem: Add a devm_memremap_reserved_mem() API
Date:   Fri, 14 Jun 2019 13:37:13 -0700
Message-Id: <20190614203717.75479-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190614203717.75479-1-swboyd@chromium.org>
References: <20190614203717.75479-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We have a few drivers that need to get a reserved memory region, request
the region, and map the reserved memory with memremap(). Add an API to
do this all in one function call.

Cc: Evan Green <evgreen@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/of/of_reserved_mem.c    | 45 +++++++++++++++++++++++++++++++++
 include/linux/of_reserved_mem.h |  6 +++++
 2 files changed, 51 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 89e190e94af7..bff932a3b80a 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -12,6 +12,7 @@
 #define pr_fmt(fmt)	"OF: reserved mem: " fmt
 
 #include <linux/err.h>
+#include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/of_platform.h>
@@ -407,3 +408,47 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(of_reserved_mem_lookup);
+
+/**
+ * devm_memremap_reserved_mem() - acquire reserved_mem from a device node,
+ *                                request and memremap it
+ * @dev: device with node pointer of the desired reserved-memory region
+ * @flags: flags to pass to memremap()
+ *
+ * This function allows drivers to acquire a reference to the reserved_mem
+ * struct based on the device's device_node handle, request it and then
+ * memremap() it.
+ *
+ * Returns: A remapped reserved memory region, or an error pointer on failure.
+ */
+void *devm_memremap_reserved_mem(struct device *dev, unsigned long flags)
+{
+	void *dest_ptr;
+	struct reserved_mem *rmem;
+	struct resource *res;
+	const char *name;
+
+	rmem = of_reserved_mem_lookup(dev->of_node);
+	if (!rmem) {
+		dev_err(dev, "failed to acquire memory region\n");
+		return ERR_PTR(-ENODEV);
+	}
+
+	name = rmem->name ? : dev_name(dev);
+
+	res = devm_request_mem_region(dev, rmem->base, rmem->size, name);
+	if (!res) {
+		dev_err(dev, "can't request region for reserved memory\n");
+		return ERR_PTR(-EBUSY);
+	}
+
+	dest_ptr = devm_memremap(dev, rmem->base, rmem->size, flags);
+	if (!dest_ptr) {
+		dev_err(dev, "memremap failed for reserved memory\n");
+		devm_release_mem_region(dev, rmem->base, rmem->size);
+		dest_ptr = ERR_PTR(-ENOMEM);
+	}
+
+	return dest_ptr;
+}
+EXPORT_SYMBOL_GPL(devm_memremap_reserved_mem);
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index 60f541912ccf..a36be60ef67c 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -39,6 +39,7 @@ void fdt_init_reserved_mem(void);
 void fdt_reserved_mem_save_node(unsigned long node, const char *uname,
 			       phys_addr_t base, phys_addr_t size);
 struct reserved_mem *of_reserved_mem_lookup(struct device_node *np);
+void *devm_memremap_reserved_mem(struct device *dev, unsigned long flags);
 #else
 static inline int of_reserved_mem_device_init_by_idx(struct device *dev,
 					struct device_node *np, int idx)
@@ -54,6 +55,11 @@ static inline struct reserved_mem *of_reserved_mem_lookup(struct device_node *np
 {
 	return NULL;
 }
+static inline void *devm_memremap_reserved_mem(struct device *dev,
+					       unsigned long flags)
+{
+	return NULL;
+}
 #endif
 
 /**
-- 
Sent by a computer through tubes

