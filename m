Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5C456A457
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 15:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236076AbiGGNsS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 09:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236036AbiGGNrh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 09:47:37 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C86E821E05
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 06:47:36 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id a39so22304422ljq.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 06:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mgPM28PgCpzcHDh49dkIvTB5xyjGluhH4a4yhjoc/Gw=;
        b=YvF5FkYvZNtR+KI1G0JpTqDCdrI6wIhF0yuACRygB/8KBq/pB8hVbV1VoYYSVFQkiu
         aTYCZjYftzbNxBETkLXBZqYxp1RezA0TCIbpEjkZT0QoHFE0uRjahYFFzpRCB8sLPh4J
         yRDG9sUb1wqaYohvsz2djFHFLJLKho5qbYGf8Von/WOeVkugvPJTTIWyNE6nb66rT8xH
         CjdxszNbjzACnvjkQ7iPI+JH8fXS8P5me//XqRiDjxwdGPDbDKbqSQ8Ty798so/gCDMI
         ZEnzMpO34eqx2/SQ64Z4Eks+FhvGH9kc6GFL2qCiFwsA2nXrzso/9aeXnSJ0IFNmPSVI
         qdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mgPM28PgCpzcHDh49dkIvTB5xyjGluhH4a4yhjoc/Gw=;
        b=BVraRps5sktTtcinqzpvcADT5GIWcn9zJH76Ky3CXqjaEEKEp40mZ3C+lB/Cj9I/wu
         vSpZs9Fs0N+AZetXZzV9lrqFSV15NnMuTCxZm3HM3yyrrjFCOlxrLdr2QV6SlFg9VUjo
         fYS3VSf7BZJyCq+JJ23+MsafI7bqcDfzs2GydXTuAzW/TxBadMfxoSP17TFtshlJCiaf
         mDlrEDVfuNqE3tEq3U4+Hr4Dv7adI0fuSXdDA5tHbhdi6uLZY2Qu3o7Ghrst6ftmNuRS
         HlXNUqri5U4lWUkYiNgD/oIW5fA9D8FvW71gCFWPv+RWMvPB3u2k2bbmtMnTI+BbCTET
         ezKw==
X-Gm-Message-State: AJIora9iH6CO+u+b6aNSbb32WAmfzPUuh9MjloyTAOyVEHXXblvpueLd
        XJJ8c+7UQHp0QxJxDnCOSDlBdA==
X-Google-Smtp-Source: AGRyM1tjFE+TqFl6NekorWFgXEspYRAL7ObD6F5VSofRK5cnqSI/we0OUVKWiP7tkLqC7QqJ/Nc3aQ==
X-Received: by 2002:a2e:b8c2:0:b0:25b:d31b:7fd5 with SMTP id s2-20020a2eb8c2000000b0025bd31b7fd5mr17444746ljp.256.1657201655216;
        Thu, 07 Jul 2022 06:47:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u22-20020a197916000000b0047fa941067fsm6856966lfc.29.2022.07.07.06.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 06:47:34 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
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
Subject: [PATCH v17 1/6] PCI: dwc: Correct msi_irq condition in dw_pcie_free_msi()
Date:   Thu,  7 Jul 2022 16:47:28 +0300
Message-Id: <20220707134733.2436629-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220707134733.2436629-1-dmitry.baryshkov@linaro.org>
References: <20220707134733.2436629-1-dmitry.baryshkov@linaro.org>
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

The subdrivers pass -ESOMETHING if they do not want the core to touch
MSI IRQ. dw_pcie_host_init() also checks if (msi_irq > 0) rather than
just if (msi_irq). So let's make dw_pcie_free_msi() also check that
msi_irq is greater than zero.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 79ade8b79b6d..49f1a786404e 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -257,7 +257,7 @@ int dw_pcie_allocate_domains(struct dw_pcie_rp *pp)
 
 static void dw_pcie_free_msi(struct dw_pcie_rp *pp)
 {
-	if (pp->msi_irq)
+	if (pp->msi_irq > 0)
 		irq_set_chained_handler_and_data(pp->msi_irq, NULL, NULL);
 
 	irq_domain_remove(pp->msi_domain);
-- 
2.35.1

