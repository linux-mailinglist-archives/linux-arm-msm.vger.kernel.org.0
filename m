Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04F49581B1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 22:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239642AbiGZUeL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 16:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239762AbiGZUeJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 16:34:09 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A9C532EEA
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 13:34:07 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id o12so17726441ljc.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 13:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LdWpamk1BXCcCjKw35z+csgKSdlT5Sh34aqNx5R4R1c=;
        b=T9fvK+oFNYePO73j91lCGnhZLrvNcnAeTdeKVbd94osYZBD7to7+hXIF0yFF9qJ09D
         YcFfPDaNbEStu4dio7fUSFVPTLhuxhNo1Z+xphWL/RaQXyZiAj2h0+0EdErfclyk+o0Z
         2CC/bf695Y/a/4cQ6XMZbLC+ba6UCM0r2nztGhauUWZHU0OYtCIQr9KP+UKW/bZWoYg+
         m6IVhCE1OKnfkXrz9AaBqN+XxobwZkKF+S2NihGcSJKQVZGVFRLBccdG48o8wsvuhSjX
         8O+n5eB3KfT7gefa245CZ3Px1n5/AMxxLNCc6hI73v6yPnLfGjzKN0qsAoMis9S0fTHM
         fAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LdWpamk1BXCcCjKw35z+csgKSdlT5Sh34aqNx5R4R1c=;
        b=jCvXa1Bc6amalAxS9Ia4KHat94BcRaylrPoFsdvgQAkLQM2UKAoVLACthR30s7+x8F
         SpZNVYp+TuRsLzTxkNoifL/1qRZe4wH2GOHFBTqF80ZiCgl8czufIhpBv8IGs4WXZRui
         X+KyBdB2MOG4kH608g93NGlb6ofvAhcN4jBGt5X3AMmauz7t27JybndAsUJ0Auqns1bV
         5V+7YL4QmtGv+3ZbVlNCJUBva/+9qMoE0D29cmz65aOCoobbR4/DMrXsPcctdmUWlOUb
         mSXvLNITeSzKKc4JuqwVQ3EY0t49ykyHJYn34NyecdfB4tUWjxlkUO0N/lvtb+sbtGRi
         l/nA==
X-Gm-Message-State: AJIora+8tTj+424NzJ2mAC3iJ4D4Hx72orw7TiL5ibom+LKtzSUGPiLq
        1X/c6Ck0UwKis8jQbtjDAHqLLQ==
X-Google-Smtp-Source: AGRyM1vqhNN1aWDvF9DQzXDry47YS8wRlTeYXRcnNh3/lu6kNrEmUuy4u02Qm/0cAFXNdEqCptQ8Eg==
X-Received: by 2002:a2e:9209:0:b0:25e:21f9:2bc5 with SMTP id k9-20020a2e9209000000b0025e21f92bc5mr45364ljg.14.1658867645653;
        Tue, 26 Jul 2022 13:34:05 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o14-20020ac24e8e000000b0048a8899db0fsm1468548lfr.7.2022.07.26.13.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 13:34:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 3/4] PCI: qcom: Setup PHY to work in RC mode
Date:   Tue, 26 Jul 2022 23:34:00 +0300
Message-Id: <20220726203401.595934-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220726203401.595934-1-dmitry.baryshkov@linaro.org>
References: <20220726203401.595934-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Call phy_set_mode_ext() to notify the PHY driver that the PHY is being
used in the RC mode.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 93d75cda4b04..f85f2579c087 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1485,6 +1485,10 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 	if (ret)
 		return ret;
 
+	ret = phy_set_mode_ext(pcie->phy, PHY_MODE_PCIE, 0);
+	if (ret)
+		return err_deinit;
+
 	ret = phy_power_on(pcie->phy);
 	if (ret)
 		goto err_deinit;
-- 
2.35.1

