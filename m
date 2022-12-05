Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 310DD642799
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 12:35:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbiLELf4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 06:35:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231255AbiLELfx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 06:35:53 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B1B71A06C
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 03:35:52 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id e13so15305094edj.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 03:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b9b59iFvofQpoKBEaYeQhFybU9NmyF7WlZBKIJce18E=;
        b=hbs+USPpFBZKRF/tug7MDLQSmfqVJbidEvpUgMVjKTYzJI+P7XcwTDngm7SahaSO0K
         iuQb3QeZi1ZOQPVCY4RNw2HabP89aKsWp5YylYgKiSrrYEIUANVuJ3lZdeFoepuKUPAl
         rpugTdctPHudbeVKnKvIfDTxgiSF309QLeAWd43944UlSOYsq+T/pURyZe04rnlZX4KZ
         NrevYRSFEvJM7S+Tr0Co7+XdUnidwDMtNCjN+bCG3Flys7Hrr109QkgnofeWDwt1a094
         G6hm8n3dOEMVzwnU08SjqU/faHT/oKuqyFe1FDAg5BeAFWN6hHmUt+uZtvqB1XFadCk6
         oBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9b59iFvofQpoKBEaYeQhFybU9NmyF7WlZBKIJce18E=;
        b=VEkSRPS+3F6Z4k4G28kirWjUB6XHA3g5LtgqxvbhmMqhtv466mDO10Slop1SEYYdxv
         jCeZcZsW7lyHTwO/UrxM7/LSU1JN1WBEPMGoAAsyueBKimk9g/p4qg4p2aUdO1jTAerh
         Gwp5ELzOdqJvHFpsFuRbJK67uOkzZ43mKtMlKJS+A51+ferP3GbpDwgAjkwuARjUAI8e
         /eopXx+GAu7bRQ/J14sKr1fFy6NSEAxhngRQqC0gDx930LklkGHGUYwX/Z5q4rHQffSY
         ehRKk+NqcAUZwZBjrIyis1JdRRtyhCnHboM1NAJT+eRw8tLQY9x3quK5JI3dDK4Fyurv
         D3Pg==
X-Gm-Message-State: ANoB5pl4nHvANwvCWQlLu7eL3rGrFCHPijDeg69wefmDnluDLDnTPvYp
        XPAt+NfoR5hK89y2auJt8LwEYQ==
X-Google-Smtp-Source: AA0mqf4XBZBNLqDHPdHU/DC0N6f8lDzA5/GvMqXPm4ghYzrxzndI2QiAGJwitj6kTYfdthLLBTHHCg==
X-Received: by 2002:a05:6402:449b:b0:459:2b41:3922 with SMTP id er27-20020a056402449b00b004592b413922mr4788067edb.160.1670240150767;
        Mon, 05 Dec 2022 03:35:50 -0800 (PST)
Received: from fedora.. ([188.252.220.250])
        by smtp.googlemail.com with ESMTPSA id q26-20020a170906389a00b007bdc2de90e6sm6164189ejd.42.2022.12.05.03.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 03:35:50 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     luka.perkov@sartura.hr, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH] clk: qcom: gcc-ipq4019: switch to devm_clk_notifier_register
Date:   Mon,  5 Dec 2022 12:35:45 +0100
Message-Id: <20221205113545.575702-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Switch to using devres-managed version of clk_notifier_register(). This
allows us to drop driver's remove() callback.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/clk/qcom/gcc-ipq4019.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index 9102150d144a..e4cb9e240a72 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -1795,19 +1795,12 @@ static int gcc_ipq4019_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	return clk_notifier_register(apps_clk_src.clkr.hw.clk,
-				     &gcc_ipq4019_cpu_clk_notifier);
-}
-
-static int gcc_ipq4019_remove(struct platform_device *pdev)
-{
-	return clk_notifier_unregister(apps_clk_src.clkr.hw.clk,
-				       &gcc_ipq4019_cpu_clk_notifier);
+	return devm_clk_notifier_register(&pdev->dev, apps_clk_src.clkr.hw.clk,
+					  &gcc_ipq4019_cpu_clk_notifier);
 }
 
 static struct platform_driver gcc_ipq4019_driver = {
 	.probe		= gcc_ipq4019_probe,
-	.remove		= gcc_ipq4019_remove,
 	.driver		= {
 		.name	= "qcom,gcc-ipq4019",
 		.of_match_table = gcc_ipq4019_match_table,
-- 
2.38.1

