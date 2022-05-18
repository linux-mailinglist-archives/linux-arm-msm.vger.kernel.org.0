Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A0CA52B806
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 May 2022 12:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234980AbiERKgK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 May 2022 06:36:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235178AbiERKgJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 May 2022 06:36:09 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8CD1271F
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 03:35:59 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id p22so2813821lfo.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 03:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/OPZaa8O8nK6v81/n/W6XSRLaD0EMUHd0/YyP/r4uTE=;
        b=Xr+N2L8ytMOPljbWrdRGsgthSUXEgPaGCcJaMJOupz7NasJgFDHsid4EfinnrtGjkc
         GIIeSF1G7yFICTnTw5iuX+yJv7mr9F/1SfWMn3VnXGPoE4TeYXt6Tu78p2s92TKIiiWK
         XCgzhZckc1mf5BGyaFMpBLKORfk+x3bA9iSzV3kF36earJNCyAYnTzpzbeyh/74unnI7
         CFXo6i0TsjlM3/WT03C3iHwG2GsJqGsLMxHKJQxQYJBcTkYj0eEaTMveHSn80dJnymwV
         P4TeavcDaty8JrmsUM6lPOwsX2A4RPBRVmONh3Xq3ph/Cr5FxlnjC/oY0aF/JuzMUi7Q
         xxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/OPZaa8O8nK6v81/n/W6XSRLaD0EMUHd0/YyP/r4uTE=;
        b=bnnZUltybXDur1yYhlByj0ezj2vaKLW4NEPoZwHvr//dN8P7n4o+t12chyNt+p8RSV
         AZheqKPrjgP25eWxrnA2xozVC1pEon8sBV4jHRyDK+KuUUHBMOeDwiBIVmfjlt8qYzDB
         WEZ7jYUNgLnOqMrHKFlY6S8UWahoplNHq7YG37xoqQi8NOXeHSzhMe09IO4iIpOZAJSw
         exZcuVJwfuUYbfFrdQ+uOVleoZt3WvRJMdM4xcHCMuYfdq8u5lsqV2VgEPml+ZNkgnz+
         7DZCrNnlcIaXXNutvSpPbGZPsKA/O7ShsYWwQPRTqW106YB6w/4Vt0lbsRDdOgm2nu+B
         yylg==
X-Gm-Message-State: AOAM531NXnHN5+YvaGVONdaEE7ed5au7bqdk4JZdrHGFCGScSeC+J/g3
        hx3MJHLTlrEhlxFSWuwgCfqMtw==
X-Google-Smtp-Source: ABdhPJzJB3QjrssIFShXSHHsIPfuN0JZhHmQ03dlU2SMWxKIwygisaGxtL8YPE30Fng9DbBPF8TEQg==
X-Received: by 2002:a19:a402:0:b0:477:baf1:1983 with SMTP id q2-20020a19a402000000b00477baf11983mr1277725lfc.222.1652870157999;
        Wed, 18 May 2022 03:35:57 -0700 (PDT)
Received: from localhost.localdomain (mobile-access-b04822-211.dhcp.inet.fi. [176.72.34.211])
        by smtp.gmail.com with ESMTPSA id v16-20020a056512097000b0047255d210f8sm171629lft.39.2022.05.18.03.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:35:57 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: camcc-sm8250: Fix halt on boot by reducing driver's init level
Date:   Wed, 18 May 2022 13:35:54 +0300
Message-Id: <20220518103554.949511-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Access to I/O of SM8250 camera clock controller IP depends on enabled
GCC_CAMERA_AHB_CLK clock supplied by global clock controller, the latter
one is inited on subsys level, so, to satisfy the dependency, it would
make sense to deprive the init level of camcc-sm8250 driver.

If both drivers are compiled as built-in, there is a change that a board
won't boot up due to a race, which happens on the same init level.

Fixes: 5d66ca79b58c ("clk: qcom: Add camera clock controller driver for SM8250")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sm8250.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
index 439eaafdcc86..ae4e9774f36e 100644
--- a/drivers/clk/qcom/camcc-sm8250.c
+++ b/drivers/clk/qcom/camcc-sm8250.c
@@ -2440,17 +2440,7 @@ static struct platform_driver cam_cc_sm8250_driver = {
 	},
 };
 
-static int __init cam_cc_sm8250_init(void)
-{
-	return platform_driver_register(&cam_cc_sm8250_driver);
-}
-subsys_initcall(cam_cc_sm8250_init);
-
-static void __exit cam_cc_sm8250_exit(void)
-{
-	platform_driver_unregister(&cam_cc_sm8250_driver);
-}
-module_exit(cam_cc_sm8250_exit);
+module_platform_driver(cam_cc_sm8250_driver);
 
 MODULE_DESCRIPTION("QTI CAMCC SM8250 Driver");
 MODULE_LICENSE("GPL v2");
-- 
2.33.0

