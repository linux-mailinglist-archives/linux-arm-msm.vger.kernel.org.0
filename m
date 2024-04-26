Return-Path: <linux-arm-msm+bounces-18693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4EC8B3F72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 20:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC615287725
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 18:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F222C69B;
	Fri, 26 Apr 2024 18:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hq715ZSb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D301879;
	Fri, 26 Apr 2024 18:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714156464; cv=none; b=gsVOBMcEhBSPZnwx/qwEiZiPa5ltFzEw51Micz9RrSZ2hx1Tb9cfVgL+HxsdvauuIzsb9rBnMsqg17CX5sLuU7IHthCzJWT20HkuW5WHDt4i7F81MQdRhHI2mgZxQRS5JOTAJErqTLHZT7A5w3r0rvDAP2/gSiBByQbg8PPXWn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714156464; c=relaxed/simple;
	bh=egrZvhM+VJXYHLqq3OZ5q41AGIhcMaeNPTkRYlBKH78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sf73hWu9bKSemFMsoeBy+WnCBlNKpo6XoX/TBHReTWJDKxJCRQf3+4eWaw35S5hXLD6Ew8cN8O5+2h02zIN4kQBazlzTWPTV5x0dPujX1csbpOO8a2CALPW12ZZ+TO3jVVkXs3u9BaiccaIpxa8KFmP13ynH7DWE2jSccAy8Dac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hq715ZSb; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-34665dd7744so1716793f8f.1;
        Fri, 26 Apr 2024 11:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714156461; x=1714761261; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sJyBvG9J4gH2TAxw4m3BlgMY/XSDT0D6YjsSlCyMHaw=;
        b=Hq715ZSbOBJ4Vv1pikoRG5FBQK734ECxgeWMLeAFrkYNBQTllXgBAPUfjM2MXSzafp
         UfFfJ402h2jtJ/bEN7lizY1QLuv3pPwXMs4VLjy2RXxBvHurVuKPxtjDpu5KgBU2dJ/x
         QsrsYmTijX5Tbb2loEnsvskzMtR2+xdOEGx7kSxuDkQJ/kPBTDUtZg3vD4B9ndRW9rIG
         knjmVECMD8gtdxwQpuLmHCXpVoyMQ8fryt0AvNK87B69mUcvO8gEQnMzlEH60TDeLCHn
         g7s0jqSbmcDts16FC62R+8f5t9BevT5CTNl7NM3OlMGNXeLIExhpVb9QzQEgy0uxE4No
         YqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714156461; x=1714761261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJyBvG9J4gH2TAxw4m3BlgMY/XSDT0D6YjsSlCyMHaw=;
        b=qK54jZsVRCdYCtG/B6K8yUNDHjOY/9WQ1DRRqx3qGVOjonWTfba9ZWJjfnuiZZnzRJ
         cBiRFRLtlKs8Vzubd4K+Q1EK2U4HVtjE4BfQSBP7oTwgTHEMyYAR2TIpSXGDWG5DM8Fp
         nBwQs6V8HYJYraiG1KIJUdO6wuatxQI8VQfSl+e/bEW0/cDRctGaC7tY3aVQp2mpRtPm
         tx51NKA4KPATv9IkirjFhEt61lhqsIcETJvQBeDwSJoBlJC2vqvond8xZoqIqlhsUgpg
         9z4oQkujh45vecmlRCOKXOeUDu2kLg8F6c4mPjDL8yQ1v+1LmSM2eSw3vHLQkOEOlKo4
         4Alg==
X-Forwarded-Encrypted: i=1; AJvYcCU88HtrpZ6sPNUuLFy/HgZgU43sl9PhAx/pjqdDUeCWTXyasLe8hALQCmjVQtTm+cr4EnqXgjsBbqiMxZKurkLxveqZS8t5juWOzw==
X-Gm-Message-State: AOJu0Yzx6xGGU8p9FJO7Poa9u+giV90sPpl4hrPvr1OX/18m+f6m10jk
	lqAX49VjHQlNiJzomM4q6YLUIy/342utm2bjWg3l8dkv8z4S0f8d
X-Google-Smtp-Source: AGHT+IEVG9WYS+/yKdEmVEps+doMTQcvCtbzG6uHCDr704EIXoq2oU9o7Vx/JzIwA9oDttvf8SkerA==
X-Received: by 2002:adf:e5c6:0:b0:34c:67d6:8dec with SMTP id a6-20020adfe5c6000000b0034c67d68decmr1590607wrn.6.1714156461460;
        Fri, 26 Apr 2024 11:34:21 -0700 (PDT)
Received: from [192.168.0.20] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id b8-20020adfe308000000b003436a3cae6dsm22982701wrj.98.2024.04.26.11.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 11:34:21 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 26 Apr 2024 19:34:04 +0100
Subject: [PATCH v2 6/6] drm/msm/a7xx: Add missing register writes from
 downstream
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-a750-raytracing-v2-6-562ac9866d63@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714156454; l=1002;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=egrZvhM+VJXYHLqq3OZ5q41AGIhcMaeNPTkRYlBKH78=;
 b=o9fdkDoS/YkfV/V0z0h6hIhKhzcieS6htACG9eESo5iKjrx59eF5rnL36c8VHWB1sjdqAe8SZ
 0bXPLzO+8TPA2QIcjD1TetNUU4Znb1gyCaMCVQ6xIQbko3Za4x7ryPO
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

This isn't known to fix anything yet, but it's a good idea to add it.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 4a3b12b20802..d88ec857f1cb 100644
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


