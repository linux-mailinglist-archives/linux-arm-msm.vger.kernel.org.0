Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 220ED3A9D15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 16:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233880AbhFPONf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 10:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232825AbhFPONc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 10:13:32 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 016FDC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 07:11:25 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id c9so2870472wrt.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 07:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ExFCaLr+DmH1KCjQVYY2iL4Mk5cBbz4oYRRMXRoKR7Q=;
        b=DcbrMPdHGXOuKRR9j0hisCJtNx6QuqMdRjPtJlKvm708kE4iYNwUdifXOJjTPPTdsM
         Gaf8eeuCHMQI4ywBV5fgTQdyOCYcWf1diws2p6F99w9QVMRMGQx09S0e0Ewf8PShQ9sZ
         /mJA7CSgRMPUMMlgReF6r+N9op5G3fsZTYETFp6enRrADw/goxvnPSHO0hh049v6djeN
         OlysLMCzVnQ0IqntvVBGc0HZXC29PN1d9j9gdMMQaZJAISYhX6wXViJS3zY9W5ORIMqI
         WksKRiZkcaJ6g0iYPTFtoDYqWVwQa6oQsEwCcvu5q/gQGo5BnqKi4yFBCo1O3aF7F2t9
         taEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ExFCaLr+DmH1KCjQVYY2iL4Mk5cBbz4oYRRMXRoKR7Q=;
        b=bx9xAH+D2CX1LSwrTd3WZMOmd+gndHAq4cbdmiWPjbyrlWwRE+Rt3xWc/N+hnya8nr
         cQTJ3whCB18BCAeZHaLBrZN4EEuEJiFxg2vUNoRHn3qWehuWK8rbtkiosMxECM+F0OcM
         ZU4eOyI+qVCTl6XDh/MMn5u2Isy5lvaP2zVMvrYcACy4UsGzeJzCEGJ2lS719yoisKA+
         8sRtSAymegDHUtR+oXYqdR1uFhuU7hd2l4h33zxP0VA9LQg9P1mh6tOyiyjFliP1mAvc
         7uQSGlfS76NtleJaRtAwnaxWkLYQagw1Dc9qeLG6buPW/B3DGD0ZAWwGg+i26kM5sSQM
         vYtw==
X-Gm-Message-State: AOAM531O2EUDdokS+NTiq+gwH43bJfuibwEIylSkrHdeKSisfWupVS+o
        T0B8swcEUz6NFNaO4Vy66o+CuA==
X-Google-Smtp-Source: ABdhPJy9DZ8SQCm5xfyIPPW0xc2GKhSiDIwGMeaMQ7aUf0K+z+MvTKPdVoc1QHq9hqVInYS+BWYe4w==
X-Received: by 2002:adf:db4d:: with SMTP id f13mr5753551wrj.243.1623852683654;
        Wed, 16 Jun 2021 07:11:23 -0700 (PDT)
Received: from xps7590.fritz.box ([2a02:2454:3e5:b700:9df7:76e5:7e94:bf1e])
        by smtp.gmail.com with ESMTPSA id g83sm1968375wma.10.2021.06.16.07.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 07:11:23 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jonathan@marek.ca, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vinod.koul@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [RFC v1 02/11] clk: qcom: rcg2: Add support for flags
Date:   Wed, 16 Jun 2021 16:10:58 +0200
Message-Id: <20210616141107.291430-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210616141107.291430-1-robert.foss@linaro.org>
References: <20210616141107.291430-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These changes are ported from the downstream driver, and are used on SM8350
for CAMCC, DISPCC, GCC, GPUCC & VIDEOCC.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/clk/qcom/clk-rcg.h  | 4 ++++
 drivers/clk/qcom/clk-rcg2.c | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index 99efcc7f8d88..a1f05281d950 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -149,6 +149,10 @@ struct clk_rcg2 {
 	const struct freq_tbl	*freq_tbl;
 	struct clk_regmap	clkr;
 	u8			cfg_off;
+	u8			flags;
+#define FORCE_ENABLE_RCG	BIT(0)
+#define HW_CLK_CTRL_MODE	BIT(1)
+#define DFS_SUPPORT		BIT(2)
 };
 
 #define to_clk_rcg2(_hw) container_of(to_clk_regmap(_hw), struct clk_rcg2, clkr)
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 42f13a2d1cc1..ed2c9b6659cc 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -295,6 +295,9 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
 	cfg |= rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
 	if (rcg->mnd_width && f->n && (f->m != f->n))
 		cfg |= CFG_MODE_DUAL_EDGE;
+	if (rcg->flags & HW_CLK_CTRL_MODE)
+		cfg |= CFG_HW_CLK_CTRL_MASK;
+
 	return regmap_update_bits(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg),
 					mask, cfg);
 }
-- 
2.30.2

