Return-Path: <linux-arm-msm+bounces-24885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6326B923E3B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 14:57:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 959641C21629
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 12:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6462B16D4CE;
	Tue,  2 Jul 2024 12:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mfMccdHz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B784E1448E1
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jul 2024 12:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719925019; cv=none; b=djN5S5vlh3wQ0XDqp7CLvpib26ICkDawHlO1OTXPGhypwVl76NUe72lxztVs9AcEj0kxMi/9PW0I3mm1RWyrD+NU+CTWlsFx8Il+meDj79wd2krWlnYrTegv9+JWSU9dnbEkCll/upUAapmMpRS1dVEP2lw7MYVvdhHM3PYfgHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719925019; c=relaxed/simple;
	bh=NRBL4jAN6hjfyxISVZD05E8syLttrXlZkKCLenRZkDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cCxV4H3BFCQzPCEshhY1KYieVvpXTZVGojFPktv2QXPfGAkWPbln7/IPdWiq6leEJ1NiG+8PY2jFMeMbdQ/KwAkIziwYsyyKwP/DcfenoLwzAKoplEeg3Q7MSx3WwGj3M5KSgBUYSPLDoc4SHKuQyh/27my9HpLLK8KBWwSYmcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mfMccdHz; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3658197cdbbso2333786f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jul 2024 05:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719925016; x=1720529816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+in5BXb/vtFxcHIZXRWviluH0ffdCxEZJKwCycdffI=;
        b=mfMccdHzLetVsHWH1HfGbrXCecBWzZ9ZQxT4htFfUET2YI/UCHMw45iy9bWYOpjgoY
         7dMHQzafPAREoL6Xy/5fLPnS2/1kUjvC9DX/w31GzqaymeDNXXAlNLu3CtNvYQd5NQnM
         HDMNoIEndjyDhGX3ji7PGe0j0gyjUTbs7S7Pnim7fjO+yK7fUpSWUGou4V5pPFa+yJn7
         lkAP1VXZwnOxZXrCFUjTHaKX22IwJmU5v1DMoBmjgdUEz33fTCer+zzMdg10RtrPi7Ac
         Pl16aAhCm3w73l0rlZSX6xej/k4qxuthaF3Cjvy4CUfNQCP92gntMlX8uC9gN2HDr216
         mhzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719925016; x=1720529816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X+in5BXb/vtFxcHIZXRWviluH0ffdCxEZJKwCycdffI=;
        b=Lq99LihLP6SF9ac+23Fm07l7p6hq7crRPNcpc+Xo94UpVfLHOr/sfvG5nRb+RsON/R
         XLI080Gu8ZLs4K8t/9iSHvvFw89LR4tR822X7IQCo5IfYJgQVRqFuuTExsIBTt/7GgXR
         lOFY2a5NmmArsbtpoMLos8SniJUPnJHyhXGaBFCYMnVFocS/VqbGJYJGO1ub+kwEGzT+
         okdl+mYLPeGqi/Pb/A73oJI/i1nTvLJIB46NCLqGwbE6j6RnqNfVwzqFzCUcjeV8HPRS
         ISoe/HNEiz7zGluaj/rgLleVypPnfvYtWNssm/sdxIQtOa4/l0x98fd/X8ovnItmvA5l
         s6wA==
X-Gm-Message-State: AOJu0YyXbGW1WA7yU4zlx3m3sUhfykCG3M9ffTPr0BGLhRtQdTiYY1Ou
	DZCKKMMrd1VRZLP9KTVsgQfr7guT6LmHwuZuVO8h6w0gnowc4REX
X-Google-Smtp-Source: AGHT+IH84ILGIU8atW89P0kwgpHmmjiN3dcdo+V/tPYzkg1LEi1HUO58sQ9arTekTI+CSIAsGWRiBA==
X-Received: by 2002:a5d:66c8:0:b0:367:8c22:5b7a with SMTP id ffacd0b85a97d-3678c22645emr651852f8f.22.1719925016068;
        Tue, 02 Jul 2024 05:56:56 -0700 (PDT)
Received: from [192.168.0.20] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fc429sm13145533f8f.68.2024.07.02.05.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 05:56:55 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 02 Jul 2024 13:56:32 +0100
Subject: [PATCH 3/3] drm/msm: Expose expanded UBWC config uapi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240702-msm-tiling-config-v1-3-adaa6a6e4523@gmail.com>
References: <20240702-msm-tiling-config-v1-0-adaa6a6e4523@gmail.com>
In-Reply-To: <20240702-msm-tiling-config-v1-0-adaa6a6e4523@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719925012; l=1686;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=NRBL4jAN6hjfyxISVZD05E8syLttrXlZkKCLenRZkDQ=;
 b=ybJ3mkt0VhbHWnNkEva9LM6fnRAIfBOe/JvuqLyV8GmE1VAGCnuyd6L7FvFBJF1sKK1ewOAyS
 QI8ZcVxNW06BSRcjrglzlINcKMAv/rm0OvXoqfU5Zn0vguUWawmRzqN
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

This adds extra parameters that affect UBWC tiling that will be used by
the Mesa implementation of VK_EXT_host_image_copy.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 6 ++++++
 include/uapi/drm/msm_drm.h              | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 1c6626747b98..a4d3bc2de8df 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -379,6 +379,12 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 	case MSM_PARAM_RAYTRACING:
 		*value = adreno_gpu->has_ray_tracing;
 		return 0;
+	case MSM_PARAM_UBWC_SWIZZLE:
+		*value = adreno_gpu->ubwc_config.ubwc_swizzle;
+		return 0;
+	case MSM_PARAM_MACROTILE_MODE:
+		*value = adreno_gpu->ubwc_config.macrotile_mode;
+		return 0;
 	default:
 		DBG("%s: invalid param: %u", gpu->name, param);
 		return -EINVAL;
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 3fca72f73861..2377147b6af0 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -88,6 +88,8 @@ struct drm_msm_timespec {
 #define MSM_PARAM_VA_SIZE    0x0f  /* RO: size of valid GPU iova range (bytes) */
 #define MSM_PARAM_HIGHEST_BANK_BIT 0x10 /* RO */
 #define MSM_PARAM_RAYTRACING 0x11 /* RO */
+#define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
+#define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #

-- 
2.31.1


