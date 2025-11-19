Return-Path: <linux-arm-msm+bounces-82551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D86A7C6FC3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 16:49:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id 36F8B29D52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91EA393DE4;
	Wed, 19 Nov 2025 15:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gvo8Ljd/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E00377EB7
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567156; cv=none; b=uK0owvlO2dsk8qvgMy0UhUGXgf7HOI6kxFDjTufo7qCDbO+nGToVinX+MJi/DfRhLIdD771RDNVH8IugLFF8JSbCIwI2c/SQsLrKhY7GwpahY7T1eXyu3tcgXxFe97joixG3wDSAtInU0U+OkO46dekv8qrwiVTIBazoqH8yfTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567156; c=relaxed/simple;
	bh=P2BpXmRz69DL/Mo9gvHTNRnm0uC420IorTT0EImakDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k+/wukpecLvgIVLkUO1sADH0ZUVlGvWsq/5LgvSqUEId7wKqiCGihAcwIxRNdOKjkl1gjoyHJTYi28DTvIX7PJK3z6l3ZqHYjvxwoXdmCeLD9WSqahCfHsaCNnM4Zj/Ui4pitZNnyHaKGMDykBMIqdMEBw417LUDpeyNqz12dcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gvo8Ljd/; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42bb288c219so3583195f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567148; x=1764171948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/EyDboeiBDU/UfklOwVUegNW3M8PrbX9Ov8/f+MrlA=;
        b=gvo8Ljd//s70Ad6SW76idmhN0fRup0Xow21Ym1r2UBYinVsb5JC3n8VBpMue/pLWkU
         htLFLuUG9II22JuzokqrUBl0FIowDCJB+lvn2qVtL1YvmFo7+wDaTYDGikVNNEn1YcH8
         Iuhzb3XiCrFIuROQ3mOZhNdTianSbsO+8pjZSfDIvE4fFYqNI8gtbghZ+usPXOFIq8iq
         i7U4tprdGjDoAg5SYQnep+sFOZ250TUOuoTa24+ZPpIoZVtyds47wZSiGn/keBZApxa7
         Pam02IHJfIOB0F9q/5d2km4Th7hREloIwrLIh/HTlXC2IOIcZEQ7v0o90NFN6ydDKPp6
         rVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567148; x=1764171948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l/EyDboeiBDU/UfklOwVUegNW3M8PrbX9Ov8/f+MrlA=;
        b=N0k00LARrBqg9k+8HiH4HrO1aT8X8Xn2JUIZvatHMyagHDuow9UUyMdfVxY+N04vR7
         dbLOsDM87m9zAYJWn2DW4hUPWoH2L7cXvyz8S6Yb3iAC+8X02vxe9MYhzriqXblc8NTD
         dQpaBk3GSPhvpCG6Ar0CaVcPX9E1WNW2rW1nMN7yNoVALfzuQ7aqukEBZCJtlF80CU1t
         7rPQwxG+d+Z/iMKanjIS9A4eEGQz7WuRicD95RmwO5TV8HdZ8dxp1C/13iEDSu8q633q
         2sr/fgI7bHWYbF2xHPONLLBzmbDYrhJZiUGzHfzXLsN06YQmVscOHIrqHrd/aouAW/qA
         w3Mg==
X-Gm-Message-State: AOJu0Ywemb0KWvjSH1Sjh2k3oBCqAz71RVmYbHZ+qHxOoMWmKJsKqfro
	KHjgl8nHLFkaxyfpw1v0uZ/SDQCIbXpmdcqH1k3XRM4kiPbiA6NyQF8x4/QJ/daJvCxI064lTzn
	Jc5YFV+T66Q==
X-Gm-Gg: ASbGncvxr5FuceNo8Afgbv2KeQaVcm506YMZvqfpGtEiDLt/4hgbtVGTd9WnrKxFyF/
	nL1LaO0AJ5IZi0fGimIl25f/QZw9TWyT/I8ihFEmiLpNsImmpGx+geSjIq6MHNZa9ZKUkB+QHmY
	X1BVrc9xfFp26KbPf0dzMElnyDrg3lkbMuFQbF0haKWRxF/bts4V56/fQ6BmsJPktWOYrpxMIUH
	SaPWapzKtg7el1TvGxBxQ0N1GzpCBecN4DhlSDjaQ/5q9fO2dkZ+Mu+yq0J7r5ykrRSF8TEsKSM
	YJzXEfKNuGJIBAASOlgM7LUU7KiZEJicM3nKCBrlxoGrA5tRiF3xnzRPTxtfeLKGZVt/mPUCWTD
	tgsWss+EvJ7ZUe3hhUCSY9h4pZv/SRg2MFKsD2jww6prSlEaiJ+BSjTvZk6x0iSqxF2oMl2wvNt
	4bX/D+JISKr2P1QvvGjrc=
X-Google-Smtp-Source: AGHT+IG3jCLeDmXIRQk0s6Z/im1uj+pkHlGcqCZtyflKDhFiJA87zd6Y92IL7f4uFHeiMPUMai5jbg==
X-Received: by 2002:a05:6000:64a:b0:42b:396e:2817 with SMTP id ffacd0b85a97d-42b59378468mr19534486f8f.40.1763567148170;
        Wed, 19 Nov 2025 07:45:48 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:47 -0800 (PST)
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
Subject: [PATCH 18/26] mm/memblock: Add MEMBLOCK_INSPECT flag
Date: Wed, 19 Nov 2025 17:44:19 +0200
Message-ID: <20251119154427.1033475-19-eugen.hristev@linaro.org>
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

This memblock flag indicates that a specific block is registered
into an inspection table.
The block can be marked for inspection using memblock_mark_inspect()
and cleared with memblock_clear_inspect()

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 include/linux/memblock.h |  7 +++++++
 mm/memblock.c            | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 221118b5a16e..c3e55a4475cf 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -51,6 +51,10 @@ extern unsigned long long max_possible_pfn;
  * memory reservations yet, so we get scratch memory from the previous
  * kernel that we know is good to use. It is the only memory that
  * allocations may happen from in this phase.
+ * @MEMBLOCK_INSPECT: memory region is annotated in kernel memory inspection
+ * table. This means a dedicated entry will be created for this region which
+ * will contain the memory's address and size. This allows kernel inspectors
+ * to retrieve the memory.
  */
 enum memblock_flags {
 	MEMBLOCK_NONE		= 0x0,	/* No special request */
@@ -61,6 +65,7 @@ enum memblock_flags {
 	MEMBLOCK_RSRV_NOINIT	= 0x10,	/* don't initialize struct pages */
 	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
 	MEMBLOCK_KHO_SCRATCH	= 0x40,	/* scratch memory for kexec handover */
+	MEMBLOCK_INSPECT	= 0x80,	/* memory selected for kernel inspection */
 };
 
 /**
@@ -149,6 +154,8 @@ unsigned long memblock_addrs_overlap(phys_addr_t base1, phys_addr_t size1,
 bool memblock_overlaps_region(struct memblock_type *type,
 			      phys_addr_t base, phys_addr_t size);
 bool memblock_validate_numa_coverage(unsigned long threshold_bytes);
+int memblock_mark_inspect(phys_addr_t base, phys_addr_t size);
+int memblock_clear_inspect(phys_addr_t base, phys_addr_t size);
 int memblock_mark_hotplug(phys_addr_t base, phys_addr_t size);
 int memblock_clear_hotplug(phys_addr_t base, phys_addr_t size);
 int memblock_mark_mirror(phys_addr_t base, phys_addr_t size);
diff --git a/mm/memblock.c b/mm/memblock.c
index e23e16618e9b..a5df5ab286e5 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -17,6 +17,7 @@
 #include <linux/seq_file.h>
 #include <linux/memblock.h>
 #include <linux/mutex.h>
+#include <linux/meminspect.h>
 
 #ifdef CONFIG_KEXEC_HANDOVER
 #include <linux/libfdt.h>
@@ -1016,6 +1017,40 @@ static int __init_memblock memblock_setclr_flag(struct memblock_type *type,
 	return 0;
 }
 
+/**
+ * memblock_mark_inspect - Mark inspectable memory with flag MEMBLOCK_INSPECT.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_mark_inspect(phys_addr_t base, phys_addr_t size)
+{
+	int ret;
+
+	ret = memblock_setclr_flag(&memblock.memory, base, size, 1, MEMBLOCK_INSPECT);
+	if (ret)
+		return ret;
+
+	meminspect_lock_register_pa(base, size);
+
+	return 0;
+}
+
+/**
+ * memblock_clear_inspect - Clear flag MEMBLOCK_INSPECT for a specified region.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_clear_inspect(phys_addr_t base, phys_addr_t size)
+{
+	meminspect_lock_unregister_pa(base, size);
+
+	return memblock_setclr_flag(&memblock.memory, base, size, 0, MEMBLOCK_INSPECT);
+}
+
 /**
  * memblock_mark_hotplug - Mark hotpluggable memory with flag MEMBLOCK_HOTPLUG.
  * @base: the base phys addr of the region
@@ -2704,6 +2739,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_NOINIT)] = "RSV_NIT",
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
+	[ilog2(MEMBLOCK_INSPECT)] = "INSPECT",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.43.0


