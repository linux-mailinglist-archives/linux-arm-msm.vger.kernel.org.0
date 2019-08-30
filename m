Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B2F3A3EAF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2019 21:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbfH3Tvs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Aug 2019 15:51:48 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33221 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728094AbfH3Tvp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Aug 2019 15:51:45 -0400
Received: by mail-pl1-f195.google.com with SMTP id go14so3813650plb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2019 12:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O+OltO6UTFluXk75cI2kKaBqgm2OdSEnkSbLPyHZRA0=;
        b=PJbidU2nyy0mnYnpYZnN8QjA0xIKXaoPry2J8hHgIM7XSvI8EyUc3da6wHjKqkhaDq
         MGjAkz3w3t66v8CeOj2yFdnJvb+TecJCGiUI3Pl5q6UqCj5Spp8U35s7yWrRt6I78Yrp
         7q9Sfurg+Er1amsDoP8kK5lIi/6g3fQ4863zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O+OltO6UTFluXk75cI2kKaBqgm2OdSEnkSbLPyHZRA0=;
        b=RC4SztN+a/BvG4y09kuT/nRNLEIGmi+AMBUZ3o22N0u+AVRGP/uVrW2/Di0u38839L
         uLF06muGePGQuG31oJiUP2ELh2qyFGo3PMMa6BdLkzKk1w+nXZDK+8zMuVcRgUHFZPfZ
         SrhwuWdaGvgEVWmWSKl1DAB6fd5I71esS3hVcu6eF9COmGeSX5a1gA2NoLW3thovStWp
         RNbyXa/ff0bNTZLPBKt3rzAT8W4RgRSsnXk5rxkBeHf71jEkhBLA12eLMVIaQbcoErnX
         zUhH8ZKSD9mPeoeEYj+nGc0cBQ+vZvMVpU6PLeEtquBxp0XGFFdvPlMn3doDAkZMs3df
         sUAg==
X-Gm-Message-State: APjAAAUA43VsbgJmMKMP5l6V6GW5okfujKeT58l7a0BYhWcTPhqIxjwP
        b+E9frzK73EFEm40w9iV/eBwOQ==
X-Google-Smtp-Source: APXvYqzSyhvD1zTXoQeYEg9/s0z/9tRc6542zFQqz2s1F+7QGeG55Oskqs7e8oj2ckYVb6S6R4BqPA==
X-Received: by 2002:a17:902:4b:: with SMTP id 69mr17491002pla.89.1567194704266;
        Fri, 30 Aug 2019 12:51:44 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id d189sm8212904pfd.165.2019.08.30.12.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2019 12:51:43 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH] clk: qcom: gcc-sdm845: Use floor ops for sdcc clks
Date:   Fri, 30 Aug 2019 12:51:42 -0700
Message-Id: <20190830195142.103564-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some MMC cards fail to enumerate properly when inserted into an MMC slot
on sdm845 devices. This is because the clk ops for qcom clks round the
frequency up to the nearest rate instead of down to the nearest rate.
For example, the MMC driver requests a frequency of 52MHz from
clk_set_rate() but the qcom implementation for these clks rounds 52MHz
up to the next supported frequency of 100MHz. The MMC driver could be
modified to request clk rate ranges but for now we can fix this in the
clk driver by changing the rounding policy for this clk to be round down
instead of round up.

Fixes: 06391eddb60a ("clk: qcom: Add Global Clock controller (GCC) driver for SDM845")
Reported-by: Douglas Anderson <dianders@chromium.org>
Cc: Taniya Das <tdas@codeaurora.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

I suppose we need to do this for all the sdc clks in qcom driver?

 drivers/clk/qcom/gcc-sdm845.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index 7131dcf9b060..95be125c3bdd 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -685,7 +685,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.name = "gcc_sdcc2_apps_clk_src",
 		.parent_names = gcc_parent_names_10,
 		.num_parents = 5,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_floor_ops,
 	},
 };
 
@@ -709,7 +709,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 		.name = "gcc_sdcc4_apps_clk_src",
 		.parent_names = gcc_parent_names_0,
 		.num_parents = 4,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_floor_ops,
 	},
 };
 
-- 
Sent by a computer through tubes

