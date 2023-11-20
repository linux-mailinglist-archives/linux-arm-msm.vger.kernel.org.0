Return-Path: <linux-arm-msm+bounces-1144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3DE7F143D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 14:21:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4569C1F2441F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 13:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BBA41B272;
	Mon, 20 Nov 2023 13:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Po3/Amb7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05938139
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 05:21:31 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4083f61312eso17949255e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 05:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700486489; x=1701091289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xqz1VK0mYS8f9CyDoxvSzBDgulCTNu27LF81cKbiT0w=;
        b=Po3/Amb7v1NdnzU3tMQLlJeY7SmhfqjZ2Z+Omz2Bc0vfT1dNdthmh3earOgDyeupn7
         n55oIsO8+cy90Bo8aCDtNMUqBtkf8nzI6R99ZUATe1s10MjMJpt7uhtgSK8u9qrgvW6N
         2Jy9ZjHKj3inwTHS+2qSNlE1qbrv8NpOsl4jDpDzSs5fn5aoOcGuDhrwIux5XX6t6hWB
         nvHeRSS4QAjnwgWEVkD/vWOMYDHM9+UJBnc/Vh/lc4OpgenhOfdifere5CeIcrJhGj5m
         ENGVfSODVTpozEp0uAclpwGjxgBRvoLMlHP+ELoboQ6IOEZeDXZ07B9emTfaNt4udKkF
         1hUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700486489; x=1701091289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xqz1VK0mYS8f9CyDoxvSzBDgulCTNu27LF81cKbiT0w=;
        b=mbMKQWuf4xdqgCWeOPilAOk/d3Huc4JQN2+8gx7sn3fULWgGtIRhoj8oE+Z1YR71MN
         NEGW3AL2e0WTtbTGpdxty1vLav74kowvq27h01H7Cry59MDMEUORRgpFztX0k/G1hmuR
         UppXNmizOxBR1gLx47hZuSqWs/B7uHabVe7pSvkgbJvuBidaWbqKdc8ORpAffCFyT+mf
         hH9ECTw+7jgB/NwjkIYvKlvNS64iNdgA+c2+emLG8r/lYuGgRoqvC7RqEPamwEGurve9
         DksT9BfXGpegW4jb51jtPiEdIBjKQiDWYd37BwUMCM+agBGTMXiRPg3emP1sJwYoUxBd
         F1og==
X-Gm-Message-State: AOJu0Yy/c60FdI1Chczky+05TikXr++QuvEQkitZoW54Q6Zd/TmPooZM
	LstyHDKc1N4xzc5J8PTQXIKJRg==
X-Google-Smtp-Source: AGHT+IEHJG2PWRT7hWRMJXRn4DOeHbhS3nW6N5WgPprhwMyamnDq4Sm6+2fVU7uQp0iok0njT7QtbA==
X-Received: by 2002:a05:600c:1994:b0:405:40ec:415d with SMTP id t20-20020a05600c199400b0040540ec415dmr6097795wmq.39.1700486489266;
        Mon, 20 Nov 2023 05:21:29 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:c590:a7ce:883:eba3])
        by smtp.gmail.com with ESMTPSA id k18-20020a05600c0b5200b004065e235417sm17329192wmr.21.2023.11.20.05.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 05:21:28 -0800 (PST)
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
Subject: [RESEND PATCH v5 05/12] firmware: qcom: scm: make qcom_scm_ice_set_key() use the TZ allocator
Date: Mon, 20 Nov 2023 14:21:11 +0100
Message-Id: <20231120132118.30473-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231120132118.30473-1-brgl@bgdev.pl>
References: <20231120132118.30473-1-brgl@bgdev.pl>
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


