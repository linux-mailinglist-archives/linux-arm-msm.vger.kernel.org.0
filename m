Return-Path: <linux-arm-msm+bounces-82552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B14DBC6FD9F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 16:56:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0A9DF3846B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5B93A79A6;
	Wed, 19 Nov 2025 15:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XXrmnSHa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F3636C0CE
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567159; cv=none; b=uJoOTpCv+HNesZ4pUw/RDxd0Li9O2+0rwZi3CYYz6l59PbUmdwzVqYITJ1tPg7X1Hz2oJ6X70yjk3MUkII8XS0OzV3JB1uOCDkQ5AJgSFVyo+r3YF0lYNyLhuhHrmkv8kSI4negjcd60oMWjnDnAef8iCb9qwABQYO80WOLSTGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567159; c=relaxed/simple;
	bh=f3/jMwmnVv3mI87uodqbEJ5zmLRyilWaBRh2oB7xeIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i6+vCFazVp18tjn4dlnSbMvNNeobWAnpHaESj4yNoJlfnLIchjxa5OvjxgPd3rmFU55KKV27Y4gsRYDUElrtIevHqv1tl1Wv53yROxARj1npltjwaLQhfPaxtW92Q40QEQfI9aQpmBhj6x0Nn0jlPV7oF5j/et8JHynbBag3oN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XXrmnSHa; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4775ae77516so75161985e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567150; x=1764171950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TG3MkEScUQgKy+QWFE7rEK/ceT0KdBZscolLPvZ1jcY=;
        b=XXrmnSHaTf1vf6uqqllPUT0sMUElMq1GY66Her4KbnbRi5e+DUU+M+SWXGUt2CZ6yi
         Fcfg1D6NcZVjy26O1mHYrbiVIPaAlLBA2GBqvpgLMBXyymHP7sB69YUN84ZdMxEQx29S
         DToilDeS7YIqZBRpQLn/r+GmhRa5gNuXE+wcynhuswMQIYn0NsTWAoMVNaNDtskjuf6d
         eua2UlS0Q7BEVBAS9dnTmdA56yZpIwU8XFShysHoYhbEidZl0ofZ+gQZPlTrTx3l7IgY
         d2eNag3MWaOS0TVX4RMZONoYBqxONt/LCOMwvGtHCkIwtA0Jveoa88lEMBckYQCQjlIx
         QEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567150; x=1764171950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TG3MkEScUQgKy+QWFE7rEK/ceT0KdBZscolLPvZ1jcY=;
        b=u6g1KG1ho7sdiyWxJgzva34o8nqoaijbv99LDDhRbq9ij05eR9ompVtewkPuGfztHO
         cd6lqIzWT82nQd8Yr8Rul6ZI8T9W3389R5wXC0Z1fv34Ue96go/0huiSdIW7Rq3PeXMF
         4SpETxj2p61XBnvqAVcMR9WxVX1BbyWCt/OlEcRGrDVs5WzuDa8OKuAV1IjbijMWkRF1
         Atz3ZoWZDY0LksWxvd3AYXpyqZ0tZKKt3asykQKG6sBe1nuYtVfnbn+z7f4y+tgIIhAI
         xCeL9zs6NvruqJIDS74+YoGV5om7pUR9xlJPIvRSMrx4iV8lCnDru7IpWx/6aiVljeQ6
         k79g==
X-Gm-Message-State: AOJu0Ywe8eDefK9Hg6skUFd2YGt77zjg+eC5goWp9KS0qIm/6vAo22I6
	l1lXpVqVCdflHBS1zqVmBCigJRLgG8lsmDAfMZKi1iewSSHLSw7n674fDm3rmEmIyC5OK2Sicsc
	s//xks47iCw==
X-Gm-Gg: ASbGnct68i4BOO7e/LuIP6LqkvRHeuJ7KoWtBpfJrurx1/rqLOGkcWisbjuhKheZbvu
	QUWqRPUYrnoA7SpEmHflwzTSXbCmR0z32tABoT5FTpnhzarP5SjWvFc6IPq5CHqMvbho0Efvd+d
	TuhJeLKOwZJhVu7YLsqimyTH3KHt939fVJ3jpZ68wX5rHYvzUae1gk7GsQQITGaSHxrSdKUluxl
	6Dmsx5Zs7P4FQRvYV/55YqBz/W00vCmkORL99ly9m4l4ZNBFSbFFYH0p5yUMlYBpB0JgttpNxXo
	De1AoToHKSV1y/rQOZc5jjIl+jXoNU3qfXW3PbLCrAD1fxSN/GG854xVnHIiRjiBPH0DAyzpDJD
	3g4DVT4SB8zfzu1bfHjrovFplwaMD7r3Y0tcwXDpaAnKgqbpAXkHGgBEvmgSpATgcggoB0w9bno
	Izm358vfcrIb3p6UVL/tiGQgbBhPsR1w==
X-Google-Smtp-Source: AGHT+IHArpVzpD3LO0mA1+dNKflLF3LKgYCdBzRW5r7OQjPk30YRri90746lAxdaW694nNfBsFGkIg==
X-Received: by 2002:a05:600c:a05:b0:475:dc5c:3a89 with SMTP id 5b1f17b1804b1-4778fea881fmr202472465e9.34.1763567149948;
        Wed, 19 Nov 2025 07:45:49 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:49 -0800 (PST)
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
Subject: [PATCH 19/26] mm/numa: Register information into meminspect
Date: Wed, 19 Nov 2025 17:44:20 +0200
Message-ID: <20251119154427.1033475-20-eugen.hristev@linaro.org>
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

Register dynamic information into meminspect:
 - dynamic node data for each node

This information is being allocated for each node, as physical address,
so call memblock_mark_inspect that will mark the block accordingly.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/numa.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/numa.c b/mm/numa.c
index 7d5e06fe5bd4..379065dd633e 100644
--- a/mm/numa.c
+++ b/mm/numa.c
@@ -4,6 +4,7 @@
 #include <linux/printk.h>
 #include <linux/numa.h>
 #include <linux/numa_memblks.h>
+#include <linux/meminspect.h>
 
 struct pglist_data *node_data[MAX_NUMNODES];
 EXPORT_SYMBOL(node_data);
@@ -20,6 +21,7 @@ void __init alloc_node_data(int nid)
 	if (!nd_pa)
 		panic("Cannot allocate %zu bytes for node %d data\n",
 		      nd_size, nid);
+	memblock_mark_inspect(nd_pa, nd_size);
 
 	/* report and initialize */
 	pr_info("NODE_DATA(%d) allocated [mem %#010Lx-%#010Lx]\n", nid,
-- 
2.43.0


