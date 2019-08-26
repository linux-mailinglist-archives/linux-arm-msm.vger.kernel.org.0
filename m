Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 437F89D457
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2019 18:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732549AbfHZQqh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Aug 2019 12:46:37 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34314 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733124AbfHZQqb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Aug 2019 12:46:31 -0400
Received: by mail-wr1-f66.google.com with SMTP id s18so16023909wrn.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2019 09:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NEmCczScxOjFfK/GsZ795dKDEuO/wf3t9hNmpIlsOQI=;
        b=BID66P7itQJ4yzTshEIGtAkG0upK9NrN2v/H5HGmn2LXb3nRYWGysQQJy5GzkKi2Ww
         WNiK+LKqgnRqiDXKI6r/L1duC7cuRDAryXvD2RjGgdBOoXZypangAWFW2vZ55LF9/VLc
         4If9ZuuZGAqArMiM49ae7lw1IcWdjFGFR8RCYPnl3SXbcmHEgIj8kMq/2Li1RDGWTz+q
         DpTtYHlxBqHyKRzIVhI+x3HtHvwHnp2TTkqE+5U5XnGEAY6OY0Yxu4I5EAXvkR2MBEiX
         dIrPcqbgaC/ADd9ITbSrT2WOiPfY9m8btcyS4kxBQjhgR+/RqZbmf7KphKMQOYvMWjqI
         5lhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NEmCczScxOjFfK/GsZ795dKDEuO/wf3t9hNmpIlsOQI=;
        b=MuvZleFJvA2zDyA4okf6oZfg9Q9YPR9oh/0QA5viHaXXoE7EQGYYTT1hhMbT4Yta2/
         bAYZi+Eq5+i0TBSAbjRXKg/0FiIST4aPWOkJD+OzvCfmOwgbUrqhC15ktVBmF9YR537B
         UvUwsYfH3+qtQo+xS3pASReaulGxorDQKFrRNUB7/eclAGXrTmNN5US6W5S0jQ/d2FVP
         M6hJhXzsbCYO5OE77SPGWLlNsFuEg7O8D0fMcR6Y222Tz+ecAYHBEoxn8163N00dYRJr
         cm6e/FCUWM3LbS2tiy5Ath80FnMmswaW/dba5FtOb7osGLh9MFmkxHRdqKTABpKxYY6a
         c2Cg==
X-Gm-Message-State: APjAAAXhPt1P85NJu5nNvyobT1x6cZmaJRN7a9pMCE+tZbAPdortPhoL
        XzGlgzXIbEhsN0tzx6NnJif8Iw==
X-Google-Smtp-Source: APXvYqxf5ydx1zKi75IMmBCsndAtfgevLo3Rematxh30e+AFNnfRuUZ6qNl1huKC6S6s/k53vqnR9Q==
X-Received: by 2002:a05:6000:1186:: with SMTP id g6mr24328520wrx.17.1566837989922;
        Mon, 26 Aug 2019 09:46:29 -0700 (PDT)
Received: from localhost.localdomain (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id 5sm18768wmg.42.2019.08.26.09.46.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 26 Aug 2019 09:46:29 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, jassisinghbrar@gmail.com,
        agross@kernel.org
Cc:     niklas.cassel@linaro.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mbox: qcom: replace integer with valid macro
Date:   Mon, 26 Aug 2019 18:46:25 +0200
Message-Id: <20190826164625.6744-2-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190826164625.6744-1-jorge.ramirez-ortiz@linaro.org>
References: <20190826164625.6744-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the correct macro when registering the platform device.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 76e1ad433b3f..dc198802bdf7 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -96,7 +96,8 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 
 		apcs->clk = platform_device_register_data(&pdev->dev,
 							  "qcom-apcs-msm8916-clk",
-							  -1, NULL, 0);
+							  PLATFORM_DEVID_NONE,
+							  NULL, 0);
 		if (IS_ERR(apcs->clk))
 			dev_err(&pdev->dev, "failed to register APCS clk\n");
 	}
-- 
2.22.0

