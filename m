Return-Path: <linux-arm-msm+bounces-88135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC16ED05F2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 20:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08E47301894F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 19:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95D8E31D75E;
	Thu,  8 Jan 2026 19:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xsYvxyEb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30652DB781
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 19:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767902251; cv=none; b=dE0qnnaUtvY/LAHMAJAsFnKsaHABq8YmzphA/m1xaoT8EEP+BA0QcNwb2iZ8wP3zNTKTlwxSjzpF965RuH0rD24grCEPZ7iCurojbCArUlD0rmF9l1RsE1YG44yU9aKVcdzb/OPFcPd+MMgOPsrDPQNmCvR2Q+ayGarl1tBrAM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767902251; c=relaxed/simple;
	bh=c7jMhN8XtvfpyVorUkznyAzrFKyWQ17Srg5BEIXNWfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U6PtKE82EcbQydE/Sc2WjvA11fq/sI8RIDd5fgSSTrCcU+xTDLQWZAX608KK627Palae0gKPT48p84O7IyEceOPvdV2q+rMsgZ+vbTtvLPswdEmXNcVrqQ1Y/szaR53ZpSKDD223/A7dtDnoUi7k83SX59RZQtl3Z2kjHhv9ciU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xsYvxyEb; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4327555464cso2064387f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 11:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767902247; x=1768507047; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QCRWVLE8KYqwVCUSR+leEM1QO2iDsc6SFUmiGPEHzWo=;
        b=xsYvxyEbzVUkGTzlfYVMFJ/vUAuvbRawquZVff+08OVYyYuDMQ7g9Dsvqk4e4UcL7K
         ASESN3IWIMURW7YlXIbUKNH9gzZ8KUFTs9NT6ecvcOJfqKUH8lGn0OhQqGyWUNjTF1bd
         daicfrBQPuVIWjCZAMB/1YA0O/BmKL7dEC0cF5lDabJaRIRyF5yE+5llXTiRAvaw0yOs
         DABOchO0eGNgeVHEBLWR1korUzpoG6ydFtLm4XDbbmcHudX/P2Ij2Few21Ws5D2J+qOd
         9/krazfEPNn3r76DDN5RXT43hy7jty6KwzaM6DpWAoWr5+QgaSWgMp0vYwn+QBlHJD9d
         Pm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767902247; x=1768507047;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QCRWVLE8KYqwVCUSR+leEM1QO2iDsc6SFUmiGPEHzWo=;
        b=pBUk84oiW1PcCFAFKbS+BlYqcVEd/TYJBnKtsVyvJjRLSHfIXHb9Q3mUFNoYhrFe0Z
         Xy6O2lSQCDfBkhbtClZ2FZrWrXZrr1PDwX+w9ZF7pzgSv/Bfb9yqCezTgpWZhw4vA8ZN
         FhRv+fN8YQV2Dx3Zhg4IAvZK3i80nRoxWxzj9P+r/H177lYOUgU9c++bi1ifyQBsZty4
         50hUIEbJKqThdGwZBAGFg1zd0sRpJx+acwNqUWLn9E7YxusEI/BFb79ID2ebhyrwhDBA
         VwjdCvtq27JMz+LsjwUQLWBgYnU/APzprI9bfMlrjt+p/peiJYgM4+z8IWpDimSyHGbW
         W3yw==
X-Forwarded-Encrypted: i=1; AJvYcCV89FTLya5EM28fr2Ot3nmdsgWXr9q/+1Wps3U6KrSq0tDWI7Fpub0YiTBaD3Y1grXuChOnsTYQhsBCt72d@vger.kernel.org
X-Gm-Message-State: AOJu0YwWWHh3q2UCKtCm19Ue92gLyHyE0x4FvJkuIjKZh7B+YODqyK7a
	Q5+SvUusLQXENGMNuwKusfFIzcRxKPNeTPl17GlaWVd5UE6pPQCjYcFNHWGATf3l0MY=
X-Gm-Gg: AY/fxX7eRT/NunDf5QAVpSKZ+Cz1mTUMMFzkPxJPKOre9Ey1hCcMTuuCBYrT7EFebEn
	YMkQHe3IgNSeZNs4nHNCrw8oMgF2WUrZCsOFeYo3m3l/+GqCqhzG6rRb0WFBcleWBLvwm7oZlEg
	F9Cfmr39Y7i/UKDDo0vrrshEj+RGhippaxdEWrluS2ZUhjup945RkMy/1sbkwE0T54r2DMhzo+m
	7LgCP6DQ5gk/ibv2t5U7e/s/d54emKgnCuM3z7ocP3H2c59c+/9ImdP1QlKkDSLHxtnO6tpXS9i
	aT5uVoX3E+ZivFCiJrv1U8iVotdutvmquTjRyyskdGORVKQRM8h9OMqdNB8QRqE2magBL4PNppi
	vc/KUMnjn5QIgCLUhjss9WZ1WuuLGDg691rQCxp9atNmJPi09LKvHLvlXZWirKP5c/zhOMRiuF0
	3gEhXNh4vChHSnAjc9
X-Google-Smtp-Source: AGHT+IFcp3VtHt/q/Alt1immzh6zHpZoD2LnzhIVd+S2uek5Z3OEZpx2nKLWt2bXAXJEShIrU12xOw==
X-Received: by 2002:a05:6000:24c6:b0:430:f742:fbb4 with SMTP id ffacd0b85a97d-432c37a4f66mr8711115f8f.43.1767902246566;
        Thu, 08 Jan 2026 11:57:26 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df91fsm18529516f8f.23.2026.01.08.11.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 11:57:26 -0800 (PST)
Date: Thu, 8 Jan 2026 22:57:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/msm: remove some dead code
Message-ID: <aWAMIhZLxUcecbLd@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This is supposed to test for integer overflow but it is wrong and
unnecessary.  The size_add()/mul() macros return SIZE_MAX when there is
an integer overflow.  This code saves the SIZE_MAX to a u64 and then
tests if the result is greater than SIZE_MAX which it never will be.
Fortunately, when we try to allocate SIZE_MAX bytes the allocation
will fail.  We even pass __GFP_NOWARN so the allocation fails
harmlessly and quietly.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 8 +-------
 1 file changed, 1 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 71d5238437eb..7968c2dccff0 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -947,15 +947,9 @@ vm_bind_job_create(struct drm_device *dev, struct drm_file *file,
 		   struct msm_gpu_submitqueue *queue, uint32_t nr_ops)
 {
 	struct msm_vm_bind_job *job;
-	uint64_t sz;
 	int ret;
 
-	sz = struct_size(job, ops, nr_ops);
-
-	if (sz > SIZE_MAX)
-		return ERR_PTR(-ENOMEM);
-
-	job = kzalloc(sz, GFP_KERNEL | __GFP_NOWARN);
+	job = kzalloc(struct_size(job, ops, nr_ops), GFP_KERNEL | __GFP_NOWARN);
 	if (!job)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.51.0


