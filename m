Return-Path: <linux-arm-msm+bounces-82545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 771EEC6FC13
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 16:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id E489F29C6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351DD3702E2;
	Wed, 19 Nov 2025 15:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bz492DHl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909F123E346
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567145; cv=none; b=H5WDRi9ZbsCpFgxC8sWu6R8gWDON7pgdVpZaN3z54mh1nbaorVYyC17bhPkzlM6BsGM4sjZmlvaTduNpuRp9N0ogP//68J3MauMf4HjWu+XL6PcC2AOP0qOAR0FEODIObviYmPxR4tkl+i7/BoPg+s2EZfeZQUYXGpUV3+KttGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567145; c=relaxed/simple;
	bh=bdt5n2rAVI8cStNvPmdZt8oM87hfXgPy8mlP/xL4jOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=djDRu6BXzb+QN8L3upQUb/wGYMZsg7CAlXkRi2CYekeitADNQ1NH9P0msi1XZK1YlBncYbmcT4SGI8kAunAHLAYmKj0IZ8/i1uZbNHk5hxLttl8OTl5QGSgLjdlkTYL3lao8qH/KsRrlDTOQBAps9saSdGq1SZDUxVKgitMmYbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bz492DHl; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b39d51dcfso3930702f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567138; x=1764171938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slnZKLktel7FGULom0AhklQ/3aJdt8tuo66g65NOCPI=;
        b=bz492DHl5yOzE9yJqimKdlgCFvBmcsPkvDkuBNCriAVZnkeSAqY3nP7LGbyBZvdxbW
         oc2HOPgDgVH18yyt6HjNfvydEL8GIuHXv2Pofai7w1UKXlmII3hPumvCXNOvOePSROSi
         e/2BiBnIWC2n2sNn+FoRECLcoeEkoo+4CnwCEhpQwBpUULBVqNYLT4F1hgITIZqkJLqQ
         bfeKsPz9KlTRqx2ZVlK2A6artCAtJV32H7NQpEOqVUMiDR1uo3umGlgdSfA+RVSV9ygb
         zLmQSslT7dn9MaSqtfyzoxsSoi+0bpd+NdlBvr5Az29P7gmjqheUCt9rGNgINWi3WwuL
         Kn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567138; x=1764171938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=slnZKLktel7FGULom0AhklQ/3aJdt8tuo66g65NOCPI=;
        b=MfFV6QUALXyOUhgw5+Gm2QrDPvIBHQhEG7pvb5/U1BEdPDgcSFg1D9sBiwALSQFlwa
         giy7Sm5luM8/wJB1BUhiESgVWQeqSBau2ICe40JAQ8UJjKETGKh3GBDXy9oY0yChgQVo
         NDPFlmSCfbDVqjM6lr5Y9TgdCN+28xlSd3fKzaty0/Ui5/a92xRxLJ3tjXOWqaBuzoba
         14VdJysVDqe8B6slhqeh4D0nz+5elqiHr0mNcFJCxXFtQlkroawzQZlwq+j1/bEqosdX
         WQkzGU+9JPMq3+2vM2lfP0eCXdQbYkp0+Akp4hN8vjisGyyoySpinvcUfsZ5chEbTh6r
         LP0Q==
X-Gm-Message-State: AOJu0Yzmau3yIOZhRCql4/zc1Filkset7aQOcFSKExFwZF5DhlRq8qh/
	85ug/L4sdzHx8a/5bF2++mGlE9BVRRyd7F/8MiarOPtlRWhEcohz/Y4v8vRbKRWF9ifVmLnRMIm
	oCyWtZwnYhw==
X-Gm-Gg: ASbGncuPd51lhq796qhNec79itRoJjkn17R6tNkPgrtC4+llq3EHjL8YqelN2O9QYB1
	lKfxi8UjXOs2B5cEJ7S9GDfkIbcGjWSHPObDxqj8pzHWly5f4PWbwmkY5L+l5Wa0lyB6C6TCy4P
	GERlTfym+LWMEYdP4ujPm8EGYMQbBYa8IczH3m40GaXKRWri8v/0GMm0jXH+mpZV6Xc0Ikrd0Lk
	B7P9ehCqx1I60F4z6qn1QR0zTQz93j258RPMrdd/qpixB1s2vxrlzJlA1zOdSd1TvE917LFMS31
	O9ormz5ike6T6A0mwOyTRAfBxlWRVA8kNnSdtjkSmdY65iKgQyx7da9/EgL5wGtOqHQjdwOEX//
	v1Ee5QMBtfpAkoKTJejyiKMwwqIJbLY4cRzeUb0y6NB7FWIkiwxUPYZLf55iDDJhT0gxtLCrC+p
	EmM1gUw+RwWE5xYU0wTxZR5xkl/WB9DXS2hvSbZZBb
X-Google-Smtp-Source: AGHT+IH9XA5XKwB+eYd4P52AVjjtUkCjRx7TcK6UtIfvF/aP3IOPVELnIO3YhYk8yezAw62YpuQ83g==
X-Received: by 2002:a5d:64e7:0:b0:42b:47da:c313 with SMTP id ffacd0b85a97d-42b593395a0mr22250899f8f.3.1763567137600;
        Wed, 19 Nov 2025 07:45:37 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:37 -0800 (PST)
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
Subject: [PATCH 12/26] kernel/configs: Register dynamic information into meminspect
Date: Wed, 19 Nov 2025 17:44:13 +0200
Message-ID: <20251119154427.1033475-13-eugen.hristev@linaro.org>
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

Register kernel_config_data information into inspection table.
Debugging tools look for the start and end markers, so we need to capture
those as well into the region.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/configs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/configs.c b/kernel/configs.c
index a28c79c5f713..139ecc74bcee 100644
--- a/kernel/configs.c
+++ b/kernel/configs.c
@@ -15,6 +15,7 @@
 #include <linux/seq_file.h>
 #include <linux/init.h>
 #include <linux/uaccess.h>
+#include <linux/meminspect.h>
 
 /*
  * "IKCFG_ST" and "IKCFG_ED" are used to extract the config data from
@@ -64,6 +65,11 @@ static int __init ikconfig_init(void)
 
 	proc_set_size(entry, &kernel_config_data_end - &kernel_config_data);
 
+	/* Register 8 bytes before and after, to catch the marker too */
+	meminspect_lock_register_id_va(MEMINSPECT_ID_CONFIG,
+			     (void *)&kernel_config_data - 8,
+			     &kernel_config_data_end - &kernel_config_data + 16);
+
 	return 0;
 }
 
-- 
2.43.0


