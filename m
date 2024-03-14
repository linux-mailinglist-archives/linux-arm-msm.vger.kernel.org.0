Return-Path: <linux-arm-msm+bounces-14068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0C187B606
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 02:10:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 468C11C211AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 01:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C543D75;
	Thu, 14 Mar 2024 01:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rYSt/9U5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82394A1B
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 01:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710378649; cv=none; b=m3ri2cTtHijxK5xuMpxuYn2j/iDhsdc0RMFZdzRe9P39qp5rs3jiK2bTGv6fOe84KIxpYTe6wgXS5GICXTNsziig5fP2IUdDXqG1MRi0yofjheM3NYj8EZJByrKrBH/dMn8CENZRLfo+0VkS7E2TisF4L3GJkBA9/NW8TcREVfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710378649; c=relaxed/simple;
	bh=jkx8QeT632cJYJKjDVA7lP5qA9kMxj5ChekVZ1pgV/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nNsQeseHrLlL/PQXS6GNfIL3N8krRa/4B0RU9FrUKZPABPAMGwNDUdDiT5/6Py3OxV4Ozr9MnNU1Lr28H8NNWWjvQ6DDXTcWZLMI6STkT9T3EWaJQgPT6hLcka1OIp1dFtgQES6pQDl5u5bXXTB1wPCVr2zni1+y3GiZ/aEQQmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rYSt/9U5; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d2509c66daso4408801fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 18:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710378646; x=1710983446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zxdr/mpui1hYVgn1hATuqyEXzqZWkDVcTe72ce1oxoA=;
        b=rYSt/9U5Gqylu0hEZrikVpSmDWWrjipUAEUOT+xdDwEEqOptdmN8MaynqOrTB02C7u
         6OFkE65w1sbAkGoCNMPsFThwApxXDELVOT5tQvwogtLJOQIrsUpl0w40qYulfsYODlXd
         B10PBD1K4VnZ5P2/iQzOTZ2UAGELlVwGvZFMtj//iLGtdkbJndpwgWtOgVeV41PHdZEH
         PkLj69o7wnbTDoumH9q2PSECMHQXE5xbcKOW3+QmFlAkmQIK9D1CdBsf0GSWjuWoRn51
         yjIukwWOS99rxTIuBpszxlE8+CqvtnOeH19PnYefD73Blo5IZA6a3JBxG1yjeThWa+qE
         SXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710378646; x=1710983446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zxdr/mpui1hYVgn1hATuqyEXzqZWkDVcTe72ce1oxoA=;
        b=Q7cV22UHSnxkwbnveBqpJ85HBUyfcgYABwwLv72EGavzBKXwR3WNUr8EnKFykRrmDw
         YAKE8kztdhXwOt/DdFhTgjpc1xxTybNWbn5+JVX8dt7XLv7Imhu0VKu/jLDcWItzmcTg
         gCkDuZDDo2GiT4BLD7lKykynk3e6dvBVsJv9BBNe1occpyPryEPwo+mdgLW0NylcaBy0
         naRqpm3lm3Jsodl3fphDVmWcQMvMxkKsSboMKRtJu05wLE/Hsjq7AYgXeTU4C/scCF5f
         145sTwXCa2gcGLEvTRk0ubvNMkSQ72xFvJSnpn2EoRfTmEnzJodK69zJYPZbRPsnUxi2
         5FDA==
X-Gm-Message-State: AOJu0YwxImZHIACdTOLEjbFQ8Lk/Rr9Z9ywp8Tgo6Xm2uUV2dt9Jl8Nn
	YUVt7IEXAx3ooA4Ak1ZZkt+kSEj43fPHMvu00uCzPbu4CYU6rqBpxyjpoLq6be8=
X-Google-Smtp-Source: AGHT+IHCUJmoYn9jI50GYYIrQhEEZr2dXcfoR+wFJNhsonpJAZ8FGcHSZtzK/NG5ppzW2cGCp28OgQ==
X-Received: by 2002:a2e:9b99:0:b0:2d4:7756:3549 with SMTP id z25-20020a2e9b99000000b002d477563549mr110990lji.16.1710378645969;
        Wed, 13 Mar 2024 18:10:45 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u19-20020a2e91d3000000b002d2ab6ae675sm48917ljg.137.2024.03.13.18.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 18:10:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Mar 2024 03:10:41 +0200
Subject: [PATCH v3 1/5] drm/msm/dpu: don't allow overriding data from
 catalog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-dpu-perf-rework-v3-1-79fa4e065574@linaro.org>
References: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
In-Reply-To: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jkx8QeT632cJYJKjDVA7lP5qA9kMxj5ChekVZ1pgV/A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl8k6SaiBAo9biqgSROXWBG9JOaT2gSR6NNM1gh
 rLTYn6o59CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfJOkgAKCRCLPIo+Aiko
 1TYsCACm/8pvdQnme+edeFf6jF9cCNURSjDk4BGjb7bgjZKUe9tXt33VNrUPfjO0bhwsako1KR3
 obQmzwXxfZy6NcTFP4FxqyJBUsAqpyADelajr+98gbDM45cU+KgXN+/P7poEjnUAh0MMeAx5EH+
 TYKZY6PfJJ3DR0+RF1Ns5s3iFPljn7to7/iR+8v1FJDPauYU1uiQSA/pGLWaYGJdhB30K0hyffk
 66e0UDmS49YG093eSEHaMJg93YLO6xYeHZBuzR4UYsrD3+17FZd3hazxJ1AGFFIEaF9vC2zxvvR
 r2ok0315QhHToQeoL+6xkvY7NHEFizL6ZxatKwH9tsY20eZK
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The data from catalog is marked as const, so it is a part of the RO
segment. Allowing userspace to write to it through debugfs can cause
protection faults. Set debugfs file mode to read-only for debug entries
corresponding to perf_cfg coming from catalog.

Fixes: abda0d925f9c ("drm/msm/dpu: Mark various data tables as const")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index ef871239adb2..68fae048a9a8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -459,15 +459,15 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 			&perf->core_clk_rate);
 	debugfs_create_u32("enable_bw_release", 0600, entry,
 			(u32 *)&perf->enable_bw_release);
-	debugfs_create_u32("threshold_low", 0600, entry,
+	debugfs_create_u32("threshold_low", 0400, entry,
 			(u32 *)&perf->perf_cfg->max_bw_low);
-	debugfs_create_u32("threshold_high", 0600, entry,
+	debugfs_create_u32("threshold_high", 0400, entry,
 			(u32 *)&perf->perf_cfg->max_bw_high);
-	debugfs_create_u32("min_core_ib", 0600, entry,
+	debugfs_create_u32("min_core_ib", 0400, entry,
 			(u32 *)&perf->perf_cfg->min_core_ib);
-	debugfs_create_u32("min_llcc_ib", 0600, entry,
+	debugfs_create_u32("min_llcc_ib", 0400, entry,
 			(u32 *)&perf->perf_cfg->min_llcc_ib);
-	debugfs_create_u32("min_dram_ib", 0600, entry,
+	debugfs_create_u32("min_dram_ib", 0400, entry,
 			(u32 *)&perf->perf_cfg->min_dram_ib);
 	debugfs_create_file("perf_mode", 0600, entry,
 			(u32 *)perf, &dpu_core_perf_mode_fops);

-- 
2.39.2


