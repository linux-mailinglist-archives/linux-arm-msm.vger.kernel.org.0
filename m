Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77BFC3B832E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jun 2021 15:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235270AbhF3Nec (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Jun 2021 09:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235200AbhF3Ne2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Jun 2021 09:34:28 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C9E7C0617AE
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jun 2021 06:31:58 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id u20so3260750ljo.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jun 2021 06:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f0ldkE5j34OXHAqh3I/xyyl0k1n40wAos/+0qzuAEic=;
        b=nN4kNd2LBw+qLu1JnZ77bd/t3mM8E8ALtHKNmgKXifU5dgCmPrRyDI9c/vsZhVZMUW
         SZ12CTcg11NmQ6Bsah1DYL175Lwzk3AhA2RFLOMAgxIv5v/V1TeojFzwqhD9pbaOmbrT
         vrHMUA5SW534De2TuTTjvuyciT4bbGpuBlQPm8Ytvz34j+ZyYfWU/xFyjS/bdvnps53a
         sLD9inZYMZuVUKRkRO/Y1MPDlJ/Da5nsSSFjfAxFzKGONgbi20bTLWZDn8sjsD8jG4QE
         TuTy9ZmQVO2bA9rQVf1G4vs3IfL2dQDBu/2Pc0kD+VEgs5m78ItS2XwlpR2h/eEVHQbj
         9LtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f0ldkE5j34OXHAqh3I/xyyl0k1n40wAos/+0qzuAEic=;
        b=K/Z9iNtIcFRFmjJxTyeGLyAQJhiaUkuDIC+fvsr/mzlK5LyOfNfa1URAjjGvOX/Bxo
         E29xwZdN42pHj8RppKSVXUqv5UPkQvTPM3FPvvoc0ADicr0Ev0IZBPMD33S+j+yC6Knt
         SnZw1S2rVJJTEBHYSeniCrpZFkgT6loTkniRHtPrJwgp1D+f4EPHQg7riRdZk0srgs8J
         4PDWI851Xq/cFo6Y2RDMbXpY3lZnb8Fp408ZV3jOkl9vwRxDi99uyhnJJq2uFjIUs/eP
         ILOKWryR7XYcjawYxdC1dpWHBPU/sUtFTZ3XpEns6lifM43FP4xalMz6Q2aE8PQUnl26
         IJwQ==
X-Gm-Message-State: AOAM5311Aah4b+7CS/h59ItdqeOOw0FwnC9++NiO5O0dGFclLP7TOkm2
        cIaG5NL/+FXQQ3R8DZWwtqAVJA==
X-Google-Smtp-Source: ABdhPJxr+7YpD56iuPGLpJn8os8tptok8/A09ts9VMan+Nfe+HMIP2f6hj1eOMhVhDYwejrInlnRog==
X-Received: by 2002:a2e:9bcc:: with SMTP id w12mr8056907ljj.123.1625059916603;
        Wed, 30 Jun 2021 06:31:56 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x20sm1578098lfd.128.2021.06.30.06.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 06:31:56 -0700 (PDT)
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
Subject: [PATCH 5/6] clk: qcom: dispcc-sm8250: stop using mmcx regulator
Date:   Wed, 30 Jun 2021 16:31:48 +0300
Message-Id: <20210630133149.3204290-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210630133149.3204290-1-dmitry.baryshkov@linaro.org>
References: <20210630133149.3204290-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now as the common qcom clock controller code has been taught about power
domains, stop mentioning mmcx supply as a way to power up the clock
controller's gdsc.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

