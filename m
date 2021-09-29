Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50C0141CB4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Sep 2021 19:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344278AbhI2Rx1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Sep 2021 13:53:27 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:41128
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243396AbhI2Rx0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Sep 2021 13:53:26 -0400
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 55736402F6
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 17:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632937904;
        bh=sGmR+urAbR+sGbkj5JCyniQzZ7uplCBGMFqJx16vAAg=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=G8DW55cwYit1A19tvXvqD/7hOAixox5Qn26Rddl7NNb78TmKpj+bTBCKjhYGckqzG
         d5sVYFzL6Mby96z1zbz9Cz2zQj53pp5gb08EUVTxHbqVWPbocG4m9p2P5gpSLO7xiI
         aKQeNdYEo9AjtBVv1AvrU7V16mD9zaQDL19sWNLvzKkXqIk6jXFxybveJ9gYIg7kn8
         RB3bCa5LuntvErS53LB4xHdiqw0OYO5KRl02saRqEM1SwSMiEidzBqW1bgGKbEtbzW
         Ge8KMusT4eM3amk2u/xl9rnmZ6r5y2Xz3yKD13QQG9+KoVOAJXchSu5SnTLbMvu3LW
         zqTz0RWsJ23UA==
Received: by mail-pl1-f200.google.com with SMTP id ba4-20020a170902720400b0013a432f7556so1675283plb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 10:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sGmR+urAbR+sGbkj5JCyniQzZ7uplCBGMFqJx16vAAg=;
        b=BU2pBFfrU4FPAzYsMeZUfzGgyhBiGG0VoAJQR5Fg+CO8pAgMDbB5XmCsaXzpawJYpg
         8HI8Oe1/clHItdXhi7Tkg5poSdwOrKCKMx61UZgjc+loA4+HqtqY1gby8howjZ1UvoQB
         tSeAXc8pX150FpqzBpcc6YwzAcnRF1KWeSiBCZj5uOIP02jemEjCoaNah56woWu2AXdE
         54mAeX7QHVRAVB1Vk0jd/ShLiS8j4dNJli5HwW7A+nqAx948o5CpnNgLPV8OgzndsXFT
         Pv5hUwXGnzlZ7Gqlad21lF/qJwQKHSPk4Ft6eBa+/ByxY9TxHu6pRMxlyvFqGU3nY99y
         MCZA==
X-Gm-Message-State: AOAM532Q4zWrDZY2Aga2PAPC/kW2ZQxWrUqHCEzEwcV7PBX0uclW4PF6
        K/Fc+yXDHpGsR/2ek+l3MSFfKq2TcS4LZDIKkPDb3t4ozqNt/3TY5OnpLWVqQfn5WgHxUdTWTxn
        miuZnLdXNObYUqqudh2SGz4TzrMyptpzWvo1/BW2Iexc=
X-Received: by 2002:a17:902:bb81:b0:12d:a7ec:3d85 with SMTP id m1-20020a170902bb8100b0012da7ec3d85mr855667pls.17.1632937902044;
        Wed, 29 Sep 2021 10:51:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjjac0TBBohoJcJhQhSRim7mjmRR5K1fIbkEhcN8vg/rftFjZi6B+vE8JDhtXmh2PCd3d37w==
X-Received: by 2002:a17:902:bb81:b0:12d:a7ec:3d85 with SMTP id m1-20020a170902bb8100b0012da7ec3d85mr855648pls.17.1632937901819;
        Wed, 29 Sep 2021 10:51:41 -0700 (PDT)
Received: from localhost.localdomain ([69.163.84.166])
        by smtp.gmail.com with ESMTPSA id u24sm431805pfm.85.2021.09.29.10.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 10:51:41 -0700 (PDT)
From:   Tim Gardner <tim.gardner@canonical.com>
To:     dri-devel@lists.freedesktop.org
Cc:     tim.gardner@canonical.com, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dsi: prevent unintentional integer overflow in dsi_pll_28nm_clk_recalc_rate()
Date:   Wed, 29 Sep 2021 11:51:34 -0600
Message-Id: <20210929175134.15808-1-tim.gardner@canonical.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Coverity warns of an unintentional integer overflow

CID 120715 (#1 of 1): Unintentional integer overflow (OVERFLOW_BEFORE_WIDEN)
overflow_before_widen: Potentially overflowing expression ref_clk * sdm_byp_div
  with type unsigned int (32 bits, unsigned) is evaluated using 32-bit arithmetic,
  and then used in a context that expects an expression of type unsigned long
  (64 bits, unsigned).
To avoid overflow, cast either ref_clk or sdm_byp_div to type unsigned long.
263                vco_rate = ref_clk * sdm_byp_div;

Fix this and another possible overflow by casting ref_clk to unsigned long.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 2da673a2add6..cfe4b30eb96d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -260,7 +260,7 @@ static unsigned long dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
 		sdm_byp_div = FIELD(
 				dsi_phy_read(base + REG_DSI_28nm_PHY_PLL_SDM_CFG0),
 				DSI_28nm_PHY_PLL_SDM_CFG0_BYP_DIV) + 1;
-		vco_rate = ref_clk * sdm_byp_div;
+		vco_rate = (unsigned long)ref_clk * sdm_byp_div;
 	} else {
 		/* sdm mode */
 		sdm_dc_off = FIELD(
@@ -274,7 +274,7 @@ static unsigned long dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
 		sdm_freq_seed = (sdm3 << 8) | sdm2;
 		DBG("sdm_freq_seed = %d", sdm_freq_seed);
 
-		vco_rate = (ref_clk * (sdm_dc_off + 1)) +
+		vco_rate = ((unsigned long)ref_clk * (sdm_dc_off + 1)) +
 			mult_frac(ref_clk, sdm_freq_seed, BIT(16));
 		DBG("vco rate = %lu", vco_rate);
 	}
-- 
2.33.0

