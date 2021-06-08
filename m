Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6A03A04CC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 21:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235232AbhFHT6i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 15:58:38 -0400
Received: from mail-pf1-f170.google.com ([209.85.210.170]:38631 "EHLO
        mail-pf1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235609AbhFHT63 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 15:58:29 -0400
Received: by mail-pf1-f170.google.com with SMTP id z26so16546872pfj.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 12:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hpBo4F5IMaB8LprhMFQpECB/Tsipa5HxZ3V5D/8s1RY=;
        b=SM/rbyKXA5uvkVWdxAE6Uw8+XB1YuYpQA87f7imaB/Pa30PTaHSpAPkKqTllciNV22
         PwKRJcjD5sTSzuv31Rv7ssQrJ98YemAWUPDAmY3iA/fsef2ro2Sy+eabRHPGBNSTsV0q
         MSbLDaa0NamNGO9LkS/iku2vxVXiy+9JwGU7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hpBo4F5IMaB8LprhMFQpECB/Tsipa5HxZ3V5D/8s1RY=;
        b=q2yxTVIx5fgSzQ1kk3yfrM5nXBkNQiuuoUh8Zl4ThPsOO82qV4aM8bQwJmb6PHwm7J
         AGB/t7yw93LGkK4jFGPg8baehhl/caoBkOW6zXV8kxOHGPV2x0RTq3yKIWtWie3frSiH
         mL83/BVvw1xsceWFLAccxsoTihy4MhWChzVBY0p/0XnoLSv+tx6JRvbo8dZLzSHjcMcm
         NwQG6KeqKRZZR20c9awLElS5PSnI17s61D3MAVmjsyBQH7xroQCpfYx8Xq2SyJfkxFz1
         53EIbJzHA5GFOGcTM7wmXn+RRs2JxF00afJDfscWanVaG8/n42czoVjRjZ2p+hOt/0so
         hhnQ==
X-Gm-Message-State: AOAM530PgHcMX7ZhJ1PFMYM1qrTdpOOAkvjNTgSrM6c68M0BGE9Tvvlk
        qQvkzS5RFOYkbq7qoC3GFQ4d1A==
X-Google-Smtp-Source: ABdhPJyyigapQWlfSOy3grhL9AsA1fpTEuIDZBrnOdvzN/ROnn3aHq7p/NPByDRRtFPjSjbBqPezUA==
X-Received: by 2002:a63:f248:: with SMTP id d8mr24212648pgk.219.1623182120335;
        Tue, 08 Jun 2021 12:55:20 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:a3bd:e3bf:4835:f2fc])
        by smtp.gmail.com with ESMTPSA id u125sm2590132pfu.95.2021.06.08.12.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 12:55:19 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH] drm/msm/dsi: Stash away calculated vco frequency on recalc
Date:   Tue,  8 Jun 2021 12:55:19 -0700
Message-Id: <20210608195519.125561-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A problem was reported on CoachZ devices where the display wouldn't come
up, or it would be distorted. It turns out that the PLL code here wasn't
getting called once dsi_pll_10nm_vco_recalc_rate() started returning the
same exact frequency, down to the Hz, that the bootloader was setting
instead of 0 when the clk was registered with the clk framework.

After commit 001d8dc33875 ("drm/msm/dsi: remove temp data from global
pll structure") we use a hardcoded value for the parent clk frequency,
i.e.  VCO_REF_CLK_RATE, and we also hardcode the value for FRAC_BITS,
instead of getting it from the config structure. This combination of
changes to the recalc function allows us to properly calculate the
frequency of the PLL regardless of whether or not the PLL has been
clk_prepare()d or clk_set_rate()d. That's a good improvement.

Unfortunately, this means that now we won't call down into the PLL clk
driver when we call clk_set_rate() because the frequency calculated in
the framework matches the frequency that is set in hardware. If the rate
is the same as what we want it should be OK to not call the set_rate PLL
op. The real problem is that the prepare op in this driver uses a
private struct member to stash away the vco frequency so that it can
call the set_rate op directly during prepare. Once the set_rate op is
never called because recalc_rate told us the rate is the same, we don't
set this private struct member before the prepare op runs, so we try to
call the set_rate function directly with a frequency of 0. This
effectively kills the PLL and configures it for a rate that won't work.
Calling set_rate from prepare is really quite bad and will confuse any
downstream clks about what the rate actually is of their parent. Fixing
that will be a rather large change though so we leave that to later.

For now, let's stash away the rate we calculate during recalc so that
the prepare op knows what frequency to set, instead of 0. This way
things keep working and the display can enable the PLL properly. In the
future, we should remove that code from the prepare op so that it
doesn't even try to call the set rate function.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Fixes: 001d8dc33875 ("drm/msm/dsi: remove temp data from global pll structure")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

I didn't update the 14nm file as the caching logic looks different. But
between the 7nm and 10nm files it looks practically the same.

 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 34bc93548fcf..657778889d35 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -432,6 +432,7 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
 	pll_freq += div_u64(tmp64, multiplier);
 
 	vco_rate = pll_freq;
+	pll_10nm->vco_current_rate = vco_rate;
 
 	DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",
 	    pll_10nm->phy->id, (unsigned long)vco_rate, dec, frac);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index e76ce40a12ab..6f96fbac8282 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -460,6 +460,7 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 	pll_freq += div_u64(tmp64, multiplier);
 
 	vco_rate = pll_freq;
+	pll_7nm->vco_current_rate = vco_rate;
 
 	DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",
 	    pll_7nm->phy->id, (unsigned long)vco_rate, dec, frac);

base-commit: 8124c8a6b35386f73523d27eacb71b5364a68c4c
-- 
https://chromeos.dev

