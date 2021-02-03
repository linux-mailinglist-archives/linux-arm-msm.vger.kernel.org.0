Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 345A130D942
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 12:56:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234210AbhBCLzZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 06:55:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234331AbhBCLzX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 06:55:23 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AAAEC061797
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Feb 2021 03:54:08 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id w4so3922239wmi.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 03:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tidbrV96cevG91PVzX2INYeaRwIIrioVPhXX0yu4SxQ=;
        b=xFloSyxolDUPPr61ifL9MXppQjvGlV+CTDPkD7psev12UmgB0e8bptRKGY56UEJhPO
         PceIY5452ki69GuehGsylYAmOOFOXg5/5BvVrQ3m0HCTYUfU+cZJqwXhOIZ8oLIIlmtN
         2RcTIULTJLPDIRpWSOdMxdyry5cZR5JCqynEps0FvrWEvguJF/MxBDtBmtPj3qm9tbSW
         fLTV2E6Dq5qIPBI6VwKRBZgQ+2LsVXolff2vSIidebGK1PqY9qAXafYi7xacfkkx0jGS
         7C0DB0yUMAAjeyK0OzcC4y+ehwQmlmAyMZXO1ZwaWYoRSin2fjF4cBv+oUshI78LNfOL
         K0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tidbrV96cevG91PVzX2INYeaRwIIrioVPhXX0yu4SxQ=;
        b=LtCWeNQ6AlHLpj667nQzNTRJgeBxS89VmekZKlcNKvC1+IYyvht8tI9aS8Gn6ctoIH
         hv3uFCmDrhJyo3oNavzsE9bjcovdV1KI7CmQYOTUBDr/PLVVrTmiEQFixheDiU5hpyrl
         38/qSUDdrIRJKU21l8vUwkH8bNMG4X1tGRr2G8+8JSsThs3tcX5wjzFIZ5ee4AzcuMr6
         tDElcAX67Tqd5mZc30ai4AF9oidEYiR8GdjOcwPbLMw80TxlXGoV1dkfoExysbYs1tao
         GJxeIqjeNe436RGVBUsKe64QaJbjRAt/iVf2584nWMkBMCu2pRAl8AOWh6G/tnYVzw0p
         VnJQ==
X-Gm-Message-State: AOAM532uQ0yKIcE/zNudrJT7gkLYQSVT5xwAklsVElYspY2mVDfTJv6C
        Hn6tazqLxmK9DNG07PF/EqiLrw==
X-Google-Smtp-Source: ABdhPJwzv/7s2ZVR4Fglc3LwBCAwMtUxOyq843LB65E9cev0kVMVYWRX3xhOfWa6y2EMp49AHdb6HA==
X-Received: by 2002:a1c:480a:: with SMTP id v10mr2490475wma.132.1612353247231;
        Wed, 03 Feb 2021 03:54:07 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 35sm3687362wrn.42.2021.02.03.03.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 03:54:06 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc:     bryan.odonoghue@linaro.org, jonathan@marek.ca,
        dikshita@codeaurora.org, dmitry.baryshkov@linaro.org,
        stanimir.varbanov@linaro.org
Subject: [PATCH 4/4] clk: qcom: videocc: Add gdsc mmcx-reg supply hook
Date:   Wed,  3 Feb 2021 11:54:56 +0000
Message-Id: <20210203115456.1072975-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210203115456.1072975-1-bryan.odonoghue@linaro.org>
References: <20210203115456.1072975-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds a regulator supply hook to mmcx-reg missing from

- mvs0c_gdsc
- mvs1c_gdsc
- mvs0_gdsc
- mvs1_gdsc

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/videocc-sm8250.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index 3ade240bd49c..b0efadc19634 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -278,6 +278,7 @@ static struct gdsc mvs0c_gdsc = {
 	},
 	.flags = 0,
 	.pwrsts = PWRSTS_OFF_ON,
+	.supply = "mmcx",
 };
 
 static struct gdsc mvs1c_gdsc = {
@@ -287,6 +288,7 @@ static struct gdsc mvs1c_gdsc = {
 	},
 	.flags = 0,
 	.pwrsts = PWRSTS_OFF_ON,
+	.supply = "mmcx",
 };
 
 static struct gdsc mvs0_gdsc = {
@@ -296,6 +298,7 @@ static struct gdsc mvs0_gdsc = {
 	},
 	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
+	.supply = "mmcx",
 };
 
 static struct gdsc mvs1_gdsc = {
@@ -305,6 +308,7 @@ static struct gdsc mvs1_gdsc = {
 	},
 	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
+	.supply = "mmcx",
 };
 
 static struct clk_regmap *video_cc_sm8250_clocks[] = {
-- 
2.29.2

