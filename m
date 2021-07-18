Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A72013CC892
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Jul 2021 12:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233084AbhGRKwS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 18 Jul 2021 06:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233155AbhGRKwP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 18 Jul 2021 06:52:15 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77885C0613E1
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jul 2021 03:49:15 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id i5so24294353lfe.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jul 2021 03:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ClSRhnm8pHzVjF/xtq0qJLqRvgNXebRM90lbbmZW9cA=;
        b=KX9NZ39PZr3mzqRFuQGX6fZfO1ugSx3NK9JYFRfGFK98HMgMqbTUuKXR335d3B6sJ1
         WOjzSr19/6d1pEGtkD+RyumWSLsucsSlIJAPGpJAZ8h53nxpmSN3/whvfgwOGAHuxWYV
         drOPB9gQn84VbCYN26r68X4u5UyvD57BIfaiWwLnQ4qdOblhRG/fhiLbwAUFW6kWGcEu
         pYELuXRI0WU5VeoylywgD7t8k90s5fDvxEUXnXdITyv+eipNpalYvlnV8BBS1UCZzqKo
         UZExonrhn405UU/00a2bygJI3xRtUDEjxo+LIW40vZJY3nOjTuy7Mk11CsV5OmVZAHZ/
         1E9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ClSRhnm8pHzVjF/xtq0qJLqRvgNXebRM90lbbmZW9cA=;
        b=lDHtGPcWrYpxK+uOB014o8pvwIaIkWRKcl/mt7qOgXRafq3ROKA+6rkU9xoviG9RP1
         vMWwvfFarBk7tXZbpBCAI3hP4uwnyYIwjkp+8c/1z98POkebCkugBIdgksr7+H5f5xEu
         q8Z1xGk8/RKGGZxqSAkl6DXnD53aZrxSbypGmqMudti8Mu+ClL8D2qbMjfXs9ehW1pKs
         7TeSE8QuCE5YsAK8E1+7ooVwt4fCjYT96DwMzi0EmpNDbCETT3bwH3JaenKjIrRXapz+
         bHXugU/5uzZAKCGuNrW4E0eOocvvIb8W8AKMY6fW+0pUnuSuDmjpDnbV+JLXkI6VjZth
         0MVA==
X-Gm-Message-State: AOAM5317/J245qwSk2uQiVV4VzQSnYjVah7eI97dQptMI0a7g8sS+770
        7IAjLUsDLxTmgH0vS1H+mAqMMw==
X-Google-Smtp-Source: ABdhPJx1nUHvtHI+Szd9OpnGL0SHvSlOkH5RYYrLmZSbHWRm7YfcckMRcsRtWHOGXi7xPp63caORxQ==
X-Received: by 2002:a19:6f4b:: with SMTP id n11mr14536042lfk.337.1626605353889;
        Sun, 18 Jul 2021 03:49:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y22sm1039528lfh.154.2021.07.18.03.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jul 2021 03:49:13 -0700 (PDT)
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
Subject: [PATCH v5 8/9] clk: qcom: dispcc-sm8250: stop using mmcx regulator
Date:   Sun, 18 Jul 2021 13:49:00 +0300
Message-Id: <20210718104901.454843-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210718104901.454843-1-dmitry.baryshkov@linaro.org>
References: <20210718104901.454843-1-dmitry.baryshkov@linaro.org>
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
index 0625fea6d7ba..372d3a8f38cf 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -1129,7 +1129,6 @@ static struct gdsc mdss_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = HW_CTRL,
-	.supply = "mmcx",
 };
 
 static struct clk_regmap *disp_cc_sm8250_clocks[] = {
-- 
2.30.2

