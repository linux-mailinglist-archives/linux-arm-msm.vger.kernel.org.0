Return-Path: <linux-arm-msm+bounces-18931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B898B704C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 12:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 783581F23119
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 10:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29CD12DDB3;
	Tue, 30 Apr 2024 10:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hmy4HjZX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5398412DD9C;
	Tue, 30 Apr 2024 10:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714473861; cv=none; b=lOol2n2muTQkJ+xCRP8dbXK0NSrjo8zCuNZn4rDDy0h+08nhAymjxmjXLA1hYfvGM9S/TZmERqBfkQ5Ifl6g3LzbpxdkswHoRnS+706RGZMAadIRqDcCMUETNUa3f4VqOziy6GO0ca7Ct+6ZRXBnenzYgreNAm36jJxbEfQVBaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714473861; c=relaxed/simple;
	bh=jmofaJ3QWKGh4FuQgnidJQUjJ4vAccqiIwWwk4VBoUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mhufcDruZ51Pf41kCeEUQWbfHKPIV9LgVPGacbz+XGJWJxvBBUjlpY/ELYr6PQn3WAmwr77UIRiXwvuU0Sfui9yIHb/HILizkIPWdIyv871nav7pn0mrkd2qoaCTiUWvGqV1CmjiWXZuYJqKc5oE6yuJm5GAf0oV31p6KEBNqt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hmy4HjZX; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-516d2600569so6758825e87.0;
        Tue, 30 Apr 2024 03:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714473858; x=1715078658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G6FI6Pr5Zw7YU5fITapN3BSMuLEhwI7dVwWigXJEbPU=;
        b=Hmy4HjZXnYun4N3w+S7qwUdjFS+xocF9xUlPg38mDDVstpv2wMfvja9sJXIqjVujGC
         HszND0zpDC+tKcsnuqB09NFc7bCEU55sRj+kFPDRXUm5a+UsPqTE4V7uzcVlZU+RbxII
         hNFaSXpV6T8+54B2RcatWQNH4VfPaunqMCTWOhtwphba+Kwn81uMR5Y5Jd2q1uxQ/T0S
         PjM9ZQLUf27UuI32RakqEh7Bz23Gs4rKAcqFh3iPvffk7l2NFz9yUQL12eGkw0xtdUva
         HptcGj1EZfUf1mokIfDZ56ZtQNmVQxFl8bZHMw/S3IrjvK3NpIQWdjKO6Bjq9R6DugkQ
         NmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714473858; x=1715078658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6FI6Pr5Zw7YU5fITapN3BSMuLEhwI7dVwWigXJEbPU=;
        b=F6ifPPWmBrkRyvtdxwl5zCv0f82Zh0GKj8TrzXYJlrTOGyBbAnEpL5L9PFUXaxne/c
         McRQZ6FHuWcaTRIa2wa3fmwafjBro9ZWBJAIHAzwBMYdB4RH3bkqvyM1lJp1hSWzT+hD
         fN0ENuknDk/ScB2Gv26JQscBXx+xdXPbzpDBntBbNWd8wrLdy9cvt0tiTCG5yuxahjAH
         zq8N3NmEj43iAH51zpesVZhSX4MRyaci4+xB85v+wh/2riJtZKUBXiEkIkZVV3+CAcTA
         AvL/nwhtzJQU9pf+1g3Biv/ZeDm8V1px7Cx2L2Q6cZguofPllXU9r0OgIe48Rb+sb7GG
         IN9w==
X-Forwarded-Encrypted: i=1; AJvYcCV6IGcKKmfxuR836wtKWcBsOto1iVHVMEdqva1M1M5DrwQQe2JB06lL7x9hgjWUXrz+nwo9BemstASM1JeIdPA8KML+5qlme0db7g==
X-Gm-Message-State: AOJu0YwvNbJBNGrOR5YdHBNB+Fu4IN3tI6/HMYcasrewim8hV+Miv/l/
	ObmxLTVYOXFy5Y693/CVDFzvU7XSH+L6XDCwS9scJdU2LkldAXC1
X-Google-Smtp-Source: AGHT+IE1/Hq+tFW08EaAqJcX/KieuMNro/vZRtBgruiDeTAF6Szwb0xjPS8W1TwAeFIB9vKcihxQzQ==
X-Received: by 2002:a05:6512:4013:b0:51d:2056:efaa with SMTP id br19-20020a056512401300b0051d2056efaamr6845331lfb.32.1714473858552;
        Tue, 30 Apr 2024 03:44:18 -0700 (PDT)
Received: from [192.168.0.20] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id p8-20020a5d48c8000000b0034af40b2efdsm23595951wrs.108.2024.04.30.03.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 03:44:18 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 30 Apr 2024 11:43:20 +0100
Subject: [PATCH v3 6/6] drm/msm/a7xx: Add missing register writes from
 downstream
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-a750-raytracing-v3-6-7f57c5ac082d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714473850; l=1178;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=jmofaJ3QWKGh4FuQgnidJQUjJ4vAccqiIwWwk4VBoUk=;
 b=ujp5kRgQelCyVGrPXqO7Kl6H4xLU3dtkkFWc1xAKk6SPvxdAcmD/lCjWErIW2i2gG1Q8n+eOT
 XvDBjRqaVWmBj97gf7s7X4XErXC6is+dMOqDznpv0NP0SF0YmjR4s+R
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

This isn't known to fix anything yet, but it's a good idea to add it.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 52b080206090..24a4ed9bfea9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1953,6 +1953,17 @@ static int hw_init(struct msm_gpu *gpu)
 				  BIT(6) | BIT(5) | BIT(3) | BIT(2) | BIT(1));
 	}
 
+	if (adreno_is_a750(adreno_gpu)) {
+		/* Disable ubwc merged UFC request feature */
+		gpu_rmw(gpu, REG_A6XX_RB_CMP_DBG_ECO_CNTL, BIT(19), BIT(19));
+
+		/* Enable TP flaghint and other performance settings */
+		gpu_write(gpu, REG_A6XX_TPL1_DBG_ECO_CNTL1, 0xc0700);
+	} else if (adreno_is_a7xx(adreno_gpu)) {
+		/* Disable non-ubwc read reqs from passing write reqs */
+		gpu_rmw(gpu, REG_A6XX_RB_CMP_DBG_ECO_CNTL, BIT(11), BIT(11));
+	}
+
 	/* Enable interrupts */
 	gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK,
 		  adreno_is_a7xx(adreno_gpu) ? A7XX_INT_MASK : A6XX_INT_MASK);

-- 
2.31.1


