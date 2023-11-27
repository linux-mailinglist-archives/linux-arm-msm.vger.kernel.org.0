Return-Path: <linux-arm-msm+bounces-2101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2858F7FA241
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 15:16:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5C8A281834
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 14:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23BB531580;
	Mon, 27 Nov 2023 14:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Yc1JaowH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69DA43C18
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 06:16:25 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c8879a1570so54536171fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 06:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701094583; x=1701699383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mi8eKf9Bk+MHBCMvhATqbV/lq6r88mkgwcH/G87faK0=;
        b=Yc1JaowH8yN3IYwp7jKq8C9mK4qs7w1oYBKTLVeO9TYqjHDZLuoQyxY1lCGY/KMy9F
         CXrFs2YH/4+tGz8vS6DQXCIGCnjHAYjYPmOWAjydRLjVXvEOZzGGtb0jbnZN8yveWW+y
         8Crct/s5hMIaLyWt+ofoTwjNQ60H7MqXrx1xwNzUDLT/O7tTL/BCZRyP8APkewjaCeEE
         CTcffaIoBujDusGXadNulMlslyukMWZit1see3dDiIg0jhRHeWAafmAVuzjawHrpnJkD
         ExtyusDBAL0/2573b4clftsr5NHhJBUNHlRhg4//jCpcEQRz17z+DORm4IrWMD7RlH3n
         Kdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701094583; x=1701699383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mi8eKf9Bk+MHBCMvhATqbV/lq6r88mkgwcH/G87faK0=;
        b=r02pT8pRBwhMKLEznOQjy3ZzMkzZrPy8sDIH+fbghtSN8cFNGsMfj5gbKTBStoEGmr
         ykR7JoJcltwyeEpj+UCF+kOBDsM4nRxYg7jl9YeAufstvv0Fj6LXQwBWUzSCZPrVm9An
         R2DynQ//Pd2A6eV34fyQpZIIbnjbwvhDoScLLoRfItg5venKACgp6oJb4xYAlC5dT3cl
         ZujkUHZ7yu6zJXGcYy6wyZ/FK2Rwgm7T8HaH2pVa4+YxedouJxY47LXINL+ADcYmmGA5
         tmDVNi6gxwhyQimoGmqUvVUmqBWDkyQHRENs5uh98XXmdwAuiH16SR4PKfH5p4WRMJp+
         /Bug==
X-Gm-Message-State: AOJu0YxgWayzMSMflk+BsZa1Vhs3ffVERPk5+axj3rRmCgGeEpTbcfwa
	/VhzOWe7cVQgmxu6VngA04lnOQ==
X-Google-Smtp-Source: AGHT+IFNL1Em68j1sMBW/4w1EkRoANc+xc8NwuXyMpzGr/usWcq8SWNsyNFhkYwxwMDQJxFCSq7AIg==
X-Received: by 2002:a2e:88c2:0:b0:2bc:c4af:36b9 with SMTP id a2-20020a2e88c2000000b002bcc4af36b9mr7465362ljk.52.1701094583228;
        Mon, 27 Nov 2023 06:16:23 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:bf33:77c7:8131:5e64])
        by smtp.gmail.com with ESMTPSA id be7-20020a05600c1e8700b00405442edc69sm14658830wmb.14.2023.11.27.06.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 06:16:22 -0800 (PST)
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
Subject: [PATCH v6 11/13] firmware: qcom: tzmem: enable SHM Bridge support
Date: Mon, 27 Nov 2023 15:15:58 +0100
Message-Id: <20231127141600.20929-12-brgl@bgdev.pl>
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

Add a new Kconfig option for selecting the SHM Bridge mode of operation
for the TrustZone memory allocator.

If enabled at build-time, it will still be checked for availability at
run-time. If the architecture doesn't support SHM Bridge, the allocator
will work just like in the default mode.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
---
 drivers/firmware/qcom/Kconfig      | 10 +++++
 drivers/firmware/qcom/qcom_tzmem.c | 65 +++++++++++++++++++++++++++++-
 2 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
index 237da40de832..e01407e31ae4 100644
--- a/drivers/firmware/qcom/Kconfig
+++ b/drivers/firmware/qcom/Kconfig
@@ -27,6 +27,16 @@ config QCOM_TZMEM_MODE_DEFAULT
 	  Use the default allocator mode. The memory is page-aligned, non-cachable
 	  and contiguous.
 
+config QCOM_TZMEM_MODE_SHMBRIDGE
+	bool "SHM Bridge"
+	help
+	  Use Qualcomm Shared Memory Bridge. The memory has the same alignment as
+	  in the 'Default' allocator but is also explicitly marked as an SHM Bridge
+	  buffer.
+
+	  With this selected, all buffers passed to the TrustZone must be allocated
+	  using the TZMem allocator or else the TrustZone will refuse to use them.
+
 endchoice
 
 config QCOM_SCM_DOWNLOAD_MODE_DEFAULT
diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 44a062f2abd4..1ca3773263e5 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -55,7 +55,70 @@ static void qcom_tzmem_cleanup_pool(struct qcom_tzmem_pool *pool)
 
 }
 
-#endif /* CONFIG_QCOM_TZMEM_MODE_DEFAULT */
+#elif IS_ENABLED(CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE)
+
+#include <linux/firmware/qcom/qcom_scm.h>
+
+#define QCOM_SHM_BRIDGE_NUM_VM_SHIFT 9
+
+static bool qcom_tzmem_using_shm_bridge;
+
+static int qcom_tzmem_init(void)
+{
+	int ret;
+
+	ret = qcom_scm_shm_bridge_enable();
+	if (ret == -EOPNOTSUPP) {
+		dev_info(qcom_tzmem_dev, "SHM Bridge not supported\n");
+		return 0;
+	}
+
+	if (!ret)
+		qcom_tzmem_using_shm_bridge = true;
+
+	return ret;
+}
+
+static int qcom_tzmem_init_pool(struct qcom_tzmem_pool *pool)
+{
+	u64 pfn_and_ns_perm, ipfn_and_s_perm, size_and_flags, ns_perms;
+	int ret;
+
+	if (!qcom_tzmem_using_shm_bridge)
+		return 0;
+
+	ns_perms = (QCOM_SCM_PERM_WRITE | QCOM_SCM_PERM_READ);
+	pfn_and_ns_perm = (u64)pool->pbase | ns_perms;
+	ipfn_and_s_perm = (u64)pool->pbase | ns_perms;
+	size_and_flags = pool->size | (1 << QCOM_SHM_BRIDGE_NUM_VM_SHIFT);
+
+	u64 *handle __free(kfree) = kzalloc(sizeof(*handle), GFP_KERNEL);
+	if (!handle)
+		return -ENOMEM;
+
+	ret = qcom_scm_shm_bridge_create(qcom_tzmem_dev, pfn_and_ns_perm,
+					 ipfn_and_s_perm, size_and_flags,
+					 QCOM_SCM_VMID_HLOS, handle);
+	if (ret)
+		return ret;
+
+	pool->priv = no_free_ptr(handle);
+
+	return 0;
+}
+
+static void qcom_tzmem_cleanup_pool(struct qcom_tzmem_pool *pool)
+{
+	u64 *handle = pool->priv;
+
+	if (!qcom_tzmem_using_shm_bridge)
+		return;
+
+	qcom_scm_shm_bridge_delete(qcom_tzmem_dev, *handle);
+	kfree(handle);
+}
+
+#endif /* CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE */
 
 /**
  * qcom_tzmem_pool_new() - Create a new TZ memory pool.
-- 
2.40.1


