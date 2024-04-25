Return-Path: <linux-arm-msm+bounces-18569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 342038B2317
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 15:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B57BA1F22978
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 13:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D300149DF4;
	Thu, 25 Apr 2024 13:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgL1+iyB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4B8149DEF
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 13:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714052694; cv=none; b=pzNT9q7oNAUBOlxVJxEB9A4jEMkmm/NsjtdZ4X9L+3h0JVFLIEcWQxsaoQssXbcwzoCHsrL4nwADlxkZpZKTFBm7itcLd7jOLcKpwiorepQJYYtDuthRNGLg2hERxxkiz5Y2GohWaIuPF7kyfCShw7wUAkt5TfFos1agceLTmZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714052694; c=relaxed/simple;
	bh=fxDpAQmnOtd35OeksyDO2Bwro4J0e+gCpi+QnMbCBQs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ombJPiNy+blLX4edpZZkzeMXUJ/r1830AYYeHMytNeuYKQFHrlzXowYzSgE0t63Kcu/SyFrCMi6m9VgfnkBkJ16dGovlh6PC1n2tLhdtWmscMjW+Y0jV3UFfDnoZFlgr56QhyUUYPXKwYlhbMygqTi/ijK0pjQiMNIxYBBWiB5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgL1+iyB; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d895e2c6efso14739581fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 06:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714052690; x=1714657490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80Mots/dK4gyAXTnhx+FHFnhKcgvoR1D8qAAi0ppbjM=;
        b=UgL1+iyBZVRYvr110aFQg2x1+/SFCd/snTNW4CQIahxRAnDXTeJJyfKssRIoonCigy
         9V4xfFRfO1pidqsTBFDjCfdl8Jz62fMwWfY53SHibGsya25pji9tnV02cThWCahm79gr
         yqP0oqSYCiDgXXLAAWMTOWJLTPd/2lBxaq19PXu5HO4czN8dga8JiSrcq9ACXTH4FowC
         YVkdUA8/V1L7rZ2kuNc62RyihputBOqLXjOTcUPJI1O3SmvK588wp8d24f9d1Q4afHBW
         sPZTe8QGPwAEa6vEBw7kf71aD1rgwbZ802DI8F5Sr/6P8FAEbHEc0uMnjIc25nVrgviB
         VZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714052690; x=1714657490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80Mots/dK4gyAXTnhx+FHFnhKcgvoR1D8qAAi0ppbjM=;
        b=e4v8sOmyf5wtVaNFTJ7NkJeKm0NodUQBOLUDTnqTcHyxXAdjlLb+xNsT8AU023o0/t
         xHInNKBl5YQJDDCoTAgnd9QSPHir4YBcqXJHXtooUHqej0DuwukY+ros8D57pQys9/oc
         L48W/sSXap3enzJxtXo8QwTuGmuFpkphHH+qgwJxAbwEjvOkolgkK6xW1vyU51OayEOP
         uY4okKUuln9DyQA2HEuS8xaaL0vlIUttBgCwyYdvTMo7HnzuhwKDJymtQx/+CBbASILg
         fW+x1Pntw9PjE0jNSNfFME4JCVv1ev/wH9AGMZnlkB6TQ2Y4yQYHEHpx3YYeb528OAaS
         VmEw==
X-Forwarded-Encrypted: i=1; AJvYcCU33bSYUv/XrC5+U5HW+Sb3GQ28w7HMpb9pgz4zxVJo7pwKsS9zIlpynuFreJX4+eyYVRnaLckd6roLQiAvmklAX/fxyHRWkKgXFXkKLA==
X-Gm-Message-State: AOJu0YwPGILgFHGjgJzllRp0osXuO6OTK33e+IXVHyPXBND5fNjLk4Ht
	vYYKEJaPJgPdRorhdcCrmf65SFKsAV7QIwjL+sr9E8Gm85AfOVdm
X-Google-Smtp-Source: AGHT+IF+bKo8BjZt1JJiQvfXOypqRzU/qEPWlXRDnVtVzK2G4v48y1SV8lalDBDLMGdvxZxkHS7lxQ==
X-Received: by 2002:a05:651c:222b:b0:2d8:d8b5:73c7 with SMTP id y43-20020a05651c222b00b002d8d8b573c7mr4403430ljq.23.1714052690462;
        Thu, 25 Apr 2024 06:44:50 -0700 (PDT)
Received: from lucy.. (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id bg11-20020a05600c3c8b00b0041a9c3444a6sm11235579wmb.28.2024.04.25.06.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 06:44:50 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Cc: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH 6/6] drm/msm/a7xx: Add missing register writes from downstream
Date: Thu, 25 Apr 2024 14:43:54 +0100
Message-Id: <20240425134354.1233862-7-cwabbott0@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240425134354.1233862-1-cwabbott0@gmail.com>
References: <20240425134354.1233862-1-cwabbott0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This isn't known to fix anything yet, but it's a good idea to add it.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index fb2722574ae5..e015f3b43bac 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1953,6 +1953,14 @@ static int hw_init(struct msm_gpu *gpu)
 				  BIT(6) | BIT(5) | BIT(3) | BIT(2) | BIT(1));
 	}
 
+	if (adreno_is_a750(adreno_gpu)) {
+		gpu_rmw(gpu, REG_A6XX_RB_CMP_DBG_ECO_CNTL, BIT(19), BIT(19));
+
+		gpu_write(gpu, REG_A6XX_TPL1_DBG_ECO_CNTL1, 0xc0700);
+	} else if (adreno_is_a7xx(adreno_gpu)) {
+		gpu_rmw(gpu, REG_A6XX_RB_CMP_DBG_ECO_CNTL, BIT(19), BIT(19));
+	}
+
 	/* Enable interrupts */
 	gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK,
 		  adreno_is_a7xx(adreno_gpu) ? A7XX_INT_MASK : A6XX_INT_MASK);
-- 
2.31.1


