Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CBF333F028
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 13:23:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbhCQMWr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 08:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhCQMWZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 08:22:25 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C289C06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 05:22:25 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id q25so2632532lfc.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 05:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xZREofHrKR5d8VoYsbC5q5FAdkVvzXXQxtWXdVEK1w0=;
        b=FWz+gXprZDWwj8E4AwYCfi6w2YoZNLDHLmwIFmcPtRxPTKv9GSYqksHSlBb4QUH7rf
         ZTrxzoEsVHi8VYUFTbtzPojGlqEdg+sAOUDXlMwFyjkBTr6WhDO6AbKehtkoG3h4XYis
         8j3kXrsTMALCX/liNOBFUecCNSQIIlRqPAvTPbHEUVVHug3BUhAze8SplYrgXB4ity8T
         V2bIxtnF7L5tvxvM+4Vm2DgVOkQA1jz6NNRugTyxpgXMpJljiB2B3aehQjAnCMoiOKPE
         WN0thEigRm9q9TtwQLjhJgRyaScS5o9MiHGsV3MirFstgTEZy+Ik9sZ5cEb/ibZfiMOZ
         c2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xZREofHrKR5d8VoYsbC5q5FAdkVvzXXQxtWXdVEK1w0=;
        b=YGqZm7HGnsjp3kqdVy8+VJRu6BJcQjwdncNSUbBmk76koxrGU+XcJ0aJByHAuQFOfC
         nPmgoktm4v9rM1Do1XIGiQcv/q/Mmt/0zRKhhL79/4vIwSAeY4FhfO9A00xFNHFUxI0T
         3LEdWt5saRXDrlhW/1driZhz/ldvIVNb+2/dFWpCCqCM7tMdqnNCDIJIUvMebqZ0o56c
         xZ2vYoJ4afhiqpRogTe3CT5AYWBH4pRnfLzEwDDVNiomR6sTgd/BrxeMlVW3e84GPpZz
         xvqe2l5DudzTjAfdUFdwI1bvKQ1LiBtkj01nWjeR64JMGy/a7JOsopcKA3jHWxYcSCOq
         DsSw==
X-Gm-Message-State: AOAM530jPj28rJawDzDMSDc9g32jUigUSenZe1aMayXiMtNEWdpgBSh9
        G3WydBCwQafaiwQffnL+aFkQwn3pSYktaw==
X-Google-Smtp-Source: ABdhPJzQJBhN2GTjZgaBxFNJOnqvHLrkcK2vp6pL7F5CJaIQuwtZLfXiAELGI01bqtQpcn+lFZKnjw==
X-Received: by 2002:a19:5e14:: with SMTP id s20mr2271307lfb.110.1615983743025;
        Wed, 17 Mar 2021 05:22:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w1sm3415816lfu.239.2021.03.17.05.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 05:22:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 1/8] clk: qcom: dispcc-sc7180: drop unused enum entries
Date:   Wed, 17 Mar 2021 15:22:14 +0300
Message-Id: <20210317122221.439105-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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

