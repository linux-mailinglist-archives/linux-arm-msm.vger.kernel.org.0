Return-Path: <linux-arm-msm+bounces-32287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 124D89844D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 13:35:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34DC81C20AF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 11:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50601AC45C;
	Tue, 24 Sep 2024 11:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8MC4evF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9C61AC436;
	Tue, 24 Sep 2024 11:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727177461; cv=none; b=bGFI9Sj2XZb5lTf2L7IlnBxCyuM7Uwm0VapbVFwuUjgZZydsuQJiG6hArBSHnlL/zIDoyp2cX+UtyDNKbmBHJYgUqtCEF5tmJbARUzDG8XQcn6nrLwEwrIVEWcrjM5DdOGjhMrWQ8UvGalFsEdbOHVnC0Fez3CoF136EbMFyA1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727177461; c=relaxed/simple;
	bh=8km0caqw4X9w5WLWDqoPcdYkk+OV9Jah8JF02dHf5Ug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=biPh62jxNtazmjP61C/jSAg4RqmJDilRjb3YVnHLXN5J79foI2hauu2LR4uck3PIXaEzAENVDHINfZnQF+/htnP9iUhGBlsN1NF/G16+VIiyE5dYUWLdHIObrVDWH/ajbQdKmv/z11ei5pwnLHiuZDIVbntXOm5mZwdP23PCpBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8MC4evF; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c24ebaa427so9787940a12.1;
        Tue, 24 Sep 2024 04:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727177458; x=1727782258; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t1y38+8CPxsqSfGk+vokQebE6afY4tdr6oHCYyS40ak=;
        b=N8MC4evFXIkYbdQLXKJoQKhY9BLG20SPi7wMvi8rsSoXXWqPWo2I4BKCa8h3I551id
         eJfbYJDBIxPlODcwd3xooehPAYUO4IYO4xsctyiwXx5wSWtN5pSnNIBQoHvMlhn0KN3j
         Jx1m6vAcjdjZAaJElq1z0I+YUvPIUtQrkJwOBiNrni7cjkIxdb8lpeSTxTMJl6VNhZbG
         8ZpFKi6uNnKfWOAyApsISSCYqgVotn90loC+dAE0+Abs4vF/5d7JMjzeJcizWE2Nsu68
         8oP+D7+6cSK9qe1TOUwfpDYosiAT9hbDqbOeET5KznJK9iBxRzIOc52Mf5DHtkNbnbq/
         0XFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727177458; x=1727782258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t1y38+8CPxsqSfGk+vokQebE6afY4tdr6oHCYyS40ak=;
        b=s58YpntCD/L8oUSXl/SCo1FwOAMeu7FX7sgxnjNaGi2dl1n2WQatU1uYwVm3mdxkot
         oCKfD+2ZWRvuvAN4bfQuvQE5D1HcR7Kw3dw/0kqGDbiVB7Kk+jwCgQNEYJsRolaWPePB
         UpeZG04sTrBGlNwPCj/TCvkz2rgkUqRGsjDNhNrXhgtHb6OyqcHdoPcEbN0H9G6Mlgm/
         fEsWXHzBcI+iiqJ5dMj1JRRUk/+1ykSe0/+UmdVQv6UX+IZtlxhTMOR4grA1poUQzTnn
         GzK+FhUxOrqnIN8BqHDm1qb6f5/uY2HgxwBXJXH1PWSV2RKxj/m7aH3wKQATuFTl1YCd
         IUKg==
X-Forwarded-Encrypted: i=1; AJvYcCVoBuCFOdQooEcspaaiXBGAbuJDVDSQKP8+ck9ROiGehTENjmzUFRm1j6uxpWnmCqmzwW8+gvxvZnA=@vger.kernel.org, AJvYcCVxaPiHG7m4eOCF+9TdDy1xBPyNcKfXbIePUPML9dn+9c4uGhKW0/4lSkSAV8yymPlXPxyFfYwXAXFPSsOR@vger.kernel.org
X-Gm-Message-State: AOJu0YwVjL3dkI/oIhIjixD2sazB3qTyQPosGTaxXVJK2PlYJPskCoZw
	SQUp2inTvw9ha8QgiBzx+wO3ZsSOunnhq7FJT0QynkoMBcVvB1KHedTnQDKT
X-Google-Smtp-Source: AGHT+IEISR9dLxHLz87EmIuJIK9QGIXqeioaCOzkFZkYnK3EgrHJXeDRIPzWKUWlvSpSMxhF1AkwRA==
X-Received: by 2002:a17:906:dac6:b0:a72:7ede:4d12 with SMTP id a640c23a62f3a-a92c47f94c7mr381369066b.5.1727177457841;
        Tue, 24 Sep 2024 04:30:57 -0700 (PDT)
Received: from [192.168.1.17] (host-87-7-171-42.retail.telecomitalia.it. [87.7.171.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93930cae0fsm72612766b.120.2024.09.24.04.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 04:30:57 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 24 Sep 2024 13:30:46 +0200
Subject: [PATCH v5 11/11] Documentation: document adreno preemption
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240924-preemption-a750-t-v5-11-0be2bf81c187@gmail.com>
References: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
In-Reply-To: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727177437; l=5024;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=8km0caqw4X9w5WLWDqoPcdYkk+OV9Jah8JF02dHf5Ug=;
 b=gOQrYcb2klrgrDfkFVbEmFs8BClJ+yPGIugEYSqY3lJhHXAp6QKTwhZG0gjLyMoQeJgXt9LVi
 Hoy6fOd8W/TCz3TUEAyUTaLkat/5VqrFViffv0OG34XZDGQQcnYDo4l
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Add documentation about the preemption feature supported by the msm
driver.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 Documentation/gpu/msm-preemption.rst | 99 ++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/Documentation/gpu/msm-preemption.rst b/Documentation/gpu/msm-preemption.rst
new file mode 100644
index 0000000000000000000000000000000000000000..e9b5d7bc7dc6c7740a0e8ba75d3a74e9ad267b90
--- /dev/null
+++ b/Documentation/gpu/msm-preemption.rst
@@ -0,0 +1,99 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+:orphan:
+
+=============
+MSM Preemtion
+=============
+
+Preemption allows Adreno GPUs to switch to an higher priority ring when work is
+pushed to it, reducing latency for high priority submissions.
+
+When preemption is enabled 4 rings are initialized, corresponding to different
+priority levels. Having multiple rings is purely a software concept as the GPU
+only has registers to keep track of one graphics ring.
+The kernel is able to switch which ring is currently being processed by
+requesting preemption. When certain conditions are met, depending on the
+priority level, the GPU will save its current state in a series of buffers,
+then restores state from a similar set of buffers specified by the kernel. It
+then resumes execution and fires an IRQ to let the kernel know the context
+switch has completed.
+
+This mechanism can be used by the kernel to switch between rings. Whenever a
+submission occurs the kernel finds the highest priority ring which isn't empty
+and preempts to it if said ring is not the one being currently executed. This is
+also done whenever a submission completes to make sure execution resumes on a
+lower priority ring when a higher priority ring is done.
+
+Preemption levels
+-----------------
+
+Preemption can only occur at certain boundaries. The exact conditions can be
+configured by changing the preemption level, this allows to compromise between
+latency (ie. the time that passes between when the kernel requests preemption
+and when the SQE begins saving state) and overhead (the amount of state that
+needs to be saved).
+
+The GPU offers 3 levels:
+
+Level 0
+  Preemption only occurs at the submission level. This requires the least amount
+  of state to be saved as the execution of userspace submitted IBs is never
+  interrupted, however it offers very little benefit compared to not enabling
+  preemption of any kind.
+
+Level 1
+  Preemption occurs at either bin level, if using GMEM rendering, or draw level
+  in the sysmem rendering case.
+
+Level 2
+  Preemption occurs at draw level.
+
+Level 1 is the mode that is used by the msm driver.
+
+Additionally the GPU allows to specify a `skip_save_restore` option. This
+disables the saving and restoring of all registers except those relating to the
+operation of the SQE itself, reducing overhead. Saving and restoring is only
+skipped when using GMEM with Level 1 preemption. When enabling this userspace is
+expected to set the state that isn't preserved whenever preemption occurs which
+is done by specifying preamble and postambles. Those are IBs that are executed
+before and after preemption.
+
+Preemption buffers
+------------------
+
+A series of buffers are necessary to store the state of rings while they are not
+being executed. There are different kinds of preemption records and most of
+those require one buffer per ring. This is because preemption never occurs
+between submissions on the same ring, which always run in sequence when the ring
+is active. This means that only one context per ring is effectively active.
+
+SMMU_INFO
+  This buffer contains info about the current SMMU configuration such as the
+  ttbr0 register. The SQE firmware isn't actually able to save this record.
+  As a result SMMU info must be saved manually from the CP to a buffer and the
+  SMMU record updated with info from said buffer before triggering
+  preemption.
+
+NON_SECURE
+  This is the main preemption record where most state is saved. It is mostly
+  opaque to the kernel except for the first few words that must be initialized
+  by the kernel.
+
+SECURE
+  This saves state related to the GPU's secure mode.
+
+NON_PRIV
+  The intended purpose of this record is unknown. The SQE firmware actually
+  ignores it and therefore msm doesn't handle it.
+
+COUNTER
+  This record is used to save and restore performance counters.
+
+Handling the permissions of those buffers is critical for security. All but the
+NON_PRIV records need to be inaccessible from userspace, so they must be mapped
+in the kernel address space with the MSM_BO_MAP_PRIV flag.
+For example, making the NON_SECURE record accessible from userspace would allow
+any process to manipulate a saved ring's RPTR which can be used to skip the
+execution of some packets in a ring and execute user commands with higher
+privileges.

-- 
2.46.1


