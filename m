Return-Path: <linux-arm-msm+bounces-82548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E2652C6FE3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 17:00:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8DB444F991F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EFAB377E9B;
	Wed, 19 Nov 2025 15:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XeaDF8kX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087C9366566
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567150; cv=none; b=BpWYsBrSZ2HraxIE0E+C2mTWV3ma2EUVJI4Sw01Eo3/nj+4PV0OLR26mifN503YZnmgZj006sQ37mHwmYOIuX+D/mG5nR5ClmbyvWqGJZ2c4FFUMBZTeSxpFyudBHkjTigpRfvUXdcSpzXXpY5B++T2ZNXrsBr0CWTDYni2e5FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567150; c=relaxed/simple;
	bh=b7ZOQzNfYMyF79i/MOcMgt4XB6zny2khgQb+AuAIOw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DBRrl/px4SLsK8Bd6g4AlYOD3SEFIvP5E0FeqyTmV10JTTyWJSfgWOPG5LFuGAfnXOtJTmJp4dL6vSdUAs0RGKcB6C9TijL8r243Mj/QAX0DmCeTHHH1T4ouD97eq7x4kdNsYvbcX1Zp7M49/R7a045+pVSOulZXhoDQpsBZsZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XeaDF8kX; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42b427cda88so4949242f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567143; x=1764171943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVYkZ+YGVFmg/wGLFr+Mopllp1/vePaMucgqpmR/GFM=;
        b=XeaDF8kX7ZMHl7X8ve6YNTs6euc7cDzNwMF9/a96PZftfKYfkZ/jXE/thXL/LIiIaQ
         Q02MWmIB0O+JZ4GbrTxisOUMxALtAyHyz7jTCadkeqf2n22P1NIagu441f3tgFfM7QcK
         dPVYhDfsgeVsAh6mkKLn7q2BI2RpjPAWudhIFGd5mliSmMThEjsoxYZzUd8k5X7CyRsw
         sHUf1zcJWaopAFbyIAHxwLNqAwpL2GPHXcCGTngCCzojxG1y0pFkuHuu7f41aalfT3XU
         P6RMp8UgCgz+zFoKCmXIQRXYYotpvNuXYRt/Q/hWzlmcyHHgx4Vpn62xuszXtlAhNHlv
         FbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567143; x=1764171943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VVYkZ+YGVFmg/wGLFr+Mopllp1/vePaMucgqpmR/GFM=;
        b=SvS3sod4fmTfYerXvFmYEMmM+TvlZxFUQfDGaLEG3d2Bvr1Cd5QTug/siBfG4/b0It
         K3VMDALUw9NK0LA8XWNabfjKhshGMxs7GOK7dCxDLvCp+NPD5qNCRvvG2+wOUBAq11RI
         s0TEYj3fqyAHUgN0oCpaRx9vnBnsQBCoP4j7MioZOEPXN7c4nNOx6kEGmiy1ry/wZIoM
         v2iF0yRSY1ax/1IBfsIrYbJZBjNZEIkB0w7gO3UzyWs1rV9issXuqxpEPOCr5Kl8DO+v
         yFhHwJpAVlT437JNojHpSFDGdAhSQ8L6IBTBG9g5Ck0bZqJ9Jy8cyzWu1V60dHKUdYno
         kFCA==
X-Gm-Message-State: AOJu0YxhsAr758F5ojlR8X/Gjp9oIcW4ss3038rjuUhCFYtex4FAZ+oh
	aVAJY9B0u68ihy/9hdwHEIGKUuyAyBv/I2YWIwqu71TmOuOPNBYOQ4PbunRh6xQWlfteaoDSr15
	ZVEDaWKNjTQ==
X-Gm-Gg: ASbGncsKwuoDbwbwHXS68oVFa0cmC1awdUC+1jYLHAy/ymH/f5Q1s+Xpl/fd2gwBsBj
	x7J9HZPn/zYu+jhwFitR7qoZiotCYgEj+8eArJxCdfnnvu+zijAIC+RYJGe/ROk3zuIZQF9UYv1
	c5Fc5D6WcVqQxqBpHrWQJh+elZ2umBPbPf11+S2wKDjcGrqGDkP941FxhZHGvfxqaRfjGSymlJy
	lkIEo/PL6ZQeKKX2tqT84CJnnWoeAByIt8EdPdTifn40kFJLaTe6nya/JBg6+Tjv3mM0/xLGk2v
	DMSP92NFCCmOG4nwLi12OJadAyZORjyDLTQFZ+8VCFMWvOMLsF3z86x9eudAEyLJGr3jW53Ivja
	w83feZlQ9z69tLSNs8p4qwMlibOP0JXiezmR1xskt8NpZV7ZaRL44HjKrMlyBb5TlatPU+fQ72i
	aB25RMwUG1wFud1FAD1XJ/h5gh4QEhXw==
X-Google-Smtp-Source: AGHT+IEZRkUZWC9WWo9OX6jj9I/ZWQe6urgV7WqPXknOd3CwNTmQvHOBkmKtLsoZT2TI4A/OTOkOYg==
X-Received: by 2002:a05:6000:200f:b0:42b:3806:2ba6 with SMTP id ffacd0b85a97d-42b593394b4mr21022814f8f.25.1763567142926;
        Wed, 19 Nov 2025 07:45:42 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:42 -0800 (PST)
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
Subject: [PATCH 15/26] kallsyms: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:16 +0200
Message-ID: <20251119154427.1033475-16-eugen.hristev@linaro.org>
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

Annotate vital static information into meminspect:
 - kallsysms_num_syms
 - kallsyms_relative_base
 - kallsysms_offsets
 - kallsysms_names
 - kallsyms_token_table
 - kallsyms_token_index
 - kallsyms_markers
 - kallsyms_seqs_of_names

Information on these variables is stored into inspection table.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/kallsyms.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 1e7635864124..06a77a09088a 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -31,9 +31,19 @@
 #include <linux/kernel.h>
 #include <linux/bsearch.h>
 #include <linux/btf_ids.h>
+#include <linux/meminspect.h>
 
 #include "kallsyms_internal.h"
 
+MEMINSPECT_SIMPLE_ENTRY(kallsyms_num_syms);
+MEMINSPECT_SIMPLE_ENTRY(kallsyms_relative_base);
+MEMINSPECT_AREA_ENTRY(kallsyms_offsets, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_names, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_token_table, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_token_index, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_markers, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_seqs_of_names, sizeof(void *));
+
 /*
  * Expand a compressed symbol data into the resulting uncompressed string,
  * if uncompressed string is too long (>= maxlen), it will be truncated,
-- 
2.43.0


