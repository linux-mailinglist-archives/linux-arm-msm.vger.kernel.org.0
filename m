Return-Path: <linux-arm-msm+bounces-55439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A48BA9B0BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 16:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F8AE1B65984
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 14:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5311D9694;
	Thu, 24 Apr 2025 14:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A/BNi9dr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1423B29617A
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 14:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504074; cv=none; b=Pr47TLa1KErdOWnMosDVIsAZY48Ubsf1MB53gO23Sblsa5/3rcZxAN3fIOIVb0f0Rrt4IWQaXF6/zvQNF6vtNdHbVL5Ihmldkz28Ea4gtg02UMy++rwYG1iKH/n7o6W6gG71RauHtmrq/iZh0DDJZdlRC5VcXIskDBadEi7zYWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504074; c=relaxed/simple;
	bh=N53i4bFiZ0PwECXO+3O9PEZg7KbhghQli4Mhy0f7goE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KbEsX9wB7s3VmUoKVl/JES/4gLp2OoO1+y3xK0ZNCpupiIc4SAUc/XeF8ch8SpCwtsLNJ2qmmebnShHPEHI2iOWMvw9M1qKY8qlwbGQbBSHux8FwV3MfTOoLKt8Io6HNQ/iIUu4ML9iW9UDeJgLkf1zQTLSSdV4t2CcHZ4xQzsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A/BNi9dr; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c1efc4577so642624f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 07:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504070; x=1746108870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3i+gLyWtr6XPiioNUTryX7U5TAHJs0bj5+QGltLz/R0=;
        b=A/BNi9drAEtZYzDLWDDHNkbHoLQ7G/rSzO6lWtT9wJBxxPLNRLXjqG2CV9Xf5QbQBT
         Sd9zeNztMZUVOCRA5OflPbZpQ0GAQKMtgYOZVkl6AYSf1iMSjRA5bELWM2/2Ro5G2jLp
         uJnN4FsqDjPExjGbLQI6o4GhGLVBgLi7/xUjnivg4y9khXjgA3Dmmzsi1UOyqNBUNBT8
         MVi1QC4XXmiTDjqog5ZbsG6l9kZaoZlE4hgdKAohqlGXx7MczFhDs/rVxT/XoUHclq03
         v+rEjUJ0/gcda3IVfMtpZfSgpUg8mpRx1XLX5Yctye5hH+r06rdmsphQr+bWu8Cqrz5t
         eCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504070; x=1746108870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3i+gLyWtr6XPiioNUTryX7U5TAHJs0bj5+QGltLz/R0=;
        b=nFkLWERdMqrbmb6Bn/Xd8w1EPqd7A7E3+FzvEo34J5xKuQsRKWpD+P4UKAWSAS+dEv
         EHWPuJnJLSfs4SH09EFMY9jkukqkjDpIunIP5Hn+FZ02aELRVcF6S3Fwo8gqX7Jjx3T5
         Jl5BypI2SPdDYrbcx7ojO2Mi94CF0o7rWDQ00NW6AvY4vq9usm5qsgHU59knisV5h1Xh
         F5VTLMBynHEhzKivVScgxYOW5Fy+Hsjstv2FvoRd9Zdct4MMkdhAuQ8STg6U5nTGPRhR
         kMXk/WRzECFHS166eHPnP9PDU/NlR4mqOj8j8ehva3GQTpsxl40UFzzsJ8LPL+gKu/dX
         XoYg==
X-Forwarded-Encrypted: i=1; AJvYcCWfuHDULefg6NOGzN5qYIuLZRGIG6jqIrbYDp3IWjvQzdNf442yqzk2t40222AAufvO68hC5h568l1FwBbE@vger.kernel.org
X-Gm-Message-State: AOJu0YyQO1F35yIDl1leta4NN3h9pZmVLrAlbo9WdJ0dtV0pfV+tP6sS
	FxCLb7LbIJ1Zako1FsDg0RhvWRidjWzX4BMM6weJI9Z12pz2GhT3fjncu3SOdNs=
X-Gm-Gg: ASbGnct30OFupbStl1zr9AObviu95MqVs4WvohlDegOdTw17lBELZVTS+lEXB9iKWMr
	eddgBpalJPI2yJ3fEad2d9y79w6d9SbHX+hEvxfJD3VjzYiWzg2SUtWzKQ+3J1yazU7wi8dti+c
	1oZru95xZCe1r1ENDLbwNKP4TuQmkGvUH/OYvLKFz2FEDiEx0ft3lrZV1Z9UN6Yg09cCI1KBh7a
	QciRbwWucpuOinKO1HAdy9coWHekUdUcB3r2LEJcFFdrgregdFXRV2oEzpMphKs3SDAujU1mKZK
	RXWm6lcoqwk2XJmmor8SMysaNzHs0LI7YcJcQCdU3djbyr8h/AxnYcHUIcoIsYhKPVv9y0a+v7F
	SPuv6AVJfREQtYuAm
X-Google-Smtp-Source: AGHT+IFOk65S5hPF/j31g7Of/aiN0lBptA3ImD/zObUzEDJUJE+zLunCG1fROxNheO7aYYEMJ9HW0A==
X-Received: by 2002:a5d:5f87:0:b0:38d:b325:471f with SMTP id ffacd0b85a97d-3a06cf5ac50mr2557177f8f.15.1745504070317;
        Thu, 24 Apr 2025 07:14:30 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:29 -0700 (PDT)
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
	Stefan Schmidt <stefan.schmidt@linaro.org>
Subject: [RFC PATCH 34/34] KVM: gunyah: enable KVM for Gunyah
Date: Thu, 24 Apr 2025 15:13:41 +0100
Message-Id: <20250424141341.841734-35-karim.manaouil@linaro.org>
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

Enable KVM to act as the interface to create and manage Qualcomm's
Gunyah-based virtual machines [1].

[1] https://www.qualcomm.com/developer/blog/2024/08/learn-about-gunyah--qualcomm-s-open-source--lightweight-hypervis

Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 arch/arm64/kvm/gunyah.c      | 12 ++++++++++++
 drivers/virt/gunyah/gunyah.c |  3 +++
 include/linux/gunyah.h       |  1 +
 3 files changed, 16 insertions(+)

diff --git a/arch/arm64/kvm/gunyah.c b/arch/arm64/kvm/gunyah.c
index 23b9128bf5b1..91f0260ef3f5 100644
--- a/arch/arm64/kvm/gunyah.c
+++ b/arch/arm64/kvm/gunyah.c
@@ -2071,3 +2071,15 @@ void kvm_arch_free_vm(struct kvm *kvm)
 
 	kfree(ghvm);
 }
+
+int kvm_gunyah_init(void)
+{
+	int err;
+
+	err = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
+	if (err)
+		return err;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kvm_gunyah_init);
diff --git a/drivers/virt/gunyah/gunyah.c b/drivers/virt/gunyah/gunyah.c
index 3e795e3ba881..629c812fbac0 100644
--- a/drivers/virt/gunyah/gunyah.c
+++ b/drivers/virt/gunyah/gunyah.c
@@ -28,6 +28,9 @@ static int gunyah_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	if (!kvm_gunyah_init())
+		pr_info("KVM for Gunyah is available!\n");
+
 	return devm_of_platform_populate(&pdev->dev);
 }
 
diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
index 26fdfa3174da..7d43449c4547 100644
--- a/include/linux/gunyah.h
+++ b/include/linux/gunyah.h
@@ -421,4 +421,5 @@ enum gunyah_error
 gunyah_hypercall_vcpu_run(u64 capid, unsigned long *resume_data,
 			  struct gunyah_hypercall_vcpu_run_resp *resp);
 
+int kvm_gunyah_init(void);
 #endif
-- 
2.39.5


