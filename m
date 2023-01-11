Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A363C66637E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 20:20:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235353AbjAKTUR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 14:20:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234039AbjAKTUK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 14:20:10 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 169DD167D3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 11:20:09 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id g14so17028057ljh.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 11:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xw/nftZkBpYy5/CKpZ6ADRGZbB0kdGeQLhoDqoX3D5Y=;
        b=At0iGjNwCeKyoIWJgfWJg1xJndtVDb0ib0fymno2wrkwLckZoIyRirJh59zdp42qi8
         h5GKdiXR4HdW6Z6ZN46VABArx2nj55z9ddt1cDau9QuTp+kCBw388BEWzGQVFcw7oAH3
         XeOEdHQolRQQgYuYpR/tEhJpmwLXBh1brUjUdmt77OPAacFuR7V/yol1AarjSSLSPBLv
         ldTJeJvVbjHz0QJRbopjnL6y/4w7cZWWrOXvLEHbK1jcdoRuZIUSKyR1PFYZVYvV9nwt
         WII+J5GamBQnw2J6NYs0oJQD6T4ODJZ8/0+TN8hD6A2tF1WmWhmnUe1Oq8LSEQbiY0lL
         /4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xw/nftZkBpYy5/CKpZ6ADRGZbB0kdGeQLhoDqoX3D5Y=;
        b=vxaCfPKXmgbxBYxrjz9hE+oN/77UqIwawkuTlqfVTMrHEhp38VDlh05VvUNL0hZK6y
         Yq2AMHXJS0tBxzuRMO8SFOg0FgntSwOlce278tJ00Rkoj51Gp9SMjPEua3xh/l7yQFlz
         YED/d63lv/ydEFzEQoMKxQkFWj/f1/zOODMVGKmqop7vRpk66k/eszSC9V/LLxj6/9dN
         5fFCPey/miC9I17dGMJUcGkru/jbzIeBoyvr3jXpY4thKy2y3zzeFt0oQYeFd0WClItb
         O6Cff4j6qvyqBU3G5W4ZW7bfWF87G7I5mBNKYrxUe8PVjheUMwlfN4wP6N9GDy8+CsgI
         o66A==
X-Gm-Message-State: AFqh2kqW2vNEAR/yHVUUQLCY2jstnRrWxzui5eW+qdQklC4t7K5i4Ruj
        yMtEeojiOiHEXAaJtXOldNmvNw==
X-Google-Smtp-Source: AMrXdXsD1tgE7i1IfIh/AaVUSHKkgZJq/MnvP5Q3Bi+B/qnOlkg9J1eAPNC2qQnMAw/wYVbC31ndxw==
X-Received: by 2002:a2e:b169:0:b0:283:da38:427d with SMTP id a9-20020a2eb169000000b00283da38427dmr3618149ljm.49.1673464807523;
        Wed, 11 Jan 2023 11:20:07 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bj36-20020a2eaaa4000000b0027ff2fabcb5sm1807787ljb.104.2023.01.11.11.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:20:06 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 03/13] clk: qcom: cpu-8996: fix the init clock rate
Date:   Wed, 11 Jan 2023 22:19:54 +0300
Message-Id: <20230111192004.2509750-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
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

Change PLL programming to let both power and performance cluster clocks
to start from the maximum common frequency.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index ed8cb558e1aa..d51965fda56d 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -102,7 +102,7 @@ static const u8 alt_pll_regs[PLL_OFF_MAX_REGS] = {
 /* PLLs */
 
 static const struct alpha_pll_config hfpll_config = {
-	.l = 60,
+	.l = 54,
 	.config_ctl_val = 0x200d4828,
 	.config_ctl_hi_val = 0x006,
 	.test_ctl_val = 0x1c000000,
-- 
2.30.2

