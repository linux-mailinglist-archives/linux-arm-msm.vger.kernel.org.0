Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0933C1E6C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 06:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbhGIEeh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 00:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231243AbhGIEe3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 00:34:29 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 977F5C0613DD
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 21:31:45 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id v14so20679481lfb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 21:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f0ldkE5j34OXHAqh3I/xyyl0k1n40wAos/+0qzuAEic=;
        b=evja71V+pcmqd6EmSv+Kg5ZvqKs56bvDZjR9SCjtxVgotJ6idANj1ATscxqed8yhrH
         BqZTpJzJV8b2/mRGTTUw/C87V0Ub/9ljyKAib/5HmOck6HhDX9xbtcYfIDoh6B/YRcFO
         FvHhKQEyAUsy4q66QaZtOlUhXFfULRgLI0Yh1LDLF19WJqfLFoD0DGuokdd5v0YC1Yw6
         nACS2JKBe1KaPMWI2WkDogCGf5h7LS/kMaTVUidb/nitQziDHKrtzOHhImfuus0axEJE
         ViuhFR3ovCswl+VA/6QiXst+hy99HD96ktL4Qv7YVQa/qw+Dof8NNthKI1nTf9NqFV3+
         XJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f0ldkE5j34OXHAqh3I/xyyl0k1n40wAos/+0qzuAEic=;
        b=Vji+H0pufY71iYkFw2f6Js49HYmLKfIsj22U+r1XsAHQQdlDJXjJNnSF4ov9i5+BcW
         iVc/OnyG3dg7V7uUMfofQuXILnsEFA0abirpZGgBpJ86MjNthgfTZ1tEcthpY8il8353
         skXXMrndERpQxTH7ojkQyoKsGmTxXRZd5asy2H3Vv/pYAwdlwB9AkLQEa/QFwZlYfYnM
         +E2K9pFBF7yl3EkrMIb+XjP+gtDxf9OBgsgfFe5vaeGzZyEpa9L5Yx7P33MgKOXpWBuZ
         JynQVywXB3oXN829pY4yTBqiLwI6ds2wRTbqSlzIVxhUhM+abKD3cn02ilNtQif2uYUL
         3+4w==
X-Gm-Message-State: AOAM531R9R+UHe5uI7eV9Rrjp2/ubzukfTwZPKs0XTLK+bc+SCvm0D1A
        u82YHoO/PI36qli1GIunQbe5kA==
X-Google-Smtp-Source: ABdhPJwZptgyRZPC0nRqYzgnhWBWhgKSY6kj6YkrVEHm0vPEIBEUMmZjkoNbraIyVlKA+ynzcecnJg==
X-Received: by 2002:a19:408c:: with SMTP id n134mr26254126lfa.329.1625805103973;
        Thu, 08 Jul 2021 21:31:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h1sm13028lft.174.2021.07.08.21.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 21:31:43 -0700 (PDT)
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
Subject: [RESEND PATCH v2 6/7] clk: qcom: dispcc-sm8250: stop using mmcx regulator
Date:   Fri,  9 Jul 2021 07:31:35 +0300
Message-Id: <20210709043136.533205-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709043136.533205-1-dmitry.baryshkov@linaro.org>
References: <20210709043136.533205-1-dmitry.baryshkov@linaro.org>
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

