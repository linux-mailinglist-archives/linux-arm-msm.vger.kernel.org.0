Return-Path: <linux-arm-msm+bounces-55418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B72CA9B07F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 16:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 983B57A688D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 14:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA75028A1D9;
	Thu, 24 Apr 2025 14:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aAsLp2wi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A336288C8A
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 14:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504046; cv=none; b=K15OB8NXPbCkCX+R2AFXiEOUBFyECzRUNMJU9TyeAREUr1RgxcELYx0TE+S1xgkQCvP+pMwQ3DXt0FPEKePQC7jqcXzFA0zl+7YCSI1qfNX533At/1/XJ4QlwLWwweTJqXLE0bimLJw9MsJ/pOjEFGiLnmXT7Uf2pZ75YQ72C50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504046; c=relaxed/simple;
	bh=cRJdZ/BvpG7Nf2HfvkjONlA6iN6G9YZT/kvCa6h8Pqk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T6yRULJQ7TsQxXKV6ODxkoEUp0ixzfs63rgB6a/X7MlfGgtbZU4Ct+to6vH+2EEFkCWmJ/0N6mYXDoFdgYafYphtbcYUdPcSZDFyt1M+wrmXQNMXIJzP/42gTkCmWjapVPnHEv1Er0Q4shmV+Yc7qW5ZSMHlIJ7pjDRpTbRhmbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aAsLp2wi; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so7616575e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 07:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504042; x=1746108842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iugp3VZMso7R61paVQ20sor9LWthQ+vE2iyUDGP7wsk=;
        b=aAsLp2wiL4SnGGfuvk26Iktqh4BJnxFfKcsSxvjPEagGx7fi/GliYmXzZdgxm3FCgY
         R/qwu/efZXZX7uKjiHZUoXchN/W/kcp5mMR2C5anR2hcIJ3vbCm0XaoUacmQvPV2g4gC
         HvHEBkPZop2ckBPqpxuors2ZNP2+rwt8rpotniV0U9YiCzMm2V0lXTsv1bEPFgXatILl
         U/awvhfv2MzQmr0N5FntwhNSvD/lPVBu2z7/NmOrnMklRKIOceLIopPA4Y1gRvEZFHOD
         9Kr+mQE/POTKy/7qng9AwhhvaG/MFOECRAnsoxCXf/aZag79pLOhLgzi7sjdzUZ9WG4K
         /FNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504042; x=1746108842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iugp3VZMso7R61paVQ20sor9LWthQ+vE2iyUDGP7wsk=;
        b=Gt4S4aHZ0LTE83aRMCkUt+sgr/w4wfHisuY/LNmYUu0HPZeMDWMOocB3JMNRbhoXb7
         ElSJUDmV+GzJZ01fo80GDNkInfiMHSTdZ24ACFR5FWMcGdGBvxcp7EkHyf3sR3O+QrWY
         YXThh2nzY2PysczoFqRH+jUeHgY5emMJHtrCmgrIrqBIAqU/pnkXzgAqJ+V6iA7RZz52
         HJhr1EzjX6ul9Uarj1r+D/6DfmcSgufKKf6CoY/+OQ8/NO7pTPtopLwm+3NAstzZqjm0
         HLYhZ1ssVpDUjRLh1RSBToquoft8dqom7pWqAEWJSmkADv0XFfxaAF/ilM37Yk6Bi9VE
         dsSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuLoDoG6C9bPDYyTKpry0hP7oL17JJBqFNpV/9WFm5kWSEhcEP7ejxEVtaEogAt0p+VUUdtZ9O2Z56j2Ed@vger.kernel.org
X-Gm-Message-State: AOJu0YxGQdxyGoYJkaB40qE3JYg9l/1dgc6Na0GT9mF1P25MS4uGrzDY
	xoUPpvaj7ppg8muLLe9Ps1i/l7ioU0l0knWGESJGUAbs6N2zDpAOmi4igWMCWMc=
X-Gm-Gg: ASbGnct/aIa2aC095YWjp5ZKVt/xacSz/ZxtyCkYPSiuekcD0eDTLyC+UCicMldvIRx
	ZJW+vaxXetlrhNA8iyiUOX6rsv6M3/FTENkuMto4oxvV93FRa9Iibpe8IGCMs/T6zNw6LUUTrVI
	4PRFWVfSF49zvO8QQqqc+oOAqdWzxJNTEqSZ/qHSE/zYzIyGpXyIkvqg8YwOUaZ3q7V9RFdDhzp
	R1G2NyPXU77WvmwhZugyx32Cw5dFI87PPVl9bMA9TzdN7KTHP8n72qPsMay08EPW4DXdp7ZmtA0
	UCHot1x6iWczndDgm9BJNJWaX0OnpZq1BKpiCEV+rjVdAymU5jw6DPgkquxfLiI5/29iwIt7wm3
	1gNi0K2ue91p5BNT5
X-Google-Smtp-Source: AGHT+IFb5JrKaNG2KfYhmzfwfaDb/IjykBP33KVSW9og9BEhgmgsW+e69hlvAOQj6I5jNodxA+AwfQ==
X-Received: by 2002:a05:600c:c092:b0:43c:e2dd:98ea with SMTP id 5b1f17b1804b1-4409c3b1e1amr23970305e9.22.1745504042259;
        Thu, 24 Apr 2025 07:14:02 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:01 -0700 (PDT)
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
	Alex Elder <elder@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RFC PATCH 13/34] gunyah: Add hypercalls to send and receive messages
Date: Thu, 24 Apr 2025 15:13:20 +0100
Message-Id: <20250424141341.841734-14-karim.manaouil@linaro.org>
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

Add hypercalls to send and receive messages on a Gunyah message queue.

Reviewed-by: Alex Elder <elder@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 arch/arm64/gunyah/gunyah_hypercall.c | 55 ++++++++++++++++++++++++++++
 include/linux/gunyah.h               |  8 ++++
 2 files changed, 63 insertions(+)

diff --git a/arch/arm64/gunyah/gunyah_hypercall.c b/arch/arm64/gunyah/gunyah_hypercall.c
index d44663334f38..1302e128be6e 100644
--- a/arch/arm64/gunyah/gunyah_hypercall.c
+++ b/arch/arm64/gunyah/gunyah_hypercall.c
@@ -37,6 +37,8 @@ EXPORT_SYMBOL_GPL(arch_is_gunyah_guest);
 
 /* clang-format off */
 #define GUNYAH_HYPERCALL_HYP_IDENTIFY		GUNYAH_HYPERCALL(0x8000)
+#define GUNYAH_HYPERCALL_MSGQ_SEND		GUNYAH_HYPERCALL(0x801B)
+#define GUNYAH_HYPERCALL_MSGQ_RECV		GUNYAH_HYPERCALL(0x801C)
 /* clang-format on */
 
 /**
@@ -58,5 +60,58 @@ void gunyah_hypercall_hyp_identify(
 }
 EXPORT_SYMBOL_GPL(gunyah_hypercall_hyp_identify);
 
+/**
+ * gunyah_hypercall_msgq_send() - Send a buffer on a message queue
+ * @capid: capability ID of the message queue to add message
+ * @size: Size of @buff
+ * @buff: Address of buffer to send
+ * @tx_flags: See GUNYAH_HYPERCALL_MSGQ_TX_FLAGS_*
+ * @ready: If the send was successful, ready is filled with true if more
+ *         messages can be sent on the queue. If false, then the tx IRQ will
+ *         be raised in future when send can succeed.
+ */
+enum gunyah_error gunyah_hypercall_msgq_send(u64 capid, size_t size, void *buff,
+					     u64 tx_flags, bool *ready)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_hvc(GUNYAH_HYPERCALL_MSGQ_SEND, capid, size,
+			  (uintptr_t)buff, tx_flags, 0, &res);
+
+	if (res.a0 == GUNYAH_ERROR_OK)
+		*ready = !!res.a1;
+
+	return res.a0;
+}
+EXPORT_SYMBOL_GPL(gunyah_hypercall_msgq_send);
+
+/**
+ * gunyah_hypercall_msgq_recv() - Send a buffer on a message queue
+ * @capid: capability ID of the message queue to add message
+ * @buff: Address of buffer to copy received data into
+ * @size: Size of @buff
+ * @recv_size: If the receive was successful, recv_size is filled with the
+ *             size of data received. Will be <= size.
+ * @ready: If the receive was successful, ready is filled with true if more
+ *         messages are ready to be received on the queue. If false, then the
+ *         rx IRQ will be raised in future when recv can succeed.
+ */
+enum gunyah_error gunyah_hypercall_msgq_recv(u64 capid, void *buff, size_t size,
+					     size_t *recv_size, bool *ready)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_hvc(GUNYAH_HYPERCALL_MSGQ_RECV, capid, (uintptr_t)buff,
+			  size, 0, &res);
+
+	if (res.a0 == GUNYAH_ERROR_OK) {
+		*recv_size = res.a1;
+		*ready = !!res.a2;
+	}
+
+	return res.a0;
+}
+EXPORT_SYMBOL_GPL(gunyah_hypercall_msgq_recv);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Gunyah Hypervisor Hypercalls");
diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
index 33bcbd22d39f..acd70f982425 100644
--- a/include/linux/gunyah.h
+++ b/include/linux/gunyah.h
@@ -141,4 +141,12 @@ gunyah_api_version(const struct gunyah_hypercall_hyp_identify_resp *gunyah_api)
 void gunyah_hypercall_hyp_identify(
 	struct gunyah_hypercall_hyp_identify_resp *hyp_identity);
 
+/* Immediately raise RX vIRQ on receiver VM */
+#define GUNYAH_HYPERCALL_MSGQ_TX_FLAGS_PUSH BIT(0)
+
+enum gunyah_error gunyah_hypercall_msgq_send(u64 capid, size_t size, void *buff,
+					     u64 tx_flags, bool *ready);
+enum gunyah_error gunyah_hypercall_msgq_recv(u64 capid, void *buff, size_t size,
+					     size_t *recv_size, bool *ready);
+
 #endif
-- 
2.39.5


