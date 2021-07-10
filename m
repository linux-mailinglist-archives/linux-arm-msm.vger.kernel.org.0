Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 400F73C2CA3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 03:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231785AbhGJBfu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 21:35:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231704AbhGJBfp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 21:35:45 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85483C0613F0
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 18:33:01 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id e20so10898814ljn.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 18:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s/A7UPTK4i/YxYWo+py1ZfWr+92yU5mUYYeUPHiFkEg=;
        b=lrVwstQAI1v5pb4k+3c+P83tiywljkXeskO28iiu/PzggOC3pkpID/AbcckRBATRY+
         4uhSyNM/2umDKActyEtPS5GXvrFOk0tfPOtky9y3L7opDou9xxts8f+rNDrQD5KHOdJU
         XjlFq99cDfEv5fmSfewu5NGVOlIrGIY9kZx93cMvMsB62ci051Fq5Hhd0EMNZ1m7Rmwx
         C3zanel+aChq5lzIBbjTxDoSxdkiGx1tbJOY6QLyfnqDth687uFIPUn8KoLcLfFQ89RH
         12maxKtryyowubP1QWGY7kIrWOKGq6UReDPUXGmR3H4CKKePA4+cSZuwS5gUYF5eE6C9
         t6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s/A7UPTK4i/YxYWo+py1ZfWr+92yU5mUYYeUPHiFkEg=;
        b=dT8LzxZwIhAcXviDuq4cIlcoALP/9XQ91UMZUsdFZxBJGbGx1TcMXYMx5mzEWT9t/t
         vvTUtEbQFOfcO2GOJKwYYkLqUa0vBcjjPB00t8sqCIO33B7bkBHcXImyjpa29b9WlH2P
         lmVC2oC1MVe4z7M+R4XC7ztZooiTin+x3d65X9Ti5iFw57sLOeQ+oJzI5rNeSTg9W1hm
         TtfgX13DUYvdneTECmrCb6zYJAfEMO03J14DZvGjtPww4QWA8+Z8/vgqGyCghqcueDxY
         5mki2yrDVoU6Q3Fo46uxaSOUUQ0aew6GacyEsbVRPnwRlkHvmf5qJphBiyZsvOxMatY9
         aEyQ==
X-Gm-Message-State: AOAM5314C1+BroJE3IM2guWR9NudCAW681ZznAodCBaWmkA0eRifydra
        8y4GcPDg7Q0R5QnvOb3WZ7Nk7A==
X-Google-Smtp-Source: ABdhPJyU6jh3ZTKOA1TAcFOaxn3VIMjw3SCnYqLIb5j9ObLW0rPylTCZIMci2OG3NfOhp+qjl44Iww==
X-Received: by 2002:a2e:a54a:: with SMTP id e10mr31836469ljn.120.1625880779935;
        Fri, 09 Jul 2021 18:32:59 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p13sm588788lfh.206.2021.07.09.18.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 18:32:59 -0700 (PDT)
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
Subject: [PATCH v4 6/6] clk: qcom: videocc-sm8250: stop using mmcx regulator
Date:   Sat, 10 Jul 2021 04:32:53 +0300
Message-Id: <20210710013253.1134341-7-dmitry.baryshkov@linaro.org>
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
controller's gdscs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
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

