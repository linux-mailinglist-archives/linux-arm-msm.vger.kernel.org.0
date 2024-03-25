Return-Path: <linux-arm-msm+bounces-14988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD1288A36F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 15:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AAE61F3D591
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 14:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA4F182F08;
	Mon, 25 Mar 2024 10:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="g+NFsm0Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA641966A7
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 10:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711361063; cv=none; b=VKJ/x9vj6alECM8cTo9OeZ1f7PoncOK6eMx63qwamyNCr9KrbiKvWxM3uAEn/TPcnVdCYn3sRDO7dk3/dsn/2/7qDYsdbdWmc7QpbYErsE4tPr32x7ktQyOERxMce0ZUJ02g1T19XM3IsiSs2KCbhsO1yeM3nfdkjlcHjiLDTW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711361063; c=relaxed/simple;
	bh=08W0NFomNUm/IaMqIFxtOVTsNRH90xntYnedEZKPSv0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZD/tGpmV5xkJybhmsDplvkPOp0oePSG7Ya46z6jBGnqep1qinld+QJ1SN7RzfPyUrUfh+2kEbcfC2pmt1wdiLFBAzWuRhmToZ66iOg4wZLTTxZv1DaMNPTCS+vZjtuxDBXfunhf6TqE8u2k+plJXIyli5CLqwpzhZClqD0gQSBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=g+NFsm0Y; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-512e4f4e463so4381158e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 03:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711361059; x=1711965859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTuiWAzkrAQHiSJW5caIJPQRcHdUHVyPyuazcGj6Adg=;
        b=g+NFsm0YCwF+upZWMJr4IvNbe8+xzjrlmuSsLNLzlnMs+1GQUwAn+6ZyTAvh0fqSuz
         WBPO7OSk/8giNTPjVoRVU8aTphbygtgIRfMK/RQBaiBjWDW/ZGpuhoT+9ke/X16A4XTB
         61We0xKS7Y6rLOYrVVT4I9Oi/rT1q7fQJzs+lvE5JjH++4kNFSWYcmgAcdWuKm5lDdwR
         HzqI06TuBUMAnRtHVEUkgz7siJSlV5obsuD5kYLN+FAIglAsTzOVa43a++M44DEO4ZnM
         YCCIrZTj9vQc0/OTeT4PPtvphQ2s4TumCgZMv5ONKmfGUE5A3ZogYx9JDDhjAwJKKEZC
         vW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711361059; x=1711965859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTuiWAzkrAQHiSJW5caIJPQRcHdUHVyPyuazcGj6Adg=;
        b=Hx6oCqq3hWQrL555l07wZa76fcxZX1Vps2NqelaR8sF1S2pPJK4ZmMDdxNWLf0MvPj
         OcHvSLCgxeBb2KXiIwovyHZgg2QXDa+S98aDvdRmL6xxs3RZbak6odof6x7A1CJNumZa
         vXjeY63sH8rdFd449sUCpFBoO+CztJSO3ZdHG6y36TondzSX3dAyv/IaTQEJa+XO8jvh
         5efhXQnd9TScEEL7wQqXoxIFFhFgLIzl7fIGnRqklnEOkPlIYuaX9KkCdJogj+Bf7Qot
         UkMvDu+xSFGRG1D8CQLQooNisBJV8U5bW1bq+Lrn+2Uhgq/d/+QwWttqSn+ooUvZHGGI
         h4mw==
X-Gm-Message-State: AOJu0Yz3jWpA1Wd/Mhg4mv9iXx3vxgXJOO0wvjTLOxN7GNcyALg98QNM
	4twHB5Cfz1n/a0HmjFZLjjuT9GNySGo4MygdHU5hGYtFIF/dWgKqhpxuTdcCAZM=
X-Google-Smtp-Source: AGHT+IFsnHPrgYdjGIigmkdOyAoNuIv34xCFJqb0gsmmJ33tLamyLqyMc9rOWeVDAwkg0uwCKNcQ6A==
X-Received: by 2002:a05:6512:3119:b0:513:cebb:cf19 with SMTP id n25-20020a056512311900b00513cebbcf19mr4258172lfb.53.1711361059061;
        Mon, 25 Mar 2024 03:04:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:861d:8b72:a859:4ce9])
        by smtp.gmail.com with ESMTPSA id dv13-20020a0560000d8d00b0033e25c39ac3sm9086874wrb.80.2024.03.25.03.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 03:04:18 -0700 (PDT)
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
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Deepti Jaggi <quic_djaggi@quicinc.com>
Subject: [PATCH v9 11/13] firmware: qcom: tzmem: enable SHM Bridge support
Date: Mon, 25 Mar 2024 11:03:57 +0100
Message-Id: <20240325100359.17001-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325100359.17001-1-brgl@bgdev.pl>
References: <20240325100359.17001-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

SHM Bridge is a safety mechanism allowing to limit the amount of memory
shared between the kernel and the TrustZone to regions explicitly marked
as such.

Add a variant of the tzmem allocator that configures the memory pools as
SHM bridges. It also enables the SHM bridge globally so non-SHM bridge
memory will no longer work with SCM calls.

If enabled at build-time, it will still be checked for availability at
run-time. If the architecture doesn't support SHM Bridge, the allocator
will fall back to the generic mode.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
Tested-by: Deepti Jaggi <quic_djaggi@quicinc.com> #sa8775p-ride
Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
---
 drivers/firmware/qcom/Kconfig      | 10 +++++
 drivers/firmware/qcom/qcom_tzmem.c | 64 +++++++++++++++++++++++++++++-
 2 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
index 4634f8cecc7b..7f6eb4174734 100644
--- a/drivers/firmware/qcom/Kconfig
+++ b/drivers/firmware/qcom/Kconfig
@@ -28,6 +28,16 @@ config QCOM_TZMEM_MODE_GENERIC
 	  Use the generic allocator mode. The memory is page-aligned, non-cachable
 	  and physically contiguous.
 
+config QCOM_TZMEM_MODE_SHMBRIDGE
+	bool "SHM Bridge"
+	help
+	  Use Qualcomm Shared Memory Bridge. The memory has the same alignment as
+	  in the 'Generic' allocator but is also explicitly marked as an SHM Bridge
+	  buffer.
+
+	  With this selected, all buffers passed to the TrustZone must be allocated
+	  using the TZMem allocator or else the TrustZone will refuse to use them.
+
 endchoice
 
 config QCOM_SCM_DOWNLOAD_MODE_DEFAULT
diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 9082966c7e1f..570fda7b1aad 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -67,7 +67,69 @@ static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
 
 }
 
-#endif /* CONFIG_QCOM_TZMEM_MODE_GENERIC */
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
+static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
+{
+	u64 pfn_and_ns_perm, ipfn_and_s_perm, size_and_flags;
+	int ret;
+
+	if (!qcom_tzmem_using_shm_bridge)
+		return 0;
+
+	pfn_and_ns_perm = (u64)area->paddr | QCOM_SCM_PERM_RW;
+	ipfn_and_s_perm = (u64)area->paddr | QCOM_SCM_PERM_RW;
+	size_and_flags = area->size | (1 << QCOM_SHM_BRIDGE_NUM_VM_SHIFT);
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
+	area->priv = no_free_ptr(handle);
+
+	return 0;
+}
+
+static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
+{
+	u64 *handle = area->priv;
+
+	if (!qcom_tzmem_using_shm_bridge)
+		return;
+
+	qcom_scm_shm_bridge_delete(qcom_tzmem_dev, *handle);
+	kfree(handle);
+}
+
+#endif /* CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE */
 
 static int qcom_tzmem_pool_add_memory(struct qcom_tzmem_pool *pool,
 				      size_t size, gfp_t gfp)
-- 
2.40.1


