Return-Path: <linux-arm-msm+bounces-55415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 193C3A9B071
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 16:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 533F64A41A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 14:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD1C284B55;
	Thu, 24 Apr 2025 14:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j9+iKa4W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043312820B5
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 14:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504042; cv=none; b=lIp4gxY14+bGGKcKke8x6IiUf/HD4rfUNSNUSH1NYdX/aXGcRo6xt1zpSXEFwAdkqGrOjzNELfFKHKPQkQ58zYt6JzYFvOjltvrKv8/3CJE3JgQSFZHmPPjluWoGQzEvIGA5RC1oLDh4UavR9gpKD/zu6PymZ5t3OtIItgslG4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504042; c=relaxed/simple;
	bh=zpH5RWwn66pK/eMc3LSMNEkV/3yaevWoUA1/kvmrIcs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AiEg1T9W95ZjjjIpmHj8yrdEDLTbxA5voMAWHdq0U+GZmSFx37f8B+M0xNh0p2VE4IVvSHBdL9ku7CHCdWL+yviWXewtfEI3jvPvypcchVWD63OZc/gRd8aZl7oSmDQe71jiKoNi2S8mpJXtTu+xXkmAOmjQaN22Gz1g7Phtvbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j9+iKa4W; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39ee623fe64so1026444f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 07:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504038; x=1746108838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RusfJk/Wwgs+hfa3WlHRZBdqt7Zg7qYVP8LFIn+weQg=;
        b=j9+iKa4WCT/mz4U6jOuEjxqBAIM17fNBuPra7vwuEWL0QXoKe6DkDeChGdfSfN2jqZ
         uCaRbiExMKGx6vkJmOf6uDYYMezLzUdvO3PzNablg6nTHG7sKC5ygO7dxRWP12DQb/Lo
         ncNWWVX00LNc9y6vT9WTBjPdHkjhCEe1ppVdr+2tyhjPTJf7tIR0lHWwMgINoRHhtrzz
         KBZh7idT029V7GaVEdLIlUlagIvjMV72pL5JYshgff1oMFthqajbTK4j6rmb1Xy/vP62
         O6qovaWNGZ14gRNMMC0hn7jK7GW9RnF132Bax0dN4BK/6ziNhLy/woVUD4piL85of4bM
         P50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504038; x=1746108838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RusfJk/Wwgs+hfa3WlHRZBdqt7Zg7qYVP8LFIn+weQg=;
        b=OYI4wLPNe1gzSXc7ELUH47LYPRwPGrbhdeUpOFvRPkiahsrRYWulfXYquG7aQhpwqk
         i+5dQ8TY3/wIjUd3wDzcV8+rxWxYgxqB5CDtTvfxtzbJ6yNuN4SWFhxPpd5ccqFGigcG
         zzcYegnCJ2xqEDWvKKrDFUS/pKpjcuBb6IxyI1268Qd5XAJijR1y1l5jil8Thi669u3T
         ZVhK3xuYHnyg4jjP7YkNWQGzC38yDhk6hJ40SB6kditAONPCZnaQd3WkzpB60lyDR1+d
         coQdGCIbKbeYLhlGoMpzHpu/Q9RYwcA76KYyo8XlIZK728HqsY0TuzCm3VV3fnQHEc0+
         jLFg==
X-Forwarded-Encrypted: i=1; AJvYcCUa/9D0n017XwTM3TyatHlSBpVAlsCRAxKc0Siy2DQrax4UMa4u55dJ29Nd+k5TZkq/npJLyWLUaOvYNs80@vger.kernel.org
X-Gm-Message-State: AOJu0YwXV/ioGBYnkmaQRYgfU4O3sIPRCMiqYiTqN/kJJx/KE5pHLbz9
	bxTTeT5xv4WDyC6OFWCQBfCijAHumdfMf6//vKcgmw8rlJoQYEwYQvMC50OdIeg=
X-Gm-Gg: ASbGncsDwRPP/dGdQL5ANaYbDLnx5Smjob4BrwLHYf3Bj6ZcTPrsicOT8lGUS1aUQ02
	oJONssyP8l9ExqcS/rFTrVkTI4ykVWttE1YhquViVBxfhUZ4ZXdK4qz895p2ofFlOaCqESjkVNI
	R4Ugsg51OOYLc4hkJFdE6DX4nZM+Kv8DSnZi/6yTl0Eg5pqlew2JoD/BZh3c5PpqoCyMB2Cvjdi
	DvyoXCwnGPU/V4IpjE3HM6XLxgLh7cdyTgCxcSel/whfDIW4m/ekTMfxqxkxGFv00ACbm2KvNxP
	PBjcLDSK361xpu0B4EF0RxEVWECluDS8hdlYzQwVitnY+szrJpXOxXC0pTxKayHZ9rwdnv6j744
	DUuYAqiSvh+H2XtPgoM+Wbq7ejT8=
X-Google-Smtp-Source: AGHT+IFmkqrLYBA6pxT3bgHP40xSeHaZYwIrDUExxYU5PjMxiNNE1p1s+eiHaAutjdes9ZQldE7V0g==
X-Received: by 2002:a05:6000:188d:b0:39e:dbee:f644 with SMTP id ffacd0b85a97d-3a06cfa5a93mr2715557f8f.46.1745504038249;
        Thu, 24 Apr 2025 07:13:58 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:13:57 -0700 (PDT)
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
	Elliot Berman <quic_eberman@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Alex Elder <elder@linaro.org>
Subject: [RFC PATCH 10/34] gunyah: Common types and error codes for Gunyah hypercalls
Date: Thu, 24 Apr 2025 15:13:17 +0100
Message-Id: <20250424141341.841734-11-karim.manaouil@linaro.org>
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

Add architecture-independent standard error codes, types, and macros for
Gunyah hypercalls.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 include/linux/gunyah.h | 106 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 include/linux/gunyah.h

diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
new file mode 100644
index 000000000000..1eab631a49b6
--- /dev/null
+++ b/include/linux/gunyah.h
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _LINUX_GUNYAH_H
+#define _LINUX_GUNYAH_H
+
+#include <linux/errno.h>
+#include <linux/interrupt.h>
+#include <linux/limits.h>
+
+/* Matches resource manager's resource types for VM_GET_HYP_RESOURCES RPC */
+enum gunyah_resource_type {
+	/* clang-format off */
+	GUNYAH_RESOURCE_TYPE_BELL_TX	= 0,
+	GUNYAH_RESOURCE_TYPE_BELL_RX	= 1,
+	GUNYAH_RESOURCE_TYPE_MSGQ_TX	= 2,
+	GUNYAH_RESOURCE_TYPE_MSGQ_RX	= 3,
+	GUNYAH_RESOURCE_TYPE_VCPU	= 4,
+	GUNYAH_RESOURCE_TYPE_MEM_EXTENT	= 9,
+	GUNYAH_RESOURCE_TYPE_ADDR_SPACE	= 10,
+	/* clang-format on */
+};
+
+struct gunyah_resource {
+	enum gunyah_resource_type type;
+	u64 capid;
+	unsigned int irq;
+};
+
+/******************************************************************************/
+/* Common arch-independent definitions for Gunyah hypercalls                  */
+#define GUNYAH_CAPID_INVAL U64_MAX
+#define GUNYAH_VMID_ROOT_VM 0xff
+
+enum gunyah_error {
+	/* clang-format off */
+	GUNYAH_ERROR_OK				= 0,
+	GUNYAH_ERROR_UNIMPLEMENTED		= -1,
+	GUNYAH_ERROR_RETRY			= -2,
+
+	GUNYAH_ERROR_ARG_INVAL			= 1,
+	GUNYAH_ERROR_ARG_SIZE			= 2,
+	GUNYAH_ERROR_ARG_ALIGN			= 3,
+
+	GUNYAH_ERROR_NOMEM			= 10,
+
+	GUNYAH_ERROR_ADDR_OVFL			= 20,
+	GUNYAH_ERROR_ADDR_UNFL			= 21,
+	GUNYAH_ERROR_ADDR_INVAL			= 22,
+
+	GUNYAH_ERROR_DENIED			= 30,
+	GUNYAH_ERROR_BUSY			= 31,
+	GUNYAH_ERROR_IDLE			= 32,
+
+	GUNYAH_ERROR_IRQ_BOUND			= 40,
+	GUNYAH_ERROR_IRQ_UNBOUND		= 41,
+
+	GUNYAH_ERROR_CSPACE_CAP_NULL		= 50,
+	GUNYAH_ERROR_CSPACE_CAP_REVOKED		= 51,
+	GUNYAH_ERROR_CSPACE_WRONG_OBJ_TYPE	= 52,
+	GUNYAH_ERROR_CSPACE_INSUF_RIGHTS	= 53,
+	GUNYAH_ERROR_CSPACE_FULL		= 54,
+
+	GUNYAH_ERROR_MSGQUEUE_EMPTY		= 60,
+	GUNYAH_ERROR_MSGQUEUE_FULL		= 61,
+	/* clang-format on */
+};
+
+/**
+ * gunyah_error_remap() - Remap Gunyah hypervisor errors into a Linux error code
+ * @gunyah_error: Gunyah hypercall return value
+ */
+static inline int gunyah_error_remap(enum gunyah_error gunyah_error)
+{
+	switch (gunyah_error) {
+	case GUNYAH_ERROR_OK:
+		return 0;
+	case GUNYAH_ERROR_NOMEM:
+		return -ENOMEM;
+	case GUNYAH_ERROR_DENIED:
+	case GUNYAH_ERROR_CSPACE_CAP_NULL:
+	case GUNYAH_ERROR_CSPACE_CAP_REVOKED:
+	case GUNYAH_ERROR_CSPACE_WRONG_OBJ_TYPE:
+	case GUNYAH_ERROR_CSPACE_INSUF_RIGHTS:
+		return -EACCES;
+	case GUNYAH_ERROR_CSPACE_FULL:
+	case GUNYAH_ERROR_BUSY:
+	case GUNYAH_ERROR_IDLE:
+		return -EBUSY;
+	case GUNYAH_ERROR_IRQ_BOUND:
+	case GUNYAH_ERROR_IRQ_UNBOUND:
+	case GUNYAH_ERROR_MSGQUEUE_FULL:
+	case GUNYAH_ERROR_MSGQUEUE_EMPTY:
+		return -EIO;
+	case GUNYAH_ERROR_UNIMPLEMENTED:
+		return -EOPNOTSUPP;
+	case GUNYAH_ERROR_RETRY:
+		return -EAGAIN;
+	default:
+		return -EINVAL;
+	}
+}
+
+#endif
-- 
2.39.5


