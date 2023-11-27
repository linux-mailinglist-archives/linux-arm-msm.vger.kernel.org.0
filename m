Return-Path: <linux-arm-msm+bounces-2095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DE97FA237
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 15:16:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B88BF28178F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 14:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C038431580;
	Mon, 27 Nov 2023 14:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="y4xuImJp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BED893ABA
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 06:16:18 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40b397793aaso17962565e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 06:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701094577; x=1701699377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xqz1VK0mYS8f9CyDoxvSzBDgulCTNu27LF81cKbiT0w=;
        b=y4xuImJpJ6PaKSjRu3VTEEe9+KH8llXFw7JPaHkmzS1VbhGuj6yuPERbeD1owNcQ+m
         Fv68haC3A0zjQMPfVGLLJeZ5NIBuUyXf6CYlIG7QymD1O9wQ6ckvtA9L43kUr92/Ts8K
         jHgKmxaD5Lz54T1L0MfkKbocMc42BFuD6uUf7h4u8FnKP60twsDovOIuSK+XnT+NfrU0
         Qxuux97N19k4C6JiJi8OTBWGUIT+KoJrsypORvXWYMcBQ9v54KvAG3h6XXhN6Ip300kk
         Ng3SNKCffTLEQXlAU8AEEkBFnciA0Cw3t1fIg4uo8+6E5qrbdu8Uu/2/yKbBb32pgV7H
         GU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701094577; x=1701699377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xqz1VK0mYS8f9CyDoxvSzBDgulCTNu27LF81cKbiT0w=;
        b=i3PflklE9oNyuzwbeuri0B0LQYipdWqwlJxlN400+vquu+1m3TS/8EfSR4tztUhVtQ
         eDqwF8fFFJItyst0Pa4aljwzyx40v9coIlUGWPVV8WhCEAjJpLk6HAAaujza03u2pR3j
         WbpZgeHDz4xJHLnlyHyqHFawWB7SCpEhmNi2vY4RSzpYFLGxOpPkIQywEkpygpUYcB5a
         KRQVApmhc41Rt+PZVwwqQYpGaC21nxjYobvz6cUFJTcx6ZGBT1+gqrx8XNrR4Dc/LAKa
         ZZXQshhZLmaNNiOlXWdJPzE6hxP7IXvhQLU6z9JDv7VvMc3jGxRsJhhGHsokruWh9ssw
         9jVQ==
X-Gm-Message-State: AOJu0Yy0sErRVR//vMJjCzwBmLLj/WFzMemr55KWizECYqCiLcXq3Q5H
	xSRtu/VmO0A6qRr9mIoK1dSBhA==
X-Google-Smtp-Source: AGHT+IHMn0wWKy0PNcRLMmHMGiQMxo3AwVXygRjIyzuZuJGMIUuaMDA6AO6HM2buOAcnfZO9zniPxg==
X-Received: by 2002:a05:600c:4f12:b0:409:6e0e:e95a with SMTP id l18-20020a05600c4f1200b004096e0ee95amr9379119wmq.19.1701094576249;
        Mon, 27 Nov 2023 06:16:16 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:bf33:77c7:8131:5e64])
        by smtp.gmail.com with ESMTPSA id be7-20020a05600c1e8700b00405442edc69sm14658830wmb.14.2023.11.27.06.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 06:16:15 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Guru Das Srinagesh <quic_gurus@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v6 06/13] firmware: qcom: scm: make qcom_scm_ice_set_key() use the TZ allocator
Date: Mon, 27 Nov 2023 15:15:53 +0100
Message-Id: <20231127141600.20929-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231127141600.20929-1-brgl@bgdev.pl>
References: <20231127141600.20929-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
2.40.1


