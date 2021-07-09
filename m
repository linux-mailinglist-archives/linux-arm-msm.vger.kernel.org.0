Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8803B3C1D1F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 03:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbhGIBdu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 21:33:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230408AbhGIBdh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 21:33:37 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A1E3C06175F
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 18:30:54 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id f30so19954916lfj.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 18:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f0ldkE5j34OXHAqh3I/xyyl0k1n40wAos/+0qzuAEic=;
        b=nm/hroiuWo+iD98b1WyHvUy5UayywXgtAa9rZPMVCVjmNl3WMEkz8+2uF+ZJJyM2hs
         U9Qqx5chOha+qv+IGYUDu+moP9I72CV2Sf0u521YC2O9cx1SN9KzhufbSV9CDHripyfq
         qokUVOMeGAxjdSy2u1YKov0IIv8pFGAW18pA2VgnE84WZM8RhrQBLz1aJmd3YZKSGU6J
         wH/pjxt7XTHJCmyG9Kr2Kpqpt2zxPb2wMuZm2oOzLbPeNJid6rPg7P+rI/NAa8zvC9Ey
         vKhOuiIu5rtV8TXErMket3WTCmTL87hGzHqKvjMWweNIVC4h0Bg+4LsCP9qks22uxkJ/
         7Dtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f0ldkE5j34OXHAqh3I/xyyl0k1n40wAos/+0qzuAEic=;
        b=cX+z9x2zxnFwJT+t0z+g8cgsOAZkOYpfkwVxE6kcTYoy16+dqC2z2h5e7PJ/r2m5yO
         nU3ZxXKjL3lLXRlgaxdOhbdqYb9wvmTaTwrhS2VEgL43mQqElIqx77Av2Xh/aXS0CK4a
         mJOIi7pzSaTeRB0zxvx+I1ziJE07QnJgJlElDCOHQLnbvEJXbVfqCIczdRNouacBua2j
         ogvIVtOVh0tF8sGL1IPipUsZl3HOVYTLVuK0MqGvpXtM7E86XLSNp4qa5+WyH5pTra5h
         no9dxrLLyTWSVynlJX+4Pi1+bEzQ3Q4Z2GkIznWqvnKz8jm1jMPTImdIViDvTUOHEKKo
         uorQ==
X-Gm-Message-State: AOAM5320UW5WI/Nc7PPlgPgWM3hGUIefG175W4nVG3r4aIKwuk5+jige
        s3zk+ClxUADSYcTof90C2zOvVQ==
X-Google-Smtp-Source: ABdhPJwm8y8f9o7ZuXL20FeOwS87K82eZxq23U5WHj1AX4Q+KvbhAkPrkGXvcIG2EvrQImcfNFkmBw==
X-Received: by 2002:a05:6512:3d0a:: with SMTP id d10mr26656661lfv.143.1625794252428;
        Thu, 08 Jul 2021 18:30:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u16sm405637ljj.113.2021.07.08.18.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 18:30:51 -0700 (PDT)
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
Subject: [PATCH v2 6/7] clk: qcom: dispcc-sm8250: stop using mmcx regulator
Date:   Fri,  9 Jul 2021 04:30:42 +0300
Message-Id: <20210709013043.495233-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709013043.495233-1-dmitry.baryshkov@linaro.org>
References: <20210709013043.495233-1-dmitry.baryshkov@linaro.org>
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

