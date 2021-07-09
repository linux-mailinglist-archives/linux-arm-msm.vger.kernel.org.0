Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 017933C1D1B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 03:31:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbhGIBdt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 21:33:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230347AbhGIBdi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 21:33:38 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEE27C061764
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 18:30:54 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id q184so4858687ljq.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 18:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OW6r9Ztak14Z94NLN85hpavnPWferFff+9qy6SUKk4g=;
        b=JC+1co9x/j+ssxCI+b1ed91TSXIs9SSXm9M04kPMKTty2jG2kt3NTohLWEdszrJp4d
         OWjYXBEqxswxPVRdX5oD8bvjermQG4xTqOsvtdmnRPRuUsqAxSGxhpxhzso8xFWxnasP
         Sqb7IkQzYU1yYKlpoCpIIaVj8QnuzQOtDu3+ABjl0d6FRKmhGHyk3IAJphS0InJR3csZ
         ZXrhWEXgym+/thivB1uxBvE97x5RoP3GK7VzLL3rZ3229L9G9zmcjqxFRfW5sDhUmmHz
         fbM5C10WwxdB2P3KgcQAPKrB9l9R8YMjwQtO69myRBsg5nKrbkPDS+7FzuyPRGmFmOnT
         9BIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OW6r9Ztak14Z94NLN85hpavnPWferFff+9qy6SUKk4g=;
        b=FX/gVwbJ63aoqqeeAInQDtbo3kyk2WI7C3+OaKEPwBRp2IYUgddk0bz0XfTtNnr/J7
         0FqjVTYZ/u8TMnUXWaDpVMpzttjZOcxKQUItbziL1y63xIJPKbGumCLfYdB/iyJ1rBZ9
         Q8/2eD7VhYXid4vNVMermJt3nFQLRY2GP1KLg8JsS4OSojTRzVBN4UwrfnFAMgeymzD0
         2YBdR75lW3QIqZvAiy6GYxNLjoKdI4Anhjdc7mgr2980o+rH9ueoIyJEpFRYfXlkbBLq
         ZtBbg175wE/jr7RCtlveoYfqJD0LxUjoZWK1tYbvdj38MpYV9hdegmyjTvMsGDsGDUNz
         Kp+Q==
X-Gm-Message-State: AOAM532kCEysgTDaWfPi3n10EsHGUpe5VDDjXhpkupYEAXx9aiJXvK3i
        3TG9K20F4LH+H/FwiGka2xPleA==
X-Google-Smtp-Source: ABdhPJx6WXDWhJBZKd7QHCOxQwuu4v3iDZQQH1YLUxtdkVc6jIf8iadLgiyW6VaFmzWYsqE9wRVDQA==
X-Received: by 2002:a05:651c:1798:: with SMTP id bn24mr26944102ljb.72.1625794253278;
        Thu, 08 Jul 2021 18:30:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u16sm405637ljj.113.2021.07.08.18.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 18:30:52 -0700 (PDT)
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
Subject: [PATCH v2 7/7] clk: qcom: videocc-sm8250: stop using mmcx regulator
Date:   Fri,  9 Jul 2021 04:30:43 +0300
Message-Id: <20210709013043.495233-8-dmitry.baryshkov@linaro.org>
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
controller's gdscs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/videocc-sm8250.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index 7b435a1c2c4b..eedef85d90e5 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -276,7 +276,6 @@ static struct gdsc mvs0c_gdsc = {
 	},
 	.flags = 0,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct gdsc mvs1c_gdsc = {
@@ -286,7 +285,6 @@ static struct gdsc mvs1c_gdsc = {
 	},
 	.flags = 0,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct gdsc mvs0_gdsc = {
@@ -296,7 +294,6 @@ static struct gdsc mvs0_gdsc = {
 	},
 	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct gdsc mvs1_gdsc = {
@@ -306,7 +303,6 @@ static struct gdsc mvs1_gdsc = {
 	},
 	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct clk_regmap *video_cc_sm8250_clocks[] = {
-- 
2.30.2

