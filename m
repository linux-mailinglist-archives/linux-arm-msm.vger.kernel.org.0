Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 156193A9D18
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 16:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233887AbhFPONg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 10:13:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233857AbhFPONd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 10:13:33 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E3AFC061768
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 07:11:26 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id c9so2870537wrt.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 07:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u+LrLr5ScKl10ELD0o4ZHSHRjCSJkFhG5a8CEjAWpf0=;
        b=dYpK2lVMhSj1JMnFOWz/gb2RgSQ9t3LSlBD8hDZoFpWqEbXwVv7r50EshsXzKmzhn6
         072awUEOdcuOAgXuqQA0KuTntJ7Kn7/E+KCHdGP3FKz00v0YFP92hgm0b6s4/HzJHpqs
         WtLiHIMATvbpu5T23XuQYsPiD9ryOJ4mTm09so9EWnffJTH7SNwdYNsRkLI7OYuVyBem
         GKHDb5QhqirylTFQaQBTMMQ70WqTsqcB4X1QJ6ozCH90xyY+v6DAvbCozRY6MFokBuXO
         sMSZXjy7L/LfVyrJocwVt4nWtqz0WKBOOTV32ocB8pgrFT5ysObzdPSNfrDqNH9NrhIN
         ku+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u+LrLr5ScKl10ELD0o4ZHSHRjCSJkFhG5a8CEjAWpf0=;
        b=RZi4vq2DtvRyHLDXnDomke7ZXI1JZUGkDr02xonXeoHVhOExeEmzhTa3UYnxc1G0dE
         xws5mUCFbWIPH1aPaSNBejBxuyeJgijCd+NSWEYpk54O2lTacZE3blJjwz3MNtdySSQg
         C2NKUyygbdQEZB4MMXjuvxCG8ScC2SbZYCkKYGmsrPYfPyflfWM8+UOUCXp3FIsgRTTa
         yeNjux2ylzpd10mr/ciaPZQzpll49KHX6lod0+DinSu7qLNSLpp0zkwT/TmmprRN3F0z
         3io9gd/qG5BzLVjv+465aKEa/30udYQIphx2ajZIy6TuOJan5HwLQMB8bht6WgSUnyDe
         ZG2A==
X-Gm-Message-State: AOAM531NjpKvq3w1v/Vf36zkroERJf0ShfIorpe6AnbUZU0qsyqn8seg
        CoeL51+gG/hG1b2Ppr2nkAwMsA==
X-Google-Smtp-Source: ABdhPJxAFBS8WqjBJ74ngiCvh2qJQoU+yU7YGRzoWEqeCM9ZbvMyzePxiEBZodMpXcaaxATvaD5jqA==
X-Received: by 2002:adf:a45a:: with SMTP id e26mr5804185wra.222.1623852684859;
        Wed, 16 Jun 2021 07:11:24 -0700 (PDT)
Received: from xps7590.fritz.box ([2a02:2454:3e5:b700:9df7:76e5:7e94:bf1e])
        by smtp.gmail.com with ESMTPSA id g83sm1968375wma.10.2021.06.16.07.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 07:11:24 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jonathan@marek.ca, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vinod.koul@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [RFC v1 03/11] clk: qcom: clk-alpha-pll: Fix typo in comment
Date:   Wed, 16 Jun 2021 16:10:59 +0200
Message-Id: <20210616141107.291430-4-robert.foss@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210616141107.291430-1-robert.foss@linaro.org>
References: <20210616141107.291430-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Substiture lucid for trion in comment, in order to conform to the
function name.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index c6eb99169ddc..01090852ea76 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1399,7 +1399,7 @@ const struct clk_ops clk_alpha_pll_postdiv_fabia_ops = {
 EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_fabia_ops);
 
 /**
- * clk_lucid_pll_configure - configure the lucid pll
+ * clk_trion_pll_configure - configure the trion pll
  *
  * @pll: clk alpha pll
  * @regmap: register map
-- 
2.30.2

