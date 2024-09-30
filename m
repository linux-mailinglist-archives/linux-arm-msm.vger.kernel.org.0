Return-Path: <linux-arm-msm+bounces-32787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 304ED98A63B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 15:55:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1A8E1F2364E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 13:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6909198A01;
	Mon, 30 Sep 2024 13:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSCxZwVG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3959195FF0;
	Mon, 30 Sep 2024 13:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727704384; cv=none; b=CrUYFIgmE0P1vd+TLhFxIP5dUtztLq0RvLZCH85r/FDUszXQ3MzsNV0lNO45gvK4VK3QDxvVlmGw+pSGKMa+4Uut0TRY4sckce/WCsCeE77FnngzGdw27L4/azifphZhAKJlMLXMD59eQBMGC52gKlZpz9xO+rgMzTb50DrFZkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727704384; c=relaxed/simple;
	bh=8km0caqw4X9w5WLWDqoPcdYkk+OV9Jah8JF02dHf5Ug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J2HUPqg8ZdQ2707y13ChxYYmrL9l/Pt7u09xDqtGIhFas9QDXAQpv0EHQ6wmuutW/RhzWY9vFxg5Brz/z7/A0O8m/Flp+uRon73IoA8m0YM3iiImQBuxg6Stpiz/o3RbyFiT+pH8sjelxPXjqntquhWG0KEbrk+jEg3hiGAihaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OSCxZwVG; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fad0f66d49so10501601fa.3;
        Mon, 30 Sep 2024 06:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727704381; x=1728309181; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t1y38+8CPxsqSfGk+vokQebE6afY4tdr6oHCYyS40ak=;
        b=OSCxZwVGlWkURIgsAha+dgVC+/xgXZZQDtv7QCnEaItqmrrKSWTQKW05e4YZMwWHU/
         3T75kyxxf1WBLdRpv+McRTrxO+ftIRpCvIPGOk7/n/0uM8bjGh9SKxkvsP8DRh8Y9mqF
         2pUnLnOSi92WiI5nrLhJq59GESyM/O/DaMck+lszbgoy+A9izEYizVLVQsYcUjTFtfEu
         qdUgComLrElsixdGbsbnB4JEk2pQ5zp7gnHjxd2h/b6HUY/sL2TT2t3ZSBwOzYNirH+3
         acz/XYGACaueJgJ2mGYjuvHyuia24siLS4qyrsc3Pqq6YCq9EjrbbfMmnvvRJsArT/Dz
         VuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727704381; x=1728309181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t1y38+8CPxsqSfGk+vokQebE6afY4tdr6oHCYyS40ak=;
        b=cGwCjY0VKxhfQTo3AryKbedpS41KFh/Ynqi9xWkedcIB4pNDSU/JSAuCcu7jXQ1uW6
         CqZ9Zf/dsOVRvWTFUT7TnBjiUM2mTDmbEvQ0FEOKhMNIW2ZKPro1ggMddYh4JfjFtutv
         WsxjKWlIOn6pr564o69+MpkPNiPJQGBJcOn0EFSrAFAE55EM+DUqks35NkaSviF/Hywt
         uwfBiqbeth9GCJKhIEZO7x9Y7YcGrBj+xbhMJnvLlNN1Hx7zfDIVzy1uZODzAeqkYgm+
         l3aBpEsqXs73nMAgjU4algS0+sdiHB4QAypL/sn6Ptfme8/lHaF4qCmCryycBjnjS6Oi
         em1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2170+diNE5jbI9KL8VtnhzW46doM8979pWw2NUnOnSzoH8bFgMAyo4b7rFaBt1zKQz4Fiu0Z/vPb+v9tj@vger.kernel.org, AJvYcCX3Kz0VwouBn9jctQUBem9PT0BiiNZHWjutjDAVZdwf+JK5UXwFn5v9AoVw9JoH+GdYFdc2NosikiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFvRYefufTsZhRTUpDjth0MRxP3nERieOMw7f/u7xx8pimE2Uq
	g661fdiQtwPQxz20J5AqnXhpWGPVSZ9MbTJW4O8NwMJmnykPYCzp
X-Google-Smtp-Source: AGHT+IEg69BR50STgCuKu/pPSOPMSBU/bGr36uoh1Lc98Ji5DFaA1Pnf7fDLAkbi9nL39EDiPjiJqw==
X-Received: by 2002:a2e:f1a:0:b0:2fa:bba7:2699 with SMTP id 38308e7fff4ca-2fabba72735mr50221801fa.16.1727704380585;
        Mon, 30 Sep 2024 06:53:00 -0700 (PDT)
Received: from [192.168.1.17] (host-95-250-55-22.retail.telecomitalia.it. [95.250.55.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88245ea57sm4507540a12.55.2024.09.30.06.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 06:53:00 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Mon, 30 Sep 2024 15:52:47 +0200
Subject: [PATCH v7 12/12] Documentation: document adreno preemption
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-preemption-a750-t-v7-12-47803c7a5a64@gmail.com>
References: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
In-Reply-To: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727704357; l=5024;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=8km0caqw4X9w5WLWDqoPcdYkk+OV9Jah8JF02dHf5Ug=;
 b=BHwtSLEaNLieYg6e3Ygrw+itZ0WzagFs7SXNbpZIAAElFpNib3jiNKVHvyTqeEFrRJCN0YMfO
 2JkVkvx5ColB/74nWURP3H+zmHX1OYcIr7FSZJ7YUUf/ahnXTu8aW+W
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


