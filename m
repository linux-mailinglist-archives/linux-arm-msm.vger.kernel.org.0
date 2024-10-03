Return-Path: <linux-arm-msm+bounces-33039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A43098F3FD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 18:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D67EB225A9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 16:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB41D1B85D0;
	Thu,  3 Oct 2024 16:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ycv8FUtS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE06D1AE863;
	Thu,  3 Oct 2024 16:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727972002; cv=none; b=L7vkxecq6lp83UPJ7dApBzy9sXRQGr8WkRf4irrWBn1F4g1wrugs1KrxXzwAsCjquhwvcI8mn1hP1imfgR5hc3aq3cTY3aY39C85v+oK3URh+WmruW42zTBclH4F9BlQ1kZ5Ne+8gN9XoWOnL39v+dXAhwIMsZNDjqjcNbDPg2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727972002; c=relaxed/simple;
	bh=Lqokp436hYQPQY3ahWAbbFwj5CouB7qIxKNoJs67APU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j0YQBgKvAnmueKL5juW4tnllbwdQeK9p0iJQO0pRlCCX5NNTm1Aa/FTueSmMiusC+6RjyTmpmg2w8wJaGgCC7ga//DEATZsPGCeHMYSWX3TK3yOSvx/bTCv0Xy3EyVvlz6welAxkRj3SfHFUIcIrFt7T+93H70kfZVvMJu9Ly6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ycv8FUtS; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a8d43657255so186422066b.0;
        Thu, 03 Oct 2024 09:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727971999; x=1728576799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3fpNTS0q1Wya28e2Ddw3u+eLcNrzlMeAfttSM8CxcnU=;
        b=Ycv8FUtS5gK8VmgHbMAsClNWftHGYucqDn1mpogpYjFymT0H5Hi4O1XpgJq7Iomnrd
         N/VrX3jetErf8Bfk65+mSkcO7XXVUcGs7eCylO4l7zld7L+q7Vr4XeXo4RQlyheyz7AJ
         /KnboGTDlVoKaxuZ/beCWKlxJ/KKxRgaRxOrP1VNzBpka0UWBXKHDTpvK2OlkIBfhTRp
         Kt4irW+HH464vfKjRtrjtl6Eb7CTXb0QhurpzHjhu9AU+x1kzVHH5Vypx2+9LUeLrSlz
         Q4MxG/vsE5xzQLijl4PCT2dLpYiFCQE2+4EU6+MBd8peTBPjO9dwBBte5OPErR9x4XRk
         Ivlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727971999; x=1728576799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3fpNTS0q1Wya28e2Ddw3u+eLcNrzlMeAfttSM8CxcnU=;
        b=Q06vtO/+BPvDrKpn/s4llG82RbNoMIyvtEmwZTNt+tcM1lDxvqoOWI8Sq+kyBWMaHj
         19Bf8bBEHiFQI8aq+9ZUN21+go808npWUpLO8Z2mqzgFET8M49Dxb6sdgUnRXynJqD/d
         qkE/CU4pege19VTu7Mq+UoU1iuyHix3IgEK8GaHqm3KVyW1866+jtktzSsgEDIMWvosX
         J4KfmADq7UJdNb5NEGT4uGa0dUlOSTN7LugkTr9jSA2Ab66Sl9kXoI4Mk+ENIAmET/R/
         V7xgp054qA8BnmHE72TJLc+w/3ByY8o0Ew6zL5NBhpX5ilaOKWso51phA+YGlDcI7BlR
         g2Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUpyBHOE2VnoBRWbsGlRv9dUv2np2mxu8/IHSkS0blQu+y21fdELFoiv6m1VXjZdnVXxEfSjX3m7LY=@vger.kernel.org, AJvYcCVVOHse20BGhXYDgqVuwrshIdI/haiv9ZfPDRRdjZQgjiRFt+Dzn1kZBWIgQXUNjEPnIiMIxhyBrmh9Pi6D@vger.kernel.org
X-Gm-Message-State: AOJu0YxCFMH2Zrv0pudPh3Zx27icy+xM/Oo5iKCxjdypNuAYCLpnOS/J
	rH0ed24zjuBFK/wWugpQ9wr9rJrwr17KoGTE4zbFY4Gr6tydO4EeCiNquy/Uzr40RQ==
X-Google-Smtp-Source: AGHT+IH+z9eUo8QcUxhrDoJYH3nCVHawLxyeUByKeD9f7uhNjTIOXx5BsvoGTwPWw9epYlodqVNg5g==
X-Received: by 2002:a17:906:9c84:b0:a91:15dc:34e4 with SMTP id a640c23a62f3a-a98f838b3b9mr825508066b.59.1727971998826;
        Thu, 03 Oct 2024 09:13:18 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-161-203.retail.telecomitalia.it. [79.12.161.203])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99103b314asm102382366b.103.2024.10.03.09.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 09:13:18 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 03 Oct 2024 18:13:01 +0200
Subject: [PATCH v8 12/12] Documentation: document adreno preemption
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-preemption-a750-t-v8-12-5c6cb9f256e0@gmail.com>
References: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
In-Reply-To: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727971975; l=5027;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=Lqokp436hYQPQY3ahWAbbFwj5CouB7qIxKNoJs67APU=;
 b=Y0+gbMYo926SrfUYu3rTzPeHpFJC7sLUBp92IZwL/MosjFrr3cLUskF07F3sMVxjJFJpTPcOG
 gOApUuQ84zwDkVsFRRh+sxuDU5aagr8Devr8sF7RPuK3cahOsLtbI8D
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
index 0000000000000000000000000000000000000000..2f74f8b61935a4469168ec36e777320dd6f22df9
--- /dev/null
+++ b/Documentation/gpu/msm-preemption.rst
@@ -0,0 +1,99 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+:orphan:
+
+==============
+MSM Preemption
+==============
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


