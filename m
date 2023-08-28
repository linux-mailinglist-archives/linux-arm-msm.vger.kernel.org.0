Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A45F478B845
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Aug 2023 21:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233096AbjH1T15 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Aug 2023 15:27:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233367AbjH1T1c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Aug 2023 15:27:32 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37469120
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 12:27:12 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-31adc5c899fso3201614f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 12:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693250831; x=1693855631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cFxADGOERyNFN7lTVtP33aE4fUtIdh4yla5Ms0ctiE=;
        b=EoXzrnanHjxRlCVdFNR3jEL/xRmfXMhI4RzAOrNmLf3G2biAWlM7vvmO7zLkPHT4iK
         5Le0KJNfMSWSAwMlhFthLroTME9MfrlZuNQF5utevteIrmy0/Av5ZCo33of6uVD6MzZw
         A1KumZvLrH7LkMecujD0FPIYUstS5WpuDS37Ojb2nzciYE9Xh5rv0wqiVRJgNyR/eYOw
         epjjDQD+dBqlNcb4kQb7Sa60JXJvr7soJSrAuFyOkgWHC0Dit3u6CO0PaVO6+PsJ0nTy
         zKUet+A0wII8xV9lzUXPhMgXlFMm113iHCOpFEQhZhKXxSt/ZxNZqwZ+GN5YszttspJ7
         Ks9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693250831; x=1693855631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5cFxADGOERyNFN7lTVtP33aE4fUtIdh4yla5Ms0ctiE=;
        b=f/VsPp/kESDm8NKNWYq1fU3GZaBAKlnHkocEzu+r+vkhENq9+z8ODABOtAZxsZVWWl
         UvrgNOOHr3QHnubHk+YL69g1s3aPKxxE2iUQdJFJC1J39pe+sA65/a38/JJPwyqzDvDI
         n5ro6PLQoCCBtJ4LGqm3iCiJdwDOyYW1m4+3hTgzw1UNDuwHltKpU/AsxFuKcHeZ65kH
         9VxO5A1o/lmduNN+9/u7Gq+WMbgdAgg0/zAprg+FLzZ1L9UrHZVgiSA9Ep5KSsxg2jSY
         9q1CBa5foWi90FfNbWHwzceM3Yk7/RmIdf+8h/RJXor8Ylcw1UoFFQIWUHCj0IIrJTvb
         xu6Q==
X-Gm-Message-State: AOJu0YxwB4ySw1JOJqP6SJwBLi8qyPbESCwHDRN3Ljss7p7lVYgkPaKI
        PypYUxBlTj5k/7FEOylh+/vzbg==
X-Google-Smtp-Source: AGHT+IFTdl/tQdMkT1arHw9DxZMr0l64zUqWz+qHpOkaOVV+i2xMx+CKkBv3fHfRzh8d+Cw4kcZ+EQ==
X-Received: by 2002:a5d:4d02:0:b0:317:5a9b:fcec with SMTP id z2-20020a5d4d02000000b003175a9bfcecmr19670541wrt.14.1693250830785;
        Mon, 28 Aug 2023 12:27:10 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:8bd:7f16:d368:115f])
        by smtp.gmail.com with ESMTPSA id i20-20020a5d5234000000b003141f96ed36sm11435319wra.0.2023.08.28.12.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 12:27:10 -0700 (PDT)
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 07/11] firmware: qcom-scm: use SHM bridge if available
Date:   Mon, 28 Aug 2023 21:25:03 +0200
Message-Id: <20230828192507.117334-8-bartosz.golaszewski@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230828192507.117334-1-bartosz.golaszewski@linaro.org>
References: <20230828192507.117334-1-bartosz.golaszewski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Allocate the memory for SCM call arguments from the Shared Memory Bridge
if it's available.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/firmware/qcom_scm-smc.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom_scm-smc.c b/drivers/firmware/qcom_scm-smc.c
index 16cf88acfa8e..6045be600c2a 100644
--- a/drivers/firmware/qcom_scm-smc.c
+++ b/drivers/firmware/qcom_scm-smc.c
@@ -11,6 +11,7 @@
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/arm-smccc.h>
 #include <linux/dma-mapping.h>
+#include <linux/firmware/qcom/shm-bridge.h>
 
 #include "qcom_scm.h"
 
@@ -161,6 +162,7 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 				    ARM_SMCCC_SMC_32 : ARM_SMCCC_SMC_64;
 	struct arm_smccc_res smc_res;
 	struct arm_smccc_args smc = {0};
+	bool using_shm_bridge = qcom_scm_shm_bridge_available();
 
 	smc.args[0] = ARM_SMCCC_CALL_VAL(
 		smccc_call_type,
@@ -173,8 +175,12 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 
 	if (unlikely(arglen > SCM_SMC_N_REG_ARGS)) {
 		alloc_len = SCM_SMC_N_EXT_ARGS * sizeof(u64);
-		args_virt = kzalloc(PAGE_ALIGN(alloc_len), flag);
-
+		if (using_shm_bridge)
+			args_virt = qcom_shm_bridge_alloc(NULL,
+							  PAGE_ALIGN(alloc_len),
+							  flag);
+		else
+			args_virt = kzalloc(PAGE_ALIGN(alloc_len), flag);
 		if (!args_virt)
 			return -ENOMEM;
 
@@ -196,7 +202,10 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 					   DMA_TO_DEVICE);
 
 		if (dma_mapping_error(dev, args_phys)) {
-			kfree(args_virt);
+			if (using_shm_bridge)
+				qcom_shm_bridge_free(args_virt);
+			else
+				kfree(args_virt);
 			return -ENOMEM;
 		}
 
@@ -208,7 +217,10 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 
 	if (args_virt) {
 		dma_unmap_single(dev, args_phys, alloc_len, DMA_TO_DEVICE);
-		kfree(args_virt);
+		if (using_shm_bridge)
+			qcom_shm_bridge_free(args_virt);
+		else
+			kfree(args_virt);
 	}
 
 	if (ret)
-- 
2.39.2

