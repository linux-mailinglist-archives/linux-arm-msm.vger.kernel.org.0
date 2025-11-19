Return-Path: <linux-arm-msm+bounces-82544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E93C6FC0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 16:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 612032F30B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC8736C0B7;
	Wed, 19 Nov 2025 15:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pYLbNjJI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3BF31ED78
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567142; cv=none; b=iw+xC8/BS5EpO5cCR2JbHAepe7tZQzCvUn6NZ5ESfMGv42pCsrs8HxMuPdlS2nFOHhuuZcZqeWeWS1rF5kTYxJe/FO4QClRytsYsOmT0IEV0y5wcZjzJWOh61QePFHfHGO69yn9Y16GOJVHBrESXrkq0n/9AM4NLQxQNzLvXeys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567142; c=relaxed/simple;
	bh=3D6cMAtJFcH0eGhpLiRPBCAWIwBu4/DIokVo2lKhkeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sAlsDapMAw+IuWu7K32qYKeJbnowcYHLrtpUPZV8MDx9KXLOpTKbJu3I1P9F66ZUBMiQxpK2Wk/nR18ikmi1jOP4v9TnqEPN69MuYPLdidQ7H9jkAqP5t+go4m/F2Kcd7n3Ek/wFSD7IEjLPVb4WMqmcFek6rqhZzhwMYvlCDI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pYLbNjJI; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b2a0c18caso3706252f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567136; x=1764171936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EgUtWpxUoehpDvVbPcVA+GkHlZFESzHxIeFdx8HGLc=;
        b=pYLbNjJIY4xqxEIuEns8uXjvZ7F9isi/7jugo5Qj7mhP9MDL/QpwdMISZcJdNL9qP/
         y9ZVXz8oEfwgevPWLkpZcPeLF47jsOb/XLf6/K0XXuPwugKhs+phJYcFTU6ZYG5E4S/r
         o+Gp6z+r3MWbQ861Bcu8Uuld23esVOU+yE3rs15fEovLoc4dr+ngBE2HsPuDyaaBMk7k
         PRsZEYjW7PPvzzPVl2RzcO++pOHfy+eUzYEjW15SHSG2mnuw9/5gHaT85gJU5KvJyeWx
         dle+WOQC/9zPb3r7giPWeiI3kW7J2GODRp8Myf5WewGW6sR4l53Vhkhm3IGgtNkPpyaU
         tTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567136; x=1764171936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1EgUtWpxUoehpDvVbPcVA+GkHlZFESzHxIeFdx8HGLc=;
        b=VjdY241NtyPqOb8qCSLIY5m9EwypUfX/uGfcysvRx3Mn6ldsdBRqgi4CHlpn1txqjW
         r3GTNrdEr/EbAc9Twnq/X/d1r4hSJLRvxKv7b5n1Pos6hv0Yl08kZlCK0WvGNekAVpSB
         fEEvjiWaU5YiHwCU7yqdopLYN/kb340fcHA1goPkUaeZgaRv6tu7WdVkQZ7yOepYBzpF
         Emuffr4djpL7VqoU3fOF2BJVQrwrRRChifZP7aWr8itXc5eSXjZwlwLqNbpKJxy9fO7N
         xlhfusz12wGk4Zp/wriCvQs03/T7HtsLSdrOyMqLTtKKLd1+n1GoOrU+mRVXuSxG0fU1
         hi7A==
X-Gm-Message-State: AOJu0YxLbd27JJ9JnrvRmJQTYcwy90N8vq0fuXVRcGwrIzwaJFrxvmlK
	TI63ps3WaV1Cv9hRrvknBEMj788hOn1gpsO1KImaLxV9NW2iBrABad6Mpyc3DWHYuEFEQQOmRau
	I2dizE0FPQg==
X-Gm-Gg: ASbGncvZICG57gKqDqsACNiK1UOOBhgy+LjHQuGCjQI/P5CSd7m6OH0C3Pp9Sl2UhYn
	PfG55nw2loV+AXUHNem8ugdkeMth8gWti34WywToHTEsEzFUEBe4eNaYXiaQKyYuJkhj45nXfcC
	wF5euDYBiZeHZJdIcMAc2m95ApC/lDjnQE4EGpwEmJhu+8lp+6sp+x0ScQlA3OVRqKr7kGNwXQ0
	s0CIDxfhk+dL/t1dtZ/WJ1X4XBINC/5Y+nzZfTd+i47hQFMr9fLXsNnNcTb5wzuIJvI8xw85rn9
	I344m0bBvZ15pnJiKBCG+guCx/T3kP2EfgMn5iz4HAuRP0W3XJbH4jqg7survK8a6ePJjnMljEd
	5ZtaukH7GG4rLmsda51KSWaO9P1hbquSjZ//VS2KohMBaqy1m/ls0M2BgXmNzQ9qHHCoJ9LEJAy
	pxCbtIglZJJ2l6mHjUySdu9zhlU7Y0lA==
X-Google-Smtp-Source: AGHT+IGKFFWZ+AqolHJ3imLY6SMDSF30b2mMpFX+Q/YU64RzAj2P3ofwp9AZZn8blv/guB2oFBfRQw==
X-Received: by 2002:a5d:5f93:0:b0:42b:43cc:982e with SMTP id ffacd0b85a97d-42b595a497fmr21650580f8f.36.1763567135863;
        Wed, 19 Nov 2025 07:45:35 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:35 -0800 (PST)
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
Subject: [PATCH 11/26] kernel/vmcore_info: Register dynamic information into meminspect
Date: Wed, 19 Nov 2025 17:44:12 +0200
Message-ID: <20251119154427.1033475-12-eugen.hristev@linaro.org>
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

Register vmcoreinfo information into inspection table.
Because the size of the info is computed after all entries are being
added, there is no point in registering the whole page, rather, call
the inspection registration once everything is in place with the right size.
A second reason is that the vmcoreinfo is added as a region inside
the ELF coreimage note, there is no point in having blank space at the end.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/vmcore_info.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
index e066d31d08f8..6a9658d6ec9a 100644
--- a/kernel/vmcore_info.c
+++ b/kernel/vmcore_info.c
@@ -14,6 +14,7 @@
 #include <linux/cpuhotplug.h>
 #include <linux/memblock.h>
 #include <linux/kmemleak.h>
+#include <linux/meminspect.h>
 
 #include <asm/page.h>
 #include <asm/sections.h>
@@ -227,6 +228,9 @@ static int __init crash_save_vmcoreinfo_init(void)
 	arch_crash_save_vmcoreinfo();
 	update_vmcoreinfo_note();
 
+	meminspect_register_id_va(MEMINSPECT_ID_VMCOREINFO,
+				  (void *)vmcoreinfo_data, vmcoreinfo_size);
+
 	return 0;
 }
 
-- 
2.43.0


