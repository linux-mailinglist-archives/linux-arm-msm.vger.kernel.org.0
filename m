Return-Path: <linux-arm-msm+bounces-20617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 306E08D00B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 15:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACDA21F24C5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 13:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36779161327;
	Mon, 27 May 2024 12:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HlFd9aRp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C291607A0
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 12:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814619; cv=none; b=Eff4wyVEJSQdFB47uSbmeEPljpf4UJJkdSFzW0Imo/WRwOSFC/SxEp7tC9nFS9qCM5ty4Kfs5THrDL3az8tb33pbJxfnYfYUafpVrZ+HjAf3s6qHASyCcVugWJI39NNlaYMWcgU93NU2ngb3vfiEOwYpx7zPYnCg09JvGxuppS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814619; c=relaxed/simple;
	bh=xVAP2yUo860qGVVdjxAiMXPUbzaHrXsGq8uq0Y6cr70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YIMBD4tKBQyn1O+6hLo9NzaN4xDYBmDv4g67MZAFIFa+Tdak+s2axxsn7VzmDaMKUyQbBCtfU0uc07qItksrgvzOSnrBesgW1+nQTAaqzQ6SQkWfTsWZFp7e58/bZCY4EEKZ33DNSPZVmBHWAFstO2QLzaovtMB932KRXu0gQSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HlFd9aRp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42102c51524so23361325e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 05:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716814615; x=1717419415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xb011fqkeryzcbBET/6jqlq0C5NLk6ehH9YotcPeHdY=;
        b=HlFd9aRpl8yOYfNwn5CyunJc8UFuK79dHIyKVIpPZBYuK29nDUhwA3Odshwt2tGAbQ
         2lJi+dxv6/5KZcgpH2Y7qXXCemqMNwN9Az2feFj1KBHjrTelayhoCoQZTPs4+4di1XIX
         5oEqOltxw+3YAyvcEf31b6K9gNAG1/gPmLtT+jSAoB07eUPjHaRmyMLWSfHs7mV/Adox
         XIgjeE89fLU1H00mqVpCOZ/wGFujKD/VXQQgV0Wx/xb0HLi5vgVZ8/EJNv19F/dQiiLd
         3BPniWAMi8axCt4N7+O2fYxqWP9EDXJlH7e8cL6Q2u8fmn/hOyH/pZl85Gw3AaCS8chN
         RkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716814615; x=1717419415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xb011fqkeryzcbBET/6jqlq0C5NLk6ehH9YotcPeHdY=;
        b=hHTyi4uI97eDxg8mBJ7OhV9St5nqVIgr5I42rSrVyiESJM37SL9mB/JOq+XpSVfVY/
         7hyKzHG8IiB1ngy28IZ/LL9+kkWIX0T8hcE2K6JCGJGyt1/DevwN9TsxBvBtbhB0zBuf
         b0pDPOKQu9qkCKR/UBZtmhNNTind61YNG1+8AwQN8j9S8BFa7rPWAbWhtfOkKK/52wzb
         9sJB09a9LJjFGhOubzK5oL9f32/A0IP2JHp2MLZqrnJuDUQFVVhY3qlIQA+y0m1xg+iu
         HRVnQ9Q7Fbbg3Ghlux2mCYko3+LXox329xpDjGj7dbnRgLrYp2QbBdwN7TxnHJs2e/Qq
         yCyA==
X-Gm-Message-State: AOJu0YxgCaLGrmIKwrD43XflT3QDQTgd1c6yNlZYz4EjcAnvT2WDaQew
	QA3GrKiS+sVyZe5Cd9IzTp1kErXXJB031zI1d8BfIkZSKXki3gmZYzLsaWADxRA=
X-Google-Smtp-Source: AGHT+IFMm7MJVK46CgCVCnpTDtuqMAFg/I+zhUZQjMTG8tD0AIdgSKeVpj4upyM8cXEOycp43d68vQ==
X-Received: by 2002:a05:600c:1913:b0:419:e3b9:b384 with SMTP id 5b1f17b1804b1-421015b4734mr101893285e9.11.1716814615508;
        Mon, 27 May 2024 05:56:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:c322:131e:ff9d:ef41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f64f98sm138753635e9.24.2024.05.27.05.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 05:56:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 May 2024 14:55:01 +0200
Subject: [PATCH v10 11/15] firmware: qcom: tzmem: enable SHM Bridge support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-shm-bridge-v10-11-ce7afaa58d3a@linaro.org>
References: <20240527-shm-bridge-v10-0-ce7afaa58d3a@linaro.org>
In-Reply-To: <20240527-shm-bridge-v10-0-ce7afaa58d3a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Arnd Bergmann <arnd@arndb.de>, Elliot Berman <quic_eberman@quicinc.com>, 
 Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@quicinc.com, Andrew Halaney <ahalaney@redhat.com>, 
 Deepti Jaggi <quic_djaggi@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4147;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=uu55syoIGqSAHT5CWYTbsAIG3EX3ZWdIO4aqT+vkzWw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmVIMKq01dcR08z169Y8aOU+wTgVn8nGVClVW3X
 UsyKRkrcoGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlSDCgAKCRARpy6gFHHX
 cquLEADCF0YY/DACosvnIHqr0PeJpvVfdMjtv0D9JWbTZ3J8PhKl2I7qK16Ghk6K99IPsBx68mb
 iC7BL2JCLV/pDgMNITVRsMf1UzkOpNtcc/5OtTCO62ViA0KZrws3WSdS/0dtRRnIPQxSZXanY0V
 tSzQ0+4rVqLz907BSOWPSOahub9zhsya5Jf6azljX1pSe6mZlgpQNmweQqI2VMHm3QXg6992OSO
 wqafLWC3+oMe+AvD2VjlUAvMA2FlBxkjom1IOA03zhlL5Van9Erw1p6NvpqQ0fWrT7RqrRzE9gP
 iYfhfz1u8nfzbYMZT0iP9ZxrhcvsqIKjcSOqwvMilpT10mC3kY/hQhKqGtNJcTceDbIApIudKjS
 vQlW6kgQG8ewP0tWKNy7g3LBQL5xeCZbLqNT7z7GRtvrPx+JWLADwWKyMBcZGoPZhV8lx6+aziz
 V9Yq1W9K45PgfEW3p7jUOMX0dPFDQu6hup/M55QFbim0H8KGoBYarziICmqUPmetksDlJVJQQi0
 8cwEZvchXDmTl5OJMpOJ9HEkSCXFps0nOpFLF8XYS6Dn2qrH1CYXsRexFxRgDToIKmfH3+I0D9y
 +Q97F3tnSncqZHxunogUBWLwNfMGgiUQ+YSdKnWvIQ4Zv2BizW/969mHottbTutYPTDo/tWe80e
 WFaQb9xPgWZlIPw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

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
 drivers/firmware/qcom/qcom_tzmem.c | 79 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 88 insertions(+), 1 deletion(-)

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
index 3853385bf215..aab6376cade5 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -66,7 +66,84 @@ static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
 
 }
 
-#endif /* CONFIG_QCOM_TZMEM_MODE_GENERIC */
+#elif IS_ENABLED(CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE)
+
+#include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/of.h>
+
+#define QCOM_SHM_BRIDGE_NUM_VM_SHIFT 9
+
+static bool qcom_tzmem_using_shm_bridge;
+
+/* List of machines that are known to not support SHM bridge correctly. */
+static const char *const qcom_tzmem_blacklist[] = {
+	"qcom,sc8180x",
+	NULL
+};
+
+static int qcom_tzmem_init(void)
+{
+	const char *const *platform;
+	int ret;
+
+	for (platform = qcom_tzmem_blacklist; *platform; platform++) {
+		if (of_machine_is_compatible(*platform))
+			goto notsupp;
+	}
+
+	ret = qcom_scm_shm_bridge_enable();
+	if (ret == -EOPNOTSUPP)
+		goto notsupp;
+
+	if (!ret)
+		qcom_tzmem_using_shm_bridge = true;
+
+	return ret;
+
+notsupp:
+	dev_info(qcom_tzmem_dev, "SHM Bridge not supported\n");
+	return 0;
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
2.43.0


