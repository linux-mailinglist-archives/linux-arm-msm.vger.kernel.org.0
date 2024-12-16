Return-Path: <linux-arm-msm+bounces-42307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDE99F2BD5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 09:28:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18154160E34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 08:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0996D200100;
	Mon, 16 Dec 2024 08:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wMTz47f/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDDE1FFC6C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 08:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734337654; cv=none; b=nr8+TuIc4g3din+njF4yfk05Cn/3wvqoiYS66DLQJVn2EZ4Cl0drntsDs3PFXjJsduilo6H1aBHpXHytONVoPM4oKNb8xXoAs5zKo0LLnVSN9Is9k9DmQk7iiiQ20wWB20a4qZ2UvrBQnZn+nWFSzjj8CU4JlJM4picJ2cBet1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734337654; c=relaxed/simple;
	bh=GNG1YjeHfuMszqIesSKPUebiuLvhN9Xn/3L3ADbn8DU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D0KV8iRykAVHCErl5oXL2yL9FMw4VEX6Unns3bzDyn47gswX7YAFhO6/YvoMXyo5G3RBM93qQjoYRw5U1EIegb3/dfLXnowFXujHQhma3iMcDVJmaGXERtEaWYE4ZjVAwDdXG9a4TcjF8I8SGMkjg5yuPVlknGIXPUBawbKgqUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wMTz47f/; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53df19bf6a9so5523855e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 00:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734337651; x=1734942451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1y3zws2OvDJOJvn4EwHQ6T46YmVm0fvbHsUMlmIZnm8=;
        b=wMTz47f/EdFPgso0NgXhPGrddaW2xGVr0gL5w8JRvBujFhlC5XJflkkr/hz1WGSsKJ
         8S1qlUdXG13fj74FfAwY29B0xG/GK9xngKCmSdbI2YLMaK3ErzyoGeXiDsEPFwCCl4wy
         OoxTGIV+eo7eyCdT7Gb/5VT45AA7dmYNqGkvRroEUsP+ALH9ToQatXnQssh22vjgVZMF
         3nO9eUoFi2tJM3TCVKbVtJ8jE8lbLr+iFRouzdCuNuJYNIZ7cxrYItPowEunjHAD5r1G
         56jhb+75NvJ21a7KNLJeJ5dSA2q2LiLzvrgCunIlV32kSP00mf5PWz7r5/plKPHWoRoE
         MAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734337651; x=1734942451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1y3zws2OvDJOJvn4EwHQ6T46YmVm0fvbHsUMlmIZnm8=;
        b=uNldcPcnksNDF/zha5zHnFJvneqefvcAmUixgJrJljvdYamIBUlL9/UtNZBsV5IIAP
         txp8LtlneB0LdTOm9ziugrg71a2bJ3GP5CzbZZt+cdqfKM/fn0B9mT4DVo3LatVBX2F7
         Y2UeOhsA6lGTArPArm+X5vDLXbDachvqs8OSwqamlxOdaSPfXzUdbb6Y42xDJ1be16oG
         XMEgkn804+ga4M+HKSLoBzEWxvMdXP+hQBzDdxZhid4AoWsKuqYlOLsFOvYG+X0ICjom
         XMPZ5LbXmFqQUosEOUL3VesqJosQP8ahoNik9cQRmFqXNgfhS3nYVjC0/vRiyPzcfB/t
         nfbA==
X-Forwarded-Encrypted: i=1; AJvYcCUvuuifpjYwm/Nk162x/nV+sZkCI8+7GsNi2C5Z7R7cx6kHi3p6/qKmikUenWq87/SEF6ReTNPWKErRkEiW@vger.kernel.org
X-Gm-Message-State: AOJu0YyLnBE4LtPdDvmQgnwC/yp/jdfpZpj4871Tmhy1RJwaDK+Qqgz6
	QLlgkVeD2l+hM39+wr8QEYovvs6hfYmwHsWx9nlzYtoo46T1rkO6siP/cYVzG2E=
X-Gm-Gg: ASbGncvqanTq7lip+U3SjLklBGNE1VSRgVC9FTzEqSJ7KWGqYVnqrhIu0RQjfSQNgnQ
	TbaCwvJZhThq8W5lB0KsxmCr1NLVBhw3UcX1o6L8C0TWuMnMDpDPJwhRG9W6Y5KA1mpdl4k8pop
	qhTcxdXDl3OJBLM+oNpy53AWVL/sc8vrSyoUrkWO8G2Tg+Ny8BjgMkEp7tR5a7mwBXrHf/Q2nej
	dpYoJf+XLk4zyp2mtw97I1bPFYzTN4F7yf+FDPwuymclckiFWIBOtged6kb1VMb
X-Google-Smtp-Source: AGHT+IEzJ0NEoETgA7c8ba6XyTQ/DzGVN/VS5aRCw2hY/b5fwtTAbAtRpZytYulUjtMOAdHNJr0JqA==
X-Received: by 2002:a2e:a989:0:b0:300:2d54:c2ae with SMTP id 38308e7fff4ca-302546115demr45480641fa.27.1734337651302;
        Mon, 16 Dec 2024 00:27:31 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30344045342sm8543371fa.33.2024.12.16.00.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 00:27:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 10:27:23 +0200
Subject: [PATCH 2/8] drm/msm/dpu: link DSPP_2/_3 blocks on SC8180X
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-dpu-fix-catalog-v1-2-15bf0807dba1@linaro.org>
References: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
In-Reply-To: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Richard Acayan <mailingradian@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=GNG1YjeHfuMszqIesSKPUebiuLvhN9Xn/3L3ADbn8DU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnX+RrE/1t7QKrO1i15J4Z2UkK/SQyKBi/FHqf9
 nl4CVCFJu2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1/kawAKCRCLPIo+Aiko
 1aq/B/9wOMO2d+TGtOtYeWqt92iBk1GzTfpG0xNYpmbvSaiR55N0aFWclXEzgT4g2cc19vzzryv
 c41PGKSpiK5qXbnkhTcLfOqc/UVycrEYNAlzrGUaZW0vL7Yx4UerVgkBozAW5y04OEUYoZpiJYr
 MjMEURWwYOhGMkdOo7Wl5S5plX1JOwXrlZQkJt6NsAJ3lUv98ms/VamgWhKTarJqESXw46g21+F
 /qWNUK+XC6tSfqqjtZks/sIgGxMbfOAIRdPJJnCt43I9wNX9Ng4Kxc9Lc1uG5zTwzw2A6Xl5VEg
 ABGMRPo83JhPnmTajrbbslOPzjGGsAneXND3EH99hJx4QC5G
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks.

Fixes: f5abecfe339e ("drm/msm/dpu: enable DSPP and DSC on sc8180x")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index bab19ddd1d4f97805c1bfba8ba6e117ae77c6c2e..641023b102bf59352546f0782d9264986367de78 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -163,6 +163,7 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
@@ -170,6 +171,7 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,

-- 
2.39.5


