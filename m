Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07F4A52DF79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 May 2022 23:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245296AbiESVmS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 17:42:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245295AbiESVmD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 17:42:03 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B76036213B
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 14:41:47 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id q130so7700664ljb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 14:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SJ+tGdbq8RU44C7gVKtqScfDOQ9GrdzS7rAPCoM+WdA=;
        b=WNYW7eotl0gBLOKLtJVHcWpiVpm3gSLGvtPUCinb7dEHiED5HCDd4AGhsmS84QHrnN
         sxjFksUIt8+Pke9g1JJSayLekDajhQe3+zMYQg1ffT8EVfwxSbNfPhjGno/aZGfym4Q3
         uAF5t6FAVnqjU7W8E1CyG0KacgT1dMkvI0aVOq+VUWUoS7ZAoJvvU9jw3eXo29iUySs3
         TZWh0yor4hfiqw9FbYdNmqI/WS3mnkAKfLcJAfjk3U94Ky6CzupNkSlJpcSrUuPy+k2m
         KxapcYGa3l0GpUjzTlilJrvYFx1uwGsktOB19RSwM4P3BEJmpO63qOwAep+IRarGsHm2
         4WJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SJ+tGdbq8RU44C7gVKtqScfDOQ9GrdzS7rAPCoM+WdA=;
        b=m6zEgT+jgoppNtWaW9MApe7Bbd79Jomv6WQtpuOHUK3iroEtkN6BYFRdmzNOGF/354
         Gg8SEOmZcf++qHyYm1v98Z4u4WCX4uBEZi4jqVGqGKJeCd12MT4POhMUh3ML9HQSQOyb
         vBDz9fW+dwk8vzIYEtOzaKXDvaywxnnyyxT8DbVEPqmURmA0nwyqN3NUhxS6bUHGhmKs
         bJpJlzNDIGWqgH1IdSU05A0ffqQB6/2Vh6nfoG8kn2DTVhzAigE6iK9ATEFj1EFEX5zM
         5xsuDh9L35z3/wcRPzG1Z7KcLiiU8cI7UIspI+oO4n+wGw9yz1Pa4fWLhLuUpwCXflvE
         2pBA==
X-Gm-Message-State: AOAM532jBr6dURIyR28pFcpH5MpL7BPzR2GSscNSciD0zqsN/wwwJ4cM
        NgS9OIU9dowCytFkShk55bltiQ==
X-Google-Smtp-Source: ABdhPJwlb94xGzR8l/J5Wk+oWy+3ZZfTmudft90Vjgec7cRo9wipTejLACga05onFxd+NKaOKVaROw==
X-Received: by 2002:a05:651c:515:b0:250:6428:5c4c with SMTP id o21-20020a05651c051500b0025064285c4cmr3818047ljp.264.1652996505489;
        Thu, 19 May 2022 14:41:45 -0700 (PDT)
Received: from localhost.localdomain (mobile-access-b04822-211.dhcp.inet.fi. [176.72.34.211])
        by smtp.gmail.com with ESMTPSA id l12-20020a2e99cc000000b0024f3d1dae9dsm53576ljj.37.2022.05.19.14.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 14:41:45 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: camcc-sm8250: Fix topology around titan_top power domain
Date:   Fri, 20 May 2022 00:41:33 +0300
Message-Id: <20220519214133.1728979-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220519214133.1728979-1-vladimir.zapolskiy@linaro.org>
References: <20220519214133.1728979-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On SM8250 two found VFE GDSC power domains shall not be operated, if
titan top is turned off, thus the former power domains will be set as
subdomains by a GDSC registration routine.

Fixes: 5d66ca79b58c ("clk: qcom: Add camera clock controller driver for SM8250")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sm8250.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
index 439eaafdcc86..d68376077d51 100644
--- a/drivers/clk/qcom/camcc-sm8250.c
+++ b/drivers/clk/qcom/camcc-sm8250.c
@@ -2205,6 +2205,8 @@ static struct clk_branch cam_cc_sleep_clk = {
 	},
 };
 
+static struct gdsc titan_top_gdsc;
+
 static struct gdsc bps_gdsc = {
 	.gdscr = 0x7004,
 	.pd = {
@@ -2238,6 +2240,7 @@ static struct gdsc ife_0_gdsc = {
 		.name = "ife_0_gdsc",
 	},
 	.flags = POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -2247,6 +2250,7 @@ static struct gdsc ife_1_gdsc = {
 		.name = "ife_1_gdsc",
 	},
 	.flags = POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-- 
2.33.0

