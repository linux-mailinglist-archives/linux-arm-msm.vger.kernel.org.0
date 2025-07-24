Return-Path: <linux-arm-msm+bounces-66568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA71B10C81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 16:01:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1C18AE642D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4606F2E9EA7;
	Thu, 24 Jul 2025 13:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C6mxlAnj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD352E8883
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365403; cv=none; b=YO4nvE7bsC/VQFQChe3KMO46SRCPecnnksUm27sH6Zre9FE8JECBTZWOEXeubHm7+8QXZ+nR4Z20tP6r7W3tL/R2SIiFNno/A74wKhoSfTlhEbyVM+vJ1nAwNsvVpJegrFR9vtfCzTBzjRcEiWiVq2gPctHtCIvMpl7HTV0ILfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365403; c=relaxed/simple;
	bh=17QGeEGZ9coLnHYcyt7u8QDI4NZW28xAVJJwsgh3bn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DnDYXUyyOMZx3hA5/34AGzfdQ8ix+WR6K5mjCSmDMlqo4VbpP1EzzaTiAMlD9AsZNMBx89lwGB7Y9ZM5enWj/oVXxOR7kVAuqC3ubBZeORfooGBvxjy3gGuxhIaW74V4gb+lsD/MIKNSIZaqGkGabDKtgonZEcKUjuh/O46cwmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C6mxlAnj; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-451d7b50815so6722975e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365399; x=1753970199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJKFOh1t0BpMtsqdCvtkoNZefWX67AppBNjz3MRLfF4=;
        b=C6mxlAnjxxjv8X3k7Jnlv4sZr9Pj4TpM/k4nKrykg4D0lOJYUyc523/PaxPNtpEJL/
         TXdsZL+OlLgXOkacE0AtbuEMn4kpSzX+yHu9F2eDDir2xZ8YNwP7wPzFLOjiUvx0Xj9m
         LKLhOoAcHEXYVrjUsjP7Ga5v4BeuXxRYovBExttSURq+FqlMGJFitUcqGrI98yXatdGd
         SRAbA2++JzajT/CvO7GQWsAcy3obbNBjvf7AtoDaX7Ig/8krnLnaOT34aaaG16Lpv+dC
         GM52ktZzXM7zphMDsSTG9mUdN9y3OtIjMOOtcyA5x4tQcjZuMA8VQJ2wR3zQ+pgNFloA
         +AVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365399; x=1753970199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJKFOh1t0BpMtsqdCvtkoNZefWX67AppBNjz3MRLfF4=;
        b=gjHkZ6Bu788GUFrfkHa4Jp7uFCBVl/UY4WBOKAl5eNA931HQ9zLOjlpjVFQUTfzYhy
         TBrwZN2dXU4cZyddLGZA7ahC2Xu4s2mPPnhZ2gYJ7nBI1hRv+sKbxG0AwNj1m9kDTQaI
         BpjgRL5eN9sWrHLYvO1z0DRfICBt9rWUqRKTxCPSnybQeVELPycEud1hnfBucBAH263x
         6T7mRFzevCeUbrlVktbNot9d+dTQO2sCpib1xJM55Ewi4yXjwyKYuqjkN0wU8sugV3b6
         1cjhsegzkeWQgOFKw4RwOPfVS8WJzLyGgPgjGN2po+XrXOBTmbvmfmsJasox5GCZwVCF
         UxMw==
X-Forwarded-Encrypted: i=1; AJvYcCWh3yP10peSN5l8st9rkHdWb6GCUL7EGDKKhUDvvMrmSDP0Yyp07yL/P2EonvDBj8ErvavHm/VHfyRrRZfx@vger.kernel.org
X-Gm-Message-State: AOJu0YzZyCLths8r9oaSR553wuX6a8hDWHHsCXVfVLdlJyl6gfSm7yKc
	KkdKq8BfiiNrRTF3voelmJNEP5VOs/udBYZb2K8cdfZyO4AGWGykLeba0OM2858NNiqFpPh8aRw
	+eVQtouQ=
X-Gm-Gg: ASbGnctqB0Lk2v7pMBqGFDSZWJ11MNsEMcMEBpe/1lgj+dzy7c+0xVrso5O6TMgCgjm
	TwiWCXzO4cLekGIYSfyk+Bsp/dsWuD/zb1ijgQcijhegRa/nNv29g8LwjW9iopTnW6gkG29g6zx
	/3IaBWaEEIt8eVao84JhsQzKwCdBvXxUXDFuMTBirv7FcZ8JwUuN2ZD1Ezomh0OLYlNgBrcQC9G
	87okT9an8eKgV3UMHtgCtu8wHOp1O20XY82en7Fj7LOxn38l2zC3RAZxNp6vS2LMaahMz+28c+W
	m/gE+vXo6/iHblMiRKKXTdkYuXNaND7SuzoWFTR2Si4mGONESRwQDMlnb9LB3fdDxfzbgHWPXFy
	YlwL8VHsRQFYBQeCgDmospKMstX221Mbg471I+BDTUt4oFed1hpFHQZTGyrAle7wo6KlDZGxrbV
	Dxd5sCUNacrqHm
X-Google-Smtp-Source: AGHT+IFBpfszojCM9BH8+214LoTonUL/68z7rgbLH3wV7lPKq/S6zSGoTIX7zNxB5lRzwaUzCOOn2w==
X-Received: by 2002:a05:600c:3ba0:b0:456:8eb:a35c with SMTP id 5b1f17b1804b1-4586ef5cdb4mr25803445e9.31.1753365398629;
        Thu, 24 Jul 2025 06:56:38 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:38 -0700 (PDT)
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
Subject: [RFC][PATCH v2 18/29] mm/percpu: Annotate static information into Kmemdump
Date: Thu, 24 Jul 2025 16:55:01 +0300
Message-ID: <20250724135512.518487-19-eugen.hristev@linaro.org>
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
 - __per_cpu_offset

Information on these variables is stored into dedicated kmemdump section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/percpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/percpu.c b/mm/percpu.c
index d9cbaee92b60..0cfe4d7818e9 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -87,6 +87,7 @@
 #include <linux/sched.h>
 #include <linux/sched/mm.h>
 #include <linux/memcontrol.h>
+#include <linux/kmemdump.h>
 
 #include <asm/cacheflush.h>
 #include <asm/sections.h>
@@ -3342,6 +3343,8 @@ void __init setup_per_cpu_areas(void)
 
 #endif	/* CONFIG_SMP */
 
+KMEMDUMP_VAR_CORE(__per_cpu_offset, sizeof(__per_cpu_offset));
+
 /*
  * pcpu_nr_pages - calculate total number of populated backing pages
  *
-- 
2.43.0


