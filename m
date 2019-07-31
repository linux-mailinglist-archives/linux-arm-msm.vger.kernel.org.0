Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60D967CE94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2019 22:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727520AbfGaUar (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Jul 2019 16:30:47 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38966 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729437AbfGaU3i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Jul 2019 16:29:38 -0400
Received: by mail-wm1-f67.google.com with SMTP id u25so50646847wmc.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2019 13:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6UZkyijByMpuxE0Xbsk6WcUcxOmUbJF19dsM5QH8BkY=;
        b=xZevYhhz/KWW804fwxTCRJYZrjrhd2ux0NAhpibY7RniDQTM2Xc5Nupcd/skVMUyU7
         29Df1ZK1VoZAXcIPtispxhZ19rQLny647TX3/OkH04BMHAtTl370i3cIsF7HOrMWBMU/
         3Qp3gs8F1H7ZHaXzjC1LDvhDKOk1uxraJZBbTciSG4ORbVxCfJwPZiyXWJkZM/KO8the
         UeMBPPfrDS/zFvFaKI4/IJN3z5rI4TvBLhzee0AK9fA7HZJ1CSheeXR3xDVbu6fBrkB/
         IhkTlK0mP+PXftXZ4eLqdj6WJZ2Yswfnej+JLPBKkYaaJyfOuBpV/NoWLmV8UJXprARs
         EC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6UZkyijByMpuxE0Xbsk6WcUcxOmUbJF19dsM5QH8BkY=;
        b=XSexr40ceYZsKKrY3xdKWkRjHMNG2J0/Dd0zxrZ7qmoqBIJf9e/YbMsjxZDWDwL0O+
         AGIq6RR0x728JUT0ksS4NZxJVirmO3Enuu+6jvPQv+knta7OMTpw8s4HVE0eIB2ijtcm
         5UrHTOu7D8d7w7v2R9VjbRW8nFc9HtbnDxBR/csGFzXyXQHFvO5j4iqeoiiIMBLP/QRZ
         72oW+YXm1Fnfc6H+1/inqdZ51U/hgIr8/u7fkq3QRr3G7rK4vYVNT3y1o7ib/vMfClgE
         Jz+jRrBT9j+h66839+kg3aJWS0WqJbE+GCYa7qjEDOeaKnzGPlliSyQ5c83qxJqp+5Br
         jwuw==
X-Gm-Message-State: APjAAAWRN+WPW/4vwk5GVLY2QiCCV6wDyBo16Txjh3KeCq9b4sCrkt19
        Xso+jGogUgwrSl8cMdsIxJU64w==
X-Google-Smtp-Source: APXvYqzP586YtICz54f960MhvPMqes7jULgYHFPxyNSTSFX+eCshUCp1fHhAm4BIKrWpMOAsl7jFBg==
X-Received: by 2002:a1c:ca06:: with SMTP id a6mr14944909wmg.48.1564604976566;
        Wed, 31 Jul 2019 13:29:36 -0700 (PDT)
Received: from localhost.localdomain (19.red-176-86-136.dynamicip.rima-tde.net. [176.86.136.19])
        by smtp.gmail.com with ESMTPSA id i18sm91905591wrp.91.2019.07.31.13.29.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 31 Jul 2019 13:29:36 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org,
        sboyd@kernel.org, david.brown@linaro.org, jassisinghbrar@gmail.com,
        mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org,
        will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au,
        heiko@sntech.de, sibis@codeaurora.org,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net
Cc:     vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: [PATCH v4 01/13] clk: qcom: gcc: limit GPLL0_AO_OUT operating frequency
Date:   Wed, 31 Jul 2019 22:29:17 +0200
Message-Id: <20190731202929.16443-2-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731202929.16443-1-jorge.ramirez-ortiz@linaro.org>
References: <20190731202929.16443-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Limit the GPLL0_AO_OUT_MAIN operating frequency as per its hardware
specifications.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 8 ++++++++
 drivers/clk/qcom/clk-alpha-pll.h | 1 +
 drivers/clk/qcom/gcc-qcs404.c    | 2 +-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 0ced4a5a9a17..ef51f302bdf0 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -730,6 +730,14 @@ static long alpha_pll_huayra_round_rate(struct clk_hw *hw, unsigned long rate,
 	return alpha_huayra_pll_round_rate(rate, *prate, &l, &a);
 }
 
+const struct clk_ops clk_alpha_pll_fixed_ops = {
+	.enable = clk_alpha_pll_enable,
+	.disable = clk_alpha_pll_disable,
+	.is_enabled = clk_alpha_pll_is_enabled,
+	.recalc_rate = clk_alpha_pll_recalc_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_fixed_ops);
+
 const struct clk_ops clk_alpha_pll_ops = {
 	.enable = clk_alpha_pll_enable,
 	.disable = clk_alpha_pll_disable,
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 66755f0f84fc..6b4eb74706b4 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -104,6 +104,7 @@ struct alpha_pll_config {
 };
 
 extern const struct clk_ops clk_alpha_pll_ops;
+extern const struct clk_ops clk_alpha_pll_fixed_ops;
 extern const struct clk_ops clk_alpha_pll_hwfsm_ops;
 extern const struct clk_ops clk_alpha_pll_postdiv_ops;
 extern const struct clk_ops clk_alpha_pll_huayra_ops;
diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index 29cf464dd2c8..18c6563889f3 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -330,7 +330,7 @@ static struct clk_alpha_pll gpll0_ao_out_main = {
 			.parent_names = (const char *[]){ "cxo" },
 			.num_parents = 1,
 			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_alpha_pll_ops,
+			.ops = &clk_alpha_pll_fixed_ops,
 		},
 	},
 };
-- 
2.22.0

