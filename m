Return-Path: <linux-arm-msm+bounces-82546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 80466C6FD6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 16:55:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 523594F9889
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D3A370304;
	Wed, 19 Nov 2025 15:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rAnSdbFB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E3536B052
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567147; cv=none; b=idTyZhnVAB0kKwrUP4lxjW0IixKy7GFRPDr8FQrdh7yf9rmTjL8iSLIVuDdhtCnZWohfCmgw+99LAemEeC4TaDFaZNpkQhf6WUWnFIPP8Jli7DM32rxsVSy0jlb8bmPlvH5UfPDgKQQlQerVJfejkHWuwN+HX117JWBbjyqJfrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567147; c=relaxed/simple;
	bh=JX9G2IddNBochneGYWQCKynmuHEMYdz6GZlhqVo2tUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AS4x8CALOukuZ1z3ZGCbjt5Z/uChlbfjq7ryHXr4U/qVUOOXRx4M4+mAEtTCUrJU0KbA5+emDziNG5+4uWFNpilYZdk9cGkBoHAlXzw+cpi4x+jC2x9MWZCWGv+m9esOpDdcJ8p1td1Wo9MvPNzLRtf3UppaL8w4Qcx9S1wVbHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rAnSdbFB; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b32a3e78bso5589325f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567139; x=1764171939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjJbR05GJTjvP4eC8iuNclWxk1mMm5RuLT4aWNn+uIg=;
        b=rAnSdbFBCLvJLjGUsRP/QcCxvZOZSBH0Zgq71o4AlrJ42jn5rslMLmFXW2AxVikkjc
         TCFSyFvag+KDqaGb+sGs6y6Xav09Zyp10l3ZPFhA94o2Ri3OzwIj02xzj+m0FuSPn/Gv
         hD1RwrF7bt3oyLRQ5AQJ5JdP2XYKa+DRSBQ8FahHCby8Rmw4HIxn1MEMOVXs7a2B6/2u
         EVKQhhdTnuxBtaFrS4GyTGu+YV6B791L869p/wQHxmNOdi+WqgZOXrqw3s6bGiwy5FTy
         Tw6bwTM4dfJLyCpzNUExW1r8gLRr75kF8oll6wI7RdBr3kTbO/KRsqKSb6aLjhuH5/bX
         l6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567139; x=1764171939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JjJbR05GJTjvP4eC8iuNclWxk1mMm5RuLT4aWNn+uIg=;
        b=t//nFafCa/KUP5bC3pRtoWbt5Xb/zAi3/4gjWia8g6FaGnwHb1i1opzrEW37GLnJk0
         MWnsllVwEiUSh1nzgalH79lPzCx9BIpZqYEca1RddBt2dhprB7AQa2POklxnCP3jhkVJ
         v1GXG4r9oVX4oKf8VYsboXtclY/Pb74C6iS+eeim1X4nLCiKsPsVEREyJSsIV+euOWSo
         pwgGtjHji+TcGm+2Rzgl2SnX2tuMIVyQ72oB45DD0PSDzUnzctyJLHBgVf2dRUCVCwTV
         TZkndcabf8QEXaDeyut93mcYTvbMwWewbwj1hfqcEEzC8twQVQSfOX2z8ji0eePyfNx9
         /T9A==
X-Gm-Message-State: AOJu0YzNcEdmQps2rC2kMPZ8Ro2kjXjWSy+l496fxSZGQBPLqMTnbP9n
	PuP0RoqtLbK0wvSo2tgI3RzsO0iLWUAQ9rJoTAojsXVGUsd0rGWASVZoAJY/jf5cDayUtQ4eq3E
	/+WECvlrGOA==
X-Gm-Gg: ASbGncuk+oiekH0IseWcoJWTjLDI1JmxtBYhIOCWEXHJrdJUGFFJz6VUcKNwss/Pg1X
	zj5rYb8ouYqMVCuKSsytZzgKPh2op0Vlb6JiIjoE+vA0ZAfi8/Vhp/xMVNJLMJHEWEFT17S2SJF
	yfeOD1ltf7DoKl8yHz+Sv7pOEAUX92dSCUq6PnhemyFFxGOa1WmKpeWyYp6hwdc3qdEdBJ4Igq8
	n+cHptvxmX2tojTDFrjXuXT+UYsGa5z0QYo0LJYVwTTSSFFxPbhgDxn2Lj6XlXqVYe2ufbpVqdN
	C+zQr2A226wA4WwIPj64Yv+k9FO7bBwvRkA3Igwgu7TCcCYkaiuENXpBEkGDylH9hOCK7BYzxi3
	4kyRdTirH73EcdwjK9k47olRaaelRFj5UDmG7Nua3KlB5nN/mqHJ+nlMMbpyu3HHCDS0DOkPtoh
	t/YeleSpgmmA7lgXfGgA1Ft1q0MFDDuw==
X-Google-Smtp-Source: AGHT+IEyhedKwAlBM3EiuchJNsF2kJSsWS7yZo6BNIFhuE+C/7ka0URI4Q7HQ+TXxvH0Bkqj0xsuVQ==
X-Received: by 2002:a05:6000:2c11:b0:429:cd3f:f43b with SMTP id ffacd0b85a97d-42b5933e404mr19233459f8f.4.1763567139371;
        Wed, 19 Nov 2025 07:45:39 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:39 -0800 (PST)
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
Subject: [PATCH 13/26] mm/init-mm: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:14 +0200
Message-ID: <20251119154427.1033475-14-eugen.hristev@linaro.org>
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
 - init_mm
 - swapper_pg_dir
 - _sinittext
 - _einittext
 - _end
 - _text
 - _stext
 - _etext

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/init-mm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/mm/init-mm.c b/mm/init-mm.c
index 4600e7605cab..6931549bb7a2 100644
--- a/mm/init-mm.c
+++ b/mm/init-mm.c
@@ -7,6 +7,7 @@
 #include <linux/cpumask.h>
 #include <linux/mman.h>
 #include <linux/pgtable.h>
+#include <linux/meminspect.h>
 
 #include <linux/atomic.h>
 #include <linux/user_namespace.h>
@@ -19,6 +20,13 @@
 
 const struct vm_operations_struct vma_dummy_vm_ops;
 
+MEMINSPECT_AREA_ENTRY(_sinittext, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_einittext, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_end, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_text, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_stext, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_etext, sizeof(void *));
+
 /*
  * For dynamically allocated mm_structs, there is a dynamically sized cpumask
  * at the end of the structure, the size of which depends on the maximum CPU
@@ -48,6 +56,9 @@ struct mm_struct init_mm = {
 	INIT_MM_CONTEXT(init_mm)
 };
 
+MEMINSPECT_SIMPLE_ENTRY(init_mm);
+MEMINSPECT_AREA_ENTRY(swapper_pg_dir, sizeof(void *));
+
 void setup_initial_init_mm(void *start_code, void *end_code,
 			   void *end_data, void *brk)
 {
-- 
2.43.0


