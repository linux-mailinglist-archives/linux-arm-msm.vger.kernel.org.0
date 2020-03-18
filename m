Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 736A3189CB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2020 14:17:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbgCRNRP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Mar 2020 09:17:15 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:45749 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726821AbgCRNRP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Mar 2020 09:17:15 -0400
Received: by mail-ed1-f66.google.com with SMTP id u59so2500869edc.12;
        Wed, 18 Mar 2020 06:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fyMBbWwjDpTftQhmCAd3B6Ppi0nc30PtiYahkvf0nHE=;
        b=fcYMCaMLtiWCsmQT8JbcyWQpDuScuRHajkNK7PUkjHiGzDS6udOJ9PnBp6p2mIJXB8
         wSZA1HDCCb2ob9wALGYbn9SfrnScOpDxYpcYI1HsqTg6mNM42paITLWash5aPffl6rJ3
         aTr/WfcG7SVkHmhZr+915q/ES6KEiAE17MSZoBVxw7df2ZV1rzIAO7iWdJSAjxd5fuqk
         bbUwc+i1QmQ6RiIw9XB8DckfeXJ2zawZKEr/OZavn+TgUJ0L2ySegbNqbMJ42LrxBKvh
         vmrzML9OlCxSc7nCrIuBF9cuvs+yMKZLEMpRY8sqpBRcTHvtYhmuM3PfLq7KF6hlPY5E
         YHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fyMBbWwjDpTftQhmCAd3B6Ppi0nc30PtiYahkvf0nHE=;
        b=VRCPCGvnNv74bWNJ6VgPzpSJXa2NRgAr9sLLvupNWgtbbIkPEhvXxJTYihF3NTFmfg
         VYG5zuUyxKR4FCCw0Sidwzps+M5d2BdizqUpxYqZfECwvsw2xh/U49593BC/aZlqNGJ2
         UIEz2+3GsBcJ12sSGUX7+9RrgiXFqDrUSQzb2l+VfqPWes3OrM6pfFGbV0kSDFf9xFzL
         7Wxf2R6UQ9xiMRS/gzHa8IB6JIaOa39m1CLczRLDeMLvHlqTVdSrCssjyJkrb6AVSZZ7
         oe2NenilpjdRdAIUrX+yf5xCV5t+U2DqGL2revJUqAK0iJpXg02yNiqbIg4qvzMlY/Ip
         oQMA==
X-Gm-Message-State: ANhLgQ38x0GxrZYXKvpIZZs/fB4bM1tO8oX7bIGiG4AodwVQcenYiHLU
        7/3H38wp37Qcw25ilRXL9Cs=
X-Google-Smtp-Source: ADFU+vtD/ZeaAm58b/8h9UuPaw4myY7lxqf9HAWY30OoOz5vO5MYYlpfGFCjAH9ppo8JLSUCIOkJ1A==
X-Received: by 2002:a05:6402:1757:: with SMTP id v23mr3825355edx.384.1584537433064;
        Wed, 18 Mar 2020 06:17:13 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (host203-232-dynamic.53-79-r.retail.telecomitalia.it. [79.53.232.203])
        by smtp.googlemail.com with ESMTPSA id ha2sm241921ejb.88.2020.03.18.06.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 06:17:11 -0700 (PDT)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     Andy Gross <agross@kernel.org>
Cc:     Abhishek Sahu <absahu@codeaurora.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kumar Gala <galak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] ipq806x: gcc: Added the enable regs and mask for PRNG
Date:   Wed, 18 Mar 2020 14:16:56 +0100
Message-Id: <20200318131657.345-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Abhishek Sahu <absahu@codeaurora.org>

Kernel got hanged while reading from /dev/hwrng at the
time of PRNG clock enable

Fixes: 24d8fba44af3 "clk: qcom: Add support for IPQ8064's global
clock controller (GCC)"

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
v2:
 * Fix wrong authorship

 drivers/clk/qcom/gcc-ipq806x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806x.c
index b0eee0903807..a8456e09c44d 100644
--- a/drivers/clk/qcom/gcc-ipq806x.c
+++ b/drivers/clk/qcom/gcc-ipq806x.c
@@ -1224,6 +1224,8 @@ static struct clk_rcg prng_src = {
 		.parent_map = gcc_pxo_pll8_map,
 	},
 	.clkr = {
+		.enable_reg = 0x2e80,
+		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "prng_src",
 			.parent_names = gcc_pxo_pll8,
-- 
2.25.0

