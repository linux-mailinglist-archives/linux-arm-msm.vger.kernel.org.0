Return-Path: <linux-arm-msm+bounces-37688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B1B9C617E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 20:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BEFCB87FF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 18:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1EF0215C62;
	Tue, 12 Nov 2024 18:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="de6F0h7+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353A9213125;
	Tue, 12 Nov 2024 18:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731435742; cv=none; b=OxGeJSjWTqtAxCGB3Kx1ymibDkHJkEcTEjxo8iWBrNog4PS4khIK/Y4ut9uqVODmrOzlt+xOGPM3awflLuCyQcxvuYcOALKeLndNsErEMJNqTJQM3lV0qkObZuh4CqWxgheWHaW5ilfo1wgb7TgumOLiwE/pthbGgkN2AOVUaws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731435742; c=relaxed/simple;
	bh=dm411aeuElhk98z7KlbEChgibpFt0Ls8H3nVP5qWzns=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=odd9561Wb0qYniyWBC1jtAEAtBPNonHvFj4YlWvE/BRNQnRaa+puKDVEqu7GIPQtYsbcI3gU1DweTjE0d8R6Wb4vWt6dKmh8F9afO7zryjMw7RlzFUrQIoA89bsid4UU0M5B/lnQyhSUr7TsUfua2r2epuP/hh+EC7FOBrdRYOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=de6F0h7+; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-431688d5127so47834425e9.0;
        Tue, 12 Nov 2024 10:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731435739; x=1732040539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rGw8I43GoIEdw75f9gcID3EPkPrgfiDyB1X473+QaOg=;
        b=de6F0h7+D7Aj+IXEmLqLMeI4+B+KJJYz5dtynCic+UpeeMiKkmsovwtwdINNnlXksQ
         K/gY76AYXUknbhs+LvhEpqb1r4tLRPKn7ipSRoAghwz5kttCOq+CYEPdWTWM7D3IIo5i
         d/FUBfoTAHgFi4kFTX0SrC6NR2OQweebFvd1fQW9DXt638JlvWSHeWPr6fp1JcInv2yZ
         MMB0M9DTbplhAubksMlqawi8kk3wdqTEmA8tfxJSHJN/IwyNVF5+7x7W6qfYy/dUXo8F
         VWYdpGEA0kcT0d17dHWm8WGvTdGnee06jgDliRDHxIKgOPGM/5uk2ibpDBulOTp45fRm
         1fOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731435739; x=1732040539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rGw8I43GoIEdw75f9gcID3EPkPrgfiDyB1X473+QaOg=;
        b=riBfQCtkSeOMv2yGvObaMJgqEOfZut7kqbriO7wvhtrCNw8ML93t2BzkcvjR9sn6yC
         dobrjjY/yaBsaxQknGSswXOWmln5Lf3vun34Ew+hLODB1dnrd4aWKydBWNcujA0yI5Ds
         /L01ZiTNBkbw3NAAtANmc7uzEFgLYkux5w9qsyneJ+H486s/kLE2zCeesErHHxo7CzIc
         L9K/Qg5c52hVCNOe7n9iTYbnfQDXdmy8Hqa0Oi4LPqP4VFxJFnGvMsAOdhKKB5Fhqw+I
         avaW5nDF15ehxzqxiXX98ngBtsJuacDO5ixb0Cn9S912N2n8StGesp54rnVCxQvD6q0A
         6YJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRE7Vr2cf4R8s0gIrf1ZXNR3zO+WvDWwLly1mB1XjnQf4nrshaiAAksLEcPLZSbvVvWl/jfNwDd04QJlZv@vger.kernel.org, AJvYcCVRuA8tQ8T+d2FTLUpALeH/Ta2EXgvbyhWegBWIGwMqaAE8y8dVLITstv1ZUJ+nGOCr3zjWqYmz0fW3K7CW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1OqhBFw5rJRuCHlDbaIJGyuFwGSf/jF+hVxH949u9VTir/jP8
	qHriI++qSj4GRwPMkoCbJn3yIjX8iJnnTx+A+lAutSmmZfW2yMm6
X-Google-Smtp-Source: AGHT+IHQJ9DcCw2M41pZGval9nx2PIlFgi2G38OFndiORIwfTgf0326SaoN/rywDWnrSrr2FwxlJzQ==
X-Received: by 2002:a05:600c:4507:b0:431:5c1c:71b6 with SMTP id 5b1f17b1804b1-432b750a433mr165118395e9.17.1731435739344;
        Tue, 12 Nov 2024 10:22:19 -0800 (PST)
Received: from localhost ([194.120.133.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed97e62csm15903604f8f.37.2024.11.12.10.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 10:22:18 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][V2] drm/msm/a5xx: remove null pointer check on pdev
Date: Tue, 12 Nov 2024 18:22:18 +0000
Message-Id: <20241112182218.1119158-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The call chain on a5xx_gpu_init is such that pdev is not going to be
null, so the null check on pdev can be removed. This also cleans up
a static analysis warning where pdev is dereferenced before the null
check which cannot actually occur.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

---

V2: rewrite Subject, remove null check on pdev

---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index ee89db72e36e..4edf9109d1d8 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1760,11 +1760,6 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	unsigned int nr_rings;
 	int ret;
 
-	if (!pdev) {
-		DRM_DEV_ERROR(dev->dev, "No A5XX device is defined\n");
-		return ERR_PTR(-ENXIO);
-	}
-
 	a5xx_gpu = kzalloc(sizeof(*a5xx_gpu), GFP_KERNEL);
 	if (!a5xx_gpu)
 		return ERR_PTR(-ENOMEM);
-- 
2.39.5


