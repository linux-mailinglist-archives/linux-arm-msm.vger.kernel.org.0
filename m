Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5AEF546CEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 21:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347854AbiFJTJd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 15:09:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348196AbiFJTJc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 15:09:32 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 377EEBAE
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:09:31 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id d18so140016ljc.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=01bj+k2iK46i8ygWClSrCFjTLx488NH70cSKsBIKTsg=;
        b=e2UYcv7lC0jZz+Wigj6FNk1yThV/KB1KLaVVjLjyM+YOg8FsAGBF7KPSxASPLIy8cm
         UxmcpYP0PeJ5I9x5xdlgmX/wDSneUlY053PwKo/g91oyJnM/tlL6mzxDCND49SfnM4WM
         2EKcBQZa/RZrhLT7rBqn/WXsmMHvqPXUZ0iXaJxsh6D0ERC9i+sxUZQOW1dGxcENluBZ
         2PQ28CXz/mj/a0eYrYWgda6MSkIkr5xNj2zNSxgZWK2IyQ9hOwRhtVV1ph5G+kjSrhdB
         webI1/D+Z7ecQk4fcPq2tevTdW+cVDVvbOuzLjenNwNKQbXGLoYHMgjZ+A8NNSMziGVA
         x3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=01bj+k2iK46i8ygWClSrCFjTLx488NH70cSKsBIKTsg=;
        b=OiC72XOFNCS6nNzO8dNlSqIMHGDWcGqCf4VI7u5Z5B6hcPMSEs+dPGQdPW5zBiVrOk
         LpJdDr/hYc1Y6rEMTkBnFmV5Of0I6I1ry3oq5NC5UglFyENpVhvRREliQg7k+9E1f9sc
         f147JrzyVS4RG9m7rItsMjoCJ1ctIDlkavV9pCh5/nOe6yvKuePjjOE0uyDBwM//Dnzb
         1pf9iE1liXSe7SZG++bxEq7hvNPeLEnMdt1jWPRLSkN22cU6nLDGxEwlMl46/n8PnX9J
         wY6zL0k48td0CZXYyIPL1P7CnGxeAg79ZwL7mvtUKHNQ8TfDKStHmiKWp94ZG4UiBeFO
         oxGQ==
X-Gm-Message-State: AOAM533E+jYF1TISJa2PA02wvQgLHwTvcWhajPQsHWaPn1v9c1wEQ87b
        yHmgHCeSFlReMfrWMEnk+qLVZA==
X-Google-Smtp-Source: ABdhPJwOfc8XsZXdVD6QUYDj3rblILAvfam/8wo18Ug1btVrQE079zdGPlnq58qSzQa40Lb0HXg/Zg==
X-Received: by 2002:a2e:9893:0:b0:255:951f:9694 with SMTP id b19-20020a2e9893000000b00255951f9694mr15655945ljj.283.1654888169533;
        Fri, 10 Jun 2022 12:09:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h2-20020a2e9002000000b00253e1833e8bsm26614ljg.117.2022.06.10.12.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 12:09:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH 01/28] phy: qcom-qmp: fix the QSERDES_V5_COM_CMN_MODE register
Date:   Fri, 10 Jun 2022 22:08:58 +0300
Message-Id: <20220610190925.3670081-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610190925.3670081-1-dmitry.baryshkov@linaro.org>
References: <20220610190925.3670081-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change QSERDES_V5_COM_CMN_MODE to be defined to 0x1a0 rather than 0x1a4.
The only user of this register name (sm8450_qmp_gen4x2_pcie_serdes_tbl)
should use the 0x1a0 register, as stated in the downstream dtsi tree.

Fixes: 2c91bf6bf290 ("phy: qcom-qmp: Add SM8450 PCIe1 PHY support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index f4ee5884c076..581f09c71667 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -1116,7 +1116,8 @@
 #define QSERDES_V5_COM_CORE_CLK_EN			0x174
 #define QSERDES_V5_COM_CMN_CONFIG			0x17c
 #define QSERDES_V5_COM_CMN_MISC1			0x19c
-#define QSERDES_V5_COM_CMN_MODE				0x1a4
+#define QSERDES_V5_COM_CMN_MODE				0x1a0
+#define QSERDES_V5_COM_CMN_MODE_CONTD			0x1a4
 #define QSERDES_V5_COM_VCO_DC_LEVEL_CTRL		0x1a8
 #define QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE1_MODE0	0x1ac
 #define QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE2_MODE0	0x1b0
-- 
2.35.1

