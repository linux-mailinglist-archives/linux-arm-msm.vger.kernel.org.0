Return-Path: <linux-arm-msm+bounces-55417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C42A9B07D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 16:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B93C27B6818
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 14:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3F2289346;
	Thu, 24 Apr 2025 14:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aH33Dmtg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFE7284B53
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 14:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504045; cv=none; b=IscAGrAGviNUYJ2yNkVvo/PSOccFrA/W5NQv0Y9JD3dePlU1hG5qA6R/rHjZlCiEcvXFEuEl8jkbZVtluXtrnZS8wUP9V2QduWPo6jV6aJZZ9UiViOxTbh2Pq/T5DqJPE4jMqTOS/CvZYooguqm9+1TlJd8RuE077yvuYZFYxb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504045; c=relaxed/simple;
	bh=sOc+WgCBKAU0O5bB7WH2YBqY9uNwSXL1/wb8/ZYbbhE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EyEH7+4gifGenPY/Yd6oYlQkNJLC7AMm6H5QziGoT+UeQEpPHNkCYN+eDavr5Pe03oyldAK00f9gWian3OuNXbMKeXdeADEl6D9vHWqMfYZWlMe2cKhedCYil/gR6PW4D5wK2Qj/TPBW3uyMjuDSRII0Hs6+K8FzNCz5v82AhC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aH33Dmtg; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfe574976so7691715e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 07:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504041; x=1746108841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmKgb2P7k7ka3054x1IngydlF8noVj1FtGkMjW5J68k=;
        b=aH33DmtgkOHqP2hwtI+u07WChhA2Fulbri6fmZWxNnrjT9saYqe/QqBtRtVXhmy4mf
         Z5EXAZ1d8kblBZtjPBBu6of5eGkEaIx6RxIM9ZAoY2QreLBNLypaWtkE8SgCw+Wwy+Lq
         beDcf6VKK7dfLO+SfEVGqoj1kMDTW32GRytELD1r9HRvEyNagr0FTcQEYNenN8TqHsUG
         LFjBtao9OX7HlFxQGZdHxETlqI+oCLtPuZARLhzLK1ZCNKjga90rDDb1brJbUzGiqGbm
         T7SnEpgHWa6qYBz/iWUCC88dfhzIHxczzTlYdnXNwhGuJRDXB2Kp3M9orQuiHaRDkKCl
         QaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504041; x=1746108841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OmKgb2P7k7ka3054x1IngydlF8noVj1FtGkMjW5J68k=;
        b=IL9cDbHCiCtB1N/EmBD+xTnUVUEM7dfn5wtLh830xgjNuPr3NeezmN2yvDLYQ2HsEX
         2dYzY34K/cGIjr6eSjqObLXW5nRRc98Jp0UwucxgWmpnpEmoUsv1dLG+4nCzfdl4iJPi
         /6bhfwBEywJnrZkvhNyc0jQpF0c+YIAlMw4onc2FLH+DnkxNzfmVn/dKu6PGcigkq41/
         POQE+KmpcIor4VPYTQxn5erKTROI2bWe7Hv5XlkiU/ETQsem5tHsXVykslXPDboL4nlZ
         SYkU3JONZmkg/7vyHJg3leUyedrhhCd6yaLLTe1wjJnI/1KVKbAtwFkACFSSWa3zAiUS
         cwWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBou4wB8oU/mQxEe5UoLRkMXt2iTmteS/pIjOPEYa/K5U/GKhL6IcgAr9NDeKQVkl4OvwCB9J1/CBwqrLi@vger.kernel.org
X-Gm-Message-State: AOJu0YwuWdoPgIp4ret3Q+2p925aCaSyda//CApTF1iNrR5tmZ+0rA65
	biJNiFtWBBGpPX92p6Lb1lLHMaLBUNYOd8OA8d2nq1QrybqulmV8Rt2S9lG0qns=
X-Gm-Gg: ASbGncuLnqVVP+P+NaJABZxEoER83JTijFVSAUNbzWiW7w11HpTmqRVXXS3fCzxWz++
	U+mNk000jymmE8+PMrRSia4SJiKneg371JuBBVIK0TguMRR/veFTom58luCGoKUKJFBiVb5GAdF
	o+/OQ1DVF6ryKCk0//swxJpammkQQC6xgWKBBvCCK65NA2tTIybnSGZuvN1H0Ia1Ka2ahau2LNv
	9ovoveWZLrVxq7tSdWsOLFGjs0nzlWDqYtmARsSmXvJ3yIbogoFQhnKBkcM0yWx+CHMYPVSIrnT
	IqvtEUUvRVf1pi4g1q9DnfTlAcdNSf5nnu94QMT6iIsl2riBzbsP6DywhVRG0Ek57/hCTe570cS
	PW1E+c/gWcmdMnMpaqSMj3wvpq9s=
X-Google-Smtp-Source: AGHT+IGfkZ98OulZ0pJYU5c1ld+aBqoKjFuSpgzRjo7Jvo/4HTkJCAjHkRJEje6F6WXTnu8CxQELEw==
X-Received: by 2002:a05:600c:3b0c:b0:43c:e8ba:e166 with SMTP id 5b1f17b1804b1-4409bd83db4mr21261755e9.22.1745504040937;
        Thu, 24 Apr 2025 07:14:00 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:00 -0700 (PDT)
From: Karim Manaouil <karim.manaouil@linaro.org>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Karim Manaouil <karim.manaouil@linaro.org>,
	Alexander Graf <graf@amazon.com>,
	Alex Elder <elder@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
	Quentin Perret <qperret@google.com>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Will Deacon <will@kernel.org>,
	Haripranesh S <haripran@qti.qualcomm.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>,
	Murali Nalajala <mnalajal@quicinc.com>,
	Sreenivasulu Chalamcharla <sreeniva@qti.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>
Subject: [RFC PATCH 12/34] gunyah: Add hypervisor driver
Date: Thu, 24 Apr 2025 15:13:19 +0100
Message-Id: <20250424141341.841734-13-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Elliot Berman <quic_eberman@quicinc.com>

Add driver to detect when running under Gunyah. It performs basic
identification hypercall and populates the platform bus for resource
manager to probe.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Reviewed-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 drivers/virt/Makefile        |  1 +
 drivers/virt/gunyah/Makefile |  3 +++
 drivers/virt/gunyah/gunyah.c | 52 ++++++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 drivers/virt/gunyah/Makefile
 create mode 100644 drivers/virt/gunyah/gunyah.c

diff --git a/drivers/virt/Makefile b/drivers/virt/Makefile
index f29901bd7820..ef6a3835d078 100644
--- a/drivers/virt/Makefile
+++ b/drivers/virt/Makefile
@@ -10,3 +10,4 @@ obj-y				+= vboxguest/
 obj-$(CONFIG_NITRO_ENCLAVES)	+= nitro_enclaves/
 obj-$(CONFIG_ACRN_HSM)		+= acrn/
 obj-y				+= coco/
+obj-y				+= gunyah/
diff --git a/drivers/virt/gunyah/Makefile b/drivers/virt/gunyah/Makefile
new file mode 100644
index 000000000000..34f32110faf9
--- /dev/null
+++ b/drivers/virt/gunyah/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_GUNYAH) += gunyah.o
diff --git a/drivers/virt/gunyah/gunyah.c b/drivers/virt/gunyah/gunyah.c
new file mode 100644
index 000000000000..3e795e3ba881
--- /dev/null
+++ b/drivers/virt/gunyah/gunyah.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/gunyah.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+static int gunyah_probe(struct platform_device *pdev)
+{
+	struct gunyah_hypercall_hyp_identify_resp gunyah_api;
+
+	if (!arch_is_gunyah_guest())
+		return -ENODEV;
+
+	gunyah_hypercall_hyp_identify(&gunyah_api);
+
+	pr_info("Running under Gunyah hypervisor %llx/v%u\n",
+		FIELD_GET(GUNYAH_API_INFO_VARIANT_MASK, gunyah_api.api_info),
+		gunyah_api_version(&gunyah_api));
+
+	/* Might move this out to individual drivers if there's ever an API version bump */
+	if (gunyah_api_version(&gunyah_api) != GUNYAH_API_V1) {
+		pr_info("Unsupported Gunyah version: %u\n",
+			gunyah_api_version(&gunyah_api));
+		return -ENODEV;
+	}
+
+	return devm_of_platform_populate(&pdev->dev);
+}
+
+static const struct of_device_id gunyah_of_match[] = {
+	{ .compatible = "qcom,gunyah-hypervisor" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, gunyah_of_match);
+
+/* clang-format off */
+static struct platform_driver gunyah_driver = {
+	.probe = gunyah_probe,
+	.driver = {
+		.name = "gunyah",
+		.of_match_table = gunyah_of_match,
+	}
+};
+/* clang-format on */
+module_platform_driver(gunyah_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Gunyah Driver");
-- 
2.39.5


