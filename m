Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0550273FA56
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 12:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbjF0Kks (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 06:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbjF0Kkr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 06:40:47 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68652E69
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 03:40:46 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-313f59cd193so1724226f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 03:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687862445; x=1690454445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UOP/HXwOfjROV0iDHrU1g1p6LD4GcCF3K/FghLtNOU=;
        b=y5+DnJgJYphY781NuJroMLh1mIZh3+eUMQjDpKMhsyWLF+SMHN4tPapiVgi3uiVbX4
         1cUL4yRaDVQDHkrmMUBVplhWuXMbXP+0ZQG73WO5b4lmq+d3M+fh3InkHRBGLtpEpC8E
         K3l0vVj/mKmznriOrTPlcfUYBiQSVN1hKLJc5Qzp7aiPPw6rW1zXRUGgWGCjQiKhuHCK
         ofV5FjoVrXUkRnofsmwXXInwtxy0KKDN6i/7llXeIAcygky0QAttWLhABjAOl19KApyT
         XeJ1rK/ArsbtnW+kqXlmSsiGXZnrYx7x70hdgWNTL5YYA1e6dkSg0Ja4Vrj8oFHezqwU
         jPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687862445; x=1690454445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/UOP/HXwOfjROV0iDHrU1g1p6LD4GcCF3K/FghLtNOU=;
        b=hBNTNREYy3276GKtGZ20z78Ntu+qXRpznbBLh1QRpB7lSSm72PGTci4nDyeyUMy5mp
         WluKlABEt98Y0mBnlegfQm4FvG9R4D8fAiaoG3Qngg052uhP7QhhkdxiNac2sUH29Em6
         4lNY3F5gPCb5kCqGp0rJnO8CYb/iX+tOL6CFzokae3SBu78Rr9ow/EnpdgdfF2U2qoPq
         doyFVj+2dNHE1vMT/8KfU29yJPrJAGn7278P0xP/RjHH1IELjbzesVpa8gWHHcnVvFAo
         ATVSVQwxcJeaflpnEBOa9/twSk6SWuHTec3dI4CpUVEbZeIL2VpM/2nLwTCBS3l3fk/u
         vG7g==
X-Gm-Message-State: AC+VfDxq2vpVWz56K/5I9c8TWMfdUWUc8afSv3sHzbydL9T2ZEQ/HL1A
        c8pE4TLTSNAdxuaqzsvgWDnXroG319i3or+MEk8=
X-Google-Smtp-Source: ACHHUZ4qAygidQOG1GKKu2XwuyqAylSRU5Ym/1VTMrpY2Q7ErH4bT3tOZXV/sh5hy6eTJ3BMmLgx+g==
X-Received: by 2002:adf:fa83:0:b0:30d:44a1:99a with SMTP id h3-20020adffa83000000b0030d44a1099amr24120038wrr.54.1687862444873;
        Tue, 27 Jun 2023 03:40:44 -0700 (PDT)
Received: from hackbox.lan ([62.231.110.100])
        by smtp.gmail.com with ESMTPSA id a10-20020adfdd0a000000b0030af15d7e41sm10203750wrm.4.2023.06.27.03.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 03:40:44 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        avel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@qti.qualcomm.com>
Cc:     linux-pm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH 2/2] clk: qcom: gdsc: Add support for set_hwmode_dev
Date:   Tue, 27 Jun 2023 13:40:33 +0300
Message-Id: <20230627104033.3345659-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230627104033.3345659-1-abel.vesa@linaro.org>
References: <20230627104033.3345659-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Implement the GDSC specific genpd set_hwmode_dev callback in order to
switch the HW control on or off. For any GDSC that supports HW control
set this callback in order to allow its consumers to control it.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 5358e28122ab..9a04bf2e4379 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -314,6 +314,26 @@ static int gdsc_enable(struct generic_pm_domain *domain)
 	return 0;
 }
 
+static int gdsc_set_hwmode_dev(struct generic_pm_domain *domain,
+			       struct device *dev, bool enable)
+{
+	int ret = gdsc_hwctrl(domain_to_gdsc(domain), enable);
+
+	if (ret)
+		goto out;
+
+	/*
+	 * Wait for the GDSC to go through a power down and
+	 * up cycle.  In case there is a status polling going on
+	 * before the power cycle is completed it might read an
+	 * wrong status value.
+	 */
+	udelay(1);
+
+out:
+	return ret;
+}
+
 static int gdsc_disable(struct generic_pm_domain *domain)
 {
 	struct gdsc *sc = domain_to_gdsc(domain);
@@ -451,6 +471,8 @@ static int gdsc_init(struct gdsc *sc)
 		sc->pd.power_off = gdsc_disable;
 	if (!sc->pd.power_on)
 		sc->pd.power_on = gdsc_enable;
+	if (sc->flags & HW_CTRL)
+		sc->pd.set_hwmode_dev = gdsc_set_hwmode_dev;
 
 	ret = pm_genpd_init(&sc->pd, NULL, !on);
 	if (ret)
-- 
2.34.1

