Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C962379E18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 06:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230016AbhEKESd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 00:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229465AbhEKESa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 00:18:30 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20FA9C061761
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 21:17:23 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id w22so4002155oiw.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 21:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YvC5nf7k+zrK5xWC4RDKTwoK+EY80CWdjHtrEnmOMoE=;
        b=q0tsCRjFghXORwNbjdqUGRBvoO1woiRrfKvI4/Ex5IY3XtemQkhdq1cpeNwWTwstpd
         00aUKnOGwv7hqL+3gphyC6GOCvBtHwrj5+EqQqWfd6FXkjc/4luFzX7AQ9X0mxOwDarP
         FynZp5vkMRK/EJ3PNtXuAqco/Hu/aXdpWtBB+MmfmseXv1cX2RXCN/DPYSykv9GYaT6e
         REw8tsQ5XoaS1DAqxx13m06kE01EKKxdM3pKa0+6TiZqxZD9hgAT5I6Uv7tEtcmetsCE
         yyiyaqz9XPaMOQNVHZXvaVb407CjWE4FYRcRrlR/8iPdQVrnOaJYcY5jFVqo5qgI0JPo
         Chng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YvC5nf7k+zrK5xWC4RDKTwoK+EY80CWdjHtrEnmOMoE=;
        b=Y56G3FZ4dxz5XnsJ3Y9HznyCN/ygpY+2FNXkt9uXZvEvM1HtrSMvQDoz95VBdTQtc4
         o3Rdtu0LE2wplEf4NsD9JwQCF5BkEMYxaUQ0/zDjXC5Y0OiuFZy74uAwuFEYi0vrT1cD
         qmm2/JyVxZsXu39hXSt71JzGgPc0PusudweFFEOPjYeJJ7oROvRImgKUshnPg6LdKYhn
         W068tbPMYQCRmyp/AFC7GacGX4+/rpYvHpVIZXF4GMxIU8hr+vlYFxdNOdK7lKf2suwT
         LIeyR/KOp051jtE0DZ3keI1JOHEsvCeGgirjvp52vxcozVcemIVhcAG1VIrasBiIbuMt
         pq7A==
X-Gm-Message-State: AOAM531Pg5vPLY76dbdrwzvkBXe5uQvMJCCw2VZxiZuOzR1nyLtkPqu+
        jkUY519uY2+QdWgg8WBazux+8Q==
X-Google-Smtp-Source: ABdhPJx6KSP5d9a5oHmEKCqxtRP1plW7IDaQtDhXQyrc537PKVx8NrelBd+Suas4TNYEuITlIshdUA==
X-Received: by 2002:aca:da04:: with SMTP id r4mr1974968oig.123.1620706642271;
        Mon, 10 May 2021 21:17:22 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:e623:42c1:10df:adff:fec2:f1d])
        by smtp.gmail.com with ESMTPSA id v79sm1367168oia.14.2021.05.10.21.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 21:17:21 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: dispcc-sm8250: Add sc8180x support
Date:   Mon, 10 May 2021 23:17:18 -0500
Message-Id: <20210511041719.591969-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The display clock controller in SC8180x is reused from SM8150, so add
the necessary compatible and wire up the driver to enable this.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml         | 1 +
 drivers/clk/qcom/dispcc-sm8250.c                              | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
index 0cdf53f41f84..6667261dc665 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
@@ -20,6 +20,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,sc8180x-dispcc
       - qcom,sm8150-dispcc
       - qcom,sm8250-dispcc
 
diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index de09cd5c209f..12ef6f1d5c62 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -1037,6 +1037,7 @@ static const struct qcom_cc_desc disp_cc_sm8250_desc = {
 };
 
 static const struct of_device_id disp_cc_sm8250_match_table[] = {
+	{ .compatible = "qcom,sc8180x-dispcc" },
 	{ .compatible = "qcom,sm8150-dispcc" },
 	{ .compatible = "qcom,sm8250-dispcc" },
 	{ }
@@ -1053,7 +1054,8 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
 
 	/* note: trion == lucid, except for the prepare() op */
 	BUILD_BUG_ON(CLK_ALPHA_PLL_TYPE_TRION != CLK_ALPHA_PLL_TYPE_LUCID);
-	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8150-dispcc")) {
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sc8180x-dispcc") ||
+	    of_device_is_compatible(pdev->dev.of_node, "qcom,sm8150-dispcc")) {
 		disp_cc_pll0_config.config_ctl_hi_val = 0x00002267;
 		disp_cc_pll0_config.config_ctl_hi1_val = 0x00000024;
 		disp_cc_pll0_config.user_ctl_hi1_val = 0x000000D0;
-- 
2.29.2

