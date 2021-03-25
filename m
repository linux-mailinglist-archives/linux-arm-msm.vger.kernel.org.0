Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 497C8348E9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 12:12:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbhCYLLz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 07:11:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbhCYLLt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 07:11:49 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BEAFC06175F
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 04:11:49 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id o10so1897166lfb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 04:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xZREofHrKR5d8VoYsbC5q5FAdkVvzXXQxtWXdVEK1w0=;
        b=Fd4t2AI82MFZRpjsKagh3w4VdchAgmHAqZRJ+kK8+csQdxC70iXQcBFHlbjdZuENAo
         tbY8RhjWAn5w7ru6vI3qlzC6mAFaVi0sQmBRZAuZyHJJnLkmtw1PeSYeyhq48SzD25cZ
         58V8SvF9QnYCDo3JMcAcNbvX9qI8icOG1FXpvgpWO+HMQRZLVcaaNQWE3qyEyqQErSC9
         wfrPqxG3ebp8sXrC5UJsvTZHDfNnY69zqA2+V4uaVPh0TmC+LZWWK6aAaGrge68j+lMC
         8y0KaXyOXocd5S1tGjkuKE6oB9ibCx/+Kx4jlrgSlrQvYeYKMa9pltxR9ccfV2FDTRb2
         Q8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xZREofHrKR5d8VoYsbC5q5FAdkVvzXXQxtWXdVEK1w0=;
        b=MPEnerMsCGlHa40WAxTMTX0OrmM8RN++D0z5s3rfOFJjC6BKF/wVo4+x5DsTcZI4ZG
         lrOSSXXrxePJbMMYHJM4uBhhw4ZJaYGeGS+T00L+5ZBvOCsuDEETQvmSVOJ5apBJH1BU
         YCzMk0BZH6hfB/ygjFn2UX48QfrysuzsU0uyrnYEY0BsH/MS2dSB5a7T3DBRsWcFnQdS
         BiWIbUMLFz7AZyPqznmcgpPGhP63ep/tewZkFtH2R+TPGCVyLqRzzFJDnSzHwkhPi6/d
         GBTJYNMCZGpRsq8c7ocyEC5kkXUs/nMH40ggQTjTX338iY6hfSZ2CfQ53rQyfkg0dSya
         jjbg==
X-Gm-Message-State: AOAM533gqhWbffBZMo9myhPLd/zctlkYqdUAgs2k8HPDK5ikiXuxIY4M
        SIZPXy+IzTDh0YijzGRD01yHJw==
X-Google-Smtp-Source: ABdhPJwypOEy5D8Bz433omGtjvYW8ORBqV/gDCJhaql+BU/gdzFeM0ULA8sBboa+Z4pekBZL5xJN+Q==
X-Received: by 2002:a19:44:: with SMTP id 65mr4929313lfa.104.1616670707778;
        Thu, 25 Mar 2021 04:11:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22sm715191ljj.94.2021.03.25.04.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 04:11:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v1 01/15] clk: qcom: dispcc-sc7180: drop unused enum entries
Date:   Thu, 25 Mar 2021 14:11:30 +0300
Message-Id: <20210325111144.2852594-2-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/dispcc-sc7180.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
index f487515701e3..3334bf9cfb94 100644
--- a/drivers/clk/qcom/dispcc-sc7180.c
+++ b/drivers/clk/qcom/dispcc-sc7180.c
@@ -19,8 +19,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CHIP_SLEEP_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_DISP_CC_PLL0_OUT_EVEN,
 	P_DISP_CC_PLL0_OUT_MAIN,
 	P_DP_PHY_PLL_LINK_CLK,
-- 
2.30.2

