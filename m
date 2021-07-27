Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52F893D7F1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 22:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232588AbhG0UUp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 16:20:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232476AbhG0UUb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 16:20:31 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E45C8C0617B0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 13:20:25 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id z2so23960441lft.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 13:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xwHyfFobMRMZKUio9uUatRxtV0PWAj3xDN5CdY+KXtw=;
        b=pd0N30nr0KqMooVCHpWMLPM0lsT+3Zo1tpP7D4POtBf4e6piGSVRF/hMLEXNgAO64U
         Td4HPhY9c/idLVNAjwWLC3SV6ZNpzRE1mTwumX6MC1exIDQDNkVyKBmxdVvbs6C5BJtP
         utGHC7m6LnyDj6L97DFFZDOGOydarBu1PnvOr3VCOYQsOedejk3cGJnZzj/P7vwFop6w
         6csPBbZG4ABdc3PvZJgNb5EkghoyK6bqGW1wY3ftM2QNaX7KeOG9ZRn8o3R86jzzRZBs
         HyzBaw3J0IvtI7blLf0nTAJaOseMbQCpTheV2fQ5jXyy9qK+wN4Jo0OfhD2NdfWb36+P
         80bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xwHyfFobMRMZKUio9uUatRxtV0PWAj3xDN5CdY+KXtw=;
        b=Wvuk/+4Ks25o8GXrXZVujllwGwSTCEUymdQ1s7/iwFz9JeQa7/WvoaiC+XD7Agggfn
         jTPOzEsgPgsP/a6gDkWCI0XKJfIn7jdJHDUwYiw+pHzibXm0DvvxDaY+FciianPPni9H
         rNblCRcPsHx7t1j/J2s0oZ2dRNR8XtiDnUm4lPpfBLwFl+VJb/ZMJc2JI8KSJP5tInl8
         EpgIrdV6Vn7fOJENMbScA7Yo3Rex/51HB/G4fArXhLZfu4xcWv+/yPHzPGlvu0hpGUNU
         Zht9SM9awYoQAUVHCygaEzXx0nxk4eh0ESJi8PRIOqtFNmkT8C+p01xFmOF1R2hkAi4f
         drwg==
X-Gm-Message-State: AOAM533daShl9xSUXtCrfmadFnJNbXDytymw1qGFkMBN474GLpzQjJbG
        KkzhtFIjXdTEBfQlYnTogLXw7g==
X-Google-Smtp-Source: ABdhPJyoEkaNryf83y9vVHT4RF65941FKDyLrwGoeOtj/lruPuXft73AI4940p9UtXDiNRM19V4b7Q==
X-Received: by 2002:a05:6512:3767:: with SMTP id z7mr6831909lft.128.1627417223534;
        Tue, 27 Jul 2021 13:20:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i11sm376502lfe.215.2021.07.27.13.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 13:20:23 -0700 (PDT)
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
Subject: [PATCH v6 8/8] clk: qcom: videocc-sm8250: stop using mmcx regulator
Date:   Tue, 27 Jul 2021 23:20:04 +0300
Message-Id: <20210727202004.712665-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727202004.712665-1-dmitry.baryshkov@linaro.org>
References: <20210727202004.712665-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now as the common qcom clock controller code has been taught about power
domains, stop mentioning mmcx supply as a way to power up the clock
controller's gdscs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/videocc-sm8250.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index 8617454e4a77..f28f2cb051d7 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -277,7 +277,6 @@ static struct gdsc mvs0c_gdsc = {
 	},
 	.flags = 0,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct gdsc mvs1c_gdsc = {
@@ -287,7 +286,6 @@ static struct gdsc mvs1c_gdsc = {
 	},
 	.flags = 0,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct gdsc mvs0_gdsc = {
@@ -297,7 +295,6 @@ static struct gdsc mvs0_gdsc = {
 	},
 	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct gdsc mvs1_gdsc = {
@@ -307,7 +304,6 @@ static struct gdsc mvs1_gdsc = {
 	},
 	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct clk_regmap *video_cc_sm8250_clocks[] = {
-- 
2.30.2

