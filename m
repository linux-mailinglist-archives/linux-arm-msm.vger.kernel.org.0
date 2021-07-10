Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C672C3C2C95
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 03:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbhGJBft (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 21:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231708AbhGJBfq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 21:35:46 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD86AC0613EF
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 18:33:00 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id t17so26915428lfq.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 18:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IOBDG9LAdg35//Yetd5RJqxM/3l3GsplqnzVUyB90w8=;
        b=o+a0Bd/umRFuPQUmpcgFKIGy57gn34aJLEpiNJQaiZ8f5QyAUx3NjXjcXgZT0w7Ojs
         XA+CIOsaklsLvAcVWAoXtdkiZ9h8kZmqWXNcueihVq0DT541fqvn3VU8exuRvCsDg49T
         P6PaaVRaBUTO10d5ix40qpslNJ5MxN51iXP1i87trtk6LMkKfsfI573tcwNbjakdvxAp
         x0Io+sS3epZa2dNXvSQIpfLjrWIy4NY6XGiZ6wVjD1d4Um6ERTAOYFmM5Uq6fz9Mw6J4
         jzZYnWT7UBkj+/ppsr8ZmNdPwZXpyRRKRxEGcKDsHdboA7Oja0DtuaVyBF+QAWMxvYtB
         Oivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IOBDG9LAdg35//Yetd5RJqxM/3l3GsplqnzVUyB90w8=;
        b=R6yxQ3dUebgEpv7HE90pSSFB2souiI68J08xCTkFpuD9dJITEXN4yz+uuERvK4mehq
         fXS4FQMHM1PEGGxqh0fb0aaPHbwBARu0ygerPpvcWSMM4nkvuo0sUv++/Yf2UcTo9KT7
         d3HoPyjC2ZvbZCsUSeIIHVFlF+5UoWc4eVU4V++4faNLVCT4bBqIJKjIDLI7yFylFBIR
         9qs/SO0X2rYDXOiJlXAJBFkO/3lczRN1cHDxG0cWLik5p4vTGNalqprAFFboEcCE1nI1
         07l+ZcfBQfRZ7+0erbnvdZghTGywl83XDrmMQ+Gb4iLnOb3fhExzkltJNgMSc58HY4Pi
         IOug==
X-Gm-Message-State: AOAM531ORN6hEBHujTXPMDqQ9hoNwI4P14jVXmlqVDsfz9tw9ohj5uBd
        atf+r4SlyOOTdXyYTwjsXB1Gog==
X-Google-Smtp-Source: ABdhPJzWC2p/TOSh0wyi1gIKVKDmat0UWz37hByTv5E9iZKSEsS9uTSIrvhRGqol9ZYMeVtwg5F1ag==
X-Received: by 2002:ac2:4c55:: with SMTP id o21mr27576522lfk.122.1625880779166;
        Fri, 09 Jul 2021 18:32:59 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p13sm588788lfh.206.2021.07.09.18.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 18:32:58 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/6] clk: qcom: dispcc-sm8250: stop using mmcx regulator
Date:   Sat, 10 Jul 2021 04:32:52 +0300
Message-Id: <20210710013253.1134341-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710013253.1134341-1-dmitry.baryshkov@linaro.org>
References: <20210710013253.1134341-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now as the common qcom clock controller code has been taught about power
domains, stop mentioning mmcx supply as a way to power up the clock
controller's gdsc.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index de09cd5c209f..dfbfe64b12f6 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -955,7 +955,6 @@ static struct gdsc mdss_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = HW_CTRL,
-	.supply = "mmcx",
 };
 
 static struct clk_regmap *disp_cc_sm8250_clocks[] = {
-- 
2.30.2

