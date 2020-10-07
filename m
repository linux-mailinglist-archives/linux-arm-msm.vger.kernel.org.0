Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 078DF285521
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Oct 2020 02:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgJGAKN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Oct 2020 20:10:13 -0400
Received: from a27-61.smtp-out.us-west-2.amazonses.com ([54.240.27.61]:40760
        "EHLO a27-61.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725925AbgJGAKN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Oct 2020 20:10:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=2nz3jy4edhd5smbjctxaus57ph3tmkzv; d=squareup.com; t=1602029412;
        h=From:To:Cc:Subject:Date:Message-Id:Reply-To;
        bh=muKSLnvOgIDXZ5YdsvIDagaTt5Oh30c5xCs5kUab1yk=;
        b=IH1GMGASAWCWWpWUsmP2uMEmfwkH+ymrtKJMlPnEhZL8a/ONiiMAx4so8jc8XEPY
        ckrDwpj9VvSONR2MUfC0NJQ7VRuRqxd7lwX9VAqbkJjQRb0tTvAbDtBDS69fvRAg1S+
        jNf5Kl1xrKWMkCMVopp0tN/Bzo213dTLeXlf/L6c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1602029412;
        h=From:To:Cc:Subject:Date:Message-Id:Reply-To:Feedback-ID;
        bh=muKSLnvOgIDXZ5YdsvIDagaTt5Oh30c5xCs5kUab1yk=;
        b=iwVoXV2+EJVtY5/Z81dvaXDwmhB0ZfX1GhpwYDmj63SVhP3f4elF27iz4CG/XKXy
        s8pN/Fhi+vljQTLLu1i2Fl0pZL3ce5qo7i3kqTKyWcTDGUNMplg3q0vy7XAyrz/nmza
        /J60oSJnKk0ULImbMtdyyQLO5hjquiuv9tyoVdyU=
From:   benl-kernelpatches@squareup.com
To:     robdclark@gmail.com, sean@poorly.run
Cc:     Benjamin Li <benl@squareup.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        zhengbin <zhengbin13@huawei.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dsi: save PLL registers across first PHY reset
Date:   Wed, 7 Oct 2020 00:10:12 +0000
Message-ID: <010101750064e17e-3db0087e-fc37-494d-aac9-2c2b9b0a7c5b-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.17.1
Reply-To: benl@squareup.com
X-SES-Outgoing: 2020.10.07-54.240.27.61
Feedback-ID: 1.us-west-2.z+Qxlzaf/1x39VmnWQZn7Gs4WPNjZe3NO2QR/Gz0OyM=:AmazonSES
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Benjamin Li <benl@squareup.com>

Take advantage of previously-added support for persisting PLL
registers across DSI PHY disable/enable cycles (see 328e1a6
'drm/msm/dsi: Save/Restore PLL status across PHY reset') to
support persisting across the very first DSI PHY enable at
boot.

The bootloader may have left the PLL registers in a non-default
state. For example, for dsi_pll_28nm.c on 8x16/8x39, the byte
clock mux's power-on reset configuration is to bypass DIV1, but
depending on bandwidth requirements[1] the bootloader may have
set the DIV1 path.

When the byte clock mux is registered with the generic clock
framework at probe time, the framework reads & caches the value
of the mux bit field (the initial clock parent). After PHY enable,
when clk_set_rate is called on the byte clock, the framework
assumes there is no need to reparent, and doesn't re-write the
mux bit field. But PHY enable resets PLL registers, so the mux
bit field actually silently reverted to the DIV1 bypass path.
This causes the byte clock to be off by a factor of e.g. 2 for
our tested WXGA panel.

The above issue manifests as the display not working and a
constant stream of FIFO/LP0 contention errors.

[1] The specific requirement for triggering the DIV1 path (and
thus this issue) on 28nm is a panel with pixel clock <116.7MHz
(one-third the minimum VCO setting). FHD/1080p (~145MHz) is fine,
WXGA/1280x800 (~75MHz) is not.

Signed-off-by: Benjamin Li <benl@squareup.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 009f5b843dd1..139b4a5aaf86 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -621,6 +621,22 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 		phy->pll = NULL;
 	}
 
+	/*
+	 * As explained in msm_dsi_phy_enable, resetting the DSI PHY (as done
+	 * in dsi_mgr_phy_enable) silently changes its PLL registers to power-on
+	 * defaults, but the generic clock framework manages and caches several
+	 * of the PLL registers. It initializes these caches at registration
+	 * time via register read.
+	 *
+	 * As a result, we need to save DSI PLL registers once at probe in order
+	 * for the first call to msm_dsi_phy_enable to successfully bring PLL
+	 * registers back in line with what the generic clock framework expects.
+	 *
+	 * Subsequent PLL restores during msm_dsi_phy_enable will always be
+	 * paired with PLL saves in msm_dsi_phy_disable.
+	 */
+	msm_dsi_pll_save_state(phy->pll);
+
 	dsi_phy_disable_resource(phy);
 
 	platform_set_drvdata(pdev, phy);
-- 
2.17.1

