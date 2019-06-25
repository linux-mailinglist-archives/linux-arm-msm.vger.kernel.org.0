Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 379E455501
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 18:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729660AbfFYQsa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 12:48:30 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53826 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729983AbfFYQrw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 12:47:52 -0400
Received: by mail-wm1-f65.google.com with SMTP id x15so3548941wmj.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2019 09:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vx/+X3vW6hJ0UUO6xl7D37Dkvgf50ba92tNd21qhLhY=;
        b=KZCNsdmNk7fr6BtssB1l/nVXpWdNqpSJ17yuMZvs0iwZmznPE2I2mOYe64nOOkJKmT
         gmOTA980HH8aQQ4rKNBtqizvvIwxdBN5CFwNZC+P9muuWAm3s0pO+ZX6YviPklw9ZVDQ
         ESRUpR9S6teNWngx5x//WKH1YKQ/Dip0Pl+xpB3m6ZZGWX8Z7ZHY3glRn6Yv+IweM+fZ
         nWa7wcsPGrUVnfdi4g7uwSQ9qek27rtnC/pHiA2rwr1Pqh1IGatTCAH7nqANnOAMuvP8
         nCocUPBWvQlTd8xI9+Jpl/cxqko6zgosqSRJI2ADqYZWWjoQHL3H2wKM9/r5UQLHBulO
         EFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vx/+X3vW6hJ0UUO6xl7D37Dkvgf50ba92tNd21qhLhY=;
        b=e5ebAyHcw5hwHNmCnAU7Kdo1WQs2bjGCNFauXFsX8yGuI2ahnNjforTtxTD2brXC4N
         jMaQQWxEGHdKh/CPnjlcqdoHBhcjF7UWHL30J5Ed5gwi/W3a7mi5Uy8ZJkYJBNSFNtsI
         77GxoKWZf7rPQm3O5vZF7GVjWgnF4j3/viRtmwjF+vDqfqFPVgWQda4WbfrdII+fqD3n
         L5JIYkhymnQ/39GW4dgCw8FjANz3mJ6+KH9G1N9F8OYgro+zCk2fw5pwx6lZKQH6MRcy
         plruGNzBbqz5EwCM8adwaqfGfA4BDPK1sHBNSeThiIKWFJqKr4k09OiFq4tE9fOw4Oyp
         MLcg==
X-Gm-Message-State: APjAAAWncM8HD/SEnYWxjWlUk3XaYtXch7p0kVCoDvIiRH6iI2MYSflN
        djW7DLmtjo0LAeGXIH9RuQcJEA==
X-Google-Smtp-Source: APXvYqyV1gu/I4EtxDw41R2+bbmPhZ3ozBjCCna7xrSe18ZqJS/Ruc5Yad+b7pkWtrjkSEOK4fwyPQ==
X-Received: by 2002:a1c:7f54:: with SMTP id a81mr20757954wmd.170.1561481271296;
        Tue, 25 Jun 2019 09:47:51 -0700 (PDT)
Received: from localhost.localdomain (30.red-83-34-200.dynamicip.rima-tde.net. [83.34.200.30])
        by smtp.gmail.com with ESMTPSA id d18sm42594476wrb.90.2019.06.25.09.47.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 25 Jun 2019 09:47:50 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        jassisinghbrar@gmail.com, mark.rutland@arm.com,
        mturquette@baylibre.com, robh+dt@kernel.org, will.deacon@arm.com,
        arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de,
        sibis@codeaurora.org, enric.balletbo@collabora.com,
        jagan@amarulasolutions.com, olof@lixom.net
Cc:     vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: [PATCH v3 08/14] clk: qcom: hfpll: CLK_IGNORE_UNUSED
Date:   Tue, 25 Jun 2019 18:47:27 +0200
Message-Id: <20190625164733.11091-9-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When COMMON_CLK_DISABLED_UNUSED is set, in an effort to save power and
to keep the software model of the clock in line with reality, the
framework transverses the clock tree and disables those clocks that
were enabled by the firmware but have not been enabled by any device
driver.

If CPUFREQ is enabled, early during the system boot, it might attempt
to change the CPU frequency ("set_rate"). If the HFPLL is selected as
a provider, it will then change the rate for this clock.

As boot continues, clk_disable_unused_subtree will run. Since it wont
find a valid counter (enable_count) for a clock that is actually
enabled it will attempt to disable it which will cause the CPU to
stop. Notice that in this driver, calls to check whether the clock is
enabled are routed via the is_enabled callback which queries the
hardware.

The following commit, rather than marking the clock critical and
forcing the clock to be always enabled, addresses the above scenario
making sure the clock is not disabled but it continues to rely on the
firmware to enable the clock.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 drivers/clk/qcom/hfpll.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/hfpll.c b/drivers/clk/qcom/hfpll.c
index 0ffed0d41c50..d5fd27938e7b 100644
--- a/drivers/clk/qcom/hfpll.c
+++ b/drivers/clk/qcom/hfpll.c
@@ -58,6 +58,13 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
 		.parent_names = (const char *[]){ "xo" },
 		.num_parents = 1,
 		.ops = &clk_ops_hfpll,
+		/*
+		 * rather than marking the clock critical and forcing the clock
+		 * to be always enabled, we make sure that the clock is not
+		 * disabled: the firmware remains responsible of enabling this
+		 * clock (for more info check the commit log)
+		 */
+		.flags = CLK_IGNORE_UNUSED,
 	};
 
 	h = devm_kzalloc(dev, sizeof(*h), GFP_KERNEL);
-- 
2.21.0

