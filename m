Return-Path: <linux-arm-msm+bounces-7761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 380A0835F88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 11:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BFF3B275C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 10:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3273D0C8;
	Mon, 22 Jan 2024 10:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="awK7wJDa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832233CF6C
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 10:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705918939; cv=none; b=TMSyen0nW6VRoeSvGq7xjfKWoYuq7tiilWyYeVc/zsWYRKH+3PckKhxzP4/qqvvLfdWAMm3VbDQZxLsLX/UajyXje2Jng/FJpjauOg0tDYy8RlkbZuR1vFEa5rV3SFi6PRoVviqFLI/Om3EuqJPUoM13Ox6NTKB4KYryYr9qNrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705918939; c=relaxed/simple;
	bh=vLV56JdLhCXv9I8Otb8fkzypPbOrFXDh//mg91zfYWY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jAAF+YAMKr6JMrlgBgEVf6nUmlHTjtokJqm710/OuztGQMeCa0M+1f/DPQnX7uATByZN7dciHHXNmVR2zw6FGJF5UKRa/UXozwIYJD80yOT4IY2vaweVIKg975MoKVpDKbezpen2sBW/bjUXrvkVQhGfjV3AHhDdnr5a4dKU9xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=awK7wJDa; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40e87d07c07so38349115e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 02:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705918936; x=1706523736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7YM24nmdBGVn9OW3639g8czrZXTChvQLuqsDzS6F8c=;
        b=awK7wJDaG46Xf83HnuITxXnZzPc+idkYcYyeDoRlSm7+0st0ZL7dYUTH9L1xH/EISd
         bt5/0hE+P8nU08iqiJGw6NALVe/mOtP0boRZuwwzRoTyygram3cawSUWjFkH/MR3UovC
         +zMz4h0gnpnsK+SXx7ryAodjKnORYZoMorG6O5gp7LhnrSnocl2DGKiVqpSO7kSa0Gzp
         n4w7XDkD9f0pdx5mBCm/In7TvH4yNv+6svpbiEP30PNz2vNOiM2CwWe0phXKDMxWJRmW
         uVQQQcWVXGUimmgaY7a+ChXMdxceeI/qx89JFs3Xy6iMrMtNv5xckBuYGapDs0g/bH/4
         yCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705918936; x=1706523736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7YM24nmdBGVn9OW3639g8czrZXTChvQLuqsDzS6F8c=;
        b=pvr3hEwEkViSfTE2cAR1mhLT1hBcrTaCHbyqca8BP4qoocQkTgVBIn/99ua/n5jysE
         3PuNJ5BUKnn189tXXiN3c4bz1H3kVXbLADmrTs0NvK9maLEQ16Sv3loUoYfpPLuIgJ9/
         fQ/p+9XeWYMqCjOstJWMAzjnzGignEmh3UFkKLpKBVLub+anP9GE1RfHRRnrXqMdtMZD
         sMxNYMjIxcBPvTqySiekK7D7DYX3bLkLzMWZw3dkSZaFwVNLMC04Dbh7eSfBupGy4Kw2
         /mwjVUgP5VZtymzjf1Hy5RenVOPi9mD/qgPaG84SVIwR6omWyJ56OQq2ZGl9lF9EnA+L
         fVjw==
X-Gm-Message-State: AOJu0YzJjqLVUGyyrvJ1Zm33BDnQrofW3eFMVhZxhItUD4m8MXP15a3F
	qhVQW5g2CyT/CbPh6FGPuDCaALVdqqM/eVTcLO+CC4lqbYN9X94vC7i9LJBeLAI=
X-Google-Smtp-Source: AGHT+IFsuvm4Rl0NPTn1C8nd9hf/sLKnAYeussu8CGrN05k0s1rkabWtTeRwrfiBJe6Xs0bfMTPb8Q==
X-Received: by 2002:a7b:c7cc:0:b0:40e:556e:5f2c with SMTP id z12-20020a7bc7cc000000b0040e556e5f2cmr2247817wmk.63.1705918935970;
        Mon, 22 Jan 2024 02:22:15 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:92a0:6172:d229:1898])
        by smtp.gmail.com with ESMTPSA id q7-20020adffec7000000b0033926505eafsm6377904wrs.32.2024.01.22.02.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 02:22:15 -0800 (PST)
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
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Deepti Jaggi <quic_djaggi@quicinc.com>
Subject: [RESEND PATCH v6 10/12] firmware: qcom: tzmem: enable SHM Bridge support
Date: Mon, 22 Jan 2024 11:21:55 +0100
Message-Id: <20240122102157.22761-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240122102157.22761-1-brgl@bgdev.pl>
References: <20240122102157.22761-1-brgl@bgdev.pl>
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
Tested-by: Deepti Jaggi <quic_djaggi@quicinc.com> #sa8775p-ride
Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
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


