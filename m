Return-Path: <linux-arm-msm+bounces-2097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E73D7FA239
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 15:16:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11EE6281819
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 14:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D504831598;
	Mon, 27 Nov 2023 14:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0mVI+iDA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D22C3C02
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 06:16:21 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40b3e7f2fd9so17369995e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 06:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701094580; x=1701699380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkxpnfZSZT5EN0UFZSvV8zs0Wwv4/j6hiBpdKDk1HxA=;
        b=0mVI+iDAJgxg6XwiCvCPssrs22QZco0Y19B0HO8OBqq8OdqxNCd9tOFnLG7gwAbscJ
         3ZMT3u7CD6oJZKw0giKA1BLhN9ImGSEPZWOs1t7CLy1rcV/lnkSgJn/HpLrlMKDR8Iim
         XHnBkYlqtG8LHTZ9zjVEFm9A8fvZsdtWshV3FWz7udFhOSS4FjfnE4X8/SKWHFw/sRjN
         BM93c4lYBvKn1QL2XPyNzToB0Fhinrf+I+9M/6BWuxTy+mIuD8AkmgIYN2DQyPRjXbuU
         VVS/8mfHEPa4LdIa9FQcoZz8XzEy8t0d2Zt/Hz8mKjUX+wRZaLVlJLH5bJCkjUexkuUh
         9uMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701094580; x=1701699380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WkxpnfZSZT5EN0UFZSvV8zs0Wwv4/j6hiBpdKDk1HxA=;
        b=nQw3UJeFM+gj3QUPCGvZJTHOoZt983Tc+Uz88V20NrtYDkUKmHywfhiOJxspGF3qBw
         dDGj7c8rdX0DzEyATduz9VvlcBGQEB1ujy1ONzN6uA1yR+I4r3E5288OW11L/dIXPhFG
         idnjCOOlbO4JUb8JPSzxhSHa9vK/lxV4/9GvcBFlZ5J1CiqfYeb8ORmIVy78NmRtlZyx
         02lQkVTj43NeTKCyRIpOzy0MkgFqoqk+rg6GYJev+hpepi5BF9yqFJ7fViVzjVdEPefi
         Su0ibjUzVc3RTATRti7ZB7c4SVj39Tid41/0Q5nd0xqM3DezEsFJ59PN1T5oiwFXpTLX
         XVrw==
X-Gm-Message-State: AOJu0YxQHeFVnwWFezLMMx9HYd8Yk5izTkEmivXby8bxrrScpiazvqoK
	kcaN0Y6uCFIWGE2t/WTvHMyY6A==
X-Google-Smtp-Source: AGHT+IHVgZ20gEmhmev1RX2eoTA9+8mg2/svsRYqUISptDWvOxDB3DOBPlKuaLgRVJ814cwcmx9shQ==
X-Received: by 2002:a05:600c:444b:b0:40a:3e41:7df1 with SMTP id v11-20020a05600c444b00b0040a3e417df1mr8884896wmn.37.1701094578887;
        Mon, 27 Nov 2023 06:16:18 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:bf33:77c7:8131:5e64])
        by smtp.gmail.com with ESMTPSA id be7-20020a05600c1e8700b00405442edc69sm14658830wmb.14.2023.11.27.06.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 06:16:18 -0800 (PST)
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
Subject: [PATCH v6 08/13] firmware: qcom: scm: make qcom_scm_qseecom_app_get_id() use the TZ allocator
Date: Mon, 27 Nov 2023 15:15:55 +0100
Message-Id: <20231127141600.20929-9-brgl@bgdev.pl>
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
instead of manually kmalloc()ing it and then mapping to physical space.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Maximilian Luz <luzmaximilian@gmail.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
---
 drivers/firmware/qcom/qcom_scm.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 11638daa2fe5..3a6cefb4eb2e 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1525,37 +1525,27 @@ int qcom_scm_qseecom_app_get_id(const char *app_name, u32 *app_id)
 	unsigned long app_name_len = strlen(app_name);
 	struct qcom_scm_desc desc = {};
 	struct qcom_scm_qseecom_resp res = {};
-	dma_addr_t name_buf_phys;
-	char *name_buf;
 	int status;
 
 	if (app_name_len >= name_buf_size)
 		return -EINVAL;
 
-	name_buf = kzalloc(name_buf_size, GFP_KERNEL);
+	char *name_buf __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
+							     name_buf_size,
+							     GFP_KERNEL);
 	if (!name_buf)
 		return -ENOMEM;
 
 	memcpy(name_buf, app_name, app_name_len);
 
-	name_buf_phys = dma_map_single(__scm->dev, name_buf, name_buf_size, DMA_TO_DEVICE);
-	status = dma_mapping_error(__scm->dev, name_buf_phys);
-	if (status) {
-		kfree(name_buf);
-		dev_err(__scm->dev, "qseecom: failed to map dma address\n");
-		return status;
-	}
-
 	desc.owner = QSEECOM_TZ_OWNER_QSEE_OS;
 	desc.svc = QSEECOM_TZ_SVC_APP_MGR;
 	desc.cmd = QSEECOM_TZ_CMD_APP_LOOKUP;
 	desc.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_RW, QCOM_SCM_VAL);
-	desc.args[0] = name_buf_phys;
+	desc.args[0] = qcom_tzmem_to_phys(name_buf);
 	desc.args[1] = app_name_len;
 
 	status = qcom_scm_qseecom_call(&desc, &res);
-	dma_unmap_single(__scm->dev, name_buf_phys, name_buf_size, DMA_TO_DEVICE);
-	kfree(name_buf);
 
 	if (status)
 		return status;
-- 
2.40.1


