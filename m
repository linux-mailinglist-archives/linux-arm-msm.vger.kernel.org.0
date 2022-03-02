Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECF154CA2BC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Mar 2022 12:05:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241230AbiCBLG0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Mar 2022 06:06:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241220AbiCBLGX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Mar 2022 06:06:23 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A8C4D273
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Mar 2022 03:05:39 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id 15-20020a17090a098f00b001bef0376d5cso1465946pjo.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Mar 2022 03:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GBQoREQeTbmDxGp575UEke733214jz66JUBFcdmxOO0=;
        b=XPc1jQUAv0qn6kIZ+n2Wk2fRjUpXTLK/E3E+R1hhxlnMkio6OSmRSr1mSz9wqSWTFU
         ePxDTabTXEUTT+CyqEEE9XC8Wx4jDu41rJXG8rL7O8QNf0fPWjmrC9p8qZlTibscmG5s
         ocfAMvt8sYU7ZyUKKaf8rCP0snCW5BGNxXWIIgCSDdd72CYzBBy0eW7OuHd1+enOPT0I
         ntlRd96iHJ6q/B5DWIFLCSLD/r33z3TAobtEYHs0Hzafn5wrvx5jY/n9hRwlnlspt4jS
         1zY18O4uMrp5kGCgGpnDv2szcbU3ZIKlFTtk6boHbOmgNkoSmLTkbPI/uAl6sZQBt2GN
         lAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GBQoREQeTbmDxGp575UEke733214jz66JUBFcdmxOO0=;
        b=xeO8iDltz8MZXSW5K4DS/Fw4a5AjAZByc15gh9nSA2xWvZ+YCyl06Fq3+weFeGzqwx
         zqnT/ecO/c/R2VmwbTWW0cSIRvSuSrM2zpTyEfj3aLbpOGTEOrs12D6jwSpaDdkJGRO1
         uCaoe15YL89ft/9fllFRwAlUyHpZMSIklzNKJbTv2IkkqknuUrSCJnHbJDfQfjOxhLjM
         +TrwRMSViKIX/eB6BWpN57BrmqH2jgstPv94OGIDoHHYxkQGojYo5TkdBGHxUIDKz2vw
         yhuMKm2bBRitELnTEzM4x2k1LHi/wP1yN0ua4mrRvkcVky23k2ENk1y45SdP9HIWga9W
         AquQ==
X-Gm-Message-State: AOAM531ZFfGZQ55h2hUqAv3oRMP0Gdniusv6ocKq8VD6mjvulveOi1/e
        bOkIxj3JBSR3BiB3GQ6kLfde2EOA+/e4ZA==
X-Google-Smtp-Source: ABdhPJxW9I58ByWFSkIjzaInrqS2x1W8zDYYj3hHPEy54tphpEVvT64oo9Dl2pM/jOfSW/3gMfglew==
X-Received: by 2002:a17:90a:f02:b0:1bd:ab6:42ec with SMTP id 2-20020a17090a0f0200b001bd0ab642ecmr22831010pjy.18.1646219138899;
        Wed, 02 Mar 2022 03:05:38 -0800 (PST)
Received: from localhost.localdomain ([171.50.175.145])
        by smtp.gmail.com with ESMTPSA id hk1-20020a17090b224100b001b8cff17f89sm5049186pjb.12.2022.03.02.03.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 03:05:38 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org, tdas@codeaurora.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 2/5] clk: qcom: gcc: Add emac GDSC support for SM8150
Date:   Wed,  2 Mar 2022 16:35:05 +0530
Message-Id: <20220302110508.69053-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220302110508.69053-1-bhupesh.sharma@linaro.org>
References: <20220302110508.69053-1-bhupesh.sharma@linaro.org>
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

Add the EMAC GDSC defines and driver structures for SM8150.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/clk/qcom/gcc-sm8150.c               | 34 +++++++++++++--------
 include/dt-bindings/clock/qcom,gcc-sm8150.h |  1 +
 2 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
index 245794485719..08ba29e3a835 100644
--- a/drivers/clk/qcom/gcc-sm8150.c
+++ b/drivers/clk/qcom/gcc-sm8150.c
@@ -3448,22 +3448,31 @@ static struct clk_branch gcc_video_xo_clk = {
 	},
 };
 
+static struct gdsc emac_gdsc = {
+	.gdscr = 0x6004,
+	.pd = {
+		.name = "emac_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR,
+};
+
 static struct gdsc usb30_prim_gdsc = {
-		.gdscr = 0xf004,
-		.pd = {
-			.name = "usb30_prim_gdsc",
-		},
-		.pwrsts = PWRSTS_OFF_ON,
-		.flags = POLL_CFG_GDSCR,
+	.gdscr = 0xf004,
+	.pd = {
+		.name = "usb30_prim_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR,
 };
 
 static struct gdsc usb30_sec_gdsc = {
-		.gdscr = 0x10004,
-		.pd = {
-			.name = "usb30_sec_gdsc",
-		},
-		.pwrsts = PWRSTS_OFF_ON,
-		.flags = POLL_CFG_GDSCR,
+	.gdscr = 0x10004,
+	.pd = {
+		.name = "usb30_sec_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR,
 };
 
 static struct clk_regmap *gcc_sm8150_clocks[] = {
@@ -3714,6 +3723,7 @@ static const struct qcom_reset_map gcc_sm8150_resets[] = {
 };
 
 static struct gdsc *gcc_sm8150_gdscs[] = {
+	[EMAC_GDSC] = &emac_gdsc,
 	[USB30_PRIM_GDSC] = &usb30_prim_gdsc,
 	[USB30_SEC_GDSC] = &usb30_sec_gdsc,
 };
diff --git a/include/dt-bindings/clock/qcom,gcc-sm8150.h b/include/dt-bindings/clock/qcom,gcc-sm8150.h
index 3e1a91876610..40596b9ded06 100644
--- a/include/dt-bindings/clock/qcom,gcc-sm8150.h
+++ b/include/dt-bindings/clock/qcom,gcc-sm8150.h
@@ -243,5 +243,6 @@
 /* GCC GDSCRs */
 #define USB30_PRIM_GDSC                     4
 #define USB30_SEC_GDSC						5
+#define EMAC_GDSC						6
 
 #endif
-- 
2.35.1

