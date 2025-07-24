Return-Path: <linux-arm-msm+bounces-66569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A89BB10C82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 16:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 745D516A915
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B2E2E9EC6;
	Thu, 24 Jul 2025 13:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q+n07aCt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF132E7F3B
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365404; cv=none; b=Diwzad20O3k+9CTDHKUicE0U5cMgJsfXb1/ggDG2S3id3J5E2G0NfrR9+kjQtUf+bKNvYXgFqtp+s4+F0qti6BHH5ArHonmpikOzO6joE2tMxc4akU9Hm3fZKXnA4el8hnvkh48OFvUEDXaHRcYQubURMFjDQi6gbf/2WWiYH9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365404; c=relaxed/simple;
	bh=j52yzR7Gpkc2C7QzVnAL6OhmqWFXWx3JwzJVokNsTms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=umAvOhIe9lAPtD9HMDLTCDjmFZNjyXurAe/igNSy7u1F8lFrV/i0gUNG90DZjq6YcF5qInMYXslLuPonul9HQniXok9v+kbpbo04bf+I6qakxR2NS3DEA6AGkMI6LQJjiI2R/pRXZwTuS5cjaea+5yV1O896pc57qXL57I1zDss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q+n07aCt; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d7b50815so6722785e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365398; x=1753970198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phPxbutaSa2cHj8lQiAqRNXIpOiUr1sfgJg1sLmhr6Q=;
        b=q+n07aCtzLI5b5OprZDAIq8uAz3mWb20L+1xonnsPcouJj98jigrLf3qnMfoFVGfjI
         OeM+S05Brccvs8IcQCcBzyyTuTZArzaZr8h9ZMfyRrLigg0kpO725gQN5XC2ZzbVUM7L
         y0SjDNgVhz1kD/1GqaIOIxzY9rvg50jLnvwQKhgCp4qLn+r9PwtjQG5brJ+1iI2y9KoD
         kezpmDXrZh+N2x4Ohl6XzyCKFMsfeS0oratUTsc7VHeirpSYKt0fwdUtrXfb5e2FHUE3
         cs7nx92cEbIVH0knZ4w6CwYkO9geZwstvRoJzP/BrqrH7YGor0OWRBqmLrF6Bzl6P2Wc
         fJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365398; x=1753970198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=phPxbutaSa2cHj8lQiAqRNXIpOiUr1sfgJg1sLmhr6Q=;
        b=HMCLeWp7iQfBDtnK1bRRp3kFLUhKUtrZDtpTFtnDmvE9zOQtbRynRlZZVRt4zGoe7W
         IhGIuxUDNrs5bHu1sFWecwXLINobkRy0p/WIlmIXMSMMeotWXHdPwCDlGTHaIIft3bkH
         6T6IRys1i7NxBHIXdiF09fnWK9YcxU3sEEyLcIhjIdrcqQEm6Kqs8xQMRr678Mc4nZ8h
         Bkf55QM/Q3WHd5zeN2d3AVYm5vhP1kS2ouWdwO5TMx8j/dp/IO20Pn9zjFQI1UKV/hl0
         I3TPop1B4JyyTZwhA4H0M5hzomQOAfpfZDgjVD+TAt82aMIIQVip2Fc8TojTEFcQySwf
         nBSg==
X-Forwarded-Encrypted: i=1; AJvYcCVX6FMC1PIr4gDXkzEP477Psgff6gpDF97gFkG75u1bIJl4WQE19ndyfYTUMRNcRjoDSTkE05pdksCdNK3p@vger.kernel.org
X-Gm-Message-State: AOJu0YzgVO7s7IJyvoQvjClCiAhAEc2Lh6bzJT8NvFPPpfCbzwE9HaJN
	ZAhV3Lab7RjCI3dlKdUxn0U43GawEVvRNro/NJtrMNZ7pFeoKdnxpHIPw9f7H3qBH/8=
X-Gm-Gg: ASbGncuhSxFL7IDwVhvOvDg0xWDEmCXHknufhmFNWvuF7WY2LwCxXCOGd1TFdnLJN4R
	Ht0oXmjfHdMQzfBrQRvyxXxIBL0gQLpKF9BZkzRhXtPwBKPSzOSuK69zA2D0ruu82/bkA7ZOKbx
	FpHq1owlRr7xaCfGom97W7ukBvGvcZ8GjbKSAFDfRNzHjWUDpTkn+J0iWTX/oaHD4XM9xndzlMm
	n+Jw/1AMiGf29DfUj39MsEI+d2r9kbxPasggt+g+0CxlhbCLBSTC36BrQVmDQe4xwo6tysaGPlW
	2gckAhGlQmdNl4rUdWF8fbRlNazbZAVs3MZ/rHGnFYq4QqTCV9OM7Xly27hfUJmp6pIHJC3WtSW
	2/mvUTMpgr0l5vYVvR4QrwlF0sgG2KQAe2pjbySXq2DE7vLlYC9WsHe19Hk/3GdyqhPcYP+Qw7Y
	+d+fNw9dk1EfIE
X-Google-Smtp-Source: AGHT+IEzG7rA7SjcU5/IexjXqSf6MXBAUKpIcrbkFM4DkAzOo8wQtcA8euIhs0yEfuaDr3L1GJYTKw==
X-Received: by 2002:a05:600d:d:b0:456:207e:fd83 with SMTP id 5b1f17b1804b1-45869ea827amr55222245e9.4.1753365397698;
        Thu, 24 Jul 2025 06:56:37 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:37 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	eugen.hristev@linaro.org,
	corbet@lwn.net,
	mojha@qti.qualcomm.com,
	rostedt@goodmis.org,
	jonechou@google.com,
	tudor.ambarus@linaro.org
Subject: [RFC][PATCH v2 17/29] mm/swapfile: Annotate static information into Kmemdump
Date: Thu, 24 Jul 2025 16:55:00 +0300
Message-ID: <20250724135512.518487-18-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Annotate vital static information into kmemdump:
 - nr_swapfiles

Information on these variables is stored into dedicated kmemdump section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/swapfile.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index b4f3cc712580..ac5a2307a278 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -42,6 +42,7 @@
 #include <linux/suspend.h>
 #include <linux/zswap.h>
 #include <linux/plist.h>
+#include <linux/kmemdump.h>
 
 #include <asm/tlbflush.h>
 #include <linux/swapops.h>
@@ -64,6 +65,7 @@ static inline void unlock_cluster(struct swap_cluster_info *ci);
 
 static DEFINE_SPINLOCK(swap_lock);
 static unsigned int nr_swapfiles;
+KMEMDUMP_VAR_CORE(nr_swapfiles, sizeof(nr_swapfiles));
 atomic_long_t nr_swap_pages;
 /*
  * Some modules use swappable objects and may try to swap them out under
-- 
2.43.0


