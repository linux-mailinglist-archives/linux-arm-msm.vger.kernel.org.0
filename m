Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6676630F5C0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 16:04:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237069AbhBDPD3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 10:03:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237000AbhBDPCy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 10:02:54 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5DEDC061356
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Feb 2021 07:00:13 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id p15so3838339wrq.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Feb 2021 07:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nc9gnI1H6fzB+6K5saFm3Jx2SbTp7zcViLcj0vH0QAE=;
        b=xBjDITC5+tezp6ASj1W9SEEL71cDN31GmI49V3hP97Rkk6ld15hKRtJKVVAPCVz0RS
         frD+50Kq8BJmGeSUuzcO/DBk+Wu0xBCBMLZBDlXz+YABc2vTATvWxndg0Ok3M9cze3du
         29bAsbA805/uqhI35bvccRBTyEjm4L72ZetX4YTE8Z2sBLUNdzBLO1pMn4HHLn7oiV0Y
         xw2eYDCFrjr7duA+Nh7lIOLkEt9lScz8dxnwARKiZeMLa0M5/NDPYSGMSrWRBGhKVESj
         N3NEkDPJ3jU8+A6bmhUZHqb9ddeDbAZ24nrlBUokDAwiNtyDB2nN891sbpmwq2lLZlTa
         4kxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nc9gnI1H6fzB+6K5saFm3Jx2SbTp7zcViLcj0vH0QAE=;
        b=f/lEwmmSAccWX5JLV4L4DGf5R4t4gHuIC4SYgINDdPjTpjcI6bbbNDng1XY7I3sRR2
         WfoCkepHP1qf085OYoCHO3LghbjyfCHSN1JwiIkMMSiwBCYYEXI3QxHW3agZXckKv1x9
         p/eHa/NUZaMkF3ZfVphypXkwniIr+g6JS8tw60LQ5klNR2YhQo3imLPJ4Y892VzN/lyt
         9A5pXPELIdPAMhJ6d78RZJqs629HOz4rficI1H9TQS/UUTTTVGx+1m9iIqVEQOH7912P
         021WryAamZwqNjb4/WXzjB3HrF4cnHc+HgUL28bymoa2Z47EILaHmLcDgmoKs80nTJWo
         fpWQ==
X-Gm-Message-State: AOAM531C2099xACLerPtksM1s28XSmaBgObSIwtslLR12MJZ5f+ZlUim
        zVeOqHazH2wWPf1H54GHMBM4Ww==
X-Google-Smtp-Source: ABdhPJyKcEmxw1PwIBgjDPjRNrIOrtemhNiOF5VcPU6CotGo8z9YXhwc1/u4P6Sf/bYE34OlFCnruA==
X-Received: by 2002:a5d:60c2:: with SMTP id x2mr10252537wrt.248.1612450812483;
        Thu, 04 Feb 2021 07:00:12 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c11sm8312664wrs.28.2021.02.04.07.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 07:00:11 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc:     bryan.odonoghue@linaro.org, jonathan@marek.ca,
        dikshita@codeaurora.org, dmitry.baryshkov@linaro.org,
        stanimir.varbanov@linaro.org
Subject: [PATCH v2 4/4] clk: qcom: videocc: Add gdsc mmcx-reg supply hook
Date:   Thu,  4 Feb 2021 15:01:20 +0000
Message-Id: <20210204150120.1521959-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204150120.1521959-1-bryan.odonoghue@linaro.org>
References: <20210204150120.1521959-1-bryan.odonoghue@linaro.org>
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

