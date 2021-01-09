Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A31D62F003A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 14:53:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbhAINwM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Jan 2021 08:52:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726195AbhAINwL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Jan 2021 08:52:11 -0500
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA22C06179F;
        Sat,  9 Jan 2021 05:51:15 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 533481F557;
        Sat,  9 Jan 2021 14:51:14 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
        airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 1/5] drm/msm/dsi_pll_10nm: Fix dividing the same numbers twice
Date:   Sat,  9 Jan 2021 14:51:08 +0100
Message-Id: <20210109135112.147759-2-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109135112.147759-1-angelogioacchino.delregno@somainline.org>
References: <20210109135112.147759-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In function dsi_pll_calc_dec_frac we are calculating the decimal
div start parameter by dividing the decimal multiple by the
fractional multiplier: the remainder of that operation is stored
to then get programmed to the fractional divider registers of
the PLL.

It's useless to call div_u64_rem to get the remainder and *then*
call div_u64 to get the division result, as the first is already
giving that result: let's fix it by just caring about the result
of div_u64_rem.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
index 6ac04fc303f5..2c1fcf092ab8 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
@@ -172,9 +172,7 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_10nm *pll)
 
 	multiplier = 1 << config->frac_bits;
 	dec_multiple = div_u64(pll_freq * multiplier, divider);
-	div_u64_rem(dec_multiple, multiplier, &frac);
-
-	dec = div_u64(dec_multiple, multiplier);
+	dec = div_u64_rem(dec_multiple, multiplier, &frac);
 
 	if (pll_freq <= 1900000000UL)
 		regs->pll_prop_gain_rate = 8;
-- 
2.29.2

