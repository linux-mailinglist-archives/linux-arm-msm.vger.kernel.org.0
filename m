Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 660C1514ED4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 17:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378158AbiD2PQg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 11:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378143AbiD2PQd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 11:16:33 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18750D4C4F
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 08:13:15 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id k27so9430792edk.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 08:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l+Ao2RwIkRyyANPkSXXqtBch6AKumaxguIhH1CidR1Y=;
        b=emAqveVyJeyC4WuwF8N7NcYLVa+LcSLZc8Uu+9bmFtY2XC7qosw9nBSM15Et4VeWk5
         6wiLh6cEtHZomttMnIHD09BbSb2eX5yQ3n1T1OQkhVFK8zM2jHx32FAG7O7HjFvwXbm1
         gI3SgvTA/eouq5hXzQbAdg4uzFAalqoWue7UFfxCRI0UtRWJOoUjMch/lI3N6GMJ5y/k
         98KV6D6A6gNlE6v1ztbwGr+iSv914wRcTES2umwo/N2K5ybbD789xWkAR08lOhXEPqW/
         liZnUjVUltDdk+wr6i0VC1Dvbm0Xh+R91+5uYEoh1ktIIZoDHZPppmW9RwWK4hjAGvcF
         Acvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l+Ao2RwIkRyyANPkSXXqtBch6AKumaxguIhH1CidR1Y=;
        b=PTbo+Q07OJ1M8XXTM4D2TO8mjZLFP9emHCi+KdebFxNAe/LOgGyR2WmP+mb2iv4Kd8
         OVtwk4tgdEm7CZpgAWE4bxHID78G9ZFXqrrouNNWOhLAGDfWi+thJd51tTsCNlCdQ0/s
         fOrVZN/RSgJGrDQg5CAguodqdZic9IsF4cqLYJZPtzh/gP8rl7ZwmXo6s195CDXMvz6P
         gmhnTnZjCDfH2SxccsZTB2mT62Jo7OT+v8btwMONr7KoF8dVbwU82SilvTVxB11Oo/sa
         YBhmuRoc2JcpjrWk69ZZqFt3bXfXKOp2JdxABa5RuTCZvBx/22eVNe23Mdf/PaWvAzsP
         arHg==
X-Gm-Message-State: AOAM532pm4eOr+nvVTSqjS+aBdwGGRpuN1OXaWYT9imZXn1bMNEYOp7O
        jIDL0yv/iti00WqqCSVGFfPQJw==
X-Google-Smtp-Source: ABdhPJzi5dJ8Czhs0cBu3LyhHTq/Q+4bJZT8Tq3PYo2S17j/Kabihnnt9BXxbZtMl5r5w3TJtmC0VQ==
X-Received: by 2002:a05:6402:13c3:b0:425:d94b:4118 with SMTP id a3-20020a05640213c300b00425d94b4118mr31006881edx.75.1651245193575;
        Fri, 29 Apr 2022 08:13:13 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id zp15-20020a17090684ef00b006f3ef214e4esm712677ejb.180.2022.04.29.08.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 08:13:12 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, jonathan@marek.ca, tdas@codeaurora.org,
        anischal@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v1 2/9] clk: Introduce CLK_ASSUME_ENABLED_WHEN_UNUSED
Date:   Fri, 29 Apr 2022 17:12:40 +0200
Message-Id: <20220429151247.388837-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220429151247.388837-1-robert.foss@linaro.org>
References: <20220429151247.388837-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Some clock implementations doesn't provide means of implementing
is_enabled(), but still requires to be explicitly disabled when found
unused as part of clk_disable_unused().

One such set of clocks are Qualcomm's display RCGs. These can be enabled
and disabled automatically by the hardware, so it's not possible to
reliably query their configuration. Further more, these clocks need to
be disabled when unused, to allow them to be "parked" onto a safe
parent. Failure to disable the RCG results in the hardware locking up as
clk_disable_unused() traverses up the tree and turns off its source
clocks.

Add a new flag, CLK_ASSUME_ENABLED_BOOT, which clock drivers can use to
signal that these clocks should be disabled even if they don't implement
the is_enabled() ops.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/clk/clk.c            | 2 +-
 include/linux/clk-provider.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ed119182aa1b..9789ec137219 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1284,7 +1284,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
 	 * sequence.  call .disable_unused if available, otherwise fall
 	 * back to .disable
 	 */
-	if (clk_core_is_enabled(core)) {
+	if (clk_core_is_enabled(core) || core->flags & CLK_ASSUME_ENABLED_WHEN_UNUSED) {
 		trace_clk_disable(core);
 		if (core->ops->disable_unused)
 			core->ops->disable_unused(core->hw);
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index c10dc4c659e2..9038022ffebd 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -32,6 +32,8 @@
 #define CLK_OPS_PARENT_ENABLE	BIT(12)
 /* duty cycle call may be forwarded to the parent clock */
 #define CLK_DUTY_CYCLE_PARENT	BIT(13)
+/* assume clock is enabled if found unused in late init */
+#define CLK_ASSUME_ENABLED_WHEN_UNUSED	BIT(14)
 
 struct clk;
 struct clk_hw;
-- 
2.32.0

