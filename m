Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B620A2C8136
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 10:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728166AbgK3Jk5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 04:40:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726614AbgK3Jk5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 04:40:57 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F02D2C061A04
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 01:39:52 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id o4so7477623pgj.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 01:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wbIAyBk/aKDm2aOVZ9gMdgrzEY6OUn0PU2J1sb9nIlY=;
        b=Ntfd2QysKsNiw7SqrBvTvDdGgzSjVIu7y4FtGSM0OcrDHO9Xcsq0vxOroC80FJtpqU
         okeSzZ+Hj9N4uzQWiDiI053tXfghJwEWVjbdJLlfV2Uh7GHC6U9Ny0ABL3mhcLfoAvE8
         OA7x0v+wLZJRCljpSTLOvQZXgRugpoWvwM/OZLWgrxTMjNK3EfcEJvqN9Ep9YlDVC3f6
         7gTDZik5ZlnUSXA8HzHTob5rA0fvmWGibxYVAePJRNUEspHGcheYKukHdsrx26nmmgdk
         Z8Lp8hPvl73HDv9JXXbyEqPs9ToupQ62ocQ/rjY6Thxckho1ztApBkIDs/atFSh7P7YG
         47rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wbIAyBk/aKDm2aOVZ9gMdgrzEY6OUn0PU2J1sb9nIlY=;
        b=gj7rg+1Ht7FUYcNpyv3FU1LszjzDacIm8Fub8Yl4tcIWQFAPalnkJ0g4qRK1QC0h0G
         aCgVuuJBYICUnMfAdyK7on0jVv9Yp9MPSBP9Dvdw8+G5bNkUm0j4Kcl7pHFvxMtcW326
         u+Xp9Oy+b2VWqcXzTF+TZJe54dx52p75SmHz9tm8xCl00EXvp8iSgYpd9BTcm568zu1t
         wH7qL9KrnXWBIFFF+tr6NgZBDdt1kKWDKvc6+3Q9+tIGQFg13Pgt/dWFA0zWLGXSzKEc
         CNLfksYiX8XDp4vBNS7IWgp1IcBtusIga2qreOfGBPhoBueyk5bVZ5lcMUadGt5OG8MK
         J7gg==
X-Gm-Message-State: AOAM531V0XPLS5STzKldm9Reg2+dLto0S7d9F8nefq0ir920U4cF6nRa
        jU4sd+Q6v607nQyoDGXiJtVK
X-Google-Smtp-Source: ABdhPJzwcwv1+0LuaTW8h0Jq2Ce0QMV07K2tpjOqW0UQEXLlM29dJjfyEKIhl8QgnbhbBM9sOadAAA==
X-Received: by 2002:a63:b511:: with SMTP id y17mr8379504pge.345.1606729192528;
        Mon, 30 Nov 2020 01:39:52 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6c0d:98b:4016:605b:102d:cbb8])
        by smtp.gmail.com with ESMTPSA id u14sm16348429pfc.87.2020.11.30.01.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 01:39:51 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@linaro.org, saiprakash.ranjan@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 3/4] soc: qcom: llcc-qcom: Extract major hardware version
Date:   Mon, 30 Nov 2020 15:09:23 +0530
Message-Id: <20201130093924.45057-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201130093924.45057-1-manivannan.sadhasivam@linaro.org>
References: <20201130093924.45057-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

The major hardware version of the LLCC IP is encoded in its
LLCC_COMMON_HW_INFO register. Extract the version and cache it in the
driver data so that it can be used to implement version specific
functionality like enabling Write sub cache for given SCID.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
[mani: splitted the version extract as a single patch and few cleanups]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/soc/qcom/llcc-qcom.c       | 12 ++++++++++++
 include/linux/soc/qcom/llcc-qcom.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 16b421608e9c..a559617ea7c0 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -4,6 +4,7 @@
  *
  */
 
+#include <linux/bitfield.h>
 #include <linux/bitmap.h>
 #include <linux/bitops.h>
 #include <linux/device.h>
@@ -35,6 +36,9 @@
 
 #define CACHE_LINE_SIZE_SHIFT         6
 
+#define LLCC_COMMON_HW_INFO           0x00030000
+#define LLCC_MAJOR_VERSION_MASK       GENMASK(31, 24)
+
 #define LLCC_COMMON_STATUS0           0x0003000c
 #define LLCC_LB_CNT_MASK              GENMASK(31, 28)
 #define LLCC_LB_CNT_SHIFT             28
@@ -476,6 +480,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 	const struct qcom_llcc_config *cfg;
 	const struct llcc_slice_config *llcc_cfg;
 	u32 sz;
+	u32 version;
 
 	drv_data = devm_kzalloc(dev, sizeof(*drv_data), GFP_KERNEL);
 	if (!drv_data) {
@@ -496,6 +501,13 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 		goto err;
 	}
 
+	/* Extract major version of the IP */
+	ret = regmap_read(drv_data->bcast_regmap, LLCC_COMMON_HW_INFO, &version);
+	if (ret)
+		goto err;
+
+	drv_data->major_version = FIELD_GET(LLCC_MAJOR_VERSION_MASK, version);
+
 	ret = regmap_read(drv_data->regmap, LLCC_COMMON_STATUS0,
 						&num_banks);
 	if (ret)
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 3db6797ba6ff..d17a3de80510 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -79,6 +79,7 @@ struct llcc_edac_reg_data {
  * @bitmap: Bit map to track the active slice ids
  * @offsets: Pointer to the bank offsets array
  * @ecc_irq: interrupt for llcc cache error detection and reporting
+ * @major_version: Indicates the LLCC major version
  */
 struct llcc_drv_data {
 	struct regmap *regmap;
@@ -91,6 +92,7 @@ struct llcc_drv_data {
 	unsigned long *bitmap;
 	u32 *offsets;
 	int ecc_irq;
+	u32 major_version;
 };
 
 #if IS_ENABLED(CONFIG_QCOM_LLCC)
-- 
2.25.1

