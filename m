Return-Path: <linux-arm-msm+bounces-25943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 945D592E417
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 12:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2AD2B21622
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 10:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B594B157A7C;
	Thu, 11 Jul 2024 10:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qa9vBPDS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F99157495;
	Thu, 11 Jul 2024 10:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720692183; cv=none; b=NBdUgqCs8MsxgW/kkIHlCxsw9IpzLeaROELVYxe9jU6WQE5gJiY5Wo/CFDpnvPdwBk88Y0Ukbz4k8sHJ0AwUyigOb43WFcq5ZCUC3lHpPKv3A1KndM+qnZsw6Q1yHtRGN1ZDHINDwrQISM4fiMRVlkGH3HMGm7Uql8TRmpbzf+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720692183; c=relaxed/simple;
	bh=CzX6mk6KhbBJ9oB1ez2wU8sClVPXb1XdFf/fZqjpKWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m2dPqUwzQLVTK3kJmFBKIFEPALWpMXyYfIujiKLLPlQKpBR8ZQqHtPh/yYD7X33e2Wf0YqW59nVGOhVeVEWZsNNyklBEOyGGt6lOFbIjspohy8OEOhY2bUWN8Xno+K+w1yaBDZeFJHsqUEN3w8/8Fn9AnqiKBlEhj25KDpELA8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qa9vBPDS; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a77b60cafecso84150566b.1;
        Thu, 11 Jul 2024 03:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720692180; x=1721296980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRz9UumvfZkasiMoFMWu3L5o8EAQpD5HwI3FmH2Nej0=;
        b=Qa9vBPDSphi2HA/ncS10oc1q0826JfL/HixRfWAlZudTzQnak8dqQJHHiwsfBhzSHQ
         5v3lcK7fhYc9ITu6nfEok7U67AuS2YaJfn4hkxQdYK5a4v9Xjdd1d+YDQ6o1OVNW1lMS
         Q5C/E1YUzB2pRfiBUN1dLKfBr/fcvDU5m1j5xoqPteA9Syz9E5stSSU04UYN/j4q6trf
         CDlaidxvYuUmclU9d9Z56IAPwCMGvymwOk7Wvg7UnnwdDz5srKUAHYWP1Oh5LJcKa6Nm
         krnM2/TRstooTg15JqluiQ7xgMAo72vak5XkhGHc43cvhoyEMgSrrczg2pNUPMTLm+L4
         6ZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720692180; x=1721296980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tRz9UumvfZkasiMoFMWu3L5o8EAQpD5HwI3FmH2Nej0=;
        b=gDmNk0wFerENcycnqziNWBcmAK+U/YV6nsrxQC7jW+2dh6JMgpJ9wLkp7K6wUAZ4rj
         zEiDO6iRkmCcH/+oWZPpdmM9m7tpme51rOeYjZpfgEjv8IiNdssAho4x9rJtjuweV/uv
         KEUVz8Ch7+/Tag423S/sPWtZ9GpPGDkMzzO8PDrPf5XXvtBjVwnilbehXWhzTnTuWr4r
         D4+bSqiKzy/ZCHzglK8o0XAuge4bmBB3dReNDGFJtEVSpUSFSz62mHnPlw4SifDez8fl
         a6qAJO5b4symsA2IFYr/4eDOZx/9DuPofAES+3R6CUgGUgbe5MuulxIuQUrUd5CM2516
         x1xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVznWCaswO7f1B21YxfWP5ixf+z6eqA9Oemax7HSFAbmEsiCJbxVHoPT4uHSgpaq7KRMd0G8Q7VfDSKZ2OZEqG8JkbZ0lH+AQMEzJWeyNT/SbrEqpuon+TYvpIqMZUahBy9D1bNhaFjVaOqag==
X-Gm-Message-State: AOJu0YyW4SfoIygy5v5YRzSj711iv1XOQpQOHG+hhn9oIYUG35BvCQft
	w9Cl7szzF6tfqxQpu3fgRUgRjkmTeviaXSGIpF5TZf2w6UpA/YjV
X-Google-Smtp-Source: AGHT+IFZwmeKYg5L20iCnIHACgbq3BS89SRr31jpLVF1vhxP0+N3lNM44paKbRcnxvAlCyIiP/JmuA==
X-Received: by 2002:a17:906:129b:b0:a77:e71e:ff8d with SMTP id a640c23a62f3a-a780b89ab24mr466598266b.70.1720692180017;
        Thu, 11 Jul 2024 03:03:00 -0700 (PDT)
Received: from localhost.localdomain (public-nat-01.vpngate.v4.open.ad.jp. [219.100.37.233])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6bc876sm239207666b.5.2024.07.11.03.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 03:02:59 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] drm/msm/a5xx: properly clear preemption records on resume
Date: Thu, 11 Jul 2024 10:00:19 +0000
Message-ID: <20240711100038.268803-3-vladimir.lypak@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711100038.268803-1-vladimir.lypak@gmail.com>
References: <20240711100038.268803-1-vladimir.lypak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two fields of preempt_record which are used by CP aren't reset on
resume: "data" and "info". This is the reason behind faults which happen
when we try to switch to the ring that was active last before suspend.
In addition those faults can't be recovered from because we use suspend
and resume to do so (keeping values of those fields again).

Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
index f58dd564d122..67a8ef4adf6b 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
@@ -204,6 +204,8 @@ void a5xx_preempt_hw_init(struct msm_gpu *gpu)
 		return;
 
 	for (i = 0; i < gpu->nr_rings; i++) {
+		a5xx_gpu->preempt[i]->data = 0;
+		a5xx_gpu->preempt[i]->info = 0;
 		a5xx_gpu->preempt[i]->wptr = 0;
 		a5xx_gpu->preempt[i]->rptr = 0;
 		a5xx_gpu->preempt[i]->rbase = gpu->rb[i]->iova;
-- 
2.45.2


