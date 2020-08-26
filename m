Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A084425259A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Aug 2020 04:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbgHZCsQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Aug 2020 22:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726766AbgHZCrT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Aug 2020 22:47:19 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1611C0613ED
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 19:47:19 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id q1so197402pjd.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 19:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D4Q7Cl+cu3/CF8brIVfk0tQHaoP3ezD7cmpJk6HAZvg=;
        b=nswCwHh/hcgBu/MulB5sS0uMz6USXeVvdwgxOzK214astSv+BIxFvxF0Bumh9s5zI/
         V4lLj/d22cTMZRzNSlHY3wnWRfhiymjo7tF91iSHAOnB3iCumyJ5K+ghTpw8SVTfxKTB
         oxYORQ51cGpnE0quM17uAvWQpprY879n1EX8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D4Q7Cl+cu3/CF8brIVfk0tQHaoP3ezD7cmpJk6HAZvg=;
        b=CMXfA9L1xy95L6arULLbXV4ae9YgfuIarrQ2s+vARcDTUETOxRe3KZ8uK+pG8l+jnB
         q0ViXjUaJOdjT3GGF/TcHFqilAICz5etu360VK3xAfVcL/mxl8XuOHXd9YkaS/0o9LY1
         E8WNqSfXN2lxqsVN9RhLxdsGUhbzlggp545vc/0RdyNK6mNSOPD9BnTBcK1EtchL7jvu
         tD6qDE95YVBWW+VX3QtF4ZHIguch+ENJqkLEiOPRM1zkfkS0tod7NkNbFUmNmHtkOr1f
         ABBUe+fIoeqXx6nF0/qO3tntAbREnw1DlK6Af6s6I70tJvA7k186bo+4UqvnFn3heYJq
         EkhA==
X-Gm-Message-State: AOAM530DRPgxROvf4qn+gqns01RUhSfw8ejJV3713ezh4u9WgMC22Hw9
        feJRl3ZRb8Qpw3iuCjdpzf32mw4H0kqtPw==
X-Google-Smtp-Source: ABdhPJxdvC3WhhKuuJL53euVmbgWCmg6a8NKLad+aZ2/98+Owvt+TjSpAFXR19pZSpaukOquEEPA1A==
X-Received: by 2002:a17:902:9b8d:: with SMTP id y13mr8182606plp.90.1598410039209;
        Tue, 25 Aug 2020 19:47:19 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id u65sm684381pfb.102.2020.08.25.19.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 19:47:18 -0700 (PDT)
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
Subject: [PATCH v1 5/9] phy: qcom-qmp: Get dp_com I/O resource by index
Date:   Tue, 25 Aug 2020 19:47:07 -0700
Message-Id: <20200826024711.220080-6-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
In-Reply-To: <20200826024711.220080-1-swboyd@chromium.org>
References: <20200826024711.220080-1-swboyd@chromium.org>
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
 drivers/phy/qualcomm/phy-qcom-qmp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 40c051813c34..76d7a9e80f04 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -3266,8 +3266,7 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 
 	/* per PHY dp_com; if PHY has dp_com control block */
 	if (cfg->has_phy_dp_com_ctrl) {
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   "dp_com");
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 		base = devm_ioremap_resource(dev, res);
 		if (IS_ERR(base))
 			return PTR_ERR(base);
-- 
Sent by a computer, using git, on the internet

