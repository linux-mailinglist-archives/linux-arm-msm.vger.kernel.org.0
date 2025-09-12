Return-Path: <linux-arm-msm+bounces-73361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5485B5530E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 17:19:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 723ADBA1119
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 15:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2380732142C;
	Fri, 12 Sep 2025 15:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fAOMROtg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50727321433
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 15:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757689839; cv=none; b=jwTxOdQvryA/lZcSSaAP3SOL4NMashMWE5CVJlz0GQSVbA0z9P99WbjmSgI5mUpuef1Igi9qaoeQxVA+KIm2VHsKXf7ntHAH7tWUk52jWdyp49LaRviqYVDz9pt8w76R1prMcQdI10RMhU+xA6VH7C66CT92I6os7i1Zw2tSXvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757689839; c=relaxed/simple;
	bh=lBamo/mRxiUtCBdbmIZyVniV6pvujs45sCbA4KFEQzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WPNkBKwIkHZ3L9VHROFGpN7JOCNgnmoMQoJXSBfkN4yfLBD7tU3S7lvuvq8kaZDxo5cEvrMHkTgaDvMxRyj9Gllw2BLWw6ESiBsrT/hY3knDz2lgrQrMH4xMCGoorSaLnusU/keOZebIvnX23QahD8b4Zmp3US4WnEIpHt5JWCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fAOMROtg; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-724b9ba77d5so20265167b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689836; x=1758294636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ds8gslyRhEA90VqYYB6jUYRwIuKnqG3r9jdtCHu7D4=;
        b=fAOMROtg/82tIva9GG3Qq7B1/Xo0+WLG/MAQv4jrJm8l+dpu/m7w88+hJOQUjbEBCE
         Q/c6F7hcNX4R6eSvQuECiTJ/TwZ5ordlY296OA611EL10F6Q1XB+2shpcmNX1wJysvwv
         NOh0HeeJrlREnwXJPTUTPDanh1+wbk5RqHQ26uU6u2xA9a2cR+CzZhb7PNYnsb0MizPk
         vfA0nSyqNet2mhTreKSt6W/pq1aHgIboBGbT4SMlpCiDS1qWyPIW2mSg10P7JSnWUfnN
         dgEWo/RJpZfZ7WXd2RPHPcUbUJGClDGaXmF6kF1cvaXdV1OhTMqaB58W9YZMg4944Pzp
         7LQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689836; x=1758294636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ds8gslyRhEA90VqYYB6jUYRwIuKnqG3r9jdtCHu7D4=;
        b=l8Dqj2i38ma0vxqbBG5hNTUstWlA3uEIntc00Y+IIabcN8ofZc0ziK7Xk15sqo/1t1
         0ujqH/Ye+ZgDq3zTaUTVhADtVSYCBr+kTKU9cc/gFdshRgMG0h+h1BFS8e9hME4l72Bt
         TRWhqeiaykQhwNS2s36FA8ZCle69bNZQ0q8gmfP3hmLuW3oKGIjryB7KQ/70N1x4LAYa
         phQ5SVMI++3Mxc2eAgdyrZMR8ZWllhkGTHU+lIv87jZZHGxPm7QxbP1+rvYpXAVWio/k
         +1c+D0Dx46qCF8IlFzAlJhuzf6ZhWe/ukoRC5pulOVetgluJbQisF0tjLNDYPRECLlpW
         4nyw==
X-Gm-Message-State: AOJu0Yy9bBvud82xFPBdnjtRiUVJridQ6RqFXyKqsUCxApU0VKF0E5VC
	m/mOWG9vhop6l2ixtmwIa10oTmgmQ5xbmLCOdqCjTS/KCKxHHBCxOY+fv/K2LiCztFZ6SOvuupq
	l3CJvuweBQw==
X-Gm-Gg: ASbGnct5BV81Pfv6JpF1CNKt9aJ9psH5V7z6sihKUi74Xwd13/rrr56g1liQ1vyQxLe
	MbQijpkE+oPg2mQwODOhy79S8vdJwLtOeO2/0d8e5AR42tVL0n4zz4t6VZe99VWayfebgIfwuTL
	47Wrp2CEOliHf32cZ3gc7K0Eu/KryExpPkeFFg8Pd4N48uWarQfoR0R/Mb5KYiflQg9nvPYh4k7
	qARHnkRUne0PWC2WC6Q3xkfAK3dvSAOQ4OJOIU8Shcl2uZrkD8kqfRbx+V5UYxNiwk8hXANNRKi
	gy0YX8HJqqE1RBwRWPWbgqVjENtC8A3mBOgvVuGzgqlx5tZat0S45Je+mQNFUcVTSTkMX5RhH9Y
	O9pbJLqQCP0isE5jUCWqCCzI1BESsBtZ84Q==
X-Google-Smtp-Source: AGHT+IGUk5zUSgxh+r2dAU6fmhsNlb1RTWa2J7nuwDb4l4jA+t4jqiomYFBGdZGHaaNJrIZspvEapA==
X-Received: by 2002:a05:690c:7286:b0:725:dc12:3004 with SMTP id 00721157ae682-73063d589abmr33964367b3.22.1757689836260;
        Fri, 12 Sep 2025 08:10:36 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:10:36 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH v3 09/16] genirq/irqdesc: Have nr_irqs as non-static
Date: Fri, 12 Sep 2025 18:08:48 +0300
Message-ID: <20250912150855.2901211-10-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nr_irqs is required for debugging the kernel, and needs to be
accessible for kmemdump into vmcoreinfo.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/irq/irqdesc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index db714d3014b5..6c3c8c4687fd 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -139,7 +139,7 @@ static void desc_set_defaults(unsigned int irq, struct irq_desc *desc, int node,
 	desc_smp_init(desc, node, affinity);
 }
 
-static unsigned int nr_irqs = NR_IRQS;
+unsigned int nr_irqs = NR_IRQS;
 
 /**
  * irq_get_nr_irqs() - Number of interrupts supported by the system.
-- 
2.43.0


