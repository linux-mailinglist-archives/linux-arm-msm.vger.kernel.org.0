Return-Path: <linux-arm-msm+bounces-18568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1E58B2315
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 15:45:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57F5828636A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 13:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1390B149C72;
	Thu, 25 Apr 2024 13:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNokLbBC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E22612BE8C
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 13:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714052692; cv=none; b=ZP1gJB5FGcBjJJRcO6eUcKvoxeUWso6mPgSCwA+V0SHIYCG4k52cfjExh7a1WgANTrUWbVl7cdxRIcZ1nHFbrsjs44YxAWgFdgzhoG1xQgdNsw55+e6ufONYkH71/1b1Tpdhy3echztW1qFv9p6JdZ/IdMUEymlN+AyxfArfzG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714052692; c=relaxed/simple;
	bh=5G2gGeC+2SdWmykvnu29RbK5EuZqlDisbqb6kFMexV4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SX04kIXTrgNRq3SDLUHL3x8TtLin0jHe1lCzsO1zqbSuXePdQ/WXiSXJMKNifkuY4SjV/lmuupzWO0uZKC7kkxHvs+m4JqyYomn0hwBV9SCxxLc2bfjgTPIxryVuUI3Mo41NPrEO2p7MiQXEAIgcimwjahlbqIMsgJNFbDGi6pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNokLbBC; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2def38477b8so6441231fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 06:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714052689; x=1714657489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uii1WjicEmGL6f3QVir6hJNE0qnpUgKBh+/oYZXrzo4=;
        b=aNokLbBCCswlPjz8ABOPQkddxG0SIh6eELfZfxbQWajKj58VlsGaNmrburgs1yhUuc
         u/QLWZP2yV4Z8ExJlJXMqB0HnJK7Vm1Ra6MJFLm6EqHcO0Kas57DQcVV/jrx6lh2BT0p
         WpypjUOG7FmRFNrnftmSyszz+R7ETKsvurobP54H9OdUVMSyZ5qr3C5/l25/ImCEDygW
         kvzn01hqklzs4WMpdyko9uYKJcTv5vc0DJU+2RHIrFge6Yn5G2pAHZ3YmUO0TdjWAHWm
         X/TV2zGYegT05OdPwiv4t+vS+VUUOPv0Mkc4b3uYQ4VBxIHgviMwE3a3Q1Ih/TS/n3pF
         e5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714052689; x=1714657489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uii1WjicEmGL6f3QVir6hJNE0qnpUgKBh+/oYZXrzo4=;
        b=DK/Ylfx8cH2nJKLTY24vqI5qpfkyDT4tQHOPb8KFEXAvFbDMOf2pO+k9tZgYeOf20A
         32QanhYSX5KsOMm7tFw3S/uSCGDkTxbRAZrldUX4bK7+TNX0qBYv5km0zeQyOTVIF2uf
         ud5J1xtUJ0d9sVrcvobzC3u9ZhhM8RJ7jDRwX/DzPS49CLSPorjkMLojn63dP2eIVJx0
         eiLgcrh6DFtTyqndRiiqBj1N7WNxiU3xt2BxTIBBT8Z0Z0sdXXn1yeLh+QSfwyVd+hpM
         S2IvPoYqxw9+aeN41v5U5a/Rt6mMw8OLch/z05ExJaVqPmKPcegkXmFJcq8ncTv3+Y7T
         +D4w==
X-Forwarded-Encrypted: i=1; AJvYcCWmTKSy4v65llpmXCS04Et7K6waFG0WCQuQNmO5MQOi64Zp5LoL03uxPuZEiJ9l1GaJLuexbAOADrmDD2F+J0g8fOT77NdVomxoN501UA==
X-Gm-Message-State: AOJu0YwTYTD1LelOaMVyWJyST4tLg6DgZPeKUimslCU2tr5ciFaEvYme
	Fu8UQf26Tmxn0gRZiD5DsYmTb4uGi0HNH/RfheONsrfAIriaffa5
X-Google-Smtp-Source: AGHT+IE2EmqlnVwTULFEUA4rxZgGPXRdF6Z2BUzbVp53KcX0JmbF/uP2h1SDfiUZB4ZJULkt6nN9hg==
X-Received: by 2002:a2e:b007:0:b0:2d3:2ecf:c26a with SMTP id y7-20020a2eb007000000b002d32ecfc26amr3808197ljk.13.1714052689456;
        Thu, 25 Apr 2024 06:44:49 -0700 (PDT)
Received: from lucy.. (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id bg11-20020a05600c3c8b00b0041a9c3444a6sm11235579wmb.28.2024.04.25.06.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 06:44:49 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Cc: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH 5/6] drm/msm: Add MSM_PARAM_RAYTRACING uapi
Date: Thu, 25 Apr 2024 14:43:53 +0100
Message-Id: <20240425134354.1233862-6-cwabbott0@gmail.com>
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

Expose the value of the software fuse to userspace.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +++
 include/uapi/drm/msm_drm.h              | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 074fb498706f..99ad651857b2 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -376,6 +376,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 	case MSM_PARAM_HIGHEST_BANK_BIT:
 		*value = adreno_gpu->ubwc_config.highest_bank_bit;
 		return 0;
+	case MSM_PARAM_RAYTRACING:
+		*value = adreno_gpu->has_ray_tracing;
+		return 0;
 	default:
 		DBG("%s: invalid param: %u", gpu->name, param);
 		return -EINVAL;
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index d8a6b3472760..3fca72f73861 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -87,6 +87,7 @@ struct drm_msm_timespec {
 #define MSM_PARAM_VA_START   0x0e  /* RO: start of valid GPU iova range */
 #define MSM_PARAM_VA_SIZE    0x0f  /* RO: size of valid GPU iova range (bytes) */
 #define MSM_PARAM_HIGHEST_BANK_BIT 0x10 /* RO */
+#define MSM_PARAM_RAYTRACING 0x11 /* RO */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
-- 
2.31.1


