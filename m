Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A4795659BF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 17:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234207AbiGDP1y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 11:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234068AbiGDP1v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 11:27:51 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A946EDF1C
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 08:27:49 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id y18so618367ljj.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 08:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L3hxfZ0INqfe5FRYfY5gX/4X+Eai+VnYJoMpCYqKrGg=;
        b=C/bwJ8iWbkuGKDGZOXxl65duS/pwuksiXWJ8tMFEmaFk4Z6GjuX+9x9CDFgnhBYaVM
         DSnhhfgYCklnDzGcfiIkjPeSb6Mv505VZso7qKHqCvo2gEmadC6YoA9KcG8zVUcWyGkj
         xaAzm3CsHHfMZ1cZQThH/0J6otT4j+TEjvWzaJphHYGpsYKlEzkI4VxZZoW9GIbAnvrs
         m/KW92MtIEY6iD33H4RdSOTipX3H1JnwV5+lmgRpRL5+xwXVSpGMuM/hVBXzefD5tC6L
         1qMSPq0IMCNX4EVjgdLtDmmHgppLrNcDL+149Tb5tWKeh/EabrEn2aZ02J4UsLIohAUJ
         KsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L3hxfZ0INqfe5FRYfY5gX/4X+Eai+VnYJoMpCYqKrGg=;
        b=LaApewh9eoKvPyshswcs52GrnNQFiCvUETMU/TcuYHvUJdx8t/h0+mKQukoJaPqQzB
         pUfpGoQ74Iwkd0h5z75PCOw63myBL4GcMTJZmxjJ1Xl7JPP99bRMGjSh1278y57MOb9v
         h0N4AJJmod/MbSxSGNL09xmTxVQqcK9GOWkWiK3Xvep2F0uE/OvMRj7Clk5f884WIbs2
         vymnR8cLIy+dOsy932cEGSEirodjFRsWQEP9kk2buQyr3gPoFMBw+Q7UHf57wI89KaYn
         6oLjPMlRB5/20K/HMVzZx+D3gW85cCjrHy8hApSWRZpUg+/CEsIQyPWjXCoPgXdHYYN+
         5P3g==
X-Gm-Message-State: AJIora+z2iEtLOOAIEcXnS3a1lYQ4djmMgR4jLyrw1ceSMaDCSmGkIjf
        SyOBP09Y1NnWw8JmjQCyT2wWx9HRPwamuQ==
X-Google-Smtp-Source: AGRyM1uHZX2Xb557mo+9OD9pFIQ7W2QHhgCAXCuHEoeZQaHCQYrj313gUBjkYf0BvooVpRdHK7akyQ==
X-Received: by 2002:a2e:a286:0:b0:25b:bce0:720c with SMTP id k6-20020a2ea286000000b0025bbce0720cmr16989236lja.458.1656948467987;
        Mon, 04 Jul 2022 08:27:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h14-20020a056512220e00b004786eb19049sm5175820lfu.24.2022.07.04.08.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 08:27:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v16 1/6] PCI: dwc: Correct msi_irq condition in dw_pcie_free_msi()
Date:   Mon,  4 Jul 2022 18:27:41 +0300
Message-Id: <20220704152746.807550-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220704152746.807550-1-dmitry.baryshkov@linaro.org>
References: <20220704152746.807550-1-dmitry.baryshkov@linaro.org>
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

The subdrivers pass -ESOMETHING if they do not want the core to touch
MSI IRQ. dw_pcie_host_init() also checks if (msi_irq > 0) rather than
just if (msi_irq). So let's make dw_pcie_free_msi() also check that
msi_irq is greater than zero.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 1e3972c487b5..4418879fbf43 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -257,7 +257,7 @@ int dw_pcie_allocate_domains(struct pcie_port *pp)
 
 static void dw_pcie_free_msi(struct pcie_port *pp)
 {
-	if (pp->msi_irq)
+	if (pp->msi_irq > 0)
 		irq_set_chained_handler_and_data(pp->msi_irq, NULL, NULL);
 
 	irq_domain_remove(pp->msi_domain);
-- 
2.35.1

