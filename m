Return-Path: <linux-arm-msm+bounces-55424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBC3A9B08B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 16:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8F031B82096
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 14:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874C528CF73;
	Thu, 24 Apr 2025 14:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PJZRrhye"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AB928DEFA
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 14:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504056; cv=none; b=gJlgI9gcC72WEc1eECzTKarbHzM1Ng0e/gCH+Fdqr3SEodmGVylvQ3fX3NDs03NTgZHeMHv67roH1jiunQ/BV2Bu+6bjDDmiXVt6jPhtGLy1dS4PVFg/yK/6IuMx5iRLrSJljUzCzTlvy7zzha2nbySEfX57CmGslkUEUQ3Tsk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504056; c=relaxed/simple;
	bh=2aIlJTxyajv9w1JNq2QUWNBaFE1l1Iz4MgPOHzkWSHs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Na/nWySWP0rMl75owzx3kAaDtXqRLP5cg8+sWj2m+cP0nOxLwZIV3WC7Qr1+uAp/ll0vwTYfXnYxpF/pmS+NGinBtFg4KlqMnUvvKWveonSoeXwASc/kuT0vmPGaEGRJs6DwKIsFYwmbtdm980xK0jYoeXaZm+hducdO7VbAsBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PJZRrhye; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so989525f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 07:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504051; x=1746108851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnnNrRFux5qVcGjuNFA0c9YQRdgVNUximYQurTlnUC4=;
        b=PJZRrhyeB9kFuh5fnr6Nbxc6hBWs4a64QdPEFmN6EjippJ8/wFu+CIKUVczzDUBqh3
         afTa0zEhR+philf+002ackoL6VTNxbBgqwzH3tecbFIHxuzwa93EtCfPNNnTilwq7gm6
         Q5ZOQ52nyt5CUsXzxFumP4ORZN0zxiWGoAx1odVSisLG4VW79iVky/ct8IuYjx3ziW0A
         NB1P3pxFsx/voIgr8Fn9gjhRZAk+/21vaiehhkayNW42Fqk6NyJaexztNuffnx+/BqOc
         qigxJdZ2AUmPsYD6qeYmRUQhvRWkn8h0xx33NFpO8sBwTFvmDtZI0e4/CPbM9C+izJzZ
         xVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504051; x=1746108851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnnNrRFux5qVcGjuNFA0c9YQRdgVNUximYQurTlnUC4=;
        b=qbHviPec2RuKse61CxHUYe8JOG7Dl95BuDY5r68kr+onDKA7Av3sKQfDYlbpz9Z8kl
         8ejoy+pxk07haY1Hfgeqw3uD9lhkGWDK5cGYzGbiLvTPTlqfvgKSgSL8SDs2om/OvyGO
         Mn1UoOshMbHPrVzJaR3FZb+3ZAvA2mbsbDcYCROm1dt5DLuLR+nhQqOqxGs7oHgt6HGw
         YXlDWLQW8+PEa6zgVCqzluupHrlGG/gLGHO41TbXqGjvW29EQ8Fi9XjOWCNCBg3NRE+P
         7A2Z1JTJig6JE9k3wgj8whyUHGZSrfBhGL7kEkPcurbrN80+izacClVqD9i7LVAaVa64
         tlBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyH1GvZUN0yxi52j7xjDZe6gmw1ZCaL6OGlzij2ryo6ScX0uapd8nMOI7FF/vILmsjKudBIEf2iXtuXhj5@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjw6xS4Y2uq7+11BOnWxgjBUBvQnF7AAxw/gP8dvK1OamQyrpb
	s1zOpix2xpFcP6Lh6u8PzzFJvl8coDoR3cqNEkQ8Rdr6jgpcNn++a5wdgckOj3c=
X-Gm-Gg: ASbGnctLPuD2pdrzhyllNuuoiIfmENohGK/9GmAV1WV24oVLBynAcyX5jEG0UU5spSw
	IeCMoXPRoqMVBSbf4Iaj7XexrRzg8aEsewnDvJbKAEewX3vbVLGS6WQuLKTo0M4B1y0pm35yR2i
	WhDw0bf+diyBV1aRr0Iik2vQI1AAl7m4twbGAy/DSxXCtNu3tthxJXBu7H2YfDVhHg7lvrvQmvt
	6FLg7QdQG1eqmrsYJKOOXsmrB6Ne+F/KCoYp4di62dRD8lMeZ/NdiLG5XPM2fV5gNxHtDR7fvLv
	Oj0FPtQ+kwl04MEqyxRE0AabqhIUcnqCfXCF3wDA/UFYqrXWjKUzqWrekhAhWXs2/j5EOhLTVV6
	TXY3ozUC5w7V8iFqv
X-Google-Smtp-Source: AGHT+IElBFJDMQbW748Xhn6uR3Gy7UiwZwfaHD4iyiwy3AqrKyTZYkKWwIgzmc9HZX/EcWP9CEo9Lw==
X-Received: by 2002:a05:6000:18a2:b0:391:47d8:de2d with SMTP id ffacd0b85a97d-3a06cf5ed4cmr2483522f8f.23.1745504050693;
        Thu, 24 Apr 2025 07:14:10 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:10 -0700 (PDT)
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
Subject: [RFC PATCH 19/34] gunyah: Add hypercalls for running a vCPU
Date: Thu, 24 Apr 2025 15:13:26 +0100
Message-Id: <20250424141341.841734-20-karim.manaouil@linaro.org>
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

Add hypercall to donate CPU time to a vCPU.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Reviewed-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 arch/arm64/gunyah/gunyah_hypercall.c | 37 ++++++++++++++++++++++++++++
 include/linux/gunyah.h               | 35 ++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/arch/arm64/gunyah/gunyah_hypercall.c b/arch/arm64/gunyah/gunyah_hypercall.c
index 1302e128be6e..fee21df42c17 100644
--- a/arch/arm64/gunyah/gunyah_hypercall.c
+++ b/arch/arm64/gunyah/gunyah_hypercall.c
@@ -39,6 +39,7 @@ EXPORT_SYMBOL_GPL(arch_is_gunyah_guest);
 #define GUNYAH_HYPERCALL_HYP_IDENTIFY		GUNYAH_HYPERCALL(0x8000)
 #define GUNYAH_HYPERCALL_MSGQ_SEND		GUNYAH_HYPERCALL(0x801B)
 #define GUNYAH_HYPERCALL_MSGQ_RECV		GUNYAH_HYPERCALL(0x801C)
+#define GUNYAH_HYPERCALL_VCPU_RUN		GUNYAH_HYPERCALL(0x8065)
 /* clang-format on */
 
 /**
@@ -113,5 +114,41 @@ enum gunyah_error gunyah_hypercall_msgq_recv(u64 capid, void *buff, size_t size,
 }
 EXPORT_SYMBOL_GPL(gunyah_hypercall_msgq_recv);
 
+/**
+ * gunyah_hypercall_vcpu_run() - Donate CPU time to a vcpu
+ * @capid: capability ID of the vCPU to run
+ * @resume_data: Array of 3 state-specific resume data
+ * @resp: Filled reason why vCPU exited when return value is GUNYAH_ERROR_OK
+ *
+ * See also:
+ * https://github.com/quic/gunyah-hypervisor/blob/develop/docs/api/gunyah_api.md#run-a-proxy-scheduled-vcpu-thread
+ */
+enum gunyah_error
+gunyah_hypercall_vcpu_run(u64 capid, unsigned long *resume_data,
+			  struct gunyah_hypercall_vcpu_run_resp *resp)
+{
+	struct arm_smccc_1_2_regs args = {
+		.a0 = GUNYAH_HYPERCALL_VCPU_RUN,
+		.a1 = capid,
+		.a2 = resume_data[0],
+		.a3 = resume_data[1],
+		.a4 = resume_data[2],
+		/* C language says this will be implictly zero. Gunyah requires 0, so be explicit */
+		.a5 = 0,
+	};
+	struct arm_smccc_1_2_regs res;
+
+	arm_smccc_1_2_hvc(&args, &res);
+	if (res.a0 == GUNYAH_ERROR_OK) {
+		resp->sized_state = res.a1;
+		resp->state_data[0] = res.a2;
+		resp->state_data[1] = res.a3;
+		resp->state_data[2] = res.a4;
+	}
+
+	return res.a0;
+}
+EXPORT_SYMBOL_GPL(gunyah_hypercall_vcpu_run);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Gunyah Hypervisor Hypercalls");
diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
index 573e3bbd4cb6..f86f14018734 100644
--- a/include/linux/gunyah.h
+++ b/include/linux/gunyah.h
@@ -219,4 +219,39 @@ enum gunyah_error gunyah_hypercall_msgq_send(u64 capid, size_t size, void *buff,
 enum gunyah_error gunyah_hypercall_msgq_recv(u64 capid, void *buff, size_t size,
 					     size_t *recv_size, bool *ready);
 
+struct gunyah_hypercall_vcpu_run_resp {
+	union {
+		enum {
+			/* clang-format off */
+			/* VCPU is ready to run */
+			GUNYAH_VCPU_STATE_READY			= 0,
+			/* VCPU is sleeping until an interrupt arrives */
+			GUNYAH_VCPU_STATE_EXPECTS_WAKEUP	= 1,
+			/* VCPU is powered off */
+			GUNYAH_VCPU_STATE_POWERED_OFF		= 2,
+			/* VCPU is blocked in EL2 for unspecified reason */
+			GUNYAH_VCPU_STATE_BLOCKED		= 3,
+			/* VCPU has returned for MMIO READ */
+			GUNYAH_VCPU_ADDRSPACE_VMMIO_READ	= 4,
+			/* VCPU has returned for MMIO WRITE */
+			GUNYAH_VCPU_ADDRSPACE_VMMIO_WRITE	= 5,
+			/* VCPU blocked on fault where we can demand page */
+			GUNYAH_VCPU_ADDRSPACE_PAGE_FAULT	= 7,
+			/* clang-format on */
+		} state;
+		u64 sized_state;
+	};
+	u64 state_data[3];
+};
+
+enum {
+	GUNYAH_ADDRSPACE_VMMIO_ACTION_EMULATE = 0,
+	GUNYAH_ADDRSPACE_VMMIO_ACTION_RETRY = 1,
+	GUNYAH_ADDRSPACE_VMMIO_ACTION_FAULT = 2,
+};
+
+enum gunyah_error
+gunyah_hypercall_vcpu_run(u64 capid, unsigned long *resume_data,
+			  struct gunyah_hypercall_vcpu_run_resp *resp);
+
 #endif
-- 
2.39.5


