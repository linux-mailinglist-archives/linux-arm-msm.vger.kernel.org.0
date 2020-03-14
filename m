Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E248185796
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2020 02:41:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbgCOBl1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Mar 2020 21:41:27 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40174 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbgCOBl0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Mar 2020 21:41:26 -0400
Received: by mail-ed1-f67.google.com with SMTP id a24so17326162edy.7;
        Sat, 14 Mar 2020 18:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kdlcv0vXg+e3IXgeXkwIX+UvL6hiQeQvJR6h+ymcppc=;
        b=thByE3DO/kUnWcOoocjbLM+DQ0XCQhtyskwN5xLJyReNqZElXrdPMTTWwftzA30vW2
         qhyGZ6G2CbXzPpst6Usf+SuTPqDumFIEc+DrV2KGmCinoKV/scRi/P8TCBoCw0VSX2qH
         vctWR/sd4lGzsFtO+1gEQrMkr5DQh9RwU93qP+9bGbJJNfZKN/k/SQARWsK8U9kOraPt
         dpQZ652ktMOGKM543Lc8/b4AenNllPzSTxtVewwPDanpk3RZGoLErVQFqvyXqifUinO9
         Tf9bUTEiUEzTuvYuEHSLqZJlHdE1TgHYH+nZajGvR1PzGL7HBf31lrCNxHJY8jzYyrTf
         h5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kdlcv0vXg+e3IXgeXkwIX+UvL6hiQeQvJR6h+ymcppc=;
        b=dWT+dQRGia3r4jzBGDm1Qzs1waRmy35YmYf2sV/MQntQsqGRr2UJydQKcG7xnqiUH7
         YBK8zvyNX3KgHPRkUF2UHEJoqf44PqB8BgKbsGdtevWH4wJDsSEyMCnHetSSfj3cIvTB
         3SBEvae0DNeOPAirNT9gLXeD7ZoMkFdbjR4kcktstBE9K5iXcDCfXv17h6pj7jX9jhzb
         DcnUcF/kPSX3qHPT63zDRBVmH2uBi+nSbIXPStkEzos754v1EZyboPWYuH8ysSC8rHLA
         Y8hi3wSm0yFFoDbZFzrASNRueSlkaLIZIvaBqg20cOprJ8EaNZLoCueAUHdgDFm6MtsK
         QsuA==
X-Gm-Message-State: ANhLgQ1lr3+x3FSx+puubgjL3Que6qci2fTHmXPjEi/W5RIUu2wXfvdu
        JWmkVMoQpz2qR4kTd/a/Vno9QnPBpk2bog==
X-Google-Smtp-Source: ADFU+vs00b+0TuPh7UK7ayrUuIskNi33PA5Zud2/5ALZ8kFWqEKnbRLGNhSAuC/yr9xghGmiwskgcQ==
X-Received: by 2002:a05:6402:10c2:: with SMTP id p2mr6025962edu.375.1584192971411;
        Sat, 14 Mar 2020 06:36:11 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (host129-252-dynamic.6-87-r.retail.telecomitalia.it. [87.6.252.129])
        by smtp.googlemail.com with ESMTPSA id g5sm4066360edn.9.2020.03.14.06.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2020 06:36:10 -0700 (PDT)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     agross@kernel.org
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Abhishek Sahu <absahu@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kumar Gala <galak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] ipq806x: gcc: Added the enable regs and mask for PRNG
Date:   Sat, 14 Mar 2020 14:36:00 +0100
Message-Id: <20200314133600.183-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <158413140244.164562.11497203149584037524@swboyd.mtv.corp.google.com>
References: <158413140244.164562.11497203149584037524@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Kernel got hanged while reading from /dev/hwrng at the
time of PRNG clock enable

Fixes: 24d8fba44af3 "clk: qcom: Add support for IPQ8064's global
clock controller (GCC)"

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
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

