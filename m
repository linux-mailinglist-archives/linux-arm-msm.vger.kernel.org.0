Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD64825AF56
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 17:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728180AbgIBPge (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 11:36:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:41506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726979AbgIBPEK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 11:04:10 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8107C2137B;
        Wed,  2 Sep 2020 15:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599059050;
        bh=CvZl/N6bMSMI88HBcyd5T1/2bkJNYPalt1VI58vbW94=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BSlvK2dLedkxybPvtTPtPYsetOZIwJjk6zGqLrgUjsKzoJwBX+Y974vrDZgNMf/fL
         og7ZFTaWpdhrgmsKOXlFhO/TU60eSw5LmOWZKRSFc2gwf/1hs7jxhcXiDphxEv4doI
         IzaCIiKljgWKe0HsH/hGjN5xRV/AWfFWQtqjOUPo=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        David Lechner <david@lechnology.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 03/10] clk: bulk: Simplify with dev_err_probe()
Date:   Wed,  2 Sep 2020 17:03:41 +0200
Message-Id: <20200902150348.14465-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902150348.14465-1-krzk@kernel.org>
References: <20200902150348.14465-1-krzk@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and the error value gets printed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/clk-bulk.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-bulk.c b/drivers/clk/clk-bulk.c
index e9e16425c739..15978d2a1233 100644
--- a/drivers/clk/clk-bulk.c
+++ b/drivers/clk/clk-bulk.c
@@ -96,9 +96,8 @@ static int __clk_bulk_get(struct device *dev, int num_clks,
 			if (ret == -ENOENT && optional)
 				continue;
 
-			if (ret != -EPROBE_DEFER)
-				dev_err(dev, "Failed to get clk '%s': %d\n",
-					clks[i].id, ret);
+			dev_err_probe(dev, ret, "Failed to get clk '%s'\n",
+				      clks[i].id);
 			goto err;
 		}
 	}
-- 
2.17.1

