Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30DE97BE4E5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 17:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376275AbjJIPfI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 11:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377569AbjJIPez (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 11:34:55 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 985F4EA
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 08:34:50 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-307d20548adso4306951f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 08:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696865689; x=1697470489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVGoERFE3fa+HCgKC7RA440wyH71tSjIV08rhDsASMw=;
        b=1e7xGjCqbkT+/PCkaeNS7SbYAY2T52ftdRHssJ2SekcRSTPtO4G2SwpS+KgDLY2u4l
         LhY6wbLSCQMljiD92Cck93uawG/z4mtSyG3sqkrmwBSEraruup3t7uGWVXpC9tb0Kzsy
         HU4bVYwmF8SGABPFHV75Y7fBw1//dGf3V3wuOWV6BzYcl1pwKaT8b3YK1P16ljjElrEg
         Dlxk0LwXXco/Y5nPGb0AIv+sjDbKEBJWKDCYYCoSlgVGRIkqKl9oSJD9a276HnJ7b7p6
         W2AUiKwZspph27aXJSiKoi1eOQ+hwkIwZxgQoSoaVJN8JghA0HQYzvqm+YwHWZSXi1ET
         yGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696865689; x=1697470489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gVGoERFE3fa+HCgKC7RA440wyH71tSjIV08rhDsASMw=;
        b=ePLGTj5ECNzTrgPnAD2snAM8fJhOQCxrYrhaSiMipqHFNuXpbAzamjIbV7xqJ0xuUp
         JTe7Bt1SMpJgnYEmLVPsTtU/qD+krWlV2MDdBYpN1+YRvO+VR/TljzYwTNUUnwdVmF/x
         5IoMTya+YX2oDk8H1CWzMFS5hEbn+AxS7YJYOcqsdGNQ7triha9nY5q4c0U7F5ixwTX0
         QiMleOv7rI5dtNseWHYzBw/NfXxyB4n7bANyEu2AmspdcJfOI/WWtDG2Q4IcSRBPnDys
         SpMVTcc8TUpuy2pr21QhkvAQEhpjbqEiYVMvf4EL7wpnuSsXz+gFq23wzpIV2EpsK0sd
         F1Dw==
X-Gm-Message-State: AOJu0YwFJhNU/R0Ot8fJEVzofIo1bSdfWzXc1wfuzDOJT0eUkMhXOyMJ
        Zgc32kmEbw9H5TNzlNAOyKGxYA==
X-Google-Smtp-Source: AGHT+IGmR2OVbb8Xjr+DkHBylNE3rUpt0NZEh1/jquLYFhGjN/bGj4/O5LQWquHImkG2t/Wp9xDlbw==
X-Received: by 2002:adf:e6ce:0:b0:31f:b7b2:d4e1 with SMTP id y14-20020adfe6ce000000b0031fb7b2d4e1mr13710904wrm.20.1696865688018;
        Mon, 09 Oct 2023 08:34:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f20d:2959:7545:e99f])
        by smtp.gmail.com with ESMTPSA id b3-20020adff243000000b0031431fb40fasm10016521wrp.89.2023.10.09.08.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 08:34:47 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@quicinc.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 07/15] firmware: qcom: scm: make qcom_scm_assign_mem() use the TZ allocator
Date:   Mon,  9 Oct 2023 17:34:19 +0200
Message-Id: <20231009153427.20951-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009153427.20951-1-brgl@bgdev.pl>
References: <20231009153427.20951-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Let's use the new TZ memory allocator to obtain a buffer for this call
instead of using dma_alloc_coherent().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/firmware/qcom/qcom_scm.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 71e98b666391..754f6056b99f 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/arm-smccc.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/cpumask.h>
@@ -998,14 +999,13 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 	struct qcom_scm_mem_map_info *mem_to_map;
 	phys_addr_t mem_to_map_phys;
 	phys_addr_t dest_phys;
-	dma_addr_t ptr_phys;
+	phys_addr_t ptr_phys;
 	size_t mem_to_map_sz;
 	size_t dest_sz;
 	size_t src_sz;
 	size_t ptr_sz;
 	int next_vm;
 	__le32 *src;
-	void *ptr;
 	int ret, i, b;
 	u64 srcvm_bits = *srcvm;
 
@@ -1015,10 +1015,13 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 	ptr_sz = ALIGN(src_sz, SZ_64) + ALIGN(mem_to_map_sz, SZ_64) +
 			ALIGN(dest_sz, SZ_64);
 
-	ptr = dma_alloc_coherent(__scm->dev, ptr_sz, &ptr_phys, GFP_KERNEL);
+	void *ptr __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
+							ptr_sz, GFP_KERNEL);
 	if (!ptr)
 		return -ENOMEM;
 
+	ptr_phys = qcom_tzmem_to_phys(ptr);
+
 	/* Fill source vmid detail */
 	src = ptr;
 	i = 0;
@@ -1047,7 +1050,6 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 
 	ret = __qcom_scm_assign_mem(__scm->dev, mem_to_map_phys, mem_to_map_sz,
 				    ptr_phys, src_sz, dest_phys, dest_sz);
-	dma_free_coherent(__scm->dev, ptr_sz, ptr, ptr_phys);
 	if (ret) {
 		dev_err(__scm->dev,
 			"Assign memory protection call failed %d\n", ret);
-- 
2.39.2

