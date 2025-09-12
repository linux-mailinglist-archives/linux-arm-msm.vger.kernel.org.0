Return-Path: <linux-arm-msm+bounces-73363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B79AB552DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 17:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CC081D622D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 15:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2A2324B05;
	Fri, 12 Sep 2025 15:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YZypKfUU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B459322DCB
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 15:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757689850; cv=none; b=dQ90NI9vSZe3AK/aOOJ+YLo/SALzLQ/cSu6Z9/7d3N5HSFmamumFyTa9oTvAbPJ7HgseX1ObEn5tEC9vwSCxP95upMxCmwI44C/io5uvvdU+JIrjedHFrb31A3M0ud8IyduHPgw/RLasbV79rKhOX38jwCaPCkRKHUXI2IlFYvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757689850; c=relaxed/simple;
	bh=/BXmkvpKDtyn0qN8V/YK7rPLmRpgpvD9OPV5hibBmzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lI+WR6rIi82V7eI9ZtS1O1X0MV/dKGATvJ3TIeOIruKR6PGCYJY4pRRtsJ1PxnRLB7cayTGGuoJpUSmmFXd8wtJJ5ux11GmW/ZhbKfyC0n4w0Cr2iw1d/sUpDexEe+GJn4cuFx8EKdJoi3+g3CJIkqq+A7Ay+FXkGWHHOQd/Cy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YZypKfUU; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-71d6051aeafso14662147b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689847; x=1758294647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvjoC9HrZ6XyeC1MmkaG/lWnbuRS5G1sVQIYvweJDZo=;
        b=YZypKfUUilMWvSOC5tKJEyTgzwdJPYqeNXJf9FaJuF+EXB5614ExOqocoFR2zokgth
         z3v+NG9SaCReUJAEdIU5jm6VnckPGRDxYmiM9LwJagc7Bpa5LgpuBr7qnGwepz712IiT
         mH8TKsy2EmsmpRajtRjKlT/mJCeGbYpwZvepubkvev3TsBNjKxOSdSFlSd1w6aEuZ8Vu
         GsoRgc6QC8knFhDDZrEYduQSljdhI9SK3vYc/giECpsxh7v/aR20rIV4kGmo+TLP4xsp
         laTJy7nJ6KfD276gyuuXGUDUPP7scjNJRSCam+HDlAUrGAz0C9rIOBc0q2Ixh1snPk6r
         Avzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689847; x=1758294647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uvjoC9HrZ6XyeC1MmkaG/lWnbuRS5G1sVQIYvweJDZo=;
        b=pfs9jQZCMSqYQLdfwbDdbVSXCzaYVHmDRYecbm1E3N2vJ+y7eJ3vbVobITOjS2XUvB
         IXJPFbUEw248X3fMmZUueVo6b00jfsjY+HLkWvW2hfdwCO/xZbupoO/WcPsCetEmSbvh
         A7nEBMZIsSjPW/6fqnvmadGxYobOUtypp0rQlGjRegAuUneYzCCXxHKiB/6tCTTWfhdd
         zpupZl3MuGsWekn1yHR6mRxXwFo0uPVZvCU0/Fakdx11mKiGU1oFllW46hcMpexoW4XI
         LFVC4URsXollpc6Su4kQUBDoP7v/3weuc5tFWCJkZphsDKpNscyeGcugTaPE5nx980yh
         MUog==
X-Gm-Message-State: AOJu0Yw17XSkfdenww6TddcDwLbXnQcFEROKUtCm2eooRQhq6m0T/4eg
	mO+C+9qIhQL/ZVDcbiCFtDPlJuEPog7S2dV7s9okeylcAE7klNAqaNVQnXD6BbmGICZEKqF5jIG
	djaDu4b5flw==
X-Gm-Gg: ASbGncvgibJLf7xZdS0oX9ihHNRpH7wXPobsirwRDdcAoMUu94kTP0tol++8j1VdZoa
	hmxj6pKzCCOM9jgtxOWPuUydwr20Db7Z8thwlnt8NFq0iZHuV3dRLNyQTun4E2BAaF5BdyyG4Lp
	hxQJ5pgxyV0pKe7DrVCHIWNUxOituI4dD3tNAAP1w6BAS6yBtFzWVYLLpeg5udmk+DAbczxi91U
	3+oiry4Yjtdb0O3RSPAkNv5N8VK85fHJXBeVsvFUTZzC9VStrPURN2p2aaH00eg9iRtuH8TzYBm
	QOL9NpOV81EqYnJzmW0eJ+5IiygThFG2HCx/PhIcojcjn7Bf1E/l3ilYmVzPlaqxCBK9sbP3BIA
	MtDE54Xbme0OLaVtwGXjrQuBkNFFUAHQjzQ==
X-Google-Smtp-Source: AGHT+IG0Y2LxTvBY/AtHJvp89fVFaBOgxCKmySrObEvM5zSsJDKwSvyDpIHnZ+Ay7rKBasM7LP2xug==
X-Received: by 2002:a05:690c:768a:b0:731:1bc7:7830 with SMTP id 00721157ae682-7311bc77c1fmr16987957b3.23.1757689847322;
        Fri, 12 Sep 2025 08:10:47 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:10:47 -0700 (PDT)
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
Subject: [RFC][PATCH v3 11/16] mm/swapfile: Have nr_swapfiles as non-static
Date: Fri, 12 Sep 2025 18:08:50 +0300
Message-ID: <20250912150855.2901211-12-eugen.hristev@linaro.org>
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

nr_swapfiles is required for debugging the kernel, and needs to be
accessible for kmemdump into vmcoreinfo.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/swapfile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index a7ffabbe65ef..2ef51da2c642 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -63,7 +63,7 @@ static struct swap_cluster_info *lock_cluster(struct swap_info_struct *si,
 static inline void unlock_cluster(struct swap_cluster_info *ci);
 
 static DEFINE_SPINLOCK(swap_lock);
-static unsigned int nr_swapfiles;
+unsigned int nr_swapfiles;
 atomic_long_t nr_swap_pages;
 /*
  * Some modules use swappable objects and may try to swap them out under
-- 
2.43.0


