Return-Path: <linux-arm-msm+bounces-13178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1976F86F5AF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Mar 2024 16:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 848031F22AF7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Mar 2024 15:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549E16AF91;
	Sun,  3 Mar 2024 15:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KA9l1gwl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661226A8B8
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Mar 2024 15:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709478096; cv=none; b=ekPAfARaiNCdSueJgeOLm9AYrL3h1POrlWg4bLwJKrwrylFvDxgo5y5VZ5HEWCkzYfshaskVjcM4S6YR5d1RMrkPj6ZjDN8Xpuhl9qacmSSzMyjMRq5CKTDli0wg8n+klU7wDsOYfxZPIXJA+F6rWzP7jSS7JGCxbkp1o2v/6M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709478096; c=relaxed/simple;
	bh=F9bg72skBcwBiEEYZMM2hukN57hnLQZy3s4mEijYkWQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FhTm7faBldw5929tujN8kIM/Gz66rHC8Wdl9DD8oH2YQkTvw0xWujgEMOy2xpT9CnJYnc6oBaneG8exfTF2Te2uyZ0iZF+7pPKIgZTIvziX2NpZpDyCq2ITpHqtin5ANPwltoRxLWtBH0Bjfi5xTTtX9p13QIZ1wirSvvYqYOMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KA9l1gwl; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a3ddc13bbb3so787989266b.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Mar 2024 07:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709478093; x=1710082893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iX5g+V/jIoB/U2fD/Lz2zFWCo9i8AUpfaivI8I9uXqI=;
        b=KA9l1gwlYMbLA5Etcuijby5a5JbXr0VmF9ws5uben3m5fMWhYhU9Tbjkchi29RW1Qe
         ZnHxmI5BDw7LDc4Eb5ooxE5DLX3BPnae1gyIXXuV2UfkbI+Z91j68ysTguPqxroj90SX
         yj92UAdpccpjAIx1N7Y6Ji4V+Jm5SRcy7DAwjC2P768qqZhuV1ulJafBOtuVV8FPmlth
         fmweqX5rDfrmCf7oNuxtfrLsf7i/eJd71B8fV2uRP+cthfavt4ihspRk1F1u0kEx9ZSC
         ElgiNClcSS/hZAMlrh8dJYCa4Ip2ZOfKf+XzN48Jy4/FoVQbJwKGn/DWWlxOrLSc7lCv
         BcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709478093; x=1710082893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iX5g+V/jIoB/U2fD/Lz2zFWCo9i8AUpfaivI8I9uXqI=;
        b=M4qBR4t58/I61JjDGzHcnyS4q/K+F/6SFIfqKedOeKAAMqWltIsXAhtmPXLOTuV3GV
         1ddqbkYlYeCo129PmM+aj08Rf4GtRowfpiO+slAtJtDS4YhTcefirq5A3oTfaf/hz3EY
         ICzA5b3aLQ6HBJOHCWoqVnc1f06d8BP2wd/kPcC5NvHuul3MhQAhUKDvkS7MSeje0/Wu
         tUs5BjtQahgtQwhivds2W/afC2LXW/p3tu520Rb7rMaocgtbUZNSyhg7htZiaJcn2BcV
         aam8ZSg8dCn8IZPZvWFRvJDDBctzuaaLFRqS398cT0fUF+rL4aFC3kw/+fGpZtcq1+Nz
         CBgA==
X-Gm-Message-State: AOJu0Yw9yuH2xZjcBgJlpD/FXISgofPr7VT4mnEdUNfUvN6dloICQcOA
	CZhMxe7C/TEw5rYHoNiP9b9vFOUqkNiS/YCEkCoVA5evBih7jB71uP8y2nrt8bo=
X-Google-Smtp-Source: AGHT+IHaFX784uguRkmMeLyP7wBdJksLN2mrMw6APcJ/cXGZXrdnmicuWEsAAPZo80PWjA0bjfx94w==
X-Received: by 2002:a17:906:780b:b0:a3f:f8a7:e1f7 with SMTP id u11-20020a170906780b00b00a3ff8a7e1f7mr5317002ejm.5.1709478092975;
        Sun, 03 Mar 2024 07:01:32 -0800 (PST)
Received: from brgl-uxlite.. ([77.241.232.10])
        by smtp.gmail.com with ESMTPSA id ch14-20020a170906c2ce00b00a42ea946917sm3740293ejb.130.2024.03.03.07.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 07:01:32 -0800 (PST)
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
Subject: [PATCH v8 10/12] firmware: qcom: tzmem: enable SHM Bridge support
Date: Sun,  3 Mar 2024 16:01:13 +0100
Message-Id: <20240303150115.133633-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240303150115.133633-1-brgl@bgdev.pl>
References: <20240303150115.133633-1-brgl@bgdev.pl>
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
 drivers/firmware/qcom/qcom_tzmem.c | 65 +++++++++++++++++++++++++++++-
 2 files changed, 74 insertions(+), 1 deletion(-)

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
index 23f364afa6ca..244615e8c505 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -67,7 +67,70 @@ static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
 
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
+	u64 pfn_and_ns_perm, ipfn_and_s_perm, size_and_flags, ns_perms;
+	int ret;
+
+	if (!qcom_tzmem_using_shm_bridge)
+		return 0;
+
+	ns_perms = (QCOM_SCM_PERM_WRITE | QCOM_SCM_PERM_READ);
+	pfn_and_ns_perm = (u64)area->paddr | ns_perms;
+	ipfn_and_s_perm = (u64)area->paddr | ns_perms;
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


