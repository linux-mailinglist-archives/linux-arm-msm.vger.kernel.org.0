Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F342C33F033
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 13:23:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbhCQMWv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 08:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbhCQMW2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 08:22:28 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42F4DC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 05:22:28 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id p21so2617391lfu.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 05:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iyvnBZlTNurXEyCrPSOLE64/hPUHT0EpxducBu8pG7s=;
        b=qCQE8+3hnAgJsBiRiBaIsizH+y5898e98B/mTgWIVcOypjP9KlCFHbeh5p2TWVKSK8
         HJjA9j0xFM473Be7wwSV8H4+fHSUlSlFoLfKzxvbtRimolVVulNse8Yn+FQtLIN4422U
         HnDOoLx42BgeKpnYHGv9/RSdgQWgEwaaCcljBfc3siVqeZsHlRdXNNjVbvDdUcsIFdDy
         4bUDRZKvDML5OZR9EFLW8q5u5lABEG5MQRoKKjFYfGZm5Pk7hpFouxlGPND9S7Gq0fOJ
         F6Udd9qvoEeaCH02jhupccG9UD83BR83ANM1wcMhB0GlrPFtKLiWrhpncr1E4BfH4fCG
         zN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iyvnBZlTNurXEyCrPSOLE64/hPUHT0EpxducBu8pG7s=;
        b=H8ATT8i7RuqOKhlPaDw1eKdMIyI0B9+XCBA31e9O3Mhk38Bi2uWB1hZiluX8c+kP2G
         s51/fZrb8qYKM1u+KD9LAmyNmo3UccjdAVn9qta5gYmiFiMKiEmV+nv4qji7hxK/pMg6
         bblBh+iqXs8Mfyvb6g4YRlxGewh6ep1Vp1P4UlugNldKSMR6swSEpDkzp5HiaMNWThOw
         nmihLDE+JsEAkwZy77GEgin38dwgJZ71KDofQu6jIv9o4tzy5UEw/1qKJofdvG8MX0BW
         BEZkf15PeX2NEHqy9zpN3cX7TXV6WoTSvPgs4JX7Ni2raAOdMnabSHYloT8QiV68+HPy
         j+7Q==
X-Gm-Message-State: AOAM5318SycwV96Jk1DQ25gNR/hbHr7+r5QqVd7B8X21IoKWmCz2xtMA
        4PEz8Y880ED6kzJJUzPw9U4qdQ==
X-Google-Smtp-Source: ABdhPJyzGqwxAkD33MjaTXFFhZYgzUkDbED19+BhftJhj4CsP4XLlWvUQvniJUkjGep3Bw+YHxkxdA==
X-Received: by 2002:a19:5008:: with SMTP id e8mr2148974lfb.571.1615983746829;
        Wed, 17 Mar 2021 05:22:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w1sm3415816lfu.239.2021.03.17.05.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 05:22:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 6/8] clk: qcom: videocc-sc7180: drop unused enum entries
Date:   Wed, 17 Mar 2021 15:22:19 +0300
Message-Id: <20210317122221.439105-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317122221.439105-1-dmitry.baryshkov@linaro.org>
References: <20210317122221.439105-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop unused enum entries from the list of parent enums.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/videocc-sc7180.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
index 276e5ecd4840..f5d04791a3cd 100644
--- a/drivers/clk/qcom/videocc-sc7180.c
+++ b/drivers/clk/qcom/videocc-sc7180.c
@@ -19,8 +19,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CHIP_SLEEP_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_VIDEO_PLL0_OUT_EVEN,
 	P_VIDEO_PLL0_OUT_MAIN,
 	P_VIDEO_PLL0_OUT_ODD,
-- 
2.30.2

