Return-Path: <linux-arm-msm+bounces-46504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7926A21CC1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 12:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98E1118868FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 11:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0621C1D8E10;
	Wed, 29 Jan 2025 11:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nPHSjNHl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103AC1D90B1
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 11:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738151710; cv=none; b=ses8H+H9seyF9VSbKV0afe51aNjep6PuXHu+WcCQpPkOuNKhxW5gFuYk0gAq91rISv9dZMKRxr/uwT0+Dv4gRXTVkVexMdc6I3LOeoxeAghfSiMnp+2sWV6+cDOo1+vhDIIEQ6kKDkqtIpDs39Y9eeJDYeHoRSdh9KFVbKfD/tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738151710; c=relaxed/simple;
	bh=xVZ7mZHQdQEjUG890k/QM9ETHklqFmRmqwx3bqz7wfo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KISS/Z2iSwrwruP3lTJTEI8e1kD+tt330NE6srvXJBDXo/IAlVGuHSGY1zP3jGwe2Q17JFzM7lxnpa1Y8pHyOw+RFCNFotvB78m/WmgSrrbIGWe0+L9Ris8NS10NbdXWjSpFVOkz7KkVyhIbnE+vlrws60LEtTP5OUnoMTESw1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nPHSjNHl; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5dbe706f94fso1533880a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 03:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738151707; x=1738756507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZoxYub/fGhny5IvUZRt39jPFGsJ2Xpyd6lgEIHUfGX0=;
        b=nPHSjNHlHsl3dDt4F7w+Pk4YLfDLa8SwzuHJtL7WeT/M9ZbtpuSzL/WpN4JzlwWYzk
         G+3D5hH8KFzRlaws8KDJD9syBfVmR6ePmrVLOQC3DqSVCLaxq1aXiWFxXeUeTpiXQbJC
         dGUKiE9DEV2M7lfn0JqArkoLbHx5n8esnCdVFFMRSaVMOg+87rdra8bkCTXABooZ0Z7Y
         BV8neYQJTCl8mnwAyHxRLpmP8iU8d84AySpWlJg4uIABMKl7UrvRpndVdmHUG2lTSuS3
         pUE/br9wRRo4oPYPhAdppoHIKi54Wf63uaPT0G7+dIOPMGXSKCW20zt+ihmP/nEMVaEK
         6F+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738151707; x=1738756507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZoxYub/fGhny5IvUZRt39jPFGsJ2Xpyd6lgEIHUfGX0=;
        b=enXkdUmdT4kG4Sueyj4XUo03Y37+f+kosAhbS6ONkUpSTb5i6+dZH9tmTNU4oX9uLA
         1NTMCaDHLXNDNHmtUXeB6MI81sZL2YNz2yAXQT5ylC8OA/gtmRy3TdnEXv12LHnUv4kC
         ZOWZ5hfiMuYwiePF25lXvWQ1YJ/cljoDQIovlDq2P0vzc0uajo00glEe7WJCub4s/B6i
         e1CPW3/jYtT3mxuxzlTcycQ2mvWOnbelEihdeqpzxQhIe+zWbhQkj9Ce7Iaw/tpqVojl
         Hj7Jxgk3MZhmvcjnjMiqdeZ+lJwBwGyjNtaIFTGjlpFRTsl5uNsSRIKJtVFzyrNfYbT9
         0j8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZyMQB8O6Ztjrnv7OEVJq5jgYpssbRYgj4Lp9skPAleoiitJQny4UwXLfg9N3/cVTMd2ZNKp6+gQk/kv6T@vger.kernel.org
X-Gm-Message-State: AOJu0YzW40ezWNyYlEZkbvezyTm9h3psRE2Q5peGaMxPbpp58wHiQ/A2
	18yl6XIY4YV2h8Zes6z1lOXUOOfuHQp0SNCPJB7n+X067DxRq3EB72d9p5JtjO0=
X-Gm-Gg: ASbGncvntc/oggueZejXENrf5BMdqUcGnuJyKne3LNG9d2NClv3tywjuA7Pf+X8hB2l
	r3JYrfuGwXUM1AEZujoF1pUjsNZueKjMYauxh2KQ2wDuDOvW4T2eSJEVoPCYQ4zELs5rBuzVnvf
	fyqF94bSTCP4X+D0ts111cZqeze55dOg5r4ykhb8GQoLlE4K7QnNi7Fliia0tFg8TVwoXnEtLvR
	SvVG35+WY3BR3qLvIFhbPckKqvQ0rdigODym9Vw/0BOnpgIRjKaJ1VJHr6mdYP1ZtOsL9bzYS0w
	ZNRggKyRHP6j3j7gx2NZT7DfZc3w
X-Google-Smtp-Source: AGHT+IFjZKfgMNqMS3717CUskta9AgMI7HC+LrfGMh5w6tDILVjhok1zF479wv7ce8XTERnEEpq/Tg==
X-Received: by 2002:a17:906:b2d6:b0:ab6:db64:b040 with SMTP id a640c23a62f3a-ab6db64b2d7mr7832066b.12.1738151707153;
        Wed, 29 Jan 2025 03:55:07 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760ab26asm949981866b.111.2025.01.29.03.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 03:55:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RFC] drm/msm/dsi/phy: Program clock inverters in correct register
Date: Wed, 29 Jan 2025 12:55:04 +0100
Message-ID: <20250129115504.40080-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since SM8250 all downstream sources program clock inverters in
PLL_CLOCK_INVERTERS_1 register and leave the PLL_CLOCK_INVERTERS as
reset value (0x0).  The most recent Hardware Programming Guide for 3 nm,
4 nm, 5 nm and 7 nm PHYs also mention PLL_CLOCK_INVERTERS_1.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not tested except my work-in-progress oon SM8750. Not sure what is the
impact, so also no Fixes tag.
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 7f6fb2a840d2..6646f8dbe457 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -326,7 +326,7 @@ static void dsi_pll_commit(struct dsi_pll_7nm *pll, struct dsi_pll_config *confi
 	writel(pll->phy->cphy_mode ? 0x00 : 0x10,
 	       base + REG_DSI_7nm_PHY_PLL_CMODE_1);
 	writel(config->pll_clock_inverters,
-	       base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS);
+	       base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS_1);
 }
 
 static int dsi_pll_7nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
-- 
2.43.0


