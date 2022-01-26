Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB1949D550
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jan 2022 23:19:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233507AbiAZWSy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jan 2022 17:18:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233470AbiAZWSx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jan 2022 17:18:53 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA3DC06175C
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 14:18:53 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id g20so563991pgn.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 14:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FZouSr9TAlelZRwtS6TKOdeYH1dxDyHrivrG4UWi6aY=;
        b=pCw1JaoBI87xZyASQ2zBq0kUaHQkbXAeg3PzhyvorB8ky9/UyZB0QtGrUmx1Z0pqgd
         AGh8SVZOQqMOAaVdWo7urIWGh3MNWA5u/wQ4IIiEDYDnpSAxXs8PI349uL4A3hqL5KSO
         e1celx5uilrES4T0WlxSRy5giPrlHehRV4NEk780iX+myM/MPzfZXg9+d3wLF5HZTI+0
         xIHPWDQ/JdjbcHqYIJOGGUufDLrvMRxUSQ1idA1U14MqVGVK7EGMM5A85+gpBalsP2nn
         yk7mQ99Isi0W0oyjPWNTIXdoZj9kfVb0raeK1DqC9xtRcVwFzBJK3u/R5KefvcEpcFjJ
         +tSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FZouSr9TAlelZRwtS6TKOdeYH1dxDyHrivrG4UWi6aY=;
        b=TCMYoaXpYRU1G1CT6Ma0ghh/KHY9rJfweQ14F8VTUGI7CMRtuftxn/QRmSbrgFPzXp
         gHDKypHNaC4s0TrYK3CFfASQiEgxRdYbWya8fgrOfbW3gy7QVfpMXzuSoPGv2ohTWgoh
         BnQKBQoEhwr3XPiECXi+8BvtbPSXdEFb91niS/D4voyEOHTpsfTnsFUJ/YIiZzrWxU9t
         4E2OOwfCWWiD1ftO0I8i1KSJ/jMmAq+OSp6KY+VsLrDd5uPe7V6kP3/Jld99ZmN1Ktrt
         mNV6ABoCAX0kBYNiCvij0aQhyS/Rc2CPaRMImxefPslw6CSLeTssgOQHMnXduuceBUWv
         RXoQ==
X-Gm-Message-State: AOAM532wsOHqfsE/cwhDJwWTq9HLHLq8ybVuW2yDshONS+GZxrCO6qXM
        4yk84zWhmrMarJ8GTMb0OtQikKTyLA4RJiWj
X-Google-Smtp-Source: ABdhPJwBdBPkz8G0TIYzxSkkmqHgn6ds8XO8ZxbMCK49rP+RL4F0T2bMG7KCVBpwABoxWWoJIJRAUQ==
X-Received: by 2002:a05:6a00:1956:: with SMTP id s22mr397112pfk.48.1643235532791;
        Wed, 26 Jan 2022 14:18:52 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1f3a:4e9b:8fa7:36dc:a805:c73f])
        by smtp.gmail.com with ESMTPSA id t17sm4233742pgm.69.2022.01.26.14.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 14:18:52 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, sboyd@kernel.org,
        tdas@codeaurora.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, bjorn.andersson@linaro.org,
        davem@davemloft.net, netdev@vger.kernel.org
Subject: [PATCH 8/8] clk: qcom: gcc-sm8150: Use PWRSTS_ON (only) as a workaround for emac gdsc
Date:   Thu, 27 Jan 2022 03:47:25 +0530
Message-Id: <20220126221725.710167-9-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126221725.710167-1-bhupesh.sharma@linaro.org>
References: <20220126221725.710167-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

EMAC GDSC currently has issues (seen on SA8155p-ADP) when its
turn'ed ON, once its already in OFF state. So, use PWRSTS_ON
state (only) as a workaround for now.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/clk/qcom/gcc-sm8150.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
index 2e71afed81fd..fd7e931d3c09 100644
--- a/drivers/clk/qcom/gcc-sm8150.c
+++ b/drivers/clk/qcom/gcc-sm8150.c
@@ -3449,12 +3449,16 @@ static struct clk_branch gcc_video_xo_clk = {
 	},
 };
 
+/* To Do: EMAC GDSC currently has issues when its turn'ed ON, once
+ * its already in OFF state. So use PWRSTS_ON state (only) as a
+ * workaround for now.
+ */
 static struct gdsc emac_gdsc = {
 	.gdscr = 0x6004,
 	.pd = {
 		.name = "emac_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_ON,
 	.flags = POLL_CFG_GDSCR,
 };
 
-- 
2.34.1

