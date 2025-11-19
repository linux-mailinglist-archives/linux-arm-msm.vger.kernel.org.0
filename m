Return-Path: <linux-arm-msm+bounces-82541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 226FEC6FE47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 17:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5C1884F7FE1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5FB369201;
	Wed, 19 Nov 2025 15:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bFLOD1dQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C423D366566
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567137; cv=none; b=erD/Q1p1R7Al583WjXWoqMebP6dueEtwSdQnroaeH5zle5oa6u+MwCa9hnPZ9nbYycb0uor1ejaWyusuZlk9M6SVu9ZiZVzGsSUtkLyCeUZ4G/tXumgJ1FVXe57NI4MjgVfTL//P/U6CVH7Z8HUQ4vwrgUVSBRxgvXfsul+wx30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567137; c=relaxed/simple;
	bh=E0xWWAAtZ+sb1tFoy69j+X8UfYdpBq6LQ0ZttxzoUlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c+9utiFdO9oVORq7vvCjO//Dhm48Zuv4v+O+yWSj/t8U9aQSx902NBAE4WN5Qp/yTiuZuhumdKTKezy/TAPIkH3uhNJmXcWFbQUXRALMC106bFQ6ndktnALplEKhKThjpCTObJV7Y1huod7GLRmTkyUc+SYTi4pjQJj46mqCnPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bFLOD1dQ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477770019e4so71951255e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567131; x=1764171931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93DS/ScHi6FgD35ajGLpv/dHTyNaaklJOjylE6wX7jU=;
        b=bFLOD1dQC0Q4Eym89MV7724Zm5/qYdVd2/MyrMm0XvxbrzU2lDJ7f3Hv1VBREo0swI
         VNOqEN4cIlEgl+4RG3ftwarzTx6ULTRfRqQECW4NCGOea5bakUcUwadftn+o9l5qcuQr
         GqOhGsYig2eyjmviFGaWge0Ow+AucMs/GddQ7Kvm24vYmAkB9N2JvTJG65NJ/KsZPbV2
         WLjgsvnPwFwpu+sLHn5AI3lW/12WVyHGZzzBopJ60S7mOvi8gmM7wjOlCW9IqzOHKDLp
         paCwK/zQhMrhsuME+ta7z/kdBso55S8pQQVjvaunWcA3poAn3wdp0V295gegBTryfFZD
         wv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567131; x=1764171931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=93DS/ScHi6FgD35ajGLpv/dHTyNaaklJOjylE6wX7jU=;
        b=um/Q6pJjWymL7ppPtiDgM12HdXjhqZGpG6pQGH87kngdn4W5z44GE4WrZKupC+to+I
         BHfdSfGH7TP5xF7FSEhmjgr9iQ/vx60OlL9udWJC+2gq+ButfRJ0pChBw2RAvhCTUqsP
         5gepkm6nYRbnvUSEal6juPfpXS8WC8OzXFWfGVAL/NO6Ij9j3JOFIpD0UCPOJIlYdroc
         UbvsH7rbBtxWLvBt7BVNA6hdhqgziftiuX9pPAAzPgivX+tFZeh0e8pEKn5syxVHJ3UO
         9qxuhAplnlRQGbCv/i4sNysAo1iivAfYzkW1H8crAo1nS1nR4BslGtDWQrBs5swk4lTn
         Bb6Q==
X-Gm-Message-State: AOJu0YwJMrYyZZVnQlXn9PtprbA+V0ItFa/yMWAnByr3lq1KtxtLva4O
	2Q6WIjLk7Qy6PFAM53pIv4mOxhzaI6Ucti8arJwvG+rze1uIJVBccSfFXj5VgUEtAoE7cNAoZvr
	lglw8eUq8vQ==
X-Gm-Gg: ASbGncsWcoGh9RZP6zqvxrJAAV9y9kGgr9xmMSKZSN9S9oarfE3ZxYXa9HWpX/xA4jO
	Up5Dn7lZ9qSdZMJ8wqbaGns7TF99Uge+z7mC1htwSkE6r6uB9xGDygO0m22Tzy7MzdAY67TV+TE
	0i1ghUwO1SjzSEy4cqmRUsD/WI719m94QQgxjTO63GDkHSzkaw/jyvtXaYt0JAcYaRNGsIsG10Q
	3CFY3sBbfenh5Qnp3f8moby1RYF4nvCbVjhTAdMGTARrST453ts3Fsp7Ee0oclAw7qCGVdjXdx/
	QXr1jTWO8ASkHYXHiAt+mtX+dYqbGsOYVz5kq+tUw8xLX/GicHseKqGlsbHB8ipMiCD+ASMexct
	ERqFfT+y+vzNKPX94H2MM9ExVrF03NrECKDa5UrdxAVz+Pxa4cwS/bTxFsygOJtolFfFzRsEaGZ
	ngTEHSvVA+H/RQ9Rlq8O746rGwKEqeoKjtfK55Pch7
X-Google-Smtp-Source: AGHT+IFTd+L8MIsFVmd5+4R/tV4nej4oyMMzTvyobs7oRMR9eeDnvkZRxA29k7Ua9rj2plkllb3d8g==
X-Received: by 2002:a05:600c:c48f:b0:477:7b16:5f80 with SMTP id 5b1f17b1804b1-4778fe49c0bmr204044185e9.10.1763567130586;
        Wed, 19 Nov 2025 07:45:30 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:30 -0800 (PST)
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
Subject: [PATCH 08/26] mm/page_alloc: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:09 +0200
Message-ID: <20251119154427.1033475-9-eugen.hristev@linaro.org>
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
 - node_states

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/page_alloc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 600d9e981c23..323521489907 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -55,6 +55,7 @@
 #include <linux/delayacct.h>
 #include <linux/cacheinfo.h>
 #include <linux/pgalloc_tag.h>
+#include <linux/meminspect.h>
 #include <asm/div64.h>
 #include "internal.h"
 #include "shuffle.h"
@@ -207,6 +208,7 @@ nodemask_t node_states[NR_NODE_STATES] __read_mostly = {
 #endif	/* NUMA */
 };
 EXPORT_SYMBOL(node_states);
+MEMINSPECT_SIMPLE_ENTRY(node_states);
 
 gfp_t gfp_allowed_mask __read_mostly = GFP_BOOT_MASK;
 
-- 
2.43.0


