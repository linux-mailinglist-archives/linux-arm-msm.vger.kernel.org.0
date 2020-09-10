Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5D3F263A2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 04:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730692AbgIJCWI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 22:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730695AbgIJCMD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 22:12:03 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2A48C061361
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2020 17:49:10 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id d16so54594pll.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2020 17:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wSus/y6lL8EmG6yL6JLfCPXtJnmL/oSSFawM27yJogM=;
        b=GEZ0H1yH33wJmSTJONAngV1gVbg+2UBO93tZN3OI1kQsIR3ea6TYmsFIHv97HFfEH+
         s66xIFsN5f+fU1qFmea2N0d1tYwknw6/nVFOT17HFKEBGBIvDpJMtAaY3HbHKFZCkk4T
         +7OWTCqTIb17Cr6ecvTW4AT1MerUKcaH1Z16A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wSus/y6lL8EmG6yL6JLfCPXtJnmL/oSSFawM27yJogM=;
        b=nZQguwwaO9sPeua1wSjrwd6XPTGsgZSTgT39L3UjL4niXKYW6MnqqpchjUVhdU02IV
         jXuPYVi9cS5MCQ0Ymz8Jgo8I07niTc2dKhSppWD8huzzReXqDb4QgJp2LAPo35SEj6us
         TLZdhbMjN0kJBcDbv0c7RdEEE0K8/EkxXSOnQyPXs94ROGw3TiISlnXFLkG+sQXcyKf3
         WQBOV55IlmUnXrXICiHLo+t9kdYJtRHFAWcMBgr4dqO9h3lFjWoq541OQdjSd5ualGab
         sWlbOgwCpGHjdOeC4LYvCA1PbYitEmp0gEGysZ3y1MxZ9ov2iIIpcN01mnMKvYBA2xU+
         ymsg==
X-Gm-Message-State: AOAM5303bDWPOeqmIJ/8hy+d8J8TjqpPlNn8TPYtPTJ7W7DALwRlFiI0
        /1VrpsvI7+l1tPTWihf+0wvLRA==
X-Google-Smtp-Source: ABdhPJzhev1K2Ieq+ndV4g0JOIdTahf8qXpADPs+1HB4t8k9T1I4cYHOsH8u/kttTG7NxupkPXbsFQ==
X-Received: by 2002:a17:90a:644b:: with SMTP id y11mr3066145pjm.13.1599698950272;
        Wed, 09 Sep 2020 17:49:10 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id c7sm3899050pfj.100.2020.09.09.17.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 17:49:09 -0700 (PDT)
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
Subject: [PATCH v3 05/10] phy: qcom-qmp: Get dp_com I/O resource by index
Date:   Wed,  9 Sep 2020 17:48:57 -0700
Message-Id: <20200910004902.2252694-6-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
In-Reply-To: <20200910004902.2252694-1-swboyd@chromium.org>
References: <20200910004902.2252694-1-swboyd@chromium.org>
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

