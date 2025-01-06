Return-Path: <linux-arm-msm+bounces-43977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0A2A02118
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 09:49:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C72A1638B0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 08:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070501D934D;
	Mon,  6 Jan 2025 08:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mWSoCwE0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4831D90B3
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 08:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736153362; cv=none; b=SC9qZR3Mw8obzprGPzwxcI7wYdI5TvIjXqb8BKKHdXRqQzNJ7T4ONnnxEAIqy5UqwndupB/YraFnXL8ebBj09uxPFIDb/r1W67Mjf4MJSTEshXbZlzCvGWG5+0NAkL8TC76faqkqKX8hNz2/UP8NsTmhsANRNmIc0N2HCga75CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736153362; c=relaxed/simple;
	bh=nandoTBlk2Y45lzh0OGLLD7YfL+lOntjDjuGTghJ18A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fM5xtEZbg85MmSTsCT4jvdL+Qp8cdi9hhnYJZGNhvcDS8xkhfKUt32E9JxKeMSL+pH7qtsQtTLxpLkymV/+OIGQ63WSFOdzXp8poqLGZQ91qP9VT2J2HiJvq2UgKPWn4GEen3hKYuzcmFGdPaU9PG3Lj6jM3fy8wE8kOMrc+r2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mWSoCwE0; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa6b7f3c6edso169333066b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 00:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736153359; x=1736758159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1OTbFFc/LXvyixbtCvH1lSFOmelihjhQMXdOHvfDhy0=;
        b=mWSoCwE07E+avbjXJVRDdPyzp6qpE2vbDr0TXi/viyRc5VFIXvzCkoVnedopray3Qd
         ovGlJJjFJfQgwSvb6tZ6gJwuBsVFb3qWMCUmR4U16p6v1+CQs0Ki4FtnT50nX4SHMtQU
         CITqi6UBNe40utTtwK1gUEv1qgeD0QlK+XV16t8YAmp3LzLXD83igFoqgFqZcPvzj1+d
         etHzrPpzBmMiDpqU8vX/H42mvZFFzdyFbOyblbaFSMjHJCqTXCBBZfxAHYrQL9M+3AAj
         FZFGTEhr0GT5Mjat2U4t+P+JtxJ/5VpQG1c2Z/NO1Ggdq6hlr5hTfWyxRs1SzTMrkEt9
         yDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736153359; x=1736758159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1OTbFFc/LXvyixbtCvH1lSFOmelihjhQMXdOHvfDhy0=;
        b=dKhf6E53VrK/1zANP+8bWel+2BKo4MdjyiSOYZi7qEyLX0Xj9ykk5IXO9LkzVuU9dA
         kXv/wd2q4eCr9E/Seii+7l0caHX660l0MtHKU4Gl8+u+CMswtM1Xhu+l4noHcaS/eyZW
         56YBCx3fSzRahPSxGEHl0Im3Y2krMrmjR8uERkoys3+55htMpmNag85bG6VugMbvhqU6
         QgpFA32M3KW7+Rtdp0RfuXqVibwh3ZN0Q6jRjUGweSJ5+Ye1TtYspHVEdnwQH4yax4dz
         IgvI/qSUnpyYtS14pQGQ6JkXsc8yMQgyurGnrq4EONa7RJ3JhdfdWqVfNWTDHDyz/CKP
         iVpw==
X-Gm-Message-State: AOJu0Yzv4M3xvFO7W/kX+2pWJTiWyLAdA5QeNWoNrxj7oOvHi9D1JvXR
	c740kuvSIEr9z/2oTGLhFKnMTbLsZklw02xyCwGbZYNN2y/yinXoLVJ6ZAxAwN0=
X-Gm-Gg: ASbGncuP/fBirYhT4LWZLbVHgVXYDKRtoD3lU9f0nXmAT1fZ71OMcUhSHI2i3fZ3H/j
	Pq9ZC0E1lrubbieyJMf0wp3IKYMUcRuztXtd/N2ujwqVRCFlgFWH71Yy+lj9XoFsMWec6JpzenJ
	rbxJm2FSY9brVaAqPy8gdzxLRuQ7gbfgNk2i5h+Yy+mRVKZjwwCyUip5HJZ/foi2xT6I9wdC0cR
	/IXR4aII/eGn+kbispfblU+k3puFkmz7JR56IMPTmZQoM/cFT73xhymGcBE4RDbi/lLHegG
X-Google-Smtp-Source: AGHT+IFIUVGQua1Xw3vRS6huyRc0JaTlrVfc5UE7MBVZ/n19b0POGxtnLkoCKWi3gDrpntvSQ/EKdw==
X-Received: by 2002:a17:907:d15:b0:a9a:2a56:b54 with SMTP id a640c23a62f3a-aac2b0a5754mr2065982266b.5.1736153359387;
        Mon, 06 Jan 2025 00:49:19 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f1d2sm2222112466b.11.2025.01.06.00.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 00:49:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 06 Jan 2025 09:49:07 +0100
Subject: [PATCH 4/4] drm/msm/dsi: Drop unnecessary -ENOMEM message
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-drm-msm-cleanups-v1-4-271ff1c00795@linaro.org>
References: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
In-Reply-To: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1024;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nandoTBlk2Y45lzh0OGLLD7YfL+lOntjDjuGTghJ18A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBne5kHtIEraO4MOoEqSxz6JNQXpGpHLSrNWQfEX
 iZDY+GUnhCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3uZBwAKCRDBN2bmhouD
 1+pED/0THA/VJeshxpTNG9Q9JUM5ne/rmPhAfuMC36rcRts0nb3XRM2iJl8ZrqdhFYwziOdXoS3
 GRJTa3s1Eeeqfx1JNNOnuMW9YsZfTCUgkhFzjIhFKjMbkcAEZ0Y6zCyzL7Ey7ew/f6aWWrBxRS4
 pPbOMMtTaJNNfNyBhKOXy+hsriEseN/h6V+T4YCHsyxNnzy0HoIo3rKXnVLXzxSBFdxnG0uyDe5
 yXGCG0QKaz11TvN1/7TQlHPBoBdSxcJQizikrKJroAvaxgBYELQ3x4nGwfUPMx/twJHbFMKOvE4
 kMuxbk/t7dG/vWsm018wcK55Ae4+qlTx2IpL4zeP8YH/rdw2PBcaW2B0XsURYguU/i2EP+KdKc+
 pcUT/cN2UgCuRcGQsK3E5h+X2SitLjIZ0MRsJ3my29iq+WqiPc6DHUsMcaoO+PAqHwS4FXGWeKg
 3v+8gyd7mq6FTii7t73DOWxncRQxn6IzEcNoTs96DIw6iRwMcC5VpS+Ot8nTlUDQOLGrqaaHED2
 K5BchCderk1lOcNzZnjMDIedb30NjdC54RfgLsO7vHRypJfOx0RgPvtBrGkR63epFmoYTCYPkID
 mN6AlEF28DCjSSJbuWWOxwRS+V88wvWAcqx2k72/pPjLLIRyiDYSMYSd0pShYQ8/4TcgQwS11D0
 mNDGUnoEj02fbUQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Kernel core already prints detailed report about memory allocation
failures, so drivers should not have their own error messages.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index a3c344b75fc2e90923cd6d26df87b7c05208f736..ab5d6fd53972f62307b0c5b801cca8b2394c5556 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1910,10 +1910,8 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 		return dev_err_probe(&pdev->dev, ret, "%s: unable to initialize dsi clks\n", __func__);
 
 	msm_host->rx_buf = devm_kzalloc(&pdev->dev, SZ_4K, GFP_KERNEL);
-	if (!msm_host->rx_buf) {
-		pr_err("%s: alloc rx temp buf failed\n", __func__);
+	if (!msm_host->rx_buf)
 		return -ENOMEM;
-	}
 
 	ret = devm_pm_opp_set_clkname(&pdev->dev, "byte");
 	if (ret)

-- 
2.43.0


