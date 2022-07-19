Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1F4A57A7FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 22:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239754AbiGSUGf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 16:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239731AbiGSUGe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 16:06:34 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3333B2610F
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 13:06:33 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id q7so18663627lji.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 13:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4mVgMU0JNbVFGBujet/TzqwP83qk1CmJW+qJ8LQMNlY=;
        b=i7hZ0hMngQc7Ox586XnCw14dO3Q76ewcYwgL3JWtCROESiVwqKdBy9DFJe0N+Ku07T
         XGJBTpOR0aB2NdTqxGYEFlDsA9I04V2Mg7Jm1ymf/QPQEtjhnbPDwS22IIxrD7kq/P4r
         cKdXI9DDQlJ3uG3jXTQJy/aWFABS9IwAjr7znXlMBeq4jC0JR2rWi89MLpTD+xzTXbYa
         YNupmECt+x8NABwGeg0CQwV/BXjMR4C0+3uGrWB1alu2GtqOO2XuEJc0Wwe5BWITUaHK
         t/uP3h2tIfbo6sUbjfaUE1rdpHoo3go85/HDFcaCL3gvz7HjoaGmlCWqAAejNj+ZeC15
         HGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4mVgMU0JNbVFGBujet/TzqwP83qk1CmJW+qJ8LQMNlY=;
        b=1dI3LLnc8ELT8TpAY02b22HEYW5WvQylJA2iezVPOrd0JO7s2vbGoXcEi0IMaTqc6F
         FbhObRA/8ZJt2yCs8EbTWKzTKXPi+CbopkVwoeV6gYGiGeHpjz6wqthw7hw7ILnd27Ij
         ArGZgkK9hTEpJ/cjnv9fqk5FJLrD9na+8HWbw7ji5B2K3nP5hVQ2t77wEneg2ZINtJSY
         QSU/33gzPb5Jth5mgCeBsNEw3+stISEp3XGjOPgIkA6CRAp1WMANTw0Gd1jhBR7/BSZR
         Y65sM3V/OchFkCzuYxzQC+hPJFIgJ4JKzHmrzGR0mFkH0qMTtCJm7TS2SDVozVHpRQ3m
         AV9A==
X-Gm-Message-State: AJIora891dZ/nljJcPFXeQoTmkcxIOeovx+XT76UMcbM4qN5kuC6Ey+G
        bVi6sBqLph1MyZkbgU8Fev8Xq2fKOfSylw==
X-Google-Smtp-Source: AGRyM1u9CfxPl7wPBc48239pNVGU8t/qNRvfHJmFtQjpS/0pPx2/sF6/y3/uj8+7LTvllVEsX6jQQQ==
X-Received: by 2002:a2e:a277:0:b0:25d:6904:d97a with SMTP id k23-20020a2ea277000000b0025d6904d97amr15463932ljm.76.1658261191484;
        Tue, 19 Jul 2022 13:06:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w16-20020a05651234d000b00485caa0f5dfsm3402324lfr.44.2022.07.19.13.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 13:06:30 -0700 (PDT)
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
Subject: [RFC PATCH 4/4] PCI: qcom-ep: call phy_set_mode_ext()
Date:   Tue, 19 Jul 2022 23:06:26 +0300
Message-Id: <20220719200626.976084-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220719200626.976084-1-dmitry.baryshkov@linaro.org>
References: <20220719200626.976084-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Call phy_set_mode_ext() to notify the PHY driver that the PHY is being
used in the EP mode.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index ec99116ad05c..11f887a2f7c4 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -240,6 +240,10 @@ static int qcom_pcie_enable_resources(struct qcom_pcie_ep *pcie_ep)
 	if (ret)
 		goto err_disable_clk;
 
+	ret = phy_set_mode_ext(pcie->phy, PHY_MODE_PCIE, 1);
+	if (ret)
+		goto err_phy_exit;
+
 	ret = phy_power_on(pcie_ep->phy);
 	if (ret)
 		goto err_phy_exit;
-- 
2.35.1

