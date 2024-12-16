Return-Path: <linux-arm-msm+bounces-42312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A58799F2BE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 09:29:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A1B71881C2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 08:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA025202C22;
	Mon, 16 Dec 2024 08:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rAQdI8rd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99B2201268
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 08:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734337666; cv=none; b=EO/iLnLh1Fa61GMLBkzC+7hjZgpTUSrEHJlZ3SDsZjd7JAfB+w8yxMcP5oXtR2CjGOHZ4mnq08Qx+VXF+cNZ6JmUHpsNTPegHixFiFbaQS6ZYGnCOSpz27Hq7DCCF/96GGKb1djGsKpSdHym1hkKkfYDNlXCZQaV0KBxQTEzycM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734337666; c=relaxed/simple;
	bh=0d6Vl9uKHPMWNXj1THwSQ8KfCjRZZOIXlKFBufG6ric=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T+wmBJkUtJ+MRCG+ha60bSScKtn5x8jSvPcbxHycALy8cVKOERMZuOukWpI3JPPWzX/4fZye5pGysfyCWzsjG6ed9QD03IeW7l2jXBD7Q1CsYWaEy08Qnkj7WTc1kZOO94s9JVuIPtkpkiHFG3iTMBuatmu8RDxhTfiRBKNtpBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rAQdI8rd; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3022c61557cso40456931fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 00:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734337663; x=1734942463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w6iaR4XhdKUYvlNFXFyoX/pNn4cHsyDnjyLqjwDAVN4=;
        b=rAQdI8rduPVNRA0cjgdrZFOfqPhjypFg6KTdTC9zHU2cAIHJUROC5FlrsXeBr/5aCp
         QaWbggsCIpkuRqwREmFcVccTxVtZdwqSQkL2KG7Ens8mfmU8dCg21fSiY56MfSqUXGtt
         qhotPPlja41bYFodhQ8U8sPZjk1ZlqqrEpt2hAej48x7HBzUSDlNXEq0JsPJ2Cv648IA
         gqYI2rfbWSvohxcGkMde3473iqI/iGzebxrLW6r9/ntlAgBdFfzCQVZf2UiM7KycfyyZ
         YIsZstJzV5QXtHEviNthWOmVUod+tiE1pYHStpyXt+S4O7F9sgZTzXYO6CS6YVL4dCFw
         Oi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734337663; x=1734942463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6iaR4XhdKUYvlNFXFyoX/pNn4cHsyDnjyLqjwDAVN4=;
        b=B+umBYbojDmp0t0+ISiRv/GbsP6i5eTw4UvuRHI5dOWr4egrzCJYn6hlNcG77JN7es
         VbGHOA+tERXY8U8+dF3reEP8USnyOJzJC/sRZCjGkhseMDsBOQcFVc9tg2Yl9P652xmI
         8PoOeH7ePr44WSElmADXuQWe3tYmqfglZXAXOfqOpAY+asJsotnrljPphFQlKGiE7YJ9
         nQWjz3IW1qaeDBY1iWpidaaRjF8ffX+GRrg43SYko9Jzq+h6T93Z+FgZx3xZj1EPnzmT
         rEydA3uFkpqH9gL8kbxZ0TGx4+Nc/n1imIcP6fbbON3mDzSBUscuoh/tA+Dz5WdlQLa+
         1iPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRZzYCxU4o+Vgk3qyzvGXd1B9cNvdPyrFEsIl0ImTaXg7UOen+CXgILptdFshl23BR0pgvio8vsXyKN0Ol@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1e09Or0KO8UY92Z/CQwOqBNvTerWho8FQuSghuoHamqdI+zbX
	0d9CAb5o5HwK6q75MEshsZ4aGvBChZ2/pdxoLPu3tlKuhlNIfk7LZj7o454W3vk=
X-Gm-Gg: ASbGncuUH8lzSpgzdbl9cBX4yNssgRVGWzV0oS2nkxkC+4CyzjtcZefcesqYatytF1f
	tuOq5vcYz236f7PcMWrWQtIzrSFsoc4NpSRbXBdOpZCTjIHO8QLvydyYSSTypekvy1Pd1yJuWc4
	15bn9W+KvllMIAlQ1KBWsNsiaGZwliBrmhkwofVx67pAS4KPac3CM8AIBhSHNzsDvH3Gwoo6iLG
	nfYtntMW7Ie4lE4IuWtk5tc7Xqwx4ivFsyb+ll+EmDvT2JKfVwXzPwcBbGnjWu1
X-Google-Smtp-Source: AGHT+IEy+x7o2Lt7ybsRZe8ZBGCz8wMHfuQe/9Ykj81HF+ZPyzLz0xLLyDsY3vkjOuNJg6AH3N2zDg==
X-Received: by 2002:a2e:a9a8:0:b0:2ff:8e69:77ef with SMTP id 38308e7fff4ca-302544230e1mr42812991fa.1.1734337663008;
        Mon, 16 Dec 2024 00:27:43 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30344045342sm8543371fa.33.2024.12.16.00.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 00:27:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 10:27:28 +0200
Subject: [PATCH 7/8] drm/msm/dpu: link DSPP_2/_3 blocks on X1E80100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-dpu-fix-catalog-v1-7-15bf0807dba1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0d6Vl9uKHPMWNXj1THwSQ8KfCjRZZOIXlKFBufG6ric=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnX+RsCE00L5+s73vnKOb6ulTZZZO35mal3hBlU
 0p3uqpReEmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1/kbAAKCRCLPIo+Aiko
 1V5+B/9pAJg0ZCTSwEwVzazpw8iop9xUL9QAUMhs88Vnbw7eF+Ky0nqKgZQOPcnp9duJ2KZd6ui
 Gy5oSC8vg5ghOaf6MZeZO4c56G2GEH7P5mrLyc0NWGhX7oetzAUeTeGbmicgRLBMrzpynqDEGu/
 eDOJlyhNHdK94yeSjnwIEcve+5ZfFJZmaR/XywGLfDAoXizxGb5vLBwyfRnnnnfdk8qau3JNXUB
 HdcxyIvCCQg1HyU94uG0rGw5r/qUo+xYWM4BQzWu3xF1K6g4EKe0QTptys5QOkzJNzJ/MGSUzbR
 9+xDb3ElV4sLX0QpcniZNzoD55SwhZzlv5M4vizm1nlTCp09
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks.

Fixes: e3b1f369db5a ("drm/msm/dpu: Add X1E80100 support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index d61895bb396fb4287e9b41807a3bb0cdb25d4e25..4f110be6b750d30e158d517aaa507c7b4eda0af4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -159,6 +159,7 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
@@ -166,6 +167,7 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,

-- 
2.39.5


