Return-Path: <linux-arm-msm+bounces-18930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D198B704E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 12:45:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6442B20C1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 10:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CAE712DDA5;
	Tue, 30 Apr 2024 10:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HmCx6eOZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF5412C46D;
	Tue, 30 Apr 2024 10:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714473861; cv=none; b=ae6wPpLl1cAFKtTRqe1KU5QZB5oX3phE4bEQoihlBjg4J0/KtkIF5rTf7dDVk4R0segkSrCSHA0fzqozYXcPu14scA2S8V9JLHTrlWMar1klLQeXzKaa+RVnulYqlTehrW7SUtPZfMbOz4A+XO97+XniHRvwgY6R9D7Qtt4f8vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714473861; c=relaxed/simple;
	bh=FHi4AR63j8pWNcngvHBYBnb8PtEsuBHPoSnbfH71DYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ypntn30GJCgS4d/vIz/cchxeomoL2FizET3L8rXpPbHNKOL58wRgjoL2K0WKPvK/vadh9/Ddo1VUy+ddTz3C/URZXRP3mxteattk7TW6WOH5u6PVjh8rNkbYx2NtA3qj7vfKbDR1H9KTKaf27/T1RzPhX4ddpdUii9U6hWsVpuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HmCx6eOZ; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-516d1ecaf25so7668991e87.2;
        Tue, 30 Apr 2024 03:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714473857; x=1715078657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ic7IN0PnIgO0dqQ2RCjCA+dfW7JVcfpGgg1J4d7qdc=;
        b=HmCx6eOZggahJqyE/eZ5tj92O7IFLieUonptfKA1oWEp3vH4+YWTe3csZbhApmPoo1
         4QsMlH9jjJUxU1l+1neXD2ESFyx6Zdh/bQ7auTcPFHsYkPWbyZ7MIJYiRdTQhqbQYXFs
         wEtF9dS4JiI2ARB6zAL3Tt/PPttWt+rXMTCCpTS+8vuPfMjCnpvHb/78sExp0FKIl8GF
         I/Ai59Xy5TOtIsSgo/G/oPaboHyF4Cr7hIT8DkygLLPQWuCW0TCe5FG23SwAHmicSHfb
         6kjPMB7xSWLUayLivI2VROf5LnJUVS1aF1CUw5QUCLnDkH6x3N02iP0zRAyVQTRHZQFO
         kkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714473857; x=1715078657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ic7IN0PnIgO0dqQ2RCjCA+dfW7JVcfpGgg1J4d7qdc=;
        b=Bocx9DdHpZOcSQh63QBsc/yKhLpxNICO5c7aOAXYV6+D+zQghlhD5hPtgwO/nl7l/6
         4Xyj4FXxjfwZkDrbvR3LUIXjEC9Oi+TWgTtES1+dbAHB1pEK6mfmtfZ01zq+SvVpVht5
         +/8t7vpqMVk9ysWGMa9/i+DtiEB2BuRF7buNBoF71TwaXE3+tIQX64UJkA1+Racs3NJS
         NpekQTeruh9CNzeHOWDvvG690jZPQAYFfymCnAO3qNYDmPi6noX7fPCV5xWC04CSzptT
         sFIS/rY/o229gGZi3fSQrGEPlExS2uCrQGMGS5MAvXbnxuuqbzHkAdAGq9oXMOGFGxOR
         emWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPunggMudSYH9qIkWgF3V0xZv9BRdxg/6TLIkpO9OXDmjKvN6h/Zz+blmPFWOkeXEGKIrCePgnnGgINhO15S3JNViAgO3jucMDyQ==
X-Gm-Message-State: AOJu0YzSdnn8XMXklhs6FKGRQC0LJWeO0X+mSq24FSU5seu0rCpqEfby
	IR87PP25pTmJ3GvuLLYMYVLOxpPFlSbmtTYQAk5evIXYSgLDlPPJ
X-Google-Smtp-Source: AGHT+IED7+8LIt+BXqOrh4TQwvuWkR/ug2+Ie/cIihQDskljnAvBlIYDyN5PyJtWcAsEim7jT4tDkA==
X-Received: by 2002:ac2:4c8f:0:b0:519:2828:c284 with SMTP id d15-20020ac24c8f000000b005192828c284mr1470875lfl.65.1714473857412;
        Tue, 30 Apr 2024 03:44:17 -0700 (PDT)
Received: from [192.168.0.20] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id p8-20020a5d48c8000000b0034af40b2efdsm23595951wrs.108.2024.04.30.03.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 03:44:17 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 30 Apr 2024 11:43:19 +0100
Subject: [PATCH v3 5/6] drm/msm: Add MSM_PARAM_RAYTRACING uapi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-a750-raytracing-v3-5-7f57c5ac082d@gmail.com>
References: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
In-Reply-To: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714473850; l=1613;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=FHi4AR63j8pWNcngvHBYBnb8PtEsuBHPoSnbfH71DYk=;
 b=dffNInQzX2nF4l+Id/KBjq+vNO6/wAHoumSVYQ+CoEIPikRgfVSFtXNjP0PNNzanPj5Rm5j3l
 Rltt35ZByNqCd5FO/32dB1Pmor0w+LWvxrwSKhQTonth3iUR1ecvoxJ
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

Expose the value of the software fuse to userspace.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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


