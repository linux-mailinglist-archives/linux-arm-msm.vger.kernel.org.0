Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA0670DA7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 12:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236588AbjEWK1p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 06:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236274AbjEWK1o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 06:27:44 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84C4A109
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 03:27:42 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3095557dd99so4468068f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 03:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684837661; x=1687429661;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gHpDHOvmkMfU56HmDcLIDz2yxy1wyJ6lgWcRU8ab9P4=;
        b=cCoE1ebQ+HsNt4qgQaTIQKCACAuaoElcmw6nKVzZJk8Fb+c0zujqUdd+BzRk4CVt3G
         BRk9+ViKhYnE6JEWCXAZn5RtIqEvFA+WkiQTiQ+vmbBlE0jDFYPr/IWdrfH3VpPnMB77
         z0ajzxaFH+ks1PXmimvBdDWYcIy64ftJ1uyFl5LlyL1UEg7+o4YvBAn/mb/ul6GAwHWx
         cte6e9mZIHai3A8nk02SoqarHlEzUeYmeeoLMWlzwOk34cKoemCVDYzjSHq4a05FyhH4
         6PjkS1aICcyTppBmSmXSXaC5LBtNCcNyCO2UUT83yyseZ8pUjXYsymVoZsXlSH8qmuDB
         vmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684837661; x=1687429661;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gHpDHOvmkMfU56HmDcLIDz2yxy1wyJ6lgWcRU8ab9P4=;
        b=O/ZTogpdVLLVsiGNwHn/vRW7zL/w4vDt89uMSR/hxfafknDkagWrMc4LApFBphXCSj
         AWr6Iv8aABSwb7FcH+dK1w/80R7Y+niYx1/mYDMzMnK4qs0bNJIiSkeS7wMUGt/MpK4U
         tWm1bwAVzngcBrln3tDm587YoZDtHKHQEaFXPWoaDgKkZmXV3z/yWQqNvTXh4rtxsi0O
         RrDdGw40/71D6Ja3Tx0fntm/T0bTqiA7r9uZhQPIIrLq8o8Gj7uKYdhTFuKoI/9x00Hn
         C1i480T/FNvr8q3tx5FpiF/3qYd0QpiZXAK2Frj7c2oe/HTVUuTopwUO5D9DOYEdit2o
         xwyg==
X-Gm-Message-State: AC+VfDxbdUlPv/Wzx4I/+dqUXD/e8QCd99vwdYWxbgY1hhFJCaPq3KIq
        RVghnRPanGS5KPEORLkXcrJ70g==
X-Google-Smtp-Source: ACHHUZ6KaKfKl48kZ9Oww7jUr+scQRpwQvNpsSKlx2K31ho16ppfQbKQ5KO3EWBQcUtI4DBWenunEw==
X-Received: by 2002:a5d:58d4:0:b0:307:cb94:972f with SMTP id o20-20020a5d58d4000000b00307cb94972fmr8382861wrf.46.1684837660960;
        Tue, 23 May 2023 03:27:40 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c12-20020adfe70c000000b003078cd719ffsm10606333wrm.95.2023.05.23.03.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 03:27:38 -0700 (PDT)
Date:   Tue, 23 May 2023 13:27:28 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH v2] interconnect: qcom: rpm: allocate enough data in probe()
Message-ID: <e0fa275c-ae63-4342-9c9e-0ffaf6314da1@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This was not allocating enough bytes.  There are two issue here.
First, there was a typo where it was taking the size of the pointer
instead of the size of the struct, "sizeof(qp->intf_clks)" vs
"sizeof(*qp->intf_clks)".  Second, it's an array of "cd_num" clocks so
we need to allocate space for more than one element.

Fixes: 2e2113c8a64f ("interconnect: qcom: rpm: Handle interface clocks")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: allocate enough space for the array

 drivers/interconnect/qcom/icc-rpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index f4627c4a1bdd..6acc7686ed38 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -436,7 +436,7 @@ int qnoc_probe(struct platform_device *pdev)
 	if (!qp)
 		return -ENOMEM;
 
-	qp->intf_clks = devm_kzalloc(dev, sizeof(qp->intf_clks), GFP_KERNEL);
+	qp->intf_clks = devm_kcalloc(dev, cd_num, sizeof(*qp->intf_clks), GFP_KERNEL);
 	if (!qp->intf_clks)
 		return -ENOMEM;
 
-- 
2.39.2

