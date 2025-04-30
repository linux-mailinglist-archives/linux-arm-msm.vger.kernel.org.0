Return-Path: <linux-arm-msm+bounces-56273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED9FAA4CA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 15:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD5031BA049F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 13:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1FD62638B4;
	Wed, 30 Apr 2025 13:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YgSGZk1g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6E6262815
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 13:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018084; cv=none; b=c+8ZnJihcJWtEKkZWIurp+fOa9KLcayjjiaf9OCfbiGv6c30bHSFHvsNFPwjp94PFyyc6k8uu7aqGYMFbSgh8aoE9z1GocMBPZHIn8RwPkwnW3tLHj8Pa8IqkhQqNKofRx1tRGlqJANve8pusP9vI//7qioz5wPr+TkqhKPfs9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018084; c=relaxed/simple;
	bh=nfV/7RmHoNigN+etRFO22PUSZ15tfZ13Ey5db/FH8m8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=klfSs8YPusSJFeKjReSQPS/gNuFFBeEhK7d4ud8nm3gn3+IuePQeuK33Ty6y+IU72b4+eFBWe3Vg9LqlU4Nx8ryveVfYwGHDS/9bxv+5K0HWlOrybvOkoCh3j5gv7PoGAXniYzt1zH5HGCNIAMOnuYBKJ2ac2heO/XYKrj/5DEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YgSGZk1g; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43e9ccaa1ebso8301395e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 06:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746018081; x=1746622881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hIYbRlauLJ+HBkfmmmxeYe7riwQD6vu+qiBT5eLd3s4=;
        b=YgSGZk1gvlrYvkjEXqUOEwIf4eOICM3AZT+3AZB8T4Wbq4aCfoOcBImDiBeOBerswk
         hJUJ4sd1LkKTJE8AVZfF1iuEISgDtikb7K3cJJbw5ZZovfc0XGs6fuya1cUHXrFPDOM7
         2mcdPJ7d+KgUdfxidub1Vy0XSkoj9p2FMo8x1yE4mABFL0sQYLTr7ZfjSd/eq5iOxeL2
         FvjgQ9FPebaYPuGgsSCbBmGc/5l00MPevNx0fCyBLi3dtAMlq8yQqZySdUB1kj+fLEH1
         501BQgBviTg4O/CSUgQcPZJPfcpDxs/2l4OVGK39g4OrgTL7BVpYb8v9ls2pbV5jw7UQ
         0Paw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018081; x=1746622881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIYbRlauLJ+HBkfmmmxeYe7riwQD6vu+qiBT5eLd3s4=;
        b=gWupFRcowXG6cM64z15/VX9rVMt2rjtZCsVfijPcKcFn6kwnn/vxttaVE/1v6pd7B8
         b5Apwut9cCN6sdUaW6jYJrIoZEcr3T38fJFGZZ7BTdge8xwWPyVDXr6Abx61/kHqmuWG
         h6SwgrzjMoR8KKlnz3p6JcZPhI2cDqOJ1EXPI4A0KOF1YD2n/Rp2LDTHi4LTJQiKI+iN
         nSs4b2O9CAog4qIhV/K+A4zZdLrOARP/8xzj7UqZUOGJe614bonVzVzPh1P2A2JMDy0V
         JGEjAzmkmaoWUMFQIm1gLDhXkeE4q02a4tRBq2IzOpJmw72sbhY2eQyj0lywEMKDB++T
         Rrmw==
X-Gm-Message-State: AOJu0Yw2o2x9WDiA9VG0IX8sxRi3GoxJwev5us2AhKS+AM0D/ul433dz
	AQAOesIlqI9+gKsyHAlrHfRd9CpfnYIzYhFJj8FqEBZOUkgJY0wzPY4Yj6vDVM0=
X-Gm-Gg: ASbGncveoXvzfZ+hKfSDvkuwFTIWabDgW7ySubZl4FIp0r3SAYJRJKstdTyZR5CWWTw
	9ko7fsU9cnp7keiYMZcJ/Xr11NsTsJmKR+S72at0Y+ocUw+ZyCqiRAWcYDwHlFb7rjrTxJlfo2h
	LMauITftTcr5a3LDy6NaJyTsSUt7h6MYAYQM2MXAgsPyGpppzYnlqLU/3ZnWBD+nTjF9dOw3mV9
	rkoA2M43NMYGbepJVLiCmQCKajaDyYr/PXxXBtPvfun9Px2l9KlapE8nwK1zKErZ5yIOUo/MgYO
	zuDcUmx2E2yQy6OWGd/wvAQT23rQCLCyhr9eBcFEfnUC61mK4W41alcVUEo=
X-Google-Smtp-Source: AGHT+IGy0iGND4CwDZaIUFykzdWsI+BN8WeV0wSy847evjGpU0JOHr+Ib1tzikoVHW3i7zcwk/UBUw==
X-Received: by 2002:a5d:64ee:0:b0:39f:6ca:9250 with SMTP id ffacd0b85a97d-3a09007e507mr674529f8f.12.1746018080066;
        Wed, 30 Apr 2025 06:01:20 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:01:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:36 +0200
Subject: [PATCH v5 06/24] clk: qcom: dispcc-sm8750: Fix setting rate byte
 and pixel clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-6-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1649;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nfV/7RmHoNigN+etRFO22PUSZ15tfZ13Ey5db/FH8m8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh75XYczpa1XRjEYY76w1vQNfkUN4i5qCoYTp
 HwwGkhur1iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIe+QAKCRDBN2bmhouD
 17sxD/kBPOjHuljMicN8MnivmvbeOMOG6jLOk89d/9dap4GTebCFuxFDorsrNL91hdES4O7aiby
 rT/Qxv6qCxnvvkM0FVnggnSTY5gNWYcxiVD1e1wn0y+3Z03Ng9saCC1GUhyhAKTAYVZf/fjBrnU
 XHanIHAgdXPXvVbxXFipCdZHtywQr+QEpoqdBTADtnFSlTogSRmq6yOG8o15VVm9LjR2zHiS9OF
 x/lWqKJFtvGyW3ZGP8Sf9dN8RUlMD27cTAk+7dJwIlWPOUGLElzppd05ShKS9MYOzpBOWPc16q4
 t6u1+Il04mXUL2US421holVpBfFTXQU+ESXesex90exg6lMsdULKxaEJ+FuV1bFuz929ELzXykz
 y1Ssqlvl6WFuSVrkZuMisxRlELabMiGxrxs2P7Q7tJZdYqr5wxtMOaXIksAyFlleZ4oRcLGooZx
 lSBTijG+fe8L5DJxiASGKKKoxa9OwyKDSnJbU//ucnKKOauzQ6mDw+B5DoAeIHHVYYYkvqqWTL7
 p0hmMDcQYYA5RzuXWjCLUomf+HiTzN6dpdNJ7h4cYiFlCTV8DGosQ1JXRnxNTN+DiWZVIvZyx0E
 Jh0QkVO+1KaEFiJels4h0qJKL7Lyn5k7zLp/t2JJTTlDsDiVOY7cJr52yZUrPlXKwwMhrargwS5
 tbbp/QQ3V8KjjkQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

On SM8750 the setting rate of pixel and byte clocks, while the parent
DSI PHY PLL, fails with:

  disp_cc_mdss_byte0_clk_src: rcg didn't update its configuration.

DSI PHY PLL has to be unprepared and its "PLL Power Down" bits in
CMN_CTRL_0 asserted.

Mark these clocks with CLK_OPS_PARENT_ENABLE to ensure the parent is
enabled during rate changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Patch is independent and can go via separate tree. Including here for
complete picture of clock debugging issues.

Changes in v5:
1. New patch
---
 drivers/clk/qcom/dispcc-sm8750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
index 877b40d50e6ff5501df16edcffb6cf3322c65977..d86f3def6dd06b6f6f7a25018a856dcc86fc48eb 100644
--- a/drivers/clk/qcom/dispcc-sm8750.c
+++ b/drivers/clk/qcom/dispcc-sm8750.c
@@ -393,7 +393,7 @@ static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
 		.name = "disp_cc_mdss_byte0_clk_src",
 		.parent_data = disp_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_byte2_ops,
 	},
 };
@@ -712,7 +712,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
 		.name = "disp_cc_mdss_pclk0_clk_src",
 		.parent_data = disp_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_pixel_ops,
 	},
 };

-- 
2.45.2


