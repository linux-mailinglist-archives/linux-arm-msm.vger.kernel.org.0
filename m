Return-Path: <linux-arm-msm+bounces-82536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D076C6FBB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 16:45:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id A2E572F259
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3063446D2;
	Wed, 19 Nov 2025 15:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s77ePi5V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4ED23E346
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567128; cv=none; b=i/mclbiUCCNySJAZk2of/rtiEzBpSFKTcoYXRsgs3+fWn3eUd14FAXQP01hIE89yrwT9mud7b3HJLMqD2nMDNnKidI7WopaCEruubd0vZ2dDx4h5R+87upu6tnOI96iTuPBJ2XOlO95Kb7YIsSbmpgwIEmTcPkyso11OWJdlMl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567128; c=relaxed/simple;
	bh=xVX5vMoWLhUppTQAzGqUyciUL0HvTWD+fRU1g1HFtlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rUCInn1eiu7vxa6HDff5IPY1MQ74LZgxbINfHQ7N6JhpTVfIs3XtwA5aQT1sX6BrurHkOPmjqTqoDQErglQQZGBijgasZb7xqGWaagHBBBB0KdyGubOmDXGeaL1kcxo9w90m+qySKtk6hVOnHg33jVUZUIFGrj4nAk3Cvi6TRRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s77ePi5V; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso38459435e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567122; x=1764171922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0blJpzJVpLViS6yP++1+Q3N2n4IWObMjESar9bHwcO4=;
        b=s77ePi5VwhAc5RdCjyAb302P4Ka1p3s03BC0V2FspdVUm4i7WYiQ2/MLytX6QDfaGN
         kK0mUXAjWAWky+BcR4OpUoRFi0GuLC8Jj5SFvNrkKqqTO0fWekjRVtmOv5IQvQfdHEQK
         TgXteXNfAy3vUVfU4mt5qaDa2qJFDh+l7TG550TjqEsNBBo3aCcHsKC73Ycok+9pbhk4
         4qiYo9F/ku0uKX/a+S6dfpVvgv0UCLbmIZ6q2Z3sPsILWyDBj5OUEh6kQHBhCPh7EmVD
         hwar1tExtLfqrIQdYXQl1vj4KnszoQmpLBQ0hyx18qnEvaC6g0olZ5w+plmslpAGCUNT
         kFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567122; x=1764171922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0blJpzJVpLViS6yP++1+Q3N2n4IWObMjESar9bHwcO4=;
        b=Mw6HzgJHrH0zpRc7izHfKJdcf9YgG0jjtTnloUKl2EMc7J4Z0hZ4rrG2yAo3tuVveI
         pRN8y19h/mVjI+/Cp3u0OjJS2eBJ2kFvcQhXd6U+CDclveLgi7OMn/abzCLwZok/fNap
         mMNajRmTDpnvq9sdCajRukf4ZkbYySCKUhc/XxUMXKxFGmbAc1PvyCrphNmV8FMjp8Qj
         JIdeq8oj9QDIwbloRPw6lqqoO8Dp8tZGR9Oq889cH8Vp4a5DVHjqJg4TKgAHIL8oy5IG
         04k7Mygkg4rVr2AS+xjB5vubCOMeLmXlD9ud8fRd86322TaF3InPLm+0YCkuaoO81Drz
         ZXaw==
X-Gm-Message-State: AOJu0YyWcqjOvN5u6n2tY/XjPpyLNNjxwhiNdsqnm/SMa69ha06GUDxL
	Y8QR0bfmdiANlChmoSYFqkAV6TtjOHA2Jr081oLe/UMI8f58Kx7W7rOkeXfOANxwt0pA9TEf40i
	eHHWr+xs0lA==
X-Gm-Gg: ASbGncvDUvTiGoDYJe9ucbL1Cza8KwZAtoZYTNrY+LhBvLtuncZiVTb7iRZzk2HoBut
	9/9fzcxfhxHOFIPH3HddhvsPDNJmT4NyNIwcUhGjnOoWcTG/dvcIBsx0GCl8oB2lyreIJhQ5tIo
	oZ6C55cWpZfy662wKzJRa6HKa/rPh7Q+sq2gx/sCnW27jAbA9oJudnBYhy32wXuvA93JTsZdcwY
	W8x1RUkQGQPkEsOjr832enMLD4ptxOkC6pgaTbWeDJCi3NOsnJtoYzA2haRYBAwTf3F+i/1Z2qQ
	R5/Jr8kzRW/WHhcg9K3niSyqWEV8AnSiUkiHNuq2EjwvckIjTqFP9SN836up8fRwwPNIwjbHQ7m
	mGZx0A9Hk4tzdlWg1uB00E9i1qbTwDvFPADz8Jg1vncYgGBS47DUhDl5r4PKqrltxAZuEcsf6Fw
	pImYpakSIxa420EvxlOig=
X-Google-Smtp-Source: AGHT+IEf0A8SfCPAIU5Y+01ECXL2jbadglpozgNAZPe+3fJhQYPBk8r7h45IbtadEb3Wt583O3k4NA==
X-Received: by 2002:a05:600c:3587:b0:477:58af:a91d with SMTP id 5b1f17b1804b1-4778fe522f3mr209598755e9.5.1763567121930;
        Wed, 19 Nov 2025 07:45:21 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:21 -0800 (PST)
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
Subject: [PATCH 03/26] mm/percpu: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:04 +0200
Message-ID: <20251119154427.1033475-4-eugen.hristev@linaro.org>
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
 - __per_cpu_offset

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/percpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/percpu.c b/mm/percpu.c
index 81462ce5866e..cdc5b30f6a99 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -87,6 +87,7 @@
 #include <linux/sched.h>
 #include <linux/sched/mm.h>
 #include <linux/memcontrol.h>
+#include <linux/meminspect.h>
 
 #include <asm/cacheflush.h>
 #include <asm/sections.h>
@@ -3346,6 +3347,7 @@ void __init setup_per_cpu_areas(void)
 
 #endif	/* CONFIG_SMP */
 
+MEMINSPECT_SIMPLE_ENTRY(__per_cpu_offset);
 /*
  * pcpu_nr_pages - calculate total number of populated backing pages
  *
-- 
2.43.0


