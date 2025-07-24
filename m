Return-Path: <linux-arm-msm+bounces-66564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AC5B10C74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 16:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6A621652AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4A72E7BD8;
	Thu, 24 Jul 2025 13:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NhHBBf8J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23C42E610E
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365399; cv=none; b=qId2nS7+EHMA8Aih6MU2sDrojnUP0PU7GJcSZaAECkHp4Wq0x/WUFE3edjF3PoLNaey9odBhI0+1Mv/UvRIZZhUy5qQSlCDDdAtMfCuBm2dryulygPp8DqgzPLaOvdnnDBSuHNZ2j+H3Zg0tJYrGrmGPxjx9SOgJdlWZsb2YgoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365399; c=relaxed/simple;
	bh=QpOyX3O1zVluz5hSldO4dnPU9Pz5bkE/gs9RkenFruo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UibORWmlQfeDUfu2LI2oZK5zHxVQop1VSDnnk6otDEf/Z3Cvel8T1HCL45kre3o1AmaymHrHh5jtBPnlv2DtMnob0yfX5t1bI6rkizMuip/rPa451xYuLFLwYv/Dbnvq4cmrXUYvWIYDN+dnK3m5eU1TxHBOt4ks8sh4LMBOkSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NhHBBf8J; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45622a1829eso3519175e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365394; x=1753970194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6EjHBZibILbBUp2qJIWYHcXS7kn/hLDSQS+TJg877Y=;
        b=NhHBBf8Jzh2UWPCgsbFcY8aPFwvtxFOq737cLLsrQCZmRgkKkfwMJqNysXsBL8QsXC
         qmzgwjtJVYsVGW89ouotrXqKPHH++Kh+n8fzAJGfeTQQgN3xUx8umehWdVe6hxnncmui
         vMMx7OFls9lkmSMYrkbutgmBveGsrwvyQbxtNkw54UmbUH8TGVbf+pntg0yVwqDgKKpp
         sW91XbQn7lQRduhAgmkL+m0wfWr/G35EOLGF3ls9tPJArHfaRx2kec+lQcZd5sYG22Ty
         VQjkDwvKt34FiJcreuIkEXHvXuP69LMFBp1pM/55KiGjJ4nmzQMUSN1xoQGuC6LmZbcE
         fGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365394; x=1753970194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6EjHBZibILbBUp2qJIWYHcXS7kn/hLDSQS+TJg877Y=;
        b=pGMGXnlR3Lz0jmadfj6CVBpaeEfZIHAs1v0j8qYHDDxink9P57JnhRP/HfucshW/p7
         BoGqfLyQ7MD/1iymcQEhOqO1mitXz0/gi/CJJOGadQ2XrlQQteY+ignNIx6+g+VM2AoF
         cn0ONNVbWOPFYKN1XdQRh+GJWg2BSCGoCTdDQCHgtFZ//6ApPL1+uYWUhfFIOuZi3eNl
         6YmjXILKNgp5uz9ngYB1diDGHwhsIGWn2iKbUwjXrTK3DcJRjxABpBVJ1QaSzOnXLKjc
         V+2yHSFhqShgkcQf3ck+GfyqA77WgO3SHa2fXY6Vwl5FOP1LMZGvHX+5e2jKSFGifOCv
         /Iqw==
X-Forwarded-Encrypted: i=1; AJvYcCWBevYcLA9jGtlXwX1hCHKeNpqY2INzTQ+5ighF4iiM+p5aGZkB2s4KTaCLucblsuo+/fyjgH9tOzNwlcHG@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf4hZl0eO6n0NBKwql9Lyk8DueYrbE8EzqfLRKRPT2huyv/Qz6
	nmh0GLoFXeqV1xdB9P747u9fNrE5k7uHdu48O4yZ0hBCdSCSDKAeOMnzNDRP0Q4wQ7Q=
X-Gm-Gg: ASbGncsMCkBeM563x1QqbKgoqMcwslP0vdPRV8my8co8Z4CPmf0IsuV7F14wHUodF8j
	bX4AnJ+U38dyBj5S/08ZZ0pKetnLjSABiAA3or5CGCAbBlgNg/wUq+AusLgGLZtY6s534qD9dIc
	jAmscPUwqlH5bPnb68qbW/2PAbHoWCvP3X93HwsE2+hwcr+7OkWACwXPG7UJ2wqR7govuEfj3BZ
	9+xje/4i0n85gZzKaUJ87l4r6kMrTKOafJ7tAVsm9r4/mqJEdflFvYJAw/o9DAdCSIEPmeh49uQ
	Gb/bIlL9ZbsM9XDcrACUxxqG/hT+rxGDaZxHzbSoDkIBep6vcWWQuB4f3reeUsv3Pr7hu2KL+pA
	ZDRqC+lnSep75x0CQKd7jWTlb/aNPTQwKjtddTC8avToAqu+LxWB/yZhkxbROesAq9t3BaZ3iCT
	L6W2Yttln+dD7Y
X-Google-Smtp-Source: AGHT+IGRlGdpZ28v11nrKuEy26SoaDmKeIQI1w12F1VyMMK6OUtkgi6ZkZkyO989nTl8PB59Q+K5gg==
X-Received: by 2002:a05:6000:290e:b0:3a6:d7ec:c701 with SMTP id ffacd0b85a97d-3b768f1ab39mr5321094f8f.30.1753365393821;
        Thu, 24 Jul 2025 06:56:33 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:33 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	eugen.hristev@linaro.org,
	corbet@lwn.net,
	mojha@qti.qualcomm.com,
	rostedt@goodmis.org,
	jonechou@google.com,
	tudor.ambarus@linaro.org
Subject: [RFC][PATCH v2 13/29] kernel/fork: Annotate static information into Kmemdump
Date: Thu, 24 Jul 2025 16:54:56 +0300
Message-ID: <20250724135512.518487-14-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Annotate vital static information into kmemdump:
 - nr_threads

Information on these variables is stored into dedicated kmemdump section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/fork.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/fork.c b/kernel/fork.c
index edc6579f736b..ae8ae9b9180b 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -105,6 +105,7 @@
 #include <uapi/linux/pidfd.h>
 #include <linux/pidfs.h>
 #include <linux/tick.h>
+#include <linux/kmemdump.h>
 
 #include <asm/pgalloc.h>
 #include <linux/uaccess.h>
@@ -137,6 +138,7 @@
  */
 unsigned long total_forks;	/* Handle normal Linux uptimes. */
 int nr_threads;			/* The idle threads do not count.. */
+KMEMDUMP_VAR_CORE(nr_threads, sizeof(nr_threads));
 
 static int max_threads;		/* tunable limit on nr_threads */
 
-- 
2.43.0


