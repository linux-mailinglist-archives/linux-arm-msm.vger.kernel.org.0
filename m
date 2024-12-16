Return-Path: <linux-arm-msm+bounces-42306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AEE9F2BD0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 09:27:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C43AE18817C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 08:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E07C1FFC60;
	Mon, 16 Dec 2024 08:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oAfNKSBJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6431FFC47
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 08:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734337652; cv=none; b=imZpS7mazVlaIO+7wOTwJvXI+BaK5q3O0ZOX5Rt3i5hIAgxe9nDGU2oPkaf2ycLAt/UUjEqRw6xQIQ2bbP3507S2zPi4ibQowCPW+fwPmIw8p7dnWRTW9EUeFR690LOPTqIeWYDACSUU3hV9luerCXQyvur/D5D1iWPwLmJ41YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734337652; c=relaxed/simple;
	bh=9MObEe5KzGyCABZYczA3jsFGPjAHvUO1PrGscQg+Yd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iegwqXEKiGqB+gPuk4ylnwHas6Z22gIPm3p5q/9vYF8Lbzd3Jh8eZIuSSBCoJRA4kxtspb5JxxAgZZQcUmizCSDNPRmmKmsyuE9B6YgMa3YeskwnWVG33LAXiN1Da2ua8cGMJMDxCfWC8Pz7jkt/WXIbMywla7gAEDtGd5f3Wr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oAfNKSBJ; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3022598e213so37086801fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 00:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734337649; x=1734942449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p3QX07TGdBq1gHdO6oikHZ2FbBQpzQ564YrLte+zAm0=;
        b=oAfNKSBJyxIQ6l8JXm3nFDDMo8g8Qa4QGjnxUiTdpe4TC0T3lLhFPgjn3E6fowvNeq
         cSaK6lRKJEs9b4uAI5gEAyAU0rSfdGscqCoHbtGfuC2zn8gplpmQccMvrpHNE3vghtqD
         4Gok0amjI1Inzvc6/W12Yi/PrAHgQQH6hKEliQy4VLo52m97Oi3MM3OmWinv0F2bh4Zd
         /DGX/uq9hMlhAhhGGDJnlj7oQTsDlvn+WHmc9qErEPN3sTge8AIDVKK2YmSEEIMj+F9w
         HzqEdzvPF+ywYpZbiR6qPUMDnzzOYPu50DhtU6crE0wipH5FK9yN03e05AbssYE6Qkue
         9RYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734337649; x=1734942449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3QX07TGdBq1gHdO6oikHZ2FbBQpzQ564YrLte+zAm0=;
        b=OFU/W0OQP5NyriNLEy6BHKD/O8VLCcWA+erRrhiJglVrKW5jHb0rsSb0SaDZOlUkpZ
         EihkNMbTJtciBXdmYGyiZZ5v7yFmojl4djC9jO2ctGzPWs+yThw24U/n6sW1mEvvoiaE
         0U99wf1Ua1CKtDgk3d9Jg3rV4lB6i/IzkRfchfpE1NduYwnQEdaHLnL3q8j4LK7Mm8a/
         1PqJKaeuWZbUlcxqUVs3NC5d49YvwYgse9BI3t1ReZ9PLlIwRfMM9pJ22CGNVsT7M4Yj
         qNnkjz31P/7wXzamQbC8QifcLoGGyY721bc2gAIpKZB7kQNV01SCmEVRPcGtnR7RIUOu
         CKIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSnivBMDpLnET39PDnQCnAJANcXIiYyrHI4Cqnv2UVMrb2SnNcM7ed9FrdJXz5moMpd286he0sWbzS72hH@vger.kernel.org
X-Gm-Message-State: AOJu0YxO0pWjNGxvgb01W/Fibth3ZU+KU3FmPq851ANdpFaxm2MA4q/s
	QO1vQLGusHS9j1ATyofdubrkgsnupU+PguC7NhzS8Vg7piLGxzHBnaT+75UF8dQ=
X-Gm-Gg: ASbGncupPwPBYJVWRyhyukeX6SDxY0pJAfDPy8P1rFduQgXcOGHrZ8BV8c5IBO2H2EJ
	S7WmUJTwlPQp1oe9WNRyLQco8mCC1ndoRfhfmHCVDchTFS1fUkVaDSSYkthbuUBdvNKUBwHWf3C
	PRJhzop4qGgfMKt/4+ptKWu45sb+zLDgM7Vbh5VuNkxVZTa053HyuLPsbIlpZe8Akr/OfmSWwIQ
	WV08H5+DKFxg5p6GjtywmsF+tQ+CfSKkmx6bm1sDy3NJZdfrZyF+2SybMOwPPkU
X-Google-Smtp-Source: AGHT+IFx724whJM/3tgOtZRukuS/DQOvI/WHlmOjoQuMlO70R1sWXtGolZHOH0q3MJfJtAKMP/bH+g==
X-Received: by 2002:a2e:a5cb:0:b0:300:27fd:a7cd with SMTP id 38308e7fff4ca-30254464080mr42374541fa.19.1734337648920;
        Mon, 16 Dec 2024 00:27:28 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30344045342sm8543371fa.33.2024.12.16.00.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 00:27:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 10:27:22 +0200
Subject: [PATCH 1/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8150
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-dpu-fix-catalog-v1-1-15bf0807dba1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9MObEe5KzGyCABZYczA3jsFGPjAHvUO1PrGscQg+Yd8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3r8k2yTndeVZTf/++P01X49twj3domE3+FdLPFdf7jMA
 mwT2w52MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAin/PZ/7vnCGkdk3tiWteX
 uPGqhuc0xeKKy9IesoUVn0Mm7CgzL8sq6z97evsLbSbJF4vy+pc//sjQ6nIn8SfLnLu8zZx7HqS
 o2P521re/VyWyaVf6Lneno+eihGMbky0amdPPvfRbdWrifa6p5ZdK8hLX3+5/bxZx8LPhYf+g/F
 WRzxp7p9p8ElTbfDLqale0x0yVrnK+H/EpfW3p1uecuM8EdDW47T11Z9dfmX+O3J/nhXen5uXZL
 2zf3beke9mnMtVQBV2rJsnH9yfpzP0y7arzzeyqO6/+2XZW77+bcJgtW59RIYW1KjAh4vbkaLt7
 FXFPjlyX3VXFevWQSOcPhW9/HI86/HT4W3T0KsvPUzHJAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks.

Fixes: 05ae91d960fd ("drm/msm/dpu: enable DSPP support on SM8[12]50")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 6ccfde82fecdb4e3612df161814b16f7af40ca5f..421afacb7248039abd9fb66bcb73b756ae0d640a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -164,6 +164,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
@@ -171,6 +172,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,

-- 
2.39.5


