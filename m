Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73A01B1739
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2019 04:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbfIMCkf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Sep 2019 22:40:35 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40262 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbfIMCkf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Sep 2019 22:40:35 -0400
Received: by mail-pf1-f194.google.com with SMTP id x127so17137173pfb.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2019 19:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=yK99CWDEV+GMLXWhJb+XNR1rZIzkOo1KcI+8O5gSgak=;
        b=pX8GfKNlP3H7LubXCrt3O4BEUxhmJt5lfVF3cSVQwZNgT5bWdx5ZLLkyRecsMHl3RP
         gsomj7G6Cp+CUjvJngWvlC/cu+iNAJU1hSO48bbEBwN7PTvJKOjBqf0xEJI3hnCjxA+v
         QgY8zJ0VFKbmzYwY3tEZf8LczcsqMCX04A8OLXyTPaqCFiRw+L9TOK9lidjYLjpOyCT6
         F/+NAI3zDnmEkFJlZEjm7jmzPwbiiwUB4wBm28tMwDEEfe/j4Nrh2/SB1PaPtD8pQgI1
         m7G0FmmvO+iVSQh3qt+tJMcoChqooWEsaG8jfHh64uq4j/aJl1wvycdfCj3sMtgXRVQt
         pCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=yK99CWDEV+GMLXWhJb+XNR1rZIzkOo1KcI+8O5gSgak=;
        b=PHb+JKeKDORguEE132gO/QbuPQqw9uCePWBn5jsQS95VCj+1E/qzwHPw8xQ5aZj6uS
         zNWLyL5Z0OF+vIPgphAeDdIGx4Gja5+JHU2AEFYERTRSohJ/Wdx9zlnpekPjiGEoPQUC
         NScWg/BM82a1gAmLl+94aWtb72/Ed3/qa03v/xM9xHLem7vJIaJtfcWoYKV2bYX5ws8I
         pc69vWKjtHVGK6/x4V11i82RV2AJRH/5z/Nn4tXcCeBHUlkk9quH6ITzvKmMF64Gtrrn
         +YMNZg6txBfQ1KwVPRyKq2696d72yd+64l425Tj/WrFPGvbnpN9fT30L7P0EMoj6godL
         1o3w==
X-Gm-Message-State: APjAAAURfInz7x6vUSTxihKpiuvg2/A4I4T+nJ+TPDqTZ3leyDLm34Ej
        8dMcKBqBVnbnnPgJDqTOrlv9CQ==
X-Google-Smtp-Source: APXvYqwtiQkm2M/xKlHGAxKnIsR+ZI2Lqsa2MEw3Q53WdznmG4Z/bpTDe/Tk3NIvdO/QXK8Zax/CBA==
X-Received: by 2002:a63:9249:: with SMTP id s9mr39988094pgn.356.1568342433021;
        Thu, 12 Sep 2019 19:40:33 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i74sm40222938pfe.28.2019.09.12.19.40.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Sep 2019 19:40:32 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Dong Aisheng <aisheng.dong@nxp.com>,
        Jordan Crouse <jcrouse@codeaurora.org>
Subject: [PATCH] clk: Make clk_bulk_get_all() return a valid "id"
Date:   Thu, 12 Sep 2019 19:40:29 -0700
Message-Id: <20190913024029.2640-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The adreno driver expects the "id" field of the returned clk_bulk_data
to be filled in with strings from the clock-names property.

But due to the use of kmalloc_array() in of_clk_bulk_get_all() it
receives a list of bogus pointers instead.

Zero-initialize the "id" field and attempt to populate with strings from
the clock-names property to resolve both these issues.

Fixes: 616e45df7c4a ("clk: add new APIs to operate on all available clocks")
Fixes: 8e3e791d20d2 ("drm/msm: Use generic bulk clock function")
Cc: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/clk-bulk.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-bulk.c b/drivers/clk/clk-bulk.c
index 524bf9a53098..e9e16425c739 100644
--- a/drivers/clk/clk-bulk.c
+++ b/drivers/clk/clk-bulk.c
@@ -18,10 +18,13 @@ static int __must_check of_clk_bulk_get(struct device_node *np, int num_clks,
 	int ret;
 	int i;
 
-	for (i = 0; i < num_clks; i++)
+	for (i = 0; i < num_clks; i++) {
+		clks[i].id = NULL;
 		clks[i].clk = NULL;
+	}
 
 	for (i = 0; i < num_clks; i++) {
+		of_property_read_string_index(np, "clock-names", i, &clks[i].id);
 		clks[i].clk = of_clk_get(np, i);
 		if (IS_ERR(clks[i].clk)) {
 			ret = PTR_ERR(clks[i].clk);
-- 
2.18.0

