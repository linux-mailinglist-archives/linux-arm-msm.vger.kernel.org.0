Return-Path: <linux-arm-msm+bounces-82537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 648B4C6FE1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 16:58:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 863824F37CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 169DA3570DA;
	Wed, 19 Nov 2025 15:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FslOMpT0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A712D663D
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567129; cv=none; b=krDnsaSG6Tf93Is4Jf3hXrHXeeBCZ3hNvQUoXWjli/8JJ7NL4Dks+ccVayaECO/6sTbfD5dTFQ3bJkhJ0HQtIYUOQfNCcbW/dcWddLcWkQ28l77CSZVT1oBlirT16r9thM/EgN5IJsnOn+c5aI6gIEMh0oTUomTDGvKwnsGvqjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567129; c=relaxed/simple;
	bh=T6SjDhmcY0qxcuyqrC2MrBGCJa3hOQc9OYm2K6gInfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nwe5G8OmVZJ5f5gUSFC0vGA0+6VjMlFdgZwuZq1vuMVGkNj2zv+8vmkyYZnXfNJSsgN0ZBtMKAJmRWi53zfpWdlcGB1h9yDpOlSfwJ5VLnCiK3fxsctgMkQQbedAXp2tFgv3SeF0/UReyLrSIn1uaQKI782g38M0G5ft9KQzavk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FslOMpT0; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b566859ecso5396821f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567124; x=1764171924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCvJkYlF4keL+Fd6f7hwRGbLb7cgm1v1S6Qn3Ctc9SY=;
        b=FslOMpT0D6lQ2kcCfXCiK0uWzCKjdNJ+AScQFNAM8TZvG3xEM7hVRVsKm91uZMaTvz
         4ob7Vilx6or0EGs2w+NmOwSkxBsRgfBYuD4SXQ1WbbhJKL95YIWP18GQZJrCJn4gXokf
         tudwNkwtKWBIJqQsMpTYbscsCy2OJigihpRNBGv+IyyKzjhSkKhfzVARu4Qyx6Hkq0mm
         1I86zQNM4dXOBcXvNdoMUynBcD7yv7L6gKD5o1nmiPzDy6GzgNzrtWtBJYAKSrgDIaK6
         pRjDKWJeLrjp7UAQu+Ih0+8lSAKK0ipcr5Lla6ZRc+MOkqYY/bqS7qUUjRISp7uAjz90
         dUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567124; x=1764171924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NCvJkYlF4keL+Fd6f7hwRGbLb7cgm1v1S6Qn3Ctc9SY=;
        b=cktu5oDJ6L8ZIJONiqPztdF1457YRv33xK+2yLZMJVFy6c2nnMZ6esTxzJFhwpWFTO
         rVxrHXMCC4U21pBJ3SDoAgPj3hT7mBTtm2e2hNSloZRh8guVWt0qq3CfLbvDsZO9YZpY
         2MqAYbd8AVlpH/AcU/SK1gQXdlmQ9ixeRyf7h+JcWEznsqcXr+JKPtwV95uLioCn6XLG
         SOEa/7rAd9aZDmp9WnHhOofWHbt2zhopgaPb8s7OFbCzKRjVjHfxYFzB2fbp8Ay8GYSN
         F6uOSKq1eLID5U/huKF1EQ3NknctJxt001DMW8JX2fuIsf6FsjDOoK+kGY7h88Cu1YrG
         PcEQ==
X-Gm-Message-State: AOJu0YyI0Kn7Q5p7TJu5yTVysxv5+B9FiROm8cin2meVHKT3UDW1Bt26
	EtJCp9N1GVwenjRab8zH88FlCqNX6OH8f4K4y9Bpefs3Ng15IA6wOM4c92twQ3eSB+njwPSCoxt
	/gFRo9QhsgA==
X-Gm-Gg: ASbGncttDCwx7rMz2uFfUy+xPoD5gT8DDdzKUMcEAWUdyl/IObIhRAXZT32STky8zAV
	cpbR3qcLFEVVIgkoXNJJ7juvU0YM3lcQvsCufpuKiwqwi2vGPaK9RcXUJlk9SXDXQ0UaOsygkoA
	IMnGMfZle1P8u+nAC6h/vWsEyiwnhApOlWjf98+dPPF3lK3n1pXSHV0t+Y19bNl9cCR0PPQufAV
	DB3ay3ixpNiuJQPBPZxB29SwSxckhiiW9ZgRt2zKCNWFz6Co13G7E/ufy7V83xVkRLzPwxlm8xx
	8cOcKPADKU1iyLVCnAP+wW6oU3nErWAGaqSvSZtd9vr2ZublGnTdH40VLk1Dc7YR44K+HR7axZO
	flQYav2zUt5sKzYgz9HvxmqZkpZyBeo68PtYF5fSWvLcLot+paBfNYInp6yoN+B6ypqBsTqkkSf
	O8I7wO7AnI//kaw6Vw6uq3PVbwOUHHYg==
X-Google-Smtp-Source: AGHT+IFVCfX9pNo5qLPfR5wjMBWTLaRukJCHurtJsWmWrjGoOxpQq2PCC7itN5NhSfJZMSf9UOyBtQ==
X-Received: by 2002:a05:6000:1ace:b0:42b:3366:632a with SMTP id ffacd0b85a97d-42b59386ademr21562007f8f.39.1763567123749;
        Wed, 19 Nov 2025 07:45:23 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:23 -0800 (PST)
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
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 04/26] cpu: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:05 +0200
Message-ID: <20251119154427.1033475-5-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Annotate vital static information into inspection table:
 - __cpu_present_mask
 - __cpu_online_mask
 - __cpu_possible_mask
 - __cpu_active_mask

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index db9f6c539b28..1f2df5a5b9ab 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -38,6 +38,7 @@
 #include <linux/random.h>
 #include <linux/cc_platform.h>
 #include <linux/parser.h>
+#include <linux/meminspect.h>
 
 #include <trace/events/power.h>
 #define CREATE_TRACE_POINTS
@@ -3089,18 +3090,22 @@ struct cpumask __cpu_possible_mask __ro_after_init
 struct cpumask __cpu_possible_mask __ro_after_init;
 #endif
 EXPORT_SYMBOL(__cpu_possible_mask);
+MEMINSPECT_SIMPLE_ENTRY(__cpu_possible_mask);
 
 struct cpumask __cpu_online_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_online_mask);
+MEMINSPECT_SIMPLE_ENTRY(__cpu_online_mask);
 
 struct cpumask __cpu_enabled_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_enabled_mask);
 
 struct cpumask __cpu_present_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_present_mask);
+MEMINSPECT_SIMPLE_ENTRY(__cpu_present_mask);
 
 struct cpumask __cpu_active_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_active_mask);
+MEMINSPECT_SIMPLE_ENTRY(__cpu_active_mask);
 
 struct cpumask __cpu_dying_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_dying_mask);
-- 
2.43.0


