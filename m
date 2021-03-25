Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF552348EA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 12:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbhCYLM1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 07:12:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbhCYLLy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 07:11:54 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F411EC0613D7
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 04:11:52 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id m12so1890412lfq.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 04:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iyvnBZlTNurXEyCrPSOLE64/hPUHT0EpxducBu8pG7s=;
        b=vj4HF4WPq83nTWgkeiGisKU0N3svXeU0b2L+kM/Dsaky/K3b80bp5oDM2wHXN0Qi5P
         jUcRn/VJLXRxhlY19jgfxzZ2ptkM38wY1TGg6v187djmLMR2ZVV91CfS9bzR0zHp4Eif
         pEUVSXwdPnNK/bqqJGabc8jgoTUou78SavrWsCGJbRd4QCuyMDP2S1ofz6DEbzaHGGSj
         dC4L65FjIYQeMNwAAo91uJv1tvXc32VvAjifH/4KAr+d8+667JPn39ifnOjBle/6f98Y
         lz2SjQ0JE3jxFb0DbEb9Rm7hH76OiSPpnxNGfBDvzpUrtHt3Iw0dUx6/Er/SytCkPvrm
         zcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iyvnBZlTNurXEyCrPSOLE64/hPUHT0EpxducBu8pG7s=;
        b=QGg1bbzAXHt4ujhe6n7TQDqKhsLjB94WTCOBp3T6e0MiOoxZlL6EDZ6rcGreQW+w6V
         ayhZWMqknYYwIxx5KzEXInnwxxk6qYxpVRiNacLflnN+VGYxWnwjT+2flr5zPE+FpgqL
         I+cYjyOuDgKLsUI4PhdCzpj+7VQUNLPlgu5SpmXp+Qt3crWVRw4cXQ/t2qw89WPfQbNA
         vV0YmPL3cFgaw8hg0c/F2lVGKkdyP08efzbt7NrcajMSFwjbAK9TykA2Vp8iLdTdBA0y
         t3eJlmPje5hYM3tx1Z+Fu0K1cMagDgOQ87OnAOarQhFYBz27QE1Svpz51mqnUe3HNch0
         hBJg==
X-Gm-Message-State: AOAM533UZlkm/+NFyIoKBrNrrwgHcixgVGmqPTSbgX4JGtGzyXO37q3Q
        T+UZ/5XRNufGIVqSD+1TR1AcFA==
X-Google-Smtp-Source: ABdhPJyrIdu+tHoIKq/e7mIfgGeC0T9HSqxRAafs2bnkhj2FL9iJz7wjtDm+QqlttWrfuD/iYlYuJw==
X-Received: by 2002:a05:6512:3a83:: with SMTP id q3mr4738587lfu.460.1616670711552;
        Thu, 25 Mar 2021 04:11:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22sm715191ljj.94.2021.03.25.04.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 04:11:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v1 06/15] clk: qcom: videocc-sc7180: drop unused enum entries
Date:   Thu, 25 Mar 2021 14:11:35 +0300
Message-Id: <20210325111144.2852594-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
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

