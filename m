Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E8A6724183
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jun 2023 13:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235796AbjFFL7H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 07:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237363AbjFFL7A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 07:59:00 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9825C170C
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jun 2023 04:58:48 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b034ca1195so27837725ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jun 2023 04:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686052728; x=1688644728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjWKDrRgMnW3zBrOSgxonL7ljOdChPgS9ijIAFrRv3U=;
        b=XdQXXw2Chor083A1sy7eve7YHfSD4oVswkU/kJ+q//lNNuD+IvzTJOhXextnpNVhko
         gx8FkKY1NkGV5aSyD8IL5ffjG6kWBWFAd0p+u9gJOMPV2hlQkEnedtR9sfVmQojOadzQ
         RTYYIOjpSNzkMOV1+PzKUFTGx07Xsaz8xPG07F/rjDZw0BaoPMs3eOoeHdp82Wr+lmJW
         AAjgGWbStbifI02d8DucwkE/00qtSQE0MitFhRv1wmYhXjvMcyhGVV+gNhJSTaHjiRje
         zPCoF8k9BjnmgYYHK4MQJC+8AfN5FvhRyCCNC3Vt1u4SPDO9obo+Rm8u7EpNn8nk7AW/
         BrRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686052728; x=1688644728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PjWKDrRgMnW3zBrOSgxonL7ljOdChPgS9ijIAFrRv3U=;
        b=UQbWjFNs8WOKXP/6L9ESALF4aFWKXAXifWU46unc1gwRd6Si1P0iAKf3fteRjEz1Zo
         xxkVEoMOJwZfFXEcxSxpWiJpvrXCu/3elk8pyMgyGJGbZ+jsZiUAPZ17fbN11yYWod6S
         CxnlHaGRNRETx+Md7VX7mRkAj6HGcvO4uwPbMdkXUiLQhz5R+4oe2vR/vzmCQL45BspW
         6IieBhYt7UQPzbH6NIefcepUGOSLNr9flmtqBh/cmfRzzR6l7jN/bf1vHTH/Nlsli3K3
         +L+ccIP+nd9InwHwAQFW7EYi85O6D60IQCvl+SIEL9LGPQhDk6FTlIRYzqBe9wzO0G7b
         Mg5Q==
X-Gm-Message-State: AC+VfDxEM49DK14u6uzIHnUEkOSAdl1CutzxQfeb0CWQJxG0YM+ZYcke
        W4UnnmQTWND9z6ncnKMtnNME
X-Google-Smtp-Source: ACHHUZ6uACJLhWbG1p2+Waltt1hidrIFimXDOm+E3kQ4rHKlCZPZriFgCe/9iJBY5knDXcpjGVgw9A==
X-Received: by 2002:a17:902:d716:b0:1b1:9d43:ad4a with SMTP id w22-20020a170902d71600b001b19d43ad4amr620814ply.44.1686052728071;
        Tue, 06 Jun 2023 04:58:48 -0700 (PDT)
Received: from localhost.localdomain ([117.202.186.178])
        by smtp.gmail.com with ESMTPSA id b5-20020a170903228500b001acaf7e22bdsm8419226plh.14.2023.06.06.04.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 04:58:47 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, kw@linux.com
Cc:     kishon@kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 5/7] PCI: epf-mhi: Add support for SM8450
Date:   Tue,  6 Jun 2023 17:28:12 +0530
Message-Id: <20230606115814.53319-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230606115814.53319-1-manivannan.sadhasivam@linaro.org>
References: <20230606115814.53319-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for Qualcomm Snapdragon SM8450 SoC to the EPF driver. SM8450
has the dedicated PID (0x0306) and supports eDMA. Currently, it has no
fixed PCI class, so it is being advertised as "PCI_CLASS_OTHERS".

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 22 +++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index 9c93a26ce337..f4d1d60bde56 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -97,6 +97,23 @@ static const struct pci_epf_mhi_ep_info sdx55_info = {
 	.mru = 0x8000,
 };
 
+static struct pci_epf_header sm8450_header = {
+	.vendorid = PCI_VENDOR_ID_QCOM,
+	.deviceid = 0x0306,
+	.baseclass_code = PCI_CLASS_OTHERS,
+	.interrupt_pin = PCI_INTERRUPT_INTA,
+};
+
+static const struct pci_epf_mhi_ep_info sm8450_info = {
+	.config = &mhi_v1_config,
+	.epf_header = &sm8450_header,
+	.bar_num = BAR_0,
+	.epf_flags = PCI_BASE_ADDRESS_MEM_TYPE_32,
+	.msi_count = 32,
+	.mru = 0x8000,
+	.flags = MHI_EPF_USE_DMA,
+};
+
 struct pci_epf_mhi {
 	const struct pci_epf_mhi_ep_info *info;
 	struct mhi_ep_cntrl mhi_cntrl;
@@ -656,9 +673,8 @@ static int pci_epf_mhi_probe(struct pci_epf *epf,
 }
 
 static const struct pci_epf_device_id pci_epf_mhi_ids[] = {
-	{
-		.name = "sdx55", .driver_data = (kernel_ulong_t)&sdx55_info,
-	},
+	{ .name = "sdx55", .driver_data = (kernel_ulong_t)&sdx55_info },
+	{ .name = "sm8450", .driver_data = (kernel_ulong_t)&sm8450_info },
 	{},
 };
 
-- 
2.25.1

