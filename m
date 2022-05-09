Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7354451F7BE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 May 2022 11:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbiEIJPE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 May 2022 05:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237256AbiEIJF7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 May 2022 05:05:59 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C08D41D48FC
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 May 2022 02:01:53 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id b18so22599973lfv.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 May 2022 02:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ju8qIcVxu8nKYNTamtJUWMRGDCG286a6Cxhr7ezIYWA=;
        b=eJ8v2bs8NMeZ/LD29Kud2zd8sWHamaOEjf7hmouo1LWfTyhIw3DIJEPlgUS1bIucSA
         ePPaakbn+QERzc8aTw1F9CACNUTrGUD+36rl8TLcMrw5SgAkvxmhnqAcxPXLSalwdFy6
         yRp5SpregPpY/SXdAnlRL+caa0zrIx/LCVzDVlRqhqBNpqWR4TBih/ovV7tNHGqJ2So2
         yf56HHEjVGukq7D15sPd1lF4rVpksQiuswyUdBtF2H/id26mLyvBkLfIKaX7LQpGvEwG
         lDzC9eAC8OnEKQ4uaL++u0ljmK1ADVtfesFAT7Va0CCjsyTUc4ziu7jo7UrHDULfWFsn
         z+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ju8qIcVxu8nKYNTamtJUWMRGDCG286a6Cxhr7ezIYWA=;
        b=Ammg4reRnEK+2hFWs/aqxYG2jkko6E7RZ/Xiy4scHYX8TwHzjTtpO9Lb9cd1gHlRiw
         xcs7tbaG9gEyO2gbFIPKin9lQlTY/KPI1ijiJT80sjb7iOV0qVgK1bYMIjxOsnpZCogB
         m9BHNERpw6fz6Nh9cdo/vYIJzitjFoPGcgzdaeP6PoVN67eyeoGFFh9kfgkaDyaFnP12
         UQhvtNIVwGSTyx0eq90eV6bLVq076KolbEx7q4rANVImbJuKd8B/yNG4yU0D/v4grfRc
         xXixVrFR3JNRmShFjMSam0XIgwEt5RkWARDjJTvYpxw1EzUWgao3P7ABCRkGS7C8OoHD
         MZAA==
X-Gm-Message-State: AOAM532+aZJSyVkRli0nBV/2YQo2dbv1CINTj2o5MNtp5o4Eyu55nODv
        F2AZiqWKbloJoBUgq6IqHby0JQ==
X-Google-Smtp-Source: ABdhPJzoW3UTtoYpzMe/y/xA99p84CYwQq9S9lx8sgiU7+e3mU3SyD3T77LesLgTmuo0hmLAm+k7lg==
X-Received: by 2002:ac2:58db:0:b0:473:f40c:5858 with SMTP id u27-20020ac258db000000b00473f40c5858mr10828992lfo.414.1652086908359;
        Mon, 09 May 2022 02:01:48 -0700 (PDT)
Received: from localhost.localdomain (mobile-access-5672eb-224.dhcp.inet.fi. [86.114.235.224])
        by smtp.gmail.com with ESMTPSA id m5-20020a196145000000b0047255d21135sm1873219lfk.100.2022.05.09.02.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 02:01:47 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v5 3/7] clk: qcom: clk-alpha-pll: fix clk_trion_pll_configure description
Date:   Mon,  9 May 2022 12:01:43 +0300
Message-Id: <20220509090143.4140999-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220509090059.4140941-1-vladimir.zapolskiy@linaro.org>
References: <20220509090059.4140941-1-vladimir.zapolskiy@linaro.org>
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

After merging lucid and trion pll functions in commit 0b01489475c6
("clk: qcom: clk-alpha-pll: same regs and ops for trion and lucid")
the function clk_trion_pll_configure() is left with an old description
header, which results in a W=2 compile time warning, fix it.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 4406cf609aae..288692f0ea39 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1439,7 +1439,7 @@ const struct clk_ops clk_alpha_pll_postdiv_fabia_ops = {
 EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_fabia_ops);
 
 /**
- * clk_lucid_pll_configure - configure the lucid pll
+ * clk_trion_pll_configure - configure the trion pll
  *
  * @pll: clk alpha pll
  * @regmap: register map
-- 
2.33.0

