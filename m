Return-Path: <linux-arm-msm+bounces-73354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC893B552B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 17:10:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5120AA5656
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 15:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE6B23148B8;
	Fri, 12 Sep 2025 15:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tPaCglvD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A229531328E
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 15:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757689801; cv=none; b=XrJnay3PgY+FyZISF0dLu7ficquUwYCH55DI1xhUh3YGZGzbYL50mI0hwIKk54hgFnEEbfwLZ7xEZYoiWBHS35JqQQvN5nuWSISUzSWVtjvBMSlMAiiYcxA+4EhkgZDCcjovv1NecQtchPtQF9xzw8WNTPCkXGGh5JyiPFOhonM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757689801; c=relaxed/simple;
	bh=NvrjHXeuAnfuPGfi6BRYd0FKeUfYwLvAE3fvW1FL450=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dIVplohJ2Q2LSs8xa42JJLHds9yupuv9pe84PBfE6kM9RL2pS0qLxwVUJsz9YqN8aiWVBkHuHTfBswDxlIiACh5un2uzhmJDwm2YD+Z9zehs+fFq72lPD58gTq+NprDkuXA3qSVrfH5ihBkKh07QvCTx/d5eqqycS5Ji6xa95PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tPaCglvD; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-60f4678ceabso1245374d50.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689798; x=1758294598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RH4GhObM3FT55o7hGQgrlMBMoWx9IX3m3EBVgQrzYfg=;
        b=tPaCglvD3bTER4nu4P7fUsfICDLNQl5bCR5rGVyNn1s32La91d2ru3fJmK8Kp0LfY4
         Nblqh4kSwxINAIKFKDxGEM26EBUXohgDFy3fvLKAHGsGdEOXLuI7DC7Bp0hiUhNFvB3D
         TIOCxqC0wjMfk2a86ow+KvQ2h4DD5pBTvvbU11dQLDzOjFC0gLG5/Xt7TPNUOBNlEC01
         QbPA/5MK6h0bNJ7fJaXPfbqSiWBofu2T8cJ3RwTvi1m160yjV36ii3Gx7cRYYzA55D8c
         icfkdVgezVShVx6JQaUnljWYBKXT+pZr4vJcdnMh0EV8owtTs0aeP5NdmdVtcw3SBh/U
         5VAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689798; x=1758294598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RH4GhObM3FT55o7hGQgrlMBMoWx9IX3m3EBVgQrzYfg=;
        b=d50b2etEimmq2NY+7caMm5X+UkweJ9uuLsg7TcP7+KaGOn58gY319xbXed1g8F6pxN
         Xt3VdASjZ/kAD/BT06TmF8gs20mgBf4seu5X823wrJtyp8W3ScY8wFCI7VCwMI/Gn2us
         g2Jr9xJaDO3a7yh783t8Kt+vslxpfjZrJUdB4DrxhtFX7me1tVZV8GOKdkIdP/jICYzP
         JMXvuFMrLYy+yX/N1Eg91trxkkbD7g76mGdSPa2ejZyWW95YcT5oJQbkDWXnq+PuBl94
         DQbJPxgt3UnSsCmidvQuFkqD6OBsTzwGp0I3AC8F/8Ht4EpgyEL/TANpBJKBVrQFdumy
         3R2A==
X-Gm-Message-State: AOJu0YwKjG8/9B5qEYzTDzFOXE+TtpoPKS6AplLuzUnFNz2lPXkiUtKR
	Gq9QAYrkGdwWHSV/3+80VFP1SW1P5BdkG6SzccW9FSn0H96X9owI6nwJFO+7NyLvnHsT/eW8jYW
	zJ6nBIR4FWA==
X-Gm-Gg: ASbGncst1/r1C6ditcrW2gZMqR58kxqQSo/DKSQZ6E6yoZ+usODYV03guwBtrsIAXSe
	CLm5s+TgNlS0xriuCO5krUyYjZX2oCjhEkawB56kUmNS3DBTAK03X5e+xz5WFqrW1VXzuiNfItq
	Blh9+HfUOcFrYg4Sy2NdkuONcYaDu7uERNgi8munXuCdC1/ZR0g+c7XejbM/EpMdce184K7Eu7a
	NTNvl55emBwaxwhBFdDSSu27ngaLy6KAW0jsS4Kr2hDZK6/AE1CayRH54ngjk4zHCF7efqSa/Xb
	y6inF6BeZo8W8rgIcjzYUqF51Xl6mehCX+gatXR3RdzgdYxJ/vB388BIWHVaBLxIFfcP1xFw4RN
	Addaoy9ZpawPCYMuLhMLM+LYK8YtdkdI/DQCysOGjGSAX
X-Google-Smtp-Source: AGHT+IHDbtGqslyeLn4YFWeoqnBwKggrxCYxTs3G1b8DQvW49OjHmQw5TtCHo1C0fUHoFsODFmt/wQ==
X-Received: by 2002:a05:690c:660b:b0:721:7e7:50d with SMTP id 00721157ae682-730651d60dcmr29556217b3.42.1757689798342;
        Fri, 12 Sep 2025 08:09:58 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:09:58 -0700 (PDT)
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
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH v3 02/16] Documentation: Add kmemdump
Date: Fri, 12 Sep 2025 18:08:41 +0300
Message-ID: <20250912150855.2901211-3-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the new kmemdump kernel feature.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 Documentation/dev-tools/index.rst    |   1 +
 Documentation/dev-tools/kmemdump.rst | 131 +++++++++++++++++++++++++++
 MAINTAINERS                          |   1 +
 3 files changed, 133 insertions(+)
 create mode 100644 Documentation/dev-tools/kmemdump.rst

diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
index 65c54b27a60b..1b6674efeda0 100644
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@ -28,6 +28,7 @@ Documentation/process/debugging/index.rst
    kmsan
    ubsan
    kmemleak
+   kmemdump
    kcsan
    kfence
    kselftest
diff --git a/Documentation/dev-tools/kmemdump.rst b/Documentation/dev-tools/kmemdump.rst
new file mode 100644
index 000000000000..504321de951a
--- /dev/null
+++ b/Documentation/dev-tools/kmemdump.rst
@@ -0,0 +1,131 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+========
+kmemdump
+========
+
+This document provides information about the kmemdump feature.
+
+Overview
+========
+
+kmemdump is a mechanism that allows any driver or producer to register a
+chunk of memory into it, to be used at a later time for a specific
+purpose like debugging or memory dumping.
+
+kmemdump allows a backend to be connected, this backend interfaces a
+specific hardware that can debug or dump the memory previously registered
+into kmemdump.
+
+The reasoning for kmemdump is to minimize the required debug information
+in case of a kernel problem. A traditional debug method involves dumping
+the whole kernel memory and then inspecting it. Kmemdump allows the
+users to select which memory is of interest, in order to help this
+specific use case in production, where memory and connectivity
+are limited.
+
+Although the kernel has multiple debugging mechanisms, kmemdump fits
+a particular model which is not covered by the others.
+
+kmemdump Internals
+==================
+
+API
+---
+
+A memory region is being registered with a call to kmemdump_register() which
+takes as parameters the ID of the region, a pointer to the virtual memory
+start address and the size. If successful, this call returns an unique ID for
+the allocated zone (either the requested ID or an allocated ID).
+IDs are predefined in the kmemdump header. A second registration with the
+same ID is not allowed, the caller needs to deregister first.
+A dedicated NO_ID is defined, which has kmemdump allocate a new unique ID
+for the request and return it. This case is useful with multiple dynamic
+loop allocations where ID is not significant.
+
+The region would be registered with a call to kmemdump_unregister() which
+takes the id as a parameter.
+
+For dynamically allocated memory, kmemdump defines a variety of wrappers
+on top of allocation functions which are given as parameters.
+This makes the dynamic allocation easy to use without additional calls
+to registration functions. However kmemdump still exposes the register API
+for cases where it may be needed (e.g. size is not exactly known at allocation
+time).
+
+For static variables, a variety of annotation macros are provided. These
+macros will create an annotation struct inside a separate section.
+
+
+Backend
+-------
+
+Backend is represented by a struct kmemdump_backend which has to be filled
+in by the backend driver. Further, this struct is being passed to kmemdump
+with a backend_register() call. backend_unregister() will remove the backend
+from kmemdump.
+
+Once a backend is being registered, all previously registered regions are
+being sent to the backend for registration.
+
+When the backend is being removed, all regions are being first deregistered
+from the backend.
+
+kmemdump will request the backend to register a region with register_region()
+call, and deregister a region with unregister_region() call. These two
+functions are mandatory to be provided by a backend at registration time.
+
+Data structures
+---------------
+
+struct kmemdump_backend represents the kmemdump backend and should be
+initialized by the backend driver.
+
+The regions are being stored in a simple fixed size array. It avoids
+memory allocation overhead. This is not performance critical nor does
+allocating a few hundred entries create a memory consumption problem.
+
+The static variables registered into kmemdump are being annotated into
+a dedicated .kemdump memory section. This is then walked by kmemdump
+at a later time and each variable is registered.
+
+kmemdump Initialization
+-----------------------
+
+After system boots, kmemdump will be ready to accept region registration
+from producer drivers. Even if the backend may not be registered yet,
+there is a default no-op backend that is registered. At any time the backend
+can be changed with a real backend in which case all regions are being
+registered to the new backend.
+
+backend functionality
+---------------------
+
+kmemdump backend can keep it's own list of regions and use the specific
+hardware available to dump the memory regions or use them for debugging.
+
+kmemdump example
+================
+
+A production scenario for kmemdump is the following:
+The kernel registers the linux_banner variable into kmemdump with
+a simple call like:
+
+  kmemdump_register(linux_banner, sizeof(linux_banner));
+
+The backend will receive a call to it's register_region() callback after it
+probes and registers with kmemdump.
+The backend will then note into a specific table the address of the banner
+and the size of it.
+The specific table is then written to a shared memory area that can be
+read by upper level firmware.
+When the kernel freezes (hypothetically), the kernel will no longer feed
+the watchdog. The watchdog will trigger a higher exception level interrupt
+which will be handled by the upper level firmware. This firmware will then
+read the shared memory table and find an entry with the start and size of
+the banner. It will then copy it for debugging purpose. The upper level
+firmware will then be able to provide useful debugging information,
+like in this example, the banner.
+
+As seen here, kmemdump facilitates the interaction between the kernel
+and a specific backend.
diff --git a/MAINTAINERS b/MAINTAINERS
index 1713cccefc91..974f43c3902b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13813,6 +13813,7 @@ F:	drivers/iio/accel/kionix-kx022a*
 KMEMDUMP
 M:	Eugen Hristev <eugen.hristev@linaro.org>
 S:	Maintained
+F:	Documentation/dev-tools/kmemdump.rst
 F:	include/linux/kmemdump.h
 F:	mm/kmemdump/kmemdump.c
 
-- 
2.43.0


