Return-Path: <linux-arm-msm+bounces-54948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ED8A9679D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 13:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC96016B140
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 11:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1B927CB00;
	Tue, 22 Apr 2025 11:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="npo8pfQ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552B5281364
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 11:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321555; cv=none; b=bt3m8Fa79c1WMTUZ5jt5KLIjUBVn7yBqRJl0cSUEXbHwyPn4QCEYzfcDpD2uw7KCDyP9Qg/SUih0jq3RTidzFbxIx7Ee4I2EcKWGmUS32q25+QoF2ivsLOPx9aJXDzWrcK/PQ4W2WmsY8YZkXTiWOhwFgj+XQJsz/Plj/eKbpFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321555; c=relaxed/simple;
	bh=gQDPkvVC9lqTB+MV6UQ/E8pyhNViS1oHACaHEDpFvWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=smW96iKRvUkTFBiBaYDCNozayGihd/pUoQFDnPUycU4pGGTrUh6dFRYww0IFdm8xTI1ckkQgYuCPLcu5XpdgiA2vwtHvfUh1ktvLd1O05LjG1G5GewQrSIc8HWE0MMos3bpKxFuEZfWAb5/Idp3hIWVXEfnrJzw6RqDgRCGeIdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=npo8pfQ/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so37409715e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 04:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321552; x=1745926352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23OVpoYPLggoCGZU9vcl/htrC1VpcPls14v+en9CHkc=;
        b=npo8pfQ/zHqEXqoElK8IzGujkMjXdAmaiWGEv/J7NlandjQOd7d5ToEPPENGkVjh6z
         R1NC9RREg2iHvJ6BlYuQQLTULaGvldmtura/n+IFky0hGqbrjlrIMUo/96iGsHenMYNO
         16vM45CRoxVHlM57mT3u+ILTxtoQRIWYAs6vlFzRMDe/cR4ny3haR1HL5XSSsNEcqGI4
         zdp43GlzNqmDtijqQ6/nwIm6f+aNjcsrpUJ5lWS9c6nBqqcaV33JDySqUJ3bQQPXCGWN
         TtIZHW69Q3ZNVSbn5we0Z9rFLQXgk7ETbmXADQ9MkqYfcQXvFmr1MUs9MZSuqXCvkLfd
         C8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321552; x=1745926352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23OVpoYPLggoCGZU9vcl/htrC1VpcPls14v+en9CHkc=;
        b=rk9l+so2OQHHPy0J5CNApkwwGHUutqf0WebuYfBlo20VyMsptacNKW8i3y2x61GJpe
         MqQkVvHyyKf3yXGy4bVYpG4nY1uZ+V0h10tMPJbTZbjBgK3uRo3Mna2KnfrV5GXe/YRV
         Kr5QcxqBkA5A24Txo0iwcUCrf/o/g6s6nxlCOtCQsx75QU+vcHpZi5nlN/cVrGKG8IBy
         kvvI/qy5yuG/kcog0GCF6gh3m8pXXg93J9wpAluDItnPo7BLU9SfCc9NKHAAjUZnjDAZ
         mGwZER0r9bKzRPtHXDkdN2i6GD+VAygKihk1iXzL0zCluB0uzAcqE23s0gI9AdtpLuTR
         GKmg==
X-Forwarded-Encrypted: i=1; AJvYcCXZ8ezumpMXj5IrBGPITyWL4Bd5hZVDaAXmy9/63WL1CJ5GU1tuZLS8sccWhK5aPpdYPzmpodwKr7z1lOeX@vger.kernel.org
X-Gm-Message-State: AOJu0YyeDft5XN3xpipjg06i8K2R4wrbXNdGW7OnDv3btp6yk1WFA8Pv
	MpcanUgmRClJbB+72yI62mM09GfNEjeTy8eFLfMnI9Y1FbuWyeyuWcDH21Y0sYY=
X-Gm-Gg: ASbGnctD/D4MmV5C9v7KN7oN9vsU2HgFzafiok9YkFVdvKt+m1JmkbtesVWSIMNiwDZ
	WlJ0Yq0HrioXvX9CxoFuvMd7hk6nw04hq5WzV/XMPu4agVzBC+t2JMSqO7b80C62QKli8y6K2Vk
	ogcqG5z30JTSz2ArApWPZ5Zz4WEUNRE/EjxNcyv+YOz8yR+I5Qo8htZI+hjwUZcTC0gKXIJJEjj
	rhgMpUVmKUE7/coXNGVuwkYCFLU7CHgjKCjA8JkpP9fn9T7HBG5ydeMa/ZyMtE8j+T2sTopR8XX
	g9mOgSNC5zYGNZUMvqrla9Dw+3wpMZI4veAD8U8+/m4TpkGfSdw2
X-Google-Smtp-Source: AGHT+IEtVC5/hLkXP7uFg7Zmm5Mq0Mlz2uLSiQFUOQWsm32IsnbnTjBX5PadrzYjNG2TCCeAvltguQ==
X-Received: by 2002:a05:600c:1ca8:b0:440:6a79:6df0 with SMTP id 5b1f17b1804b1-4406abf94afmr91474835e9.22.1745321551609;
        Tue, 22 Apr 2025 04:32:31 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:31 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 14/14] kmemdump: coreimage: add sched registration
Date: Tue, 22 Apr 2025 14:31:56 +0300
Message-ID: <20250422113156.575971-15-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register sched info into kmemdump coreimage

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/debug/kmemdump_coreimage.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/debug/kmemdump_coreimage.c b/drivers/debug/kmemdump_coreimage.c
index 7f3b089b5739..2be396ca0495 100644
--- a/drivers/debug/kmemdump_coreimage.c
+++ b/drivers/debug/kmemdump_coreimage.c
@@ -78,6 +78,7 @@ void register_coreinfo(void)
 	kmsg_kmemdump_register();
 	irq_kmemdump_register();
 	panic_kmemdump_register();
+	sched_kmemdump_register();
 }
 
 static struct elf_phdr *elf_phdr_entry_addr(struct elfhdr *ehdr, int idx)
-- 
2.43.0


