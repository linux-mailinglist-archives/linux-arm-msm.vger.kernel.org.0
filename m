Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19DD24C0FF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Feb 2022 11:14:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239506AbiBWKPM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Feb 2022 05:15:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239499AbiBWKPM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Feb 2022 05:15:12 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2DC68B6DB
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 02:14:44 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id i11so30145108lfu.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 02:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lkxtCcsfAVoExf0UCN2vdORLQFrRJOexPGzdfVQ8PeI=;
        b=gWNRI2EUSNVeFwUMJU8u6PWtIPKU/p2/bjiLSGrlSdzecEmWPHhCrzeOSBqE0XBPnO
         a1Kl4I3fmbegVY0ooEd6/5aSKlDZpWSSaaTYOLfmjaOrX/rtba97QkwyYIjdTOwldOgS
         LmfpZOfrr9odIzRxOvKaMBUWyYV4xkI6Y9AANzzudOWqjZiEIUuE7uDucnrc660yW+37
         h6C9qJkPKVrqLlbDQQ+GAnJl60zFtyACxhxGJGjKR8b5gHP9MckL2pXIE4HP/PGaZaC9
         azs5sV4xvhW2f7K640q6SasuoEYpHwfXgTzEhWynF0p88vFDjSOBlVCWKv/PPuoU+RmD
         OEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lkxtCcsfAVoExf0UCN2vdORLQFrRJOexPGzdfVQ8PeI=;
        b=ErdEksecJafgHKccdHLwlyMCimA1gBD0P83L+K9dD3Lj2dmd0/uNq7+Ado96COTaXK
         JqgPxHdDRtkv8uoBpw7y5KO3C2cHGYVVsS6LKrSUzYg9eZ7rWl9d/D4WyHZVoSvnCCWm
         4IIkwL+bA0h6xWohIHhWnR/xiKJ7jV9N/bVmcmtUVF3ssohgjgqaY9meUEC6/K7tbmIM
         iay4X0WZX6sR4R+9oRadaYzdCU8aBsKmRauHscnJ2VLi3okE7xz7cOSB+itMJTlMNs9H
         dM9PEoiuaAsd4FUBapodBKtvtBgZTC1a/Y7HG2+j3m0OMHQYLWs2sEsdq0rq36TeqYHu
         bCjA==
X-Gm-Message-State: AOAM530cRJb0iZ8tI6Gpq1JnLcATaJRfoCFV+7jJqrhl1zETBAOr7Msv
        BMau+u8IkHdUJwzl5nEQsji+VA==
X-Google-Smtp-Source: ABdhPJyUdZY1PYHVpDV0E9X6d0/1dum9wvltJuig/BGM/jBtyVGLtopVJ0c4MVlSI4ixtnJtHbgWeQ==
X-Received: by 2002:a05:6512:4021:b0:443:150e:6984 with SMTP id br33-20020a056512402100b00443150e6984mr19253713lfb.423.1645611283097;
        Wed, 23 Feb 2022 02:14:43 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.217])
        by smtp.gmail.com with ESMTPSA id s9sm2060256ljd.79.2022.02.23.02.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 02:14:42 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v6 3/4] PCI: qcom: Add ddrss_sf_tbu flag
Date:   Wed, 23 Feb 2022 13:14:34 +0300
Message-Id: <20220223101435.447839-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220223101435.447839-1-dmitry.baryshkov@linaro.org>
References: <20220223101435.447839-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm PCIe driver uses compatible string to check if the ddrss_sf_tbu
clock should be used. Since sc7280 support has added flags, switch to
the new mechanism to check if this clock should be used.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index b2db2180e1bc..7e97820eb575 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -195,6 +195,7 @@ struct qcom_pcie_ops {
 struct qcom_pcie_cfg {
 	const struct qcom_pcie_ops *ops;
 	unsigned int pipe_clk_need_muxing:1;
+	unsigned int has_ddrss_sf_tbu_clk:1;
 };
 
 struct qcom_pcie {
@@ -1164,7 +1165,7 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
 	res->clks[3].id = "bus_slave";
 	res->clks[4].id = "slave_q2a";
 	res->clks[5].id = "tbu";
-	if (of_device_is_compatible(dev->of_node, "qcom,pcie-sm8250")) {
+	if (pcie->cfg->has_ddrss_sf_tbu_clk) {
 		res->clks[6].id = "ddrss_sf_tbu";
 		res->num_clks = 7;
 	} else {
@@ -1512,6 +1513,7 @@ static const struct qcom_pcie_cfg sdm845_cfg = {
 
 static const struct qcom_pcie_cfg sm8250_cfg = {
 	.ops = &ops_1_9_0,
+	.has_ddrss_sf_tbu_clk = true,
 };
 
 static const struct qcom_pcie_cfg sc7280_cfg = {
-- 
2.34.1

