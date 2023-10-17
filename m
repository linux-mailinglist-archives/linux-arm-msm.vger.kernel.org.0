Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFFE7CBF2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Oct 2023 11:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343667AbjJQJ2P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Oct 2023 05:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234896AbjJQJ15 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Oct 2023 05:27:57 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AECABF5
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 02:27:48 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c509f2c46cso49492651fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 02:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697534867; x=1698139667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmRpGDfzfzXXUGH1yNyuFJTa/GMKsCk+U3u4Li62P+I=;
        b=Rw8eGoyFj/tzikqWeKTEXHtKUPdxZAbP1ZAATVdF8zmFJhdpwgKxB1pn5Zf1Dl7SS6
         7x1qeFlkDFRtss5ZJNHYiPQEUPbGUwz7MBTXtvEdF3tecBXJCthGpyZhTCg6lWrQsxIw
         CFfdLQvFZcd8T+dlj0NEvNqY7hZnm8iJgy6ELWO6W9ja2ZXpkOMoYmqIzJ7qncpJ8tNX
         3Gf5BnRED4dBqbJo3LJSXgTL0l8y4MMdZbBd2atK8KbLnaBDPjAlwgwHjVXjeN4d61Yc
         ZJtqSHSe8FzJSFr0iIj1gXB3xM29+aklk8ee8IG4N8pYo+5ZmBdtJ9J1taSJl1So1vqK
         GpPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697534867; x=1698139667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmRpGDfzfzXXUGH1yNyuFJTa/GMKsCk+U3u4Li62P+I=;
        b=DebK63Si1VqRPmF9cZXOzIv03TKA9ePtdDdWP9JxYN5CMx9ZnzKhbrmH7mr5vVXSV+
         /EZNH3nMgQERqFdYGaI1rLoozRzeM8BCQfrdNR6BizPu8xR4PxUI7EiGKHAKhvxbmbm/
         gQYB0Yo97pTkkRLGI8N03BhgCrIw4r9Frcd5eaHNzRE3GF0O0zp1FnMI+Hw/FfZ3+/Ho
         2QxKN6glgX5QnozpM0deVEXexptDeas+7g2hNM1FYCO0+GrOtxd8jUF6N7UsbeeRCG4n
         lYRvDXK2rzMtBIf54GVcvWl+JvvjZOr2XQxBr4ZugsWiiV5li2glv2sBNw4/J4c7vyyh
         7TfQ==
X-Gm-Message-State: AOJu0YyU2sbyyo3jjk74ZHbEHpj8eR0s9p5BSXZBfbv4BG5qK8GRWmb5
        nbyo3fzq9gTUQsvfskKpNtErPA==
X-Google-Smtp-Source: AGHT+IGBLq9c9rOXe1PcYXocYq4MKiwHQFSxbse8vbPHLvRroReBdaWXNZiCK0tx5duzH5CWmJSC2g==
X-Received: by 2002:a2e:87d3:0:b0:2c4:fe14:a85 with SMTP id v19-20020a2e87d3000000b002c4fe140a85mr1398513ljj.18.1697534866969;
        Tue, 17 Oct 2023 02:27:46 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id j5-20020a05600c1c0500b003fe1c332810sm9460787wms.33.2023.10.17.02.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 02:27:46 -0700 (PDT)
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
Subject: [PATCH v5 08/15] firmware: qcom: scm: make qcom_scm_ice_set_key() use the TZ allocator
Date:   Tue, 17 Oct 2023 11:27:25 +0200
Message-Id: <20231017092732.19983-9-brgl@bgdev.pl>
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
 drivers/firmware/qcom/qcom_scm.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 754f6056b99f..31071a714cf1 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1197,32 +1197,21 @@ int qcom_scm_ice_set_key(u32 index, const u8 *key, u32 key_size,
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
+	void *keybuf __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
+							   key_size,
+							   GFP_KERNEL);
 	if (!keybuf)
 		return -ENOMEM;
 	memcpy(keybuf, key, key_size);
-	desc.args[1] = key_phys;
+	desc.args[1] = qcom_tzmem_to_phys(keybuf);
 
 	ret = qcom_scm_call(__scm->dev, &desc, NULL);
 
 	memzero_explicit(keybuf, key_size);
 
-	dma_free_coherent(__scm->dev, key_size, keybuf, key_phys);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_ice_set_key);
-- 
2.39.2

