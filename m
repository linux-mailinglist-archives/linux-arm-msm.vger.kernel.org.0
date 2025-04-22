Return-Path: <linux-arm-msm+bounces-54939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 459DCA9677F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 13:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82E8F189E230
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 11:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5033F27CCF0;
	Tue, 22 Apr 2025 11:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KYPl6CiW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF8627CCCA
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 11:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321541; cv=none; b=aFrsB03dCbhurEk+7BMqI+5P9QwfoBppeo+RmxF39xMVqWFDAMRuOqlSezZMP6jzqKn5AWodYboinbp1G8OycPG2H5ay7iNuqy0rr4yqv2UNHCRo1BSVl6P/HajXtAdWPLfh0TrQ/RI6HkU9eGzyja7JCNr1yU79yRJJ59Gdxxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321541; c=relaxed/simple;
	bh=pBi1MUo8cyhJVlwqE0as22e2neYDMnkEOd5dFu8AL0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L8BrjhJnOnub6UGfLRTJMYL0/8JweGfKGtbtYniNh0se+jVuUd5EzRh3jHdjFoI6T/YUiPjw33ve9h4h8uT0+iwzegWojX4JBrtbFjFIbGxRvtsXg52kV1fhBxVKQjZogeEUCiImxfcVM8bYTbKoQYCJ5ZLY4UCd8Mpw2qEmDVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KYPl6CiW; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39149bccb69so1870006f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 04:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321537; x=1745926337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jy9n9cFpVQUkUpiWIEsm4sdpu3oKdgg9Qw5HeontsNc=;
        b=KYPl6CiWNaoCBimlWWGfgTjsi76msswKk699gf2ZPm42O+rozUPrSO+49drweDDGHn
         X9KXjPBPmL4eewNa2tTeuuNnEToxiSvFR5Y4tiEN8sbNfZilc6B8lyEzA23iCYNPoIp9
         KQQcHXBcq3nM4042JgS0AtFjyBU1c55z3l8AH1qzPUXV4ha6rdKY3UMETJF0uuP304QG
         L9QBOoJWWUbb8X4c5zz7Bbbltum1D2Z5q1VgloYhv53O+vnKZFMPFxJcY9kd10jN1Uen
         wx+eGM1HtyRcNo53C42tZ6InADhlwgDVW3R3WBAWvbWlb5PnN85al+ttdhZo+3ggmvwo
         +1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321537; x=1745926337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jy9n9cFpVQUkUpiWIEsm4sdpu3oKdgg9Qw5HeontsNc=;
        b=vXOun+5GIJl3WQyoRQq98iGEy78VDoau16zHJ4gbvQ91Z9lofpSE3vaj++tkZdCxDA
         JWwNaCm12nygjBeWj3sIbRLGGhMLTI1IfNm/aH7APKhly2BTE3IgwrLyBoZEshVsNjIM
         iAbuGmLjLnQsxL5CdmbMBOL9nekm3wwtKKRQUaNJ1swzHX5+nt0xhG7HFKU9xtoTKl5X
         ne854prJHGGMdRHKr0mUZN07kls/kVX/X+yv/jgCU/O31OcjEGjgE7nZmMqyNl2GlsH5
         Hv5HdnRxQmEvvVxSvVe/7QJjiPa7/QXHjgrcP2uxdlD8hem1YRGHJ2lwOBG7EphWGSH1
         ++gQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD9OZ9ndxf1oUYWsfAbbfAvf9W6m1jzNA9w5J9t0874jTiDZuEs9FjYxoIFNsUDnqRAvM8Y7Zx4Bukb7Nj@vger.kernel.org
X-Gm-Message-State: AOJu0YwgCdadnXLfn6G5spOYl7RDTW8Wy8aajvDL/RUK8Rzm/8sECbds
	eA9bKJp/O+xMxR21fNxsYI3S96SlTNcP2h1KUP5F07TVSH4SjoAgPNYfC45dXSU=
X-Gm-Gg: ASbGnctsHmkiRufGMKOKBbrHoRf+aaQDTL5cqz+n4j7afT/k5a+4D1ytsGTYKuWcJY6
	Zwxw3VlKwEp43HhtJ6+CB0upvPaEzorCnQhPRELnprqZJCeGJ1VSLveogcwRLay5FgYVTLQju/U
	vAyqLDG8c7acbXt32jja4gmMYnupFnfNrtRXpvA0a/X1jKUh0WNnAT5NDLuxw3QDZ31jezy3RMH
	L4yNv3eRMW+79OT43zZv6Vctu/pfHYq5WiWrRIeFbhQ6ERrcUGWgFJbJIWNzavqBm6nBKBHmpD/
	4dVvhsEghXXhVFQ/HBthY2j3U+b04ZX5eAvp6RxKuhEfx35dHfYChl1Gm9F/whA=
X-Google-Smtp-Source: AGHT+IENApvlIOcfQcL0LZP5BuyV0lmfNKeMfWGxAbuT+pNZSoLQJuZ1V8if61aOzV5wetgPKLvcAw==
X-Received: by 2002:a05:6000:2510:b0:390:f9a5:bd79 with SMTP id ffacd0b85a97d-39efba5a86fmr12045598f8f.26.1745321537318;
        Tue, 22 Apr 2025 04:32:17 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:16 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 05/14] Documentation: kmemdump: add section for coreimage ELF
Date: Tue, 22 Apr 2025 14:31:47 +0300
Message-ID: <20250422113156.575971-6-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add section describing the utility of coreimage ELF generation for kmemdump.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 Documentation/debug/kmemdump.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/debug/kmemdump.rst b/Documentation/debug/kmemdump.rst
index dfee755a1be1..b67dc166905a 100644
--- a/Documentation/debug/kmemdump.rst
+++ b/Documentation/debug/kmemdump.rst
@@ -17,6 +17,12 @@ kmemdump allows a backend to be connected, this backend interfaces a
 specific hardware that can debug or dump the memory registered into
 kmemdump.
 
+kmemdump can also prepare specific regions of the kernel that can be
+put together to form a minimal core image file. To achieve this, the first
+region is an ELF header with program headers for each region, and specific
+ELF NOTE section with vmcoreinfo. To enable this feature, use
+`CONFIG_DRIVER_KMEMDUMP_COREIMAGE`.
+
 kmemdump Internals
 =============
 
-- 
2.43.0


