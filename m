Return-Path: <linux-arm-msm+bounces-66578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7241AB10C9E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 16:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 592AD168C15
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 14:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E0A2EBBA1;
	Thu, 24 Jul 2025 13:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jwFZiSQV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFA42EAD1E
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365412; cv=none; b=GqSns0V0XDEcrQ/ZSWSlt4o7FejwyseEeubF8APGQFtZ0n0M/EhfcxEHCFz3qQDCpvPrpciJkjT7BwrcUuIuBMxIV7eq4BGhE2f3XJCkOl1PK1q6isIWjPd2XQY0hNV9J47WJV9SuEnU0IwNg2dFCY+89fIsapfr9ONau4Xjwig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365412; c=relaxed/simple;
	bh=yDgqovov3P+BgQJIgQIcPJeeBOVhAaLQJOWmJvGhnm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YXg+fAdZYPzvCjwAWnckgbCXwa2vYTW4v7epOoUg/J8llCDAMLlzRZnDTlroZPO7NSiuYzbTnvt1LIOTCjqGzBMtfr0rX3cRJkNXPCpxoVHK0S8/cyjxpz4UehkmXGayrUtRIgzme1QDs3adow6j8xtCZkD9xocG0eKg4IKw5Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jwFZiSQV; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-456108bf94bso6530575e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365407; x=1753970207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=la6fP9HkJphfM0jMf+9F231C5ZYtMe+0kHUA15eBYp8=;
        b=jwFZiSQVJYWsamCDFeiyWQiJ3l/lmU7kS3tELReNf7RPsOKXGDXYGlWUMofbznWnLw
         8ZnZ1porHZcgssDi+CbL/Nm4MVmuNi2l0vKRD7VTDAoimUJoblalg2o+NqLFQgq6YvSJ
         phfuCAjdAtTiLT/9XNloAnkBqNCM0xkC6j+phLm04TSGt8Fq+yFcCh3Uy5EFmcCdnOR6
         cPIKZdFJos5wrXSPtaaeGbXhStNFIWhGew6+hUqzuDMNoMCgOyv7hMD+aIFhRM1QbNaw
         T0mAS/mSYMrXQf/WBLp34BXnb39XN4U3ImwgOQAqkZ2UQWp5Exo2pQmuK5X9xRzfG5Jt
         WZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365407; x=1753970207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=la6fP9HkJphfM0jMf+9F231C5ZYtMe+0kHUA15eBYp8=;
        b=ur+O46oUdHJHVRIDUM5xvStOh7k4iaegF3KHZkZ94DvC8fMGqezMVoSzVeJYzWSP+9
         M0u+XnS5LAVEZVELIUrL+vhkSJqG1Mv2aKkZDTUJyLGAVxoKAp4Hc3YVyk0Zk+Msijq4
         ib3cL1toxUfx8SbCkM2eZ+FEbEU6uqdkLk1MfLVBiqjiXPDx+KnujmX6+6hjWxd3ePiD
         /OV69A21WXH2fUQ7GCohDVD3aMPHSYpbvUGtRppc50Lz3jGoGbRtLRXW5/TYtm3JT98u
         ZgcaddoxTFeRBQH3AKtqFy41mMxEh2wk87kRiIMBgu+Fup/IUIW3YJj0Z2SgeFBkMki2
         ZHGA==
X-Forwarded-Encrypted: i=1; AJvYcCUC0Ss25BIbdelY4mZjx1lOpFXTp9xymOb2HoWxmmib+Zt0uj0PRnF8/ChVEqv8VFPOnrzDcNL9nb185f7f@vger.kernel.org
X-Gm-Message-State: AOJu0YxTTJPrNBZEbdWPFumJ69vWhKUE1xX/8H+/tTZ3otXOpoNhWKG8
	KAsFppG0DcOuHyTSRqEWFSxtu4UrHWoDY5F0HE6HyeD3j+aqBiWPHvaxlhkhn3aMVI0=
X-Gm-Gg: ASbGncs3AmoO0pGUPBPwmHb78C955rU2RK7RkuLNSpqtX/IwlEUSe0c4/6uWI/aRqeb
	rD9RJ3CyN9bsgVK3dxcfrg3YFcCKDb9Ox2E6FMYZdhTuRmMe5225CBLa2jx03aFEsH5UHZuRPed
	8Piyq1YbYhor8cP/QLeY6MS59pu0lcL7swQykV6nsMiCvUSJ/UzGee2g7ivr2Nu83sSI2X9TZh1
	tg/b4JmLfZgOTFaPnz0fCfkfhGuGQn30YGSZr2JZmNawNfYi2C3wDT+z8iMPlM1aMahqtA7Eh3L
	BkoBCPYcO83JxiIQxbJwfU1OtV2W6nJb1vyJXIDVvsfDdV+8Ks4+GXFMiSgSJwAn0HD2/U35Vi6
	glPm3OmtVgBq06Q9zaKf9ZzJMdyq41fca2ERghhEYwy6cTXszlvqluGrQuMcRpXzSz6kK4A232L
	eLu4VgxyKlcTeA
X-Google-Smtp-Source: AGHT+IHN52iDsRUI3MC45fB2NHZ78a+PI04sVz+MJmf9Pj70BNaVdCA6rPCjq4NJ6xqIYAMwjrcKOA==
X-Received: by 2002:a05:600c:4693:b0:456:19be:5e8 with SMTP id 5b1f17b1804b1-45868cff3ddmr60788825e9.20.1753365406597;
        Thu, 24 Jul 2025 06:56:46 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:46 -0700 (PDT)
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
Subject: [RFC][PATCH v2 27/29] kallsyms: Annotate static information into Kmemdump
Date: Thu, 24 Jul 2025 16:55:10 +0300
Message-ID: <20250724135512.518487-28-eugen.hristev@linaro.org>
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
 - kallsysms_num_syms
 - kallsyms_relative_base
 - kallsysms_offsets
 - kallsysms_names
 - kallsyms_token_table
 - kallsyms_token_index
 - kallsyms_markers
 - kallsyms_seqs_of_names

Information on these variables is stored into dedicated kmemdump section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/kallsyms.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 1e7635864124..442dc13d00cf 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -31,9 +31,19 @@
 #include <linux/kernel.h>
 #include <linux/bsearch.h>
 #include <linux/btf_ids.h>
+#include <linux/kmemdump.h>
 
 #include "kallsyms_internal.h"
 
+KMEMDUMP_VAR_CORE(kallsyms_num_syms, sizeof(kallsyms_num_syms));
+KMEMDUMP_VAR_CORE(kallsyms_relative_base, sizeof(kallsyms_relative_base));
+KMEMDUMP_VAR_CORE(kallsyms_offsets, sizeof(&kallsyms_offsets));
+KMEMDUMP_VAR_CORE(kallsyms_names, sizeof(&kallsyms_names));
+KMEMDUMP_VAR_CORE(kallsyms_token_table, sizeof(&kallsyms_token_table));
+KMEMDUMP_VAR_CORE(kallsyms_token_index, sizeof(&kallsyms_token_index));
+KMEMDUMP_VAR_CORE(kallsyms_markers, sizeof(&kallsyms_markers));
+KMEMDUMP_VAR_CORE(kallsyms_seqs_of_names, sizeof(&kallsyms_seqs_of_names));
+
 /*
  * Expand a compressed symbol data into the resulting uncompressed string,
  * if uncompressed string is too long (>= maxlen), it will be truncated,
-- 
2.43.0


