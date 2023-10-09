Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAC957BE4F1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 17:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376940AbjJIPfv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 11:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377624AbjJIPfa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 11:35:30 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82CEC12B
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 08:34:58 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-32320381a07so4642290f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 08:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696865697; x=1697470497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bf2AqtKJ/+ji6DGMnGdvnoiBlKH8gD5Uamvdkv0NVy0=;
        b=l/t8DMQQglXH58LKcQX6bjuKm13TNdB8ZQz3L3+KrI6c/L5FEf+5Ov/Jdf3LktmShQ
         7h32AFzgsXmH3Mj90dWpyJYNCFzRhvki24ATrtZJNkmKs9FGwHLSmlRlBwZGbP/O/WVW
         hFuxYm2wEoQLHmSMmp1WaePGFZqA21opVjwz8Ar9Oin6wwl3sILKofmv2CiAI0D+6wCP
         ENKT7Dq+B79VNXKRHvWEy/59erWZqvL1wuWxG8Lgmu8ellN1CMIVNhzPejpfzzwHHtQq
         yjm77Jd6pzj83vVCOwUs+5TpbrxnOLCqehpGAOAbN704nHiuAPfmzsniIXU9RzAOAyo9
         9L0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696865697; x=1697470497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bf2AqtKJ/+ji6DGMnGdvnoiBlKH8gD5Uamvdkv0NVy0=;
        b=EIC6PUVCngVA71WccZIn6LbNTkllu0B2tBBuVv5mDUkRjl9FFbG5QQpYenkBEd0/Lq
         0MFp848eSo2LlR7dVHztUTVyIEs9m+/XtbJ8bCVD79+Ar1fIqOH4mIoUoCI1bk7/2Q7L
         Uq3hrLTMSBC3LTLKVpdhtnE9c7ZCt4vWY+rFDzA0xXWiFIq+uj+/Sqykj0gulTHxEaw3
         TJZUjm6SqXUY8cxD7AiCiEGLCGIVg1MG5Ckkf/uz82AmVLWo5IXAXAaeGgSu2xvDrMQM
         IZauX9QTLhzOjPxyBKeEvfqCQO3xbCj8bSKAmwSIBVfzGNmm4iFFjqsEdJ1dTTm2bbtL
         pMGw==
X-Gm-Message-State: AOJu0YxNrOrQvPR4jusFtqXOH5yHnIeNQdF8wBo/VEetv728RRIo83wm
        sBlxMzZuNvbzmAnCjNBcwZppBg==
X-Google-Smtp-Source: AGHT+IGTXsa/CCoBPozrI8MbjUY8dJrEvFIpOtzhxfmR9YMRhYHQyCuiNShfgxVY3ik1ZrBWgpo12g==
X-Received: by 2002:a5d:6909:0:b0:317:70da:abdd with SMTP id t9-20020a5d6909000000b0031770daabddmr14203281wru.59.1696865696468;
        Mon, 09 Oct 2023 08:34:56 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f20d:2959:7545:e99f])
        by smtp.gmail.com with ESMTPSA id b3-20020adff243000000b0031431fb40fasm10016521wrp.89.2023.10.09.08.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 08:34:56 -0700 (PDT)
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
Subject: [PATCH v3 13/15] firmware: qcom: tzmem: enable SHM Bridge support
Date:   Mon,  9 Oct 2023 17:34:25 +0200
Message-Id: <20231009153427.20951-14-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009153427.20951-1-brgl@bgdev.pl>
References: <20231009153427.20951-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a new Kconfig option for selecting the SHM Bridge mode of operation
for the TrustZone memory allocator.

If enabled at build-time, it will still be checked for availability at
run-time. If the architecture doesn't support SHM Bridge, the allocator
will work just like in the default mode.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/firmware/qcom/Kconfig      | 10 +++++
 drivers/firmware/qcom/qcom_tzmem.c | 67 +++++++++++++++++++++++++++++-
 2 files changed, 76 insertions(+), 1 deletion(-)

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
index eee51fed756e..b3137844fe43 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -55,7 +55,72 @@ static void qcom_tzmem_cleanup_pool(struct qcom_tzmem_pool *pool)
 
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
+		ret = 0;
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
+	u64 pfn_and_ns_perm, ipfn_and_s_perm, size_and_flags, ns_perms, *handle;
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
+	handle = kzalloc(sizeof(*handle), GFP_KERNEL);
+	if (!handle)
+		return -ENOMEM;
+
+	ret = qcom_scm_shm_bridge_create(qcom_tzmem_dev, pfn_and_ns_perm,
+					 ipfn_and_s_perm, size_and_flags,
+					 QCOM_SCM_VMID_HLOS, handle);
+	if (ret) {
+		kfree(handle);
+		return ret;
+	}
+
+	pool->priv = handle;
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
2.39.2

