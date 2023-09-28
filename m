Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84EDD7B171E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 11:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbjI1JVV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 05:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231620AbjI1JVM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 05:21:12 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA45819E
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 02:21:06 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3231d67aff2so9067065f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 02:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695892865; x=1696497665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZW43V/v3JWndTZOC7qgio7lrKv8+8C3I99C3oqf4j4=;
        b=aPvgkqbsvfVwIlxZ5kifPEF6X1I6p/Ui9LLR1DB0nUyIlD6CVGUI1GzbWmV3GYOQ2i
         z0iY41FSlTPuDhyzTOit1BDfZ6cQRNe9/71fYVQLO6ehGP+NIxxPeEfVzF+xGcT2BDvJ
         XScbx0+yazklQ3oAzmpQrZzGq8zY8GbjKNAxaLnP8D38xt9/mOvWxOgcSK8Fj6c4gGX5
         hwFfPQjCdWpew9HnghopB9QpPCXwNkbjjfb5nXtP5UhT8YHoFZXgsWcbkV0CiG4DGAsl
         tVNpe0FCNZeQi/x9hNjRzL7EBaqlBT4oCJP76OX26Udcax/ExwHlxUZBY/WH+x2N4vwm
         rnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695892865; x=1696497665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZW43V/v3JWndTZOC7qgio7lrKv8+8C3I99C3oqf4j4=;
        b=cU096fwim/wu5ro4sHx5OGX6b36QWfNcPytsQMYuX8hMqmq1OA8o07Kivt3sYRSKkE
         VVbYglMRbNphetQqt/aX3y2Po1CbIXdHqbGGgUt3ewOGMX75aJrrJ8Vv9sMzpW3RVkCF
         FASTsnZUaunah4CzpV5BZQMZBa8lQ81L5lwJzuNCTAQ6/Rd/O0/c+6ijHpn54RSYlFGg
         ZxPMorn2B3LjRs8U/Zhr5MX2ShTHzAFifQu77G9oxwiGDY0L2ZtU7NO84wVlPGUemvYz
         fBkpd7xLx4Q5oGHl5bGLh7vq/Fm1QXJvjbbAT3wPf3juwXgNtpj1IiysitBqIYhj3KrU
         scmQ==
X-Gm-Message-State: AOJu0Yyty+hG+3y9u4/5jRdwoCGSViNMURzTuul9/0eehxJcRXSbF9Pz
        MgdQe64tHdKy3UQCRWAVPIveJA==
X-Google-Smtp-Source: AGHT+IGU8fq0UfbdbTwUDInx0JxJRpcIfEfLXVz++58oYsMwLcj0wCKrGqT2OMwI2QS2w+e8UDnaBA==
X-Received: by 2002:adf:e912:0:b0:31a:d8c0:cb8b with SMTP id f18-20020adfe912000000b0031ad8c0cb8bmr517938wrm.25.1695892865407;
        Thu, 28 Sep 2023 02:21:05 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6e4c:e3c1:5cb8:b60e])
        by smtp.gmail.com with ESMTPSA id e9-20020adfe7c9000000b003197efd1e7bsm5009156wrn.114.2023.09.28.02.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 02:21:04 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel@quicinc.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 05/11] firmware: qcom: scm: make qcom_scm_ice_set_key() use the SCM allocator
Date:   Thu, 28 Sep 2023 11:20:34 +0200
Message-Id: <20230928092040.9420-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928092040.9420-1-brgl@bgdev.pl>
References: <20230928092040.9420-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Let's use the new SCM memory allocator to obtain a buffer for this call
instead of using dma_alloc_coherent().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/firmware/qcom/qcom_scm.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 0c532e794b92..02a773ba1383 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1178,32 +1178,20 @@ int qcom_scm_ice_set_key(u32 index, const u8 *key, u32 key_size,
 		.args[4] = data_unit_size,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	void *keybuf;
-	dma_addr_t key_phys;
+
 	int ret;
 
-	/*
-	 * 'key' may point to vmalloc()'ed memory, but we need to pass a
-	 * physical address that's been properly flushed.  The sanctioned way to
-	 * do this is by using the DMA API.  But as is best practice for crypto
-	 * keys, we also must wipe the key after use.  This makes kmemdup() +
-	 * dma_map_single() not clearly correct, since the DMA API can use
-	 * bounce buffers.  Instead, just use dma_alloc_coherent().  Programming
-	 * keys is normally rare and thus not performance-critical.
-	 */
-
-	keybuf = dma_alloc_coherent(__scm->dev, key_size, &key_phys,
-				    GFP_KERNEL);
+	void *keybuf __free(qcom_scm_mem) = qcom_scm_mem_alloc(key_size,
+							       GFP_KERNEL);
 	if (!keybuf)
 		return -ENOMEM;
 	memcpy(keybuf, key, key_size);
-	desc.args[1] = key_phys;
+	desc.args[1] = qcom_scm_mem_to_phys(keybuf);
 
 	ret = qcom_scm_call(__scm->dev, &desc, NULL);
 
 	memzero_explicit(keybuf, key_size);
 
-	dma_free_coherent(__scm->dev, key_size, keybuf, key_phys);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_ice_set_key);
-- 
2.39.2

