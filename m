Return-Path: <linux-arm-msm+bounces-28095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0D594A840
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 15:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 723B51F22042
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 13:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94F6C1DF666;
	Wed,  7 Aug 2024 13:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLGPrloB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B301E672C
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Aug 2024 13:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723035918; cv=none; b=YAoF2GbvP/ovc2d7NBA3o+2VPEIsyNQoJ5RxNxq28BWiwMM/ZW+QeKo0ELFGk+QVRq35KOqpT7kFHJyOkhDzNP4nbIhYf2KgmtRz8UUNmFHR7+KfapixemzwfFR0SaRceoi/+tZxHxNRs/HwLkprZFt7nMLYNal0LTTljYMDONo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723035918; c=relaxed/simple;
	bh=/7yQqe2NBmmAI7rwVzTr03fHyeDp7IBl0NXw+ehR9bo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M6DbcDHms/KXwVGGDEo2wxAbLX1l4WnMirYZkFAkRQJiO0q5HzFUoa39hjLI+bYJtsbLufxJCXBQr3IdL+WbUPqzTrluuYMNAxTuFA3eXAmaU7LqzdZVYpthbDqvn6FK7RGVsBbpIJxCSYH+qkattYJ+39dNGmq8jXW8wmkOlTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BLGPrloB; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-428e0d18666so11870415e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Aug 2024 06:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723035915; x=1723640715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1oksB2lPljdtr262j2OTvXCtWbemaDGwEg2PJlYW6+0=;
        b=BLGPrloBV5qgPwXQhD2dPqq/ij2vVP8B7v/0CJveMPHh6brstnZcCszGKy4Ed/5OG9
         lhp+bLiKH315jwlB5+wJCJ32b3XoLcGEcQWWezwVk2G16OAsCO4R8coyfjwZRdY2xieM
         hSwauTDAGOqpDaRhCCHMI+iMh+W3KZso2huSFXFwOFXPG+AzX02FfOhurI/2BRAp/9so
         wcoUiJ+lAxOtCPmhllV2fxtEtMbppk3e00ZeIaSaNg59Y+XTunq35mPCj1siE5HeB0bb
         YLwNKvVAlfN02Z6bUc++FTqDgKTGrvaY7xRSN+6MfUF7FkaXxVVnpaX6HYgSrwnD4Xt5
         XijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723035915; x=1723640715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1oksB2lPljdtr262j2OTvXCtWbemaDGwEg2PJlYW6+0=;
        b=F1lJXJOh/d6PFFJaVEe591RYv+X60HOZlUBv8Qg0x9y7hr1WfhIbW935j5n4nNIqd8
         zP7H3dHI2gYmQlO9NiCQw7XPkbEo8cacTOntVZmL0tcx4Wyvgfi6SKnwLvtwGCQFkMVU
         G/PqE7RhqM00sLdf5LUwh4X6CIofO4T6uNvLqsdaAFujEHoZMXVLPFCuj+vLy7lFDNp5
         zjtzVeIhSroOHzq0W9IalutPjxunZ1goaH8knUwJDNt3gB+yhCzk6YGcFna5nv8B6PsJ
         CfFtzJYZoozglsyXFx5M1SCbstgAbXl+K7+niUnixWfSVMz0/MN6HGlPCgtITEvaQiBK
         PVjQ==
X-Gm-Message-State: AOJu0Yzhh41US6E97a//vQ5oykNhaIPfwpaR6qPXQX23VfMLWKRsjlQ/
	ZXa/8p8LNFxBD3G+c0AnexvxFsK48J5RJpIlf/VqccGV/O3hAiEg
X-Google-Smtp-Source: AGHT+IF8+PrPZHWV2T+bDUo5FDlFFDLNOBnPVtzIKhRd7aZ73nUs+zF448eTPJkidsAIpuR0rNlmYQ==
X-Received: by 2002:adf:e644:0:b0:365:980c:d281 with SMTP id ffacd0b85a97d-36bbc1bcce8mr10627386f8f.45.1723035914892;
        Wed, 07 Aug 2024 06:05:14 -0700 (PDT)
Received: from [192.168.0.12] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd05980csm16072849f8f.76.2024.08.07.06.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 06:05:14 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 07 Aug 2024 14:04:59 +0100
Subject: [PATCH v3 4/4] drm/msm: Fix UBWC macrotile_mode for a680
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-msm-tiling-config-v3-4-ef1bc26efb4c@gmail.com>
References: <20240807-msm-tiling-config-v3-0-ef1bc26efb4c@gmail.com>
In-Reply-To: <20240807-msm-tiling-config-v3-0-ef1bc26efb4c@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723035909; l=955;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=/7yQqe2NBmmAI7rwVzTr03fHyeDp7IBl0NXw+ehR9bo=;
 b=NRs0NJvx7j8M5zqZYO/fc7C48wEQeY0hvIuRQ+ibgD3REpZMOSfpYrZ2wBj5shMArAsIl758E
 qMPqBlBFximDcNQMDNwJW+j/OoXvlGvDhCiIWPK7t6HjJRfEhX8LT1y
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

Make it match the MDSS settings for sc8180x and downstream.

Note that without the previous commit that exposes the value of
macrotile_mode to mesa, this will break mesa which expects the legacy
default value of 0. Therefore we do *not* want to backport it.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 7c2fdd1e7684..7ceca633ceea 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -519,6 +519,9 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	if (adreno_is_a640_family(gpu))
 		gpu->ubwc_config.amsbc = 1;
 
+	if (adreno_is_a680(gpu))
+		gpu->ubwc_config.macrotile_mode = 1;
+
 	if (adreno_is_a650(gpu) ||
 	    adreno_is_a660(gpu) ||
 	    adreno_is_a690(gpu) ||

-- 
2.31.1


