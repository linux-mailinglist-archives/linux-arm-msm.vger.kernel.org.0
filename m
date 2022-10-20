Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D420605C5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Oct 2022 12:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbiJTKbc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Oct 2022 06:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbiJTKbY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Oct 2022 06:31:24 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B31E05A2FC
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Oct 2022 03:31:23 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id i21so22804676ljh.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Oct 2022 03:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lkosi1G8fiwOAzxV9MPf8p6ZfuhJ8Ws+fSLTcn2Ll0=;
        b=cTy8wXVvzrpTrxRXAnAK8Yc16JmTJNsRsKc9xjmOvmAQ3Ctol1uUBWBnW78+s4ro2E
         GRlZEx5e+Rk4kA4ogHxoUuVs42goH27dYfqyxqQXl3jPBbsKL5+sroiz+auTQ9ggitsK
         lnyRaTZik8Wi+2jGrTpHs5Cq6+bTz0m50C3MbOzhtszTYcUKwa5P+IBTBsCTZUqMfzkS
         EXe6ycttqJSFyWQD2jG42ryCE9Ng/Qj2NMUuwIDQnMhzLPOSSVJKD62uF0TlNtuTxqT+
         TtzVMB/Qkpu/vFiEJzvwZe6FYJTFKVbRTxI/h5+fP9A5XbR/b2xWDyvJDzlXL2tSijW7
         DwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6lkosi1G8fiwOAzxV9MPf8p6ZfuhJ8Ws+fSLTcn2Ll0=;
        b=PBG1JLWVuvjIQbNp7rjsOvsb35s+LEiwkm5r63NpuOtX0Wnp9ADzj5GH2nDJI1GPQY
         ECAHeziEM5qgwwvC06P/U4H/DoWtIo/eY7KwOHP+ZjehIHDWATX+V5/XkDhiQ/PfAhaj
         3Er90IW0/ghAW6kq8b0LttAmf4+jigtiUn7doMuOYwTeOiJ6TW0oHMYOxTh5WXjKrYcR
         TYUMIR9MnqDiKMH547Gxx9cyKcl4Vlp+qMvwR/dtnUdPel83+Y0HVwpc6zYUunamejT5
         lqgrrIXPB0kta6PoiDQK180KNDd9VHH58xmpSsWjLRBewrp30BlWcUBa0LrECar5vZsq
         Tuhg==
X-Gm-Message-State: ACrzQf2gQ31XXgcPlxYQrmrq2sunCaklhmKSFTzfKcQ85tCTvvz4CLjh
        mBA+ndfTRaW9ZTNgmQYOYr+bWLt/NAj9cA==
X-Google-Smtp-Source: AMsMyM6/orQWde4hd0X2/yba//8yJqaLyXF6qQMtSWiPdoU3Z/FrNZCeNqV2lF8ne0cGlhHCpSsj9g==
X-Received: by 2002:a2e:834b:0:b0:26d:ffb1:dae7 with SMTP id l11-20020a2e834b000000b0026dffb1dae7mr4574079ljh.128.1666261882067;
        Thu, 20 Oct 2022 03:31:22 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l2-20020a2e3e02000000b0026be1de1500sm2829019lja.79.2022.10.20.03.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 03:31:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/4] PCI: qcom: Move 2_1_0 defines close to the struct definition
Date:   Thu, 20 Oct 2022 13:31:17 +0300
Message-Id: <20221020103120.1541862-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221020103120.1541862-1-dmitry.baryshkov@linaro.org>
References: <20221020103120.1541862-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move the QCOM_PCIE_2_1_0_MAX_* just before the struct
qcom_pcie_resources_2_1_0 to follow the example of other structs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index f711acacaeaf..939f19241356 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -117,11 +117,10 @@
 
 #define DEVICE_TYPE_RC				0x4
 
-#define QCOM_PCIE_2_1_0_MAX_SUPPLY	3
-#define QCOM_PCIE_2_1_0_MAX_CLOCKS	5
-
 #define QCOM_PCIE_CRC8_POLYNOMIAL (BIT(2) | BIT(1) | BIT(0))
 
+#define QCOM_PCIE_2_1_0_MAX_SUPPLY	3
+#define QCOM_PCIE_2_1_0_MAX_CLOCKS	5
 struct qcom_pcie_resources_2_1_0 {
 	struct clk_bulk_data clks[QCOM_PCIE_2_1_0_MAX_CLOCKS];
 	struct reset_control *pci_reset;
-- 
2.35.1

