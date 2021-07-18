Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68D243CC89B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Jul 2021 12:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233230AbhGRKwY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 18 Jul 2021 06:52:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233253AbhGRKwR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 18 Jul 2021 06:52:17 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 682D5C0613E7
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jul 2021 03:49:16 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id q16so24302889lfa.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jul 2021 03:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dd9ei2GjQiFjh9R1NgRmYWUwg7rsPR4hERBwm4wpjv0=;
        b=m7dK3rl7blk+8UA/hKxKhQOYMPdH3NxlSmNnG/o1aJEhXEUlncPQuZKivbsbSFsd6D
         3i21AAMkCywCkVBzFWjOAv/d6Z+UDg82Z67QAhvpgJtzh0LcxglFAY9ZrBRrQ8Al6d8l
         lMQf+xWLEFiq96qDgAQPKVXhvqYLYe3nkO04nG49x/8iNM8x9LOo0LdZgU7iW9o/PdXg
         3ucl5q2Sryk4BpUbVP99WB8wcvbyb9Bx+L+AF/axWZZXqEQtAavjhflpKRkmLUluLJjB
         oqrA7G4uMYhngaGUONxfgVAVFnMRQ2sZnRSjZ7o3VcXH2T90XIyy28jrmDw769Z+hdgK
         NvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dd9ei2GjQiFjh9R1NgRmYWUwg7rsPR4hERBwm4wpjv0=;
        b=LZy8wOXKHt5vVo9Iht1zvRZs0/kaExh2AjIbx+8MMoKu/dGf8uNGWweS1UjS6EB/S0
         JfTW25FBfJ+Zb55KVfDOh9rOcIljz27ytnmhDYgGAxmlU47/NSsMqTAXrrwVDvSvh4NJ
         7Icbh/Bssl5ELrp+KeR14zg3Xj0cYU9U1F3K4ijDCpVII6VdE1fblSyebhSHlJ34aLUg
         0LWD/aqns77N3I4Q8Rn5HBfWZ6lDZ5bu2GJsE0Pm+4CNVxGkuunWQ2rjJJRzX5/d9KOW
         fv52ygozAJfkOBkOW4l0H1MWrZAW999FntmGBRQl2pvKqC03U8J4nLUwbbVSqNJ8rZoT
         Jz7w==
X-Gm-Message-State: AOAM530pNFLAGzNnsWihdOn4Y92mhHv9BF8QCGB+oXYWJtJKTR22naRq
        Uj/lfoT1T9/+mYAnyV8XWWYncQ==
X-Google-Smtp-Source: ABdhPJw9tTR2amz089wkuVxYZzBd42218zETpGO9Z5ykKpcbYkr4c1GBjVvi8xaDTDShfKRsEqLNwg==
X-Received: by 2002:a19:c1d2:: with SMTP id r201mr14921339lff.148.1626605354671;
        Sun, 18 Jul 2021 03:49:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y22sm1039528lfh.154.2021.07.18.03.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jul 2021 03:49:14 -0700 (PDT)
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
Subject: [PATCH v5 9/9] clk: qcom: videocc-sm8250: stop using mmcx regulator
Date:   Sun, 18 Jul 2021 13:49:01 +0300
Message-Id: <20210718104901.454843-10-dmitry.baryshkov@linaro.org>
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
controller's gdscs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/videocc-sm8250.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index d996b76f4e30..ad46c4014a40 100644
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

