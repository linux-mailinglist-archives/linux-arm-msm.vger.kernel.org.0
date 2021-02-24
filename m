Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16D6A32474A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 00:02:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236172AbhBXXCe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 18:02:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236176AbhBXXC0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 18:02:26 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7637C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 15:01:45 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id q23so4342612lji.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 15:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JWazTQ/6PwXeBKQ5AHtcslmYVVFr0X7rQ3bwRNkLBQ4=;
        b=m8MeP9RgTHfK0oJ8o9ojw9reVRo40AHAx9ZzYGHPC0gEmpmWgPEPO/O9JeWslY82zI
         sKiqDko9RY9cOIrweUbRxWZVjFq50Ge+/SFckP5LQvfuysIT68G/bKXgWUXuAxhkdmg4
         5x4IDAEum+tvpyIKyykBuWR+6hlcjIwUPv4wlgLii8wtavrTHZFb+/TY0GhrHJJqAoEJ
         OEL319aFwTMvsXGYVBUwNfRRHdUvkK6301N5dp8JHDYMqd/nZqINh0YKW2W/y2VmigEL
         eovRDofitUKj42GNEW9iFi1lrQP+herSPzNo7LRa182aKKwF8P7UWzQBfCLuNtGmWq7f
         ZGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JWazTQ/6PwXeBKQ5AHtcslmYVVFr0X7rQ3bwRNkLBQ4=;
        b=dubxH8NNUYPzamYj7zFuONalXMfeK4tAErz/Pctc4eak60a+5+HbpS+fmSOTzOoRHg
         NBXv/VOdd5cYisM8j44pK6Bf5Dk4M5zzypjVEYGID77BO0KgVL1T+eavxv1UxGaVMFT5
         SAIPhjwt36xkBoeNRrMjCvAVCwRDXmSY4OrpFdoCqi37t6YLWRRJ15qnUecGBmRaS3q8
         jSzAtw1MkAUl5Kxora4QoBPEyIgavXiy2AAq1L1T8koHSGiMOcPd8rI41SxGnpsmN+Bp
         GYzDMBaJs5/dMYbQyquB1ho6Vli6auuqKIdm2LVHYCTzxKea1EijhC1uBFG/WE3v1Kz4
         M55Q==
X-Gm-Message-State: AOAM530MfwKjQnLPcq9RvEctAi5ZPKERSA6NLBeGweAvJEgLOjTsg8dB
        21Dr+ohyGOT7BuefRlbppASl3g==
X-Google-Smtp-Source: ABdhPJxzaH9J5CMg5MHT2YGXigBWhsYbLIVpW4igifMX1z/lnFHGn9sQCmobgSKen59v6zddfzhquQ==
X-Received: by 2002:a2e:8849:: with SMTP id z9mr50547ljj.478.1614207704266;
        Wed, 24 Feb 2021 15:01:44 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a1sm757790ljm.73.2021.02.24.15.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 15:01:43 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dsi_pll_7nm: Solve TODO for multiplier frac_bits assignment
Date:   Thu, 25 Feb 2021 02:01:43 +0300
Message-Id: <20210224230143.1216118-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The number of fractional registers bits is known and already set in
the frac_bits variable of the dsi_pll_config struct here in 7nm:
remove the TODO by simply using that variable. This is a copy of
196145eb1af1 ("drm/msm/dsi_pll_10nm: Solve TODO for multiplier frac_bits
assignment").

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
index c1f6708367ae..0458eda15114 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
@@ -509,6 +509,7 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 {
 	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
+	struct dsi_pll_config *config = &pll_7nm->pll_configuration;
 	void __iomem *base = pll_7nm->mmio;
 	u64 ref_clk = pll_7nm->vco_ref_clk_rate;
 	u64 vco_rate = 0x0;
@@ -529,9 +530,8 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 	/*
 	 * TODO:
 	 *	1. Assumes prescaler is disabled
-	 *	2. Multiplier is 2^18. it should be 2^(num_of_frac_bits)
 	 */
-	multiplier = 1 << 18;
+	multiplier = 1 << config->frac_bits;
 	pll_freq = dec * (ref_clk * 2);
 	tmp64 = (ref_clk * 2 * frac);
 	pll_freq += div_u64(tmp64, multiplier);
-- 
2.30.0

