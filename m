Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E079E7CBF2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Oct 2023 11:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234938AbjJQJ2P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Oct 2023 05:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234880AbjJQJ14 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Oct 2023 05:27:56 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E4FA1B4
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 02:27:47 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4054496bde3so53038765e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 02:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697534866; x=1698139666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0o2Y5GCPibQO9YixuexIPFVqiPjEBVLTDTnn6eikhk4=;
        b=pVlfPZAWdA/0llJkCxP6tPUcOpPL/f/q6ltlc3LAA0BFB6zqnPZvf0EyeZNeio8arh
         BmTmHYkFUmB4Q6yd19m9lszDR0G/EyCkiaQwjmOa3gwRbL6KmyaaB2Zu5EbBy5Q2LSBc
         CVxWd+C/EvtkuMC+htJFYhDFEvYZ0N3Zboe6bDxJqiGD/36mZ7XXpwiGD7yyT1/YKLss
         rZ+bIbtIynmksshN3y2TDDNzWbzRfyYJUYkvlTfPtha7whZY6C+WWkNenWYEMD76kO7C
         NQD0x9vKU8RPvvN46zliBaoNNaXB8HItIGHm531YHMUXcftUyeaYJnDJ4nUnILJAd/ZX
         IEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697534866; x=1698139666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0o2Y5GCPibQO9YixuexIPFVqiPjEBVLTDTnn6eikhk4=;
        b=nN9z8X7d1cLT12Ol0uso1tsFuRYW4+6Sip02ygGzW8vPwJqtuGfAHyJaZ38LBg7wxF
         ltMtZJMyh736Pg3Me3vxs2+izIAaCyJ9BaRTEnfLi13d9FjZzDf7ToS0AZblD515ypz+
         44vW1tap+7peW2nd1BoAq4eOYeATE6mxNCwcxQHI4PhReRvcYIn2Gpuy9W/hOBAr4I4l
         GP/jHQnM76M7Fd779F07dknXP430S4jCGh4vBPstIuxHnZf+GgemtHbiXRr+yYTULuoQ
         6VE6C5nkW/jkuHGssOJklYbxvJ9G8aiOvGx179khUDskfTfyQg959qZcxsYN7g7WjuM5
         eCBA==
X-Gm-Message-State: AOJu0YzCJozAyq/VK3Hy+5iayVQqDFGkn40qUo3cqUSBkBK36g6VrHdA
        VXU02q4hrzssgMWjPEuVnPWIXg==
X-Google-Smtp-Source: AGHT+IEb82UUDsUFEpK1dLE73heNgvl9yOEHj0X0vK+TgO3qtXmsTgkkUqDR0xOUuiYuaAQSxF0RpA==
X-Received: by 2002:a05:600c:46d3:b0:405:367d:4656 with SMTP id q19-20020a05600c46d300b00405367d4656mr1218401wmo.29.1697534865828;
        Tue, 17 Oct 2023 02:27:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id j5-20020a05600c1c0500b003fe1c332810sm9460787wms.33.2023.10.17.02.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 02:27:45 -0700 (PDT)
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
Subject: [PATCH v5 07/15] firmware: qcom: scm: make qcom_scm_assign_mem() use the TZ allocator
Date:   Tue, 17 Oct 2023 11:27:24 +0200
Message-Id: <20231017092732.19983-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017092732.19983-1-brgl@bgdev.pl>
References: <20231017092732.19983-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Let's use the new TZ memory allocator to obtain a buffer for this call
instead of using dma_alloc_coherent().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
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

