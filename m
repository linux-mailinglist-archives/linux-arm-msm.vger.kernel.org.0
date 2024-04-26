Return-Path: <linux-arm-msm+bounces-18692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EFA8B3F70
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 20:35:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 593EA284E0B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 18:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A12742C6B9;
	Fri, 26 Apr 2024 18:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ippQE/7h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D38C2C69B;
	Fri, 26 Apr 2024 18:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714156463; cv=none; b=fyet/UEgr6cBf7fMZ/K0Q5gjYWw5CSPl4RTkcfwotm0k6fcPyvg5GrN8y5aK+wZt3DziRY82E00WkMOby2rOVlS3UEYJ3g43gUYT8pK6RHqjTh5WKK3wQhmMe9GW9q9JMRV8qshwg+CARaw40quwOO1q1PmDR5Q0xiF7yGN86uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714156463; c=relaxed/simple;
	bh=k8+KP5BvBzaV5ltlemprdbB/MkL5yABOBJv6NDeukv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nxQMsoD83Jmdz+DkUNWgqxSHRG09otLnw0x8/nRmCHb/jsFZlFeYIIhQR49rZi3tYvk+Db7RYYgZjKXHSqKmR3mrYP0AannNRM4Sg4yZ/MuyZhUtLuNPJNRnQ6GVnJG369bYBzGao7G4e6f7sGmISJ1ZeS5IbDNCWoydHWHdJCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ippQE/7h; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4196c62bb4eso18665575e9.2;
        Fri, 26 Apr 2024 11:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714156460; x=1714761260; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Grp2LGgH6+PWyu2cUX5hGmJqoEXKAEF5M+5s6HZfCfg=;
        b=ippQE/7hoFt+NAxmcUIT7iQPMl5PoxsOeo7SNt9t8rubZMcvTl0OLPtnpb4BbxGrk9
         sXdKArQiY0RdBNzDb3LjdOCDuCeEFvMemFOqaVeUrxoE8TJWfVK3tUEk4ztn7t2pvK6b
         F99XPyPNPNd0XqK8HmHsM+b06vpe2Khw4bdc1fHZSjYbvA3+NcymsdA5OSTiNxaNR9pA
         tE0ipnz6N+I9J2mzu9mLW7IOLDBwUqirhFppEJ4mKnic42MkKXfF0wevblKa9tcebSwK
         E50b7jF23whP6cfMccZMQPfk7L7PJZZ6ffvMBj2ZEA2Va5a+9w0mzPUAzcGxasht5NvD
         GliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714156460; x=1714761260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Grp2LGgH6+PWyu2cUX5hGmJqoEXKAEF5M+5s6HZfCfg=;
        b=Et60Jxr1zG0cmgrcsbwoB5wx6oErOT12KXqjrcitrfLK9NNai5A+//SNOxk3YDnEYR
         lRMpFMkXaYmiSeNX3Eg4Or1U53JXxD2FA6w082CgNzm0loqHo7ftd9lDQ7bJvfVwSR1F
         vYTX1PMPfL/JLzSUSp9344gFruCMhi93vH+hUXUbvbdBJ6gnJbSsWN9OV+IGjA/2aD9E
         GOMLwFtWzQ93ZjoCZOiR5GcyYP6Re4irRvffyS5CcFdv6Rz8XryAQ0oKilOTGEtObPcP
         El2u6vr4m85eS6L+1PYJufjlf/67KlrvuKgLySr0ptWMs1oKSmZsiVV7zoDcNWQYvpUe
         0fAg==
X-Forwarded-Encrypted: i=1; AJvYcCUcZhpIKNkM8PA//LbPHa5aX6Xrz2T8Tlk3TAnJDeBSkJYpIj7MKyEFGjXpB9ioBexbGYuBetbNRtlSN3hLTSnt/2VhhyneBBMfQA==
X-Gm-Message-State: AOJu0YyGFtt5FlRc+pYqy9+84P6t8SZ5GEe0BjLWSnlhTZg2nSFr5tl8
	qXb8Lb3P3g/cK0UGaimVREN8ACHRqaoukNnjOIAfnyEj3U9VA0Tl
X-Google-Smtp-Source: AGHT+IFNTwDOFjz1UnPkGuS61v1gGUOpnWkC+4t64gbqENyHu2qw6naENFbOIMW08qFx2TPMT5ackA==
X-Received: by 2002:adf:e111:0:b0:345:ca71:5ddb with SMTP id t17-20020adfe111000000b00345ca715ddbmr213956wrz.66.1714156460461;
        Fri, 26 Apr 2024 11:34:20 -0700 (PDT)
Received: from [192.168.0.20] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id b8-20020adfe308000000b003436a3cae6dsm22982701wrj.98.2024.04.26.11.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 11:34:20 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 26 Apr 2024 19:34:03 +0100
Subject: [PATCH v2 5/6] drm/msm: Add MSM_PARAM_RAYTRACING uapi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-a750-raytracing-v2-5-562ac9866d63@gmail.com>
References: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
In-Reply-To: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714156454; l=1497;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=k8+KP5BvBzaV5ltlemprdbB/MkL5yABOBJv6NDeukv0=;
 b=ocnALglUtUX8abejfJwQNRHOwjqITr5Nn1ufOtg985+P6uOhXhWYrYVVa7XXRSSj/446N+5pc
 hY56qhN1krCCrQA2Wzyga9JeuOyIPfs0RlQzreXvegRjcspq/JZSBsr
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

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


