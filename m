Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8B654ED154
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Mar 2022 03:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345417AbiCaBdd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Mar 2022 21:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbiCaBdc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Mar 2022 21:33:32 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08F1148397
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Mar 2022 18:31:46 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id q129so23925010oif.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Mar 2022 18:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DaR3MwFp8bDqlwUMKw41JbUHj/I2OKstsngLkvC3fEU=;
        b=nR6ntNCh4/YAwUbhK2XuUXTQBF8F95GEVdVCBAlu5e1/zu2pXuFPiAqknf9j2X+mEC
         bciAcM17DbdUEAaR7zc27qebz+a2Z+EqjWa3xdxOmC9FV6cT+kZdibU0Cb57JJnIU3nA
         VTyTMjKlyMao2lNKvTAOCui00LY5xZir/rtz+ys1eu9u1rlWbjjo/Dlc1Cn3YTcQbnOX
         Pw64KTGFflLTOr/K+l091WVuxEhmvUw/JvX/0JRkcOur/nrPUZQ4nuNCfxR17oefO9QF
         8QJHV7ZkyvcSOH6EzB5303y85qkSb0h4RFW20PbIZoiqt4y/YFIpEjNnexkpomXhu5F5
         PiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DaR3MwFp8bDqlwUMKw41JbUHj/I2OKstsngLkvC3fEU=;
        b=rTIJUUAjoh3PsW86teaTYhfUb5gyjWWR1zgPerooY0S977Z5egi3S3fQhiMi7Uijxv
         EVRfOhKQk+bHUzrIZJMtfRxUXZntAJFlBBB1/sER8u1CvcDq+5KHG9cWN2I1aalxjNkG
         m17YLFAr0cp0kAu+xPRPcn69/4vbhDPjEpIVzFSRCpR36FnoVgn4iYU9/mBeJqXvleZD
         sN9nk/5UxjPKgmKe+6BXjEKQJvqfynTjYBOwdL97HGemryJfFG19l7gecbRApRpIz0Pk
         QQ0kMR7G/B9i4qHYgm6u06s9ywEpVMRoJdffoiu+k8YnoCdJ9IxeRsuZ7euGhpuBmJ+n
         mzeQ==
X-Gm-Message-State: AOAM533SNUXNROeKE77O+yLuPcIXWJPJLsQL/e46DPdWh2muTAfMFFyd
        fxW2NcNdLyXTreUvdnLHsbVOGg==
X-Google-Smtp-Source: ABdhPJwVKqtA54H4KDUa2wyQrVcmg6t+fr5bx1rXVdpddFUtYpR1NCwlFGbWwE7ZhZum3rbVXvEEOg==
X-Received: by 2002:aca:30c7:0:b0:2ef:8a54:c3c5 with SMTP id w190-20020aca30c7000000b002ef8a54c3c5mr1706517oiw.56.1648690305328;
        Wed, 30 Mar 2022 18:31:45 -0700 (PDT)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id b188-20020aca34c5000000b002da579c994dsm11213153oia.31.2022.03.30.18.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 18:31:44 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] PCI: qcom: Remove ddrss_sf_tbu clock from sc8180x
Date:   Wed, 30 Mar 2022 18:34:15 -0700
Message-Id: <20220331013415.592748-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm SC8180X platform was piggy backing on the SM8250
qcom_pcie_cfg, but the platform doesn't have the ddrss_sf_tbu clock, so
it now fails to probe due to the missing clock.

Give SC8180X its own qcom_pcie_cfg, without the ddrss_sf_tbu flag set.

Fixes: 0614f98bbb9f ("PCI: qcom: Add ddrss_sf_tbu flag")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 6ab90891801d..816028c0f6ed 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1550,6 +1550,11 @@ static const struct qcom_pcie_cfg sc7280_cfg = {
 	.pipe_clk_need_muxing = true,
 };
 
+static const struct qcom_pcie_cfg sc8180x_cfg = {
+	.ops = &ops_1_9_0,
+	.has_tbu_clk = true,
+};
+
 static const struct dw_pcie_ops dw_pcie_ops = {
 	.link_up = qcom_pcie_link_up,
 	.start_link = qcom_pcie_start_link,
@@ -1656,7 +1661,7 @@ static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,pcie-qcs404", .data = &ipq4019_cfg },
 	{ .compatible = "qcom,pcie-sdm845", .data = &sdm845_cfg },
 	{ .compatible = "qcom,pcie-sm8250", .data = &sm8250_cfg },
-	{ .compatible = "qcom,pcie-sc8180x", .data = &sm8250_cfg },
+	{ .compatible = "qcom,pcie-sc8180x", .data = &sc8180x_cfg },
 	{ .compatible = "qcom,pcie-sm8450-pcie0", .data = &sm8450_pcie0_cfg },
 	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &sm8450_pcie1_cfg },
 	{ .compatible = "qcom,pcie-sc7280", .data = &sc7280_cfg },
-- 
2.35.1

