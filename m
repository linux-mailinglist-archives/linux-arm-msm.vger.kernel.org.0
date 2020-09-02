Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92BAF25B6FE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 01:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbgIBXDJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 19:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727865AbgIBXCZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 19:02:25 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89EA7C061247
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2020 16:02:24 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id h12so500111pgm.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2020 16:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wSus/y6lL8EmG6yL6JLfCPXtJnmL/oSSFawM27yJogM=;
        b=WOAa7jWIX8sqBVvGBIZRC9QtkMMwTPqPjiw1G2sDjdDmbh3uprVRYrdThTCTNYiPNo
         8uVLqK/PIQYF6tLX17Z+vuhKG0oezsat893XHXBRsf3uFZG2t+P9HhOO/g3tUoQhogVY
         fDuSlJVGlZg4oCd29GGAAJiOwPg9F5x5Y/mzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wSus/y6lL8EmG6yL6JLfCPXtJnmL/oSSFawM27yJogM=;
        b=ldVJKsEIeL88kyRddYy+oF/YOhZqJKtVAAXln4r3jg4CS4eG8arY1tgOm4TrKgFBBA
         hj9jqg+wZ1Pu+M3/St0YevUJN6RXQHuAproD25GSn5tbROCBJZy2wCCwYZPO7rl1W7fp
         aEXZHDuNYbxDJeN43LphCPXTbBEadEVQPfe3Ixs7FSt26g014Eb0/7QTLdnHaoQu6HwO
         9oKy615dqg8axa5Kf3sCYzpJnZlCLFi4980IoybBBnKwbJJ1A//Ol1qb1ii+dhYS+LFY
         jXRXcVrSzljToYXxuFYlq2coRzFuKzDByl2zhM/Mrz0LTJ5shDXuJBfjRHfwcjWL3oUO
         Rzpw==
X-Gm-Message-State: AOAM532SiRsrY6WQGBScGRZKvr1SSQvrGmUZ1BBEkj2aT94dk112LmvY
        N39GbDrYYWhs9IlojnrsmzIPaA==
X-Google-Smtp-Source: ABdhPJzs0Tryd3IzJT6Ie/wLPAjf8nuW0SxB+XMh2C5gZh5R8C4nn0AT6U92LXuS4/2NF+u/8rtTzA==
X-Received: by 2002:a63:e347:: with SMTP id o7mr174254pgj.143.1599087744104;
        Wed, 02 Sep 2020 16:02:24 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id x12sm410277pjq.43.2020.09.02.16.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 16:02:23 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH v2 05/10] phy: qcom-qmp: Get dp_com I/O resource by index
Date:   Wed,  2 Sep 2020 16:02:10 -0700
Message-Id: <20200902230215.3452712-6-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
In-Reply-To: <20200902230215.3452712-1-swboyd@chromium.org>
References: <20200902230215.3452712-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The dp_com resource is always at index 1 according to the dts files in
the kernel. Get this resource by index so that we don't need to make
future additions to the DT binding use 'reg-names'.

Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
Cc: Chandan Uddaraju <chandanu@codeaurora.org>
Cc: Vara Reddy <varar@codeaurora.org>
Cc: Tanmay Shah <tanmay@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Manu Gautam <mgautam@codeaurora.org>
Cc: Sandeep Maheswaram <sanm@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 40c051813c34..215abd179e74 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -3266,13 +3266,9 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 
 	/* per PHY dp_com; if PHY has dp_com control block */
 	if (cfg->has_phy_dp_com_ctrl) {
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   "dp_com");
-		base = devm_ioremap_resource(dev, res);
-		if (IS_ERR(base))
-			return PTR_ERR(base);
-
-		qmp->dp_com = base;
+		qmp->dp_com = devm_platform_ioremap_resource(pdev, 1);
+		if (IS_ERR(qmp->dp_com))
+			return PTR_ERR(qmp->dp_com);
 	}
 
 	mutex_init(&qmp->phy_mutex);
-- 
Sent by a computer, using git, on the internet

