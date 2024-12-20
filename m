Return-Path: <linux-arm-msm+bounces-42890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B58C9F898C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 02:30:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A71941886B40
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 01:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CAB143744;
	Fri, 20 Dec 2024 01:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TGx19XRV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99AD86334
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 01:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734658132; cv=none; b=r/EPUh3BgSu4O+MKEY04gbai65at+qX8A79kdYclnicJbu9X8FkJ7+/CgdadtL7BXO4fwiL9SW2ZPSXvGsjdlyK/9H3PX27lif0ewBp2h9GgWV8FxgRWi0+BniarZfJaeZI/nIFekgWoMMtB2UVTvOtnWyAxqKVd0dzL1FYFt30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734658132; c=relaxed/simple;
	bh=5058CHEvuHi6y1shjj/7LSsaLqFOGpH0zSafsGTeHak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H2k8RFCuKZu4X2VLSvILnlO/f5SJPz5OortRPtmnK4NLErM8cuiQE7/MDPgeFPcy9Q1Z0J9CCfXtrZxGThvPI2/klZyAwtF56Y9NjPUfQ3C4+jQCQh2OXexr2YF/QpkHt1+q6ukDm2++YSHtTSJf0j0kZYgXiUxJ1NUnpmrssZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TGx19XRV; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54021daa6cbso1414776e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 17:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734658129; x=1735262929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g+UxLeMEKZ0drgg5vIKf6D6FbqGDQrxrvZvv2J0cYAE=;
        b=TGx19XRVlEHchzn1valKhCMRQtPTCC0JjYSZtdjU9kLEaCKzLyddPjvrMFvZiHsUAO
         grUo4aO/hNwwGc3oVShvC0XLqyyyASHv3VjsNKPkBVRYot0f1ENiC6cX61KhzuTWtezB
         dpLLYlwN3HHV6ZNZ0KsRfJpPzeO7LEzIomNQk/ozNpKaG9voFDXZ1YsWOp01pwg3+T/a
         FF3JGb7JBk5CTjVBAyAVUjWF5Ic5uPUHv22mlmwIC/g+EaaHpT0uvs/xKx7psna1Sy5G
         bnM6KYvG7Wx3cx+ggiNdwFLSuYLhmvO5sFtdhL4ssxVic8Z9w/uGH3l1PTyVB3z2eCmj
         hj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734658129; x=1735262929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+UxLeMEKZ0drgg5vIKf6D6FbqGDQrxrvZvv2J0cYAE=;
        b=fA+ZnTOsD+WtrgZVG5n3sHL+CQC+L/YDK+R1S16L+u+sI0smaMIMu3BXGEUVdGbkG9
         WfBiKF3EBWVvfveGJAxZP+Obag2cMLAYnR9c8S7Uedn/mlK+d00hd/rFpO8lt3RKpnNf
         mZHhT8ATMvbh8tNea/LvxPaYl9NvQKvLLqP8p6g3rugQY/LEzYFDXm4f0rcb41DbXqRk
         ENXFeqPYNFHuaDzEheKdf/1D9ocg42d4I1Mdueewd7uDMxrXbAfUvL7pQ1LYvxjRkPMa
         cTLQx+Y0Umegte7DXpcO/HABaJVJv8/EdXBK8WJzsrJSvdq19L3UdNVoMW0idizLUVQj
         5Sag==
X-Forwarded-Encrypted: i=1; AJvYcCXLE9VSlgiEhUW+KBHdZnUNPsatKorHpBcCI/mZwEFFTnEY0EOaFoCHRTdBfaDAvGkN9PlnTihotuD/yvjw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz87SASS6Sfcw7dNbE3Y9rP7K6lwPdGGmG0klULojUDi38aR1g5
	tyIJxMZkDfG/Vv7oZz4Gk+HCAbU7Fh9rVvj3PESbCi3Av8hnTbhATJRNgyM2XWQ=
X-Gm-Gg: ASbGncvG8DnyZgt9njw9wN7od+D1zyS+DFDlBPzpSw+TPswBzWu81p8sFQ7YPvybjb3
	vGmIrqfr3IQCovzsCiQnEgzJIAPz9ZYQuhVKcjruZOQXIbdG5Ra8MzshdgFu6FAZhDBYiBqzgkd
	c5xdP/g/VikMMpM/Pt9lPjjZIBARXrEbDf2RFjnxuXp2LgGmHzVe/jgunSgNAIil0TehiD7adrf
	vdVWtiQJPCN/GXvXMAYEbzoqwpUNswq8c4rbYInVTUNRUmNfAp+ASXnqFe9rBxB
X-Google-Smtp-Source: AGHT+IH5Icut19CrQRKgtDSzCRG8qNy2m4CTSKGxVWKKTUEhiYw6FKBa1WmLIGAIiUsb9ae8mcxHFQ==
X-Received: by 2002:a05:6512:1055:b0:53e:39e6:a1c1 with SMTP id 2adb3069b0e04-54229560360mr232733e87.43.1734658129064;
        Thu, 19 Dec 2024 17:28:49 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54227a89c2csm170540e87.71.2024.12.19.17.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 17:28:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 03:28:36 +0200
Subject: [PATCH v2 8/8] drm/msm/dpu: link DSPP_2/_3 blocks on X1E80100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-dpu-fix-catalog-v2-8-38fa961ea992@linaro.org>
References: <20241220-dpu-fix-catalog-v2-0-38fa961ea992@linaro.org>
In-Reply-To: <20241220-dpu-fix-catalog-v2-0-38fa961ea992@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Richard Acayan <mailingradian@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1307;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5058CHEvuHi6y1shjj/7LSsaLqFOGpH0zSafsGTeHak=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZMg/RB+Fi7NOIgUKpxxiaLrBsE7s80wm6VMMl
 UTR4BMn15uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2TIPwAKCRCLPIo+Aiko
 1QbaB/9MRXkpbzcxPF0Rcp5LR396dEkAkPli7KvHNg1toaDhWPRd5C5qR8G8fog0tXC0vQP8SLm
 zqaHgaRd+nheWQRf69qtmv5FXJoNt0oiyjgtNcxeokyocr3GYy07Y3hR592MYN5EJwu6aE9X+5+
 HCHKAZDNf2apKR+GPHPXPoZZ1UVJLScMigOzkAX72Sq5+kUzu2XB3OvlVhrXMQPBb0BTbvEtPCp
 rkHncfnva1A2cFkxmw5imydwNGwSq4yiGLKiiaW+cOf/jdDMnCs9KdR7a/28KDRO1a4ZxiD+oEp
 pAcUn1XMmvDK83Iy5U4XmQGl8eaE4EtvxRff50IJWybEfSH3
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks. This allows
using colour transformation matrix (aka night mode) with more outputs at
the same time.

Fixes: e3b1f369db5a ("drm/msm/dpu: Add X1E80100 support")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
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


