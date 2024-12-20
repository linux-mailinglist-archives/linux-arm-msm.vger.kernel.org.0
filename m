Return-Path: <linux-arm-msm+bounces-42889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B41519F8988
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 02:30:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81F001890130
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 01:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FFB98635B;
	Fri, 20 Dec 2024 01:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FYDUg1HE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3F57DA6C
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 01:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734658131; cv=none; b=CsBlLKGBmRhQKxwUzy8RvO78+srlFEns1V+LDhmnIv54SdPNqspNHWtAAqxdtwBMIZSDjsOvf07pmWKGErxlwMggbiACj+XCI9mEOsPBt2h9d5i5WJHiobEB+qZ+pf2kixQPQjZxEdi16UpJkjMaqpgjJ4bD4o6wiGDhCIsbtS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734658131; c=relaxed/simple;
	bh=X7FvetBkuSIFwQPFNTIHnsnsMQMhXRkzYapuXItW/ig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TU5x1RksavJvcDFTVBDQp12bvpBdeiWLmMgSzSs4RKRTKpyGSAPGbDovrmzVXWEf4gtxSNvxgFKc87mZG8ps3hUZroKJ4TzC/TKn21hAParjl2ApNpmyVyMi8/lGJcnKBna2dUC6YhmmF/zuYDOOhC1kzBnCcYXpWkwKbg0LoFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FYDUg1HE; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53ffaaeeb76so1418840e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 17:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734658127; x=1735262927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iGem3bHUSgcY0xYR5Szm4SGhekE0/o689Nmwl8dsbT4=;
        b=FYDUg1HEpWY4OL4kAXNKRNJQF2SRwp3d39ADxWbTsOD3Y+mU9/814Hskun/VufYZUP
         kBL5sLakxO8K8BgGsxpBtj5V+MS+iNVbUledrJFR2W9XM+6WzZCaqxR8jY7ScktVuM0p
         vhZqxZ6QKh8n0d73qLoj3dKw2/+j84xTSFBuir4FgQqmqOUZeZr5njf8kfgGHrz52AxR
         zQ7CIlZQsloXn7maQe7ZNZitwupj/oL2TBV7v2xR/muAP+/1kOreBEMou+bYP/IjoJFi
         S3KAmURuMnTCkwmGVRHyFu1AnTHp3KEcgJq7IZMtGU9uxcYTYg+th8jveQ10AC63/xZi
         VgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734658127; x=1735262927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGem3bHUSgcY0xYR5Szm4SGhekE0/o689Nmwl8dsbT4=;
        b=VuFX8l9PJmST39oJXW+lv7jGVQw6tZxhkQ2iQHywz5J5U3fcK6FCjh+t3BjlbxFzQQ
         Qr5KZ3RDrc3MwdPdhCr2JCszTHYJqjCJXFoogWBMFjMYIYBUuYKqwBjy/TIIKUjEaOcF
         DCH+d59Io10m1KgO0Kg78gt/gvI0HXoeQQBizE/FQooKJYcaMS/K5wVUKfbdkLjmLQAe
         H4oGzgooGWYMy3ypXgibalstuFGYuhba5xm1rEVOgjz+/l6Gg8XijBlLvzCgJVzwDNyR
         c0DdJkW6oRvLZhEVBpd4vUbMnujTmZkmKxX5eAOfEbphtOjrk56OGCpWYRJ9MA3Lr86w
         hfXw==
X-Forwarded-Encrypted: i=1; AJvYcCWsBoXetqkGVCcyJOoW2TpjyVsMroc1Z2wBToTaVa+p5yFwDgJalNYI9Fti8qsJOT6Ir6NF48pk/wpdvxoV@vger.kernel.org
X-Gm-Message-State: AOJu0YxwDn8LoA77CNM4o8t5XnFtjmKsik6Hmj8rQ3bzt+2QSni4FBT0
	+BeHFOM2W2L1Q696dRze4n1qTxjDxiWxBOgJOuCaiTBHL5o1mKWZA3lsaxMKOQNfBn9LPj5wLg8
	c
X-Gm-Gg: ASbGncs//uhsilT0Z39dYBfs7XW5ebx31dgA3+aW+2dqsoud+IHnAGvFEnGTDST3vjy
	pZt7JjQT1JEykfLsh0Pli5R98RI/PmCcpQqI1xzghIlUkZSriPGyhQQUb/KevfkOBKW2U7hIhYP
	14qh3fbELlupt3g+rPQaHIGO3v+5KwS6+6Q+ChOTLhQzNNRySdYy1cf9mV/9giPW+y91pS5JxUS
	IHNv+koo4eLceEBgfHfAJy6KeHnxGzSAFy128iBNxVmMHLqCgpmO1KhOgK7AT+/
X-Google-Smtp-Source: AGHT+IFlLa1rzI9ywvTJgP+UZWS6o2QRUDkLVRX0vF55rzdqfZOrzFhtlmkOZ3P7H/6LEWkwS0b3DA==
X-Received: by 2002:a05:6512:2346:b0:542:1b8f:a922 with SMTP id 2adb3069b0e04-5422953332fmr191927e87.13.1734658127556;
        Thu, 19 Dec 2024 17:28:47 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54227a89c2csm170540e87.71.2024.12.19.17.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 17:28:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 03:28:35 +0200
Subject: [PATCH v2 7/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8650
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-dpu-fix-catalog-v2-7-38fa961ea992@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1304;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=X7FvetBkuSIFwQPFNTIHnsnsMQMhXRkzYapuXItW/ig=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZMg/v9DmM5T2yxcq/g6fD7SJF08okGiWvXljD
 A+sHsPo32aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2TIPwAKCRCLPIo+Aiko
 1YdiB/9rgVTCRMCi/eCKZkC3QRKJkXBrXzrFD1gJRnAnmiBIJw3rs/CqcZNs+y9qE8Rs3HErKQD
 1GRF18FqRlktpoMn/wWx0XVfvcqvF1/JOwIaufOYW/gHeDqX9bcljy+lV5BEETGiHPHlKLUSeeF
 lfPMYDBMKMh6fg2aMIeLOcPkBrvtuLrves2QMTCj3MzOi96WM0CFNWRijeJkeMEA21Piev+6WNP
 ru5ILrSjJlfyDl0PHKOOum6RS7vclvX/USM04KP03T+jQpOucULYy0PesTYVXGuxlHwqgKOwkdk
 q9c5a6ORSLriEroIZi3LtZE3dEhGouXRoh/oPAMTx9tic1Ex
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks. This allows
using colour transformation matrix (aka night mode) with more outputs at
the same time.

Fixes: b94747f7d8c7 ("drm/msm/dpu: add support for SM8650 DPU")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index eb5dfff2ec4f48d793f9d83aafed592d0947f04b..e187e7b1cef1677261a5de7b01ea3fa8136723ac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -160,6 +160,7 @@ static const struct dpu_lm_cfg sm8650_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x400,
@@ -167,6 +168,7 @@ static const struct dpu_lm_cfg sm8650_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x400,

-- 
2.39.5


