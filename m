Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E7876C0AD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 07:46:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbjCTGq4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 02:46:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjCTGqy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 02:46:54 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C81E2D40
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 23:46:53 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id e15-20020a17090ac20f00b0023d1b009f52so15370787pjt.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 23:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679294812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VaxDrE6sBelofBs54+Z3CMb25A0XT3Une6FS0Y2mEhs=;
        b=wi1+mN7GaJ4u0+hEKsy2oofsDrcs6R+8hM3lxZTB/rB1m0ZSCgQNTvHwNpL0xU9xfi
         EaCqhXmw5isP6bSykPi5nvg/EzBDaZ9JpjJGnVC0RR1oAhyH48CrC4MHsnEfq6a6nT7R
         OW3wNgX/H7dKYHNbIV7DKn90XtRCqYPj0kRaE+r7giVBYfywylF/VPqa3TQ0IdjV7IbJ
         PRJeEai8K8rBpwEUgvp1vsjrxSRCrqzsoJD4NIidOmBROS0H8HOtRcQhCLTFZ3iMuZtm
         9NdTo9cEc17eueWVv876JiJLgFRxnVVRVCEp72dugpnDwfdLIkuugLujXF+4ndBfGyAm
         TMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679294812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VaxDrE6sBelofBs54+Z3CMb25A0XT3Une6FS0Y2mEhs=;
        b=AYM4heC2N2Ut1JLOqNXmUWlDjOWyRnB4YeDOM+J09RVi43i3LRNkx+ln+3VM3DhUTt
         WjrDx4eTSXCFkWsDgiqAXbebCWZsJzNSf5k5LVsUfm1h9B9tLB14/c1xgdEOg1MpJpwJ
         66fv9w0FsCGYIrAHVWFy6MyV8N7jsCWNdoQdci1Apeg4EgEJQNGPkrR2dFcTtKMf6w3T
         SL3che4vW5TYx5DfMm8LcMYOVCj+yghmneDVc7TNV8YuXm6JHBDnQsrk6pF3hV3Gs08s
         WVR/lhWDDHYEQ+iuagpOAsNrdX+wTFiS8Ivutcku3lSZ8KOfJK/ho4n9CSKuvut+wG3R
         Hz2Q==
X-Gm-Message-State: AO0yUKU+ivQxD5LpFY8o4t86lGofIthk2F2m2135vcjAss2GS9A8NjHB
        K8hhGljxH7Q4FKTBhSP7XI0k
X-Google-Smtp-Source: AK7set+3SI3wk2EsbMEEQTr9wQv3GdLpwqjTZWBEPt2as3AtF1LSd86q/Bqa+7hWcN4ylIGkqU0tYQ==
X-Received: by 2002:a17:902:db07:b0:1a1:d949:a52d with SMTP id m7-20020a170902db0700b001a1d949a52dmr635544plx.65.1679294812417;
        Sun, 19 Mar 2023 23:46:52 -0700 (PDT)
Received: from localhost.localdomain ([59.97.54.141])
        by smtp.gmail.com with ESMTPSA id p7-20020a1709028a8700b001a1860da968sm5793382plo.178.2023.03.19.23.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 23:46:51 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, kw@linux.com
Cc:     robh@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        johan+linaro@kernel.org, steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2] PCI: qcom: Add async probe support
Date:   Mon, 20 Mar 2023 12:16:44 +0530
Message-Id: <20230320064644.5217-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
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

Qcom PCIe RC driver waits for the PHY link to be up during the probe. This
consumes several milliseconds during boot. So add async probe support so
that other drivers can load in parallel while this driver waits for the
link to be up.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Changes in v2:

* Rebased on top of v6.3-rc1

 drivers/pci/controller/dwc/pcie-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index a232b04af048..4ca357be88e0 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1862,6 +1862,7 @@ static struct platform_driver qcom_pcie_driver = {
 		.name = "qcom-pcie",
 		.suppress_bind_attrs = true,
 		.of_match_table = qcom_pcie_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 builtin_platform_driver(qcom_pcie_driver);
-- 
2.25.1

