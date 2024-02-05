Return-Path: <linux-arm-msm+bounces-9849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 748D484A25D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 19:33:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D88D91F254D0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 18:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F0354BD8;
	Mon,  5 Feb 2024 18:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wKuXjanq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A683D53800
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Feb 2024 18:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707157714; cv=none; b=FR1d2rIB5pKL0b/BmiynFZTmj+xSjxpGdGBCJ2sflIoKiGF74uglEk82d+sHBof8a4yeFaXaz3wJ8XI/qZPYWXEyy2bwgR+fUhGURNgWBk5QF2/9qcvQMy3N07vv45H88xx8GO+j1VJgQ1rrfTZ4flc4GzffDMWYHcXRLJD79QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707157714; c=relaxed/simple;
	bh=TY7UcEwIecUdAt11hpKY+H0IC9vqMq5Ef0ifk+Z9jBg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fuxbqLiUO0i0PK5kCFg3cqr8RbuLM8YIx7wAiacooZYH1olOC0ZSYamWpFjhARv0Py5JLsIdUVDd26dC9YhZNK6nifQo4dUSKkFGpznDFTk6XLGMsuVl4bOp0hh8vNIS7DjjLc/38/Sqlb853Ae9cbU+1UCdqeWIEn5Gd1+r9rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wKuXjanq; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40fd72f7125so14281065e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Feb 2024 10:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707157711; x=1707762511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=un7cEtb3KJw1A3qP7llM4B4OwSm9CqRxp4DvgeD9Ir4=;
        b=wKuXjanqOvZBHdvwr25IbqHDfOHT51KvH8hl9IL2t3qIMQCNDQGZlrp5P7mIMTA7kb
         9Ft2fRwbcUfoRCWqYBL3Kyk0df/Ra0JoLH5USpiydpwrKAwSYNSmlubi7HQaSN6h0Tn9
         QIRZkMfPicSyi7WJXinhtrBSVeoQlUwjRgxbdN3LV3oThkTcWAE0iWfOFnt5DHCsSHHG
         66kiEKJGQf3M6HLUEdV8z8+hKb9Zn1LPQ1q+awaPforHuWZ62lXnoLo4BQ/w+4ZtMQgv
         SsGR8UqEcCCKhMA0ZlqgF6ZmKoUKfC5XlMzJO73KS7pYMnw+YV2Z3LSrEUpyH5I1nSvY
         gG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707157711; x=1707762511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=un7cEtb3KJw1A3qP7llM4B4OwSm9CqRxp4DvgeD9Ir4=;
        b=UHLWbZX5BSDVHQpd2s4dilg8TrX6eBMNzpf2UwPrCoGHDWQ5diNm3FPu7B8YHwi0PB
         QwnlesW8UxcdxvCOXlheG+lSxcKUhLX0D5rBBafU8cF7rm9EdF9u65XQAknVKc8ME4EO
         kuTF3jDRkTftTCMzftDu60BhPWQ04LKQcVXkNA3fwx8jTS6bEW4j4+F2hG9Q+T3KUPAq
         LyQiwWrK69iDjNlCJoJYWQblrMORjGL4SL8jp2UI6aKxzP/rscCddu3zHF4FLPK6M18m
         iq/GVCKg0TxqZbqBnmmOt0xP8NsuD8hcc0arkdK7cbMW9OPdrMJy9+uxASZX1I1ScqIp
         aEqg==
X-Gm-Message-State: AOJu0YyhMwNXhaxn329azub5xPptjIemeiJcE/ypkR7kxr6JNy2q3Oe5
	6qBksb4sfoof+3Wzqx/XJGa5NsE8wUnB5bBEYC/sfAK9x6VpJzXHkkGzeKuZfe8=
X-Google-Smtp-Source: AGHT+IH+YlBI22schHQmMqidb7q3KHo+sRIdEP+Vmn6IUjpvEfBRLsCLSdwDp6ZXMGp2snNBJadkvQ==
X-Received: by 2002:a5d:6d0c:0:b0:33b:1390:d952 with SMTP id e12-20020a5d6d0c000000b0033b1390d952mr317743wrq.19.1707157711039;
        Mon, 05 Feb 2024 10:28:31 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW3Htlt/5bJrrn9O1UdvEw6ixuei44u/CC58MhspOd6vqORlCnuOqqkZRF/NxTIONM6zbOXlvoYSv8sRFYaRSmgezLya4CjuF8V4Fwi2n0I/uwG94mUnku1SWSzhUHZ9noFevkniE46GT4gPJcHOukfnAxIfA9YToOrnaj7oSfmpueTu7Y4nkoLj0y+8rhzpOrKZ3EQkCj7kxdyaNNcwzrZDWd4J4TVv4sfQE6J85/AyBa/SnUjrcZ8nSHzN6sp8fY67PvOMFb4wsCx9g5OlB6yrRLetTGOlLgPTFrXQIAc78SPR+36t00yAIRlHspeFwprkDwhNdDHoAVxFr2EidtezBV1sA8YWz6P1TBm0LJ3MLnQGFOyfWL115nhVpXnjSGQUvcvRK5r4MZAVAuNY9GtHZcLWvqk05Aozm+sgzAf+v5360wJEQJPu/doQA5zik1GDidf32ZJEbBohor3t4B/xo99XPqdH1IxVA3B7iXr/1VCN6He3r3prGNJWmXVLzqyAprt/jeMy3CkHhIeAZp/m6/jTDCkr7iN6EILhf5J9wm8Qen9Q01uMcCbxp/exNs=
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d929:10db:5b5c:b49d])
        by smtp.gmail.com with ESMTPSA id v15-20020a5d678f000000b0033b17e18df8sm203229wru.12.2024.02.05.10.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 10:28:30 -0800 (PST)
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
Subject: [PATCH v7 10/12] firmware: qcom: tzmem: enable SHM Bridge support
Date: Mon,  5 Feb 2024 19:28:08 +0100
Message-Id: <20240205182810.58382-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240205182810.58382-1-brgl@bgdev.pl>
References: <20240205182810.58382-1-brgl@bgdev.pl>
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
index d24d83223867..af6f895c5adf 100644
--- a/drivers/firmware/qcom/Kconfig
+++ b/drivers/firmware/qcom/Kconfig
@@ -28,6 +28,16 @@ config QCOM_TZMEM_MODE_DEFAULT
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


