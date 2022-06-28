Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 427C655EF24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 22:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbiF1UTJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 16:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232011AbiF1USv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 16:18:51 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8DAC3F30C
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 13:14:24 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id n16-20020a17090ade9000b001ed15b37424so13813215pjv.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 13:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8HhkFJTHSSr3R0oiNgI6BacFItQ/FKV35zn7bmlHUKo=;
        b=J0oSDySY3UqtJqhuEo1Xld1Soc984phZw/4/8eC9M2p6w6WAGr9Tvy/hF0slekzVGF
         YsyHoZQjOuIKyCR9oH5YGnkPrjLEc22nzKNt3HdVrEVoudUbSL++sn86cIAoXCMA8Xiu
         6R/1gOvHeTmTj5Uu9n9jCEtm1NCGEA5+WAMGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8HhkFJTHSSr3R0oiNgI6BacFItQ/FKV35zn7bmlHUKo=;
        b=QlMgj1VOUPoMS1Z1KL59ls7kwBL++5XCz09KyuOLe2MbdWZoJ25bKTXISXCNjzfE5z
         AZN02RCWHPeVfZi6wyTdb5FQrxkGkJJBWwNcd4QdQ05EtYbeUvtuILBgfelNW+oNGg9y
         uyrLqLvQ62cdVpWSwbc7G9z0PpfmKaM556zQEsqoHEaUNovmThgEMhdHGlU/q2np/og1
         pzFHyNtiZD/A3Mr0h/hDoVm8Dv4iO3Vev0AaW7OY2+nkiExTmRD382jGBBo0Kf1/2Yd/
         N+/rdscZnRcIR5ixLp8hfKlaxEfj/yXscP0kYw8YGS2Ioq02BeXyuWfAc1dP0+/DCsFW
         2Qrg==
X-Gm-Message-State: AJIora+wrtpmt81l+KUfowl4N+BH34e7TVum/aVp9a0Q8BPFSC2aJ+v5
        bl9ItisHhJzcVju3HvXNRMfg3Q==
X-Google-Smtp-Source: AGRyM1vdR3YIxt84n8zlF2YDbKJHbQSrk2Zvn3v81QkKLTwKIXK3X+r8UqdrdPpozX6Hk4xIRyqKWQ==
X-Received: by 2002:a17:90a:d583:b0:1ee:d9c4:9c50 with SMTP id v3-20020a17090ad58300b001eed9c49c50mr1461432pju.226.1656447263975;
        Tue, 28 Jun 2022 13:14:23 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:b857:8c81:6b4c:9c03])
        by smtp.gmail.com with ESMTPSA id t5-20020a1709027fc500b0016b83990aabsm3958109plb.302.2022.06.28.13.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 13:14:00 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        patches@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Mike Tipton <quic_mdtipton@quicinc.com>
Subject: [PATCH/RFC] clk: qcom: rpmh: Block system suspend if XO is enabled
Date:   Tue, 28 Jun 2022 13:13:40 -0700
Message-Id: <20220628201340.3981860-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Tracking down what RPMh resource is blocking XO shutdown in suspend is
hard. Largely because we need external debug tools to dump the RPMh
internal state to figure out what resource is enabled. Instead of doing
that, let's just block system wide suspend in the kernel if the RPMh XO
resource is enabled by something in the kernel. This will help us narrow
down XO shutdown failures to the XO clk, and not something else like an
interconnect or regulator RPMh resource.

I'm sending this as an RFC because it breaks suspend for me on Trogdor
boards. I found out that the XO resource is always enabled on these
devices because the audio driver leaves an audio clk always on. This
means that the XO resource must not be used to determine if XO shutdown
is achievable, or we're leaving power savings on the table.

Cc: Taniya Das <quic_tdas@quicinc.com>
Cc: Mike Tipton <quic_mdtipton@quicinc.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Please don't apply. It will break suspend on Trogdor boards.

 drivers/clk/qcom/clk-rpmh.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index aed907982344..ba0e0e4b9cf2 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -70,6 +70,14 @@ struct clk_rpmh_desc {
 
 static DEFINE_MUTEX(rpmh_clk_lock);
 
+/* XO shutdown will fail if XO is enabled across suspend */
+static int clk_rpmh_suspend(struct device *dev)
+{
+	struct clk_rpmh *xo = dev_get_drvdata(dev);
+
+	return xo && xo->state ? -EBUSY : 0;
+}
+
 #define __DEFINE_CLK_RPMH(_platform, _name, _name_active, _res_name,	\
 			  _res_en_offset, _res_on, _div)		\
 	static struct clk_rpmh _platform##_##_name_active;		\
@@ -690,6 +698,10 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "failed to register %s\n", name);
 			return ret;
 		}
+
+		/* Stash CXO clk for XO shutdown tracking */
+		if (i == RPMH_CXO_CLK)
+			platform_set_drvdata(pdev, rpmh_clk);
 	}
 
 	/* typecast to silence compiler warning */
@@ -722,9 +734,12 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, clk_rpmh_match_table);
 
+static SIMPLE_DEV_PM_OPS(clk_rpmh_pm_ops, clk_rpmh_suspend, NULL);
+
 static struct platform_driver clk_rpmh_driver = {
 	.probe		= clk_rpmh_probe,
 	.driver		= {
+		.pm	= pm_ptr(&clk_rpmh_pm_ops),
 		.name	= "clk-rpmh",
 		.of_match_table = clk_rpmh_match_table,
 	},

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
https://chromeos.dev

