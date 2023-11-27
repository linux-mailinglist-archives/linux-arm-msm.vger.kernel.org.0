Return-Path: <linux-arm-msm+bounces-2094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2F67FA235
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 15:16:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF55A1C20B9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 14:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC3231598;
	Mon, 27 Nov 2023 14:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GvBE9SKq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1CA53AAD
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 06:16:16 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40b473d3debso5844775e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 06:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701094575; x=1701699375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3T+Nz29XwJpeLbYrWkBbO8epnldil1IzN2t5jt5R90=;
        b=GvBE9SKqUcPnuGOdQZlkYAC1ZAUn/tpT7F7OJLemQS4JUGDrbIn/v1N7mkqRAEdYjE
         h7/uyVjBol8Fk0376m82n7QcMR8rQG+IW0G49LFHSJGh7/KUNQAjC4ZLqqVXarZe3UZ9
         00u9+MqQN0OfU+EjioHi88pS/d+j/7A4BjR+zvRGQ9tKO3WJMexfzpIJyqbtdfc5aAvB
         OsKCGidBeTU3x039YyE8Ah/xS05KNuxtrqK3r57xuay1ynO7QfrLlCD88TjWEPSm1R8F
         v8gV9F+iGxXbDfumLZxWiy2TIg+mgcmieO5byzbVEAGA3VeDAmifIUBggSwZHlV3EJdt
         GlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701094575; x=1701699375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L3T+Nz29XwJpeLbYrWkBbO8epnldil1IzN2t5jt5R90=;
        b=qTey38/xNCDB44sxa7WvlJTvD+bpyLGVMl70ovkLs2WDd0aqyYbvWVmdegW8D6ija6
         01eBy1WKzIo4mVBSkBvkqk1gIc7jM4tPiFH4JMXtgermYDpm1x+2LNFC2BpFYzsQLjbZ
         s5IFxS7kOLdzi5XTqFCPAVJENe7/FH2VmgBnpetms+NBuikmcWUGr0HrCP2o+dotKAeM
         KCbpGBrGpoFNUAeZxfQbYnjeYmUCEXgclC6eJQ1GHKoVqfNbMGZX+W22leqNqu4kn5kl
         Ymp9XWVUt+kBdi2AVOud+AckjrRMtzv6sAWHhoCHWoZZ7vux8fYellV8cJkZ0/lrYSox
         jbgg==
X-Gm-Message-State: AOJu0Yy6QujHyUdR8cDW1IfeiwUcgv5CXPUAPrlaASH1Ws3fmv7lF0ub
	JEvdxYIs6jrZfCx7XzihkLvjqg==
X-Google-Smtp-Source: AGHT+IGDbrSZacz5XAoXrWr2jrhzucPFPAPaLJC8jMRi9edx8SFcwpAsw3B/h6vSvvbTmocJf+BWjw==
X-Received: by 2002:a05:600c:696:b0:405:1c14:9227 with SMTP id a22-20020a05600c069600b004051c149227mr8513070wmn.33.1701094575234;
        Mon, 27 Nov 2023 06:16:15 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:bf33:77c7:8131:5e64])
        by smtp.gmail.com with ESMTPSA id be7-20020a05600c1e8700b00405442edc69sm14658830wmb.14.2023.11.27.06.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 06:16:14 -0800 (PST)
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
Subject: [PATCH v6 05/13] firmware: qcom: scm: make qcom_scm_assign_mem() use the TZ allocator
Date: Mon, 27 Nov 2023 15:15:52 +0100
Message-Id: <20231127141600.20929-6-brgl@bgdev.pl>
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
2.40.1


