Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5333B7099CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 16:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232098AbjESOcB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 10:32:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbjESOb6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 10:31:58 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A735E75
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 07:31:46 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-517bdc9e81dso1793636a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 07:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684506706; x=1687098706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrAhSKm9IAEYF8Oyjbiqm3Kr+qbE8wWoowYF4lezkew=;
        b=KrcnnE6Wy/j+Lu+0KD+I+VhZ7oQ96BPjFWTBQRcrDn0wqWCgVq//p5S6asE3gSyO2g
         PR9PzAxR8EcT8dAX+TNlWf9A9j6imlLIkibmMF3TJKRUE7bQ6/HBFaU4W14WzoRE6cd0
         cMEFO5chTTYJzeMcGVJfSygLu1gBxSBkMk3V3o3WovOM9ZbkAo8xUbfT1AeBAjYBpQVj
         XFsdWFMIUSWnwbzr4F4kydFnSFnQmY84QIah/oi0ogLjxvwRtIt3VwDhvBLuCm+Z6Csv
         Uz2Ca5Qt80eeyEjfAXvxSrBr+dInUR+GSUC6qk15B53QtJrxniNtZiqQyVXbUg202R3P
         LctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684506706; x=1687098706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XrAhSKm9IAEYF8Oyjbiqm3Kr+qbE8wWoowYF4lezkew=;
        b=JEP2aoA+y8AxILlMWugOHo6VZceS3axiT9KRc1mo1h4gxE0B9b35/0ewagQBGFaaVh
         uGFTM5GjbzAIESwDS+gD6fIMLWocYn/cxWxpsSX1bQr3v4j5ECPq/g/gf3nUzqoqY+Rc
         m1fxywVYSA3j5gHRJLZ5p1Yl6vFvZWvv8iIAqSIeZY+s3VBLj95KQsb2GGsOeuMs3UH3
         f+lrL3ffwRbBstiLXH5oN0TTD1fSgRU48tLcC40KDpmaVBikhre6Zr43X1FYP1zVionY
         iTuGQxJ1VUL1AAR4YM84mPfcoguNsZeauojTgfaRAE4ZFRMbKFNW2ZJVtj3kuc4GHZ3D
         C19A==
X-Gm-Message-State: AC+VfDzze+uvpeBogvogXdmCx7Lx83nr1/+8LvcSbKsx2rR/WaykLht2
        aA84GiLhWtqW5Ov9XvcA2eK0
X-Google-Smtp-Source: ACHHUZ6FvFQlXAhn9AXCr/VtBhq/u6iEiV89bMI2YtZsFKedV+ltl9VLe4uEiOZzSfETwBpPQ22jWA==
X-Received: by 2002:a17:90b:615:b0:253:4799:75de with SMTP id gb21-20020a17090b061500b00253479975demr2282602pjb.37.1684506705919;
        Fri, 19 May 2023 07:31:45 -0700 (PDT)
Received: from localhost.localdomain ([117.202.184.13])
        by smtp.gmail.com with ESMTPSA id 30-20020a17090a09a100b00250d908a771sm1634845pjo.50.2023.05.19.07.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 07:31:45 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com
Cc:     robh@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, steev@kali.org,
        quic_srichara@quicinc.com, dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@gmail.com>
Subject: [PATCH v2 4/8] PCI: qcom: Do not advertise hotplug capability for IPs v2.3.3 and v2.9.0
Date:   Fri, 19 May 2023 20:01:13 +0530
Message-Id: <20230519143117.23875-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230519143117.23875-1-manivannan.sadhasivam@linaro.org>
References: <20230519143117.23875-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SoCs making use of Qcom PCIe controller IPs v2.3.3 and v2.9.0 do not
support hotplug functionality. But the hotplug capability bit is set by
default in the hardware. This causes the kernel PCI core to register
hotplug service for the controller and send hotplug commands to it. But
those commands will timeout generating messages as below during boot
and suspend/resume.

[    5.782159] pcieport 0001:00:00.0: pciehp: Timeout on hotplug command 0x03c0 (issued 2020 msec ago)
[    5.810161] pcieport 0001:00:00.0: pciehp: Timeout on hotplug command 0x03c0 (issued 2048 msec ago)
[    7.838162] pcieport 0001:00:00.0: pciehp: Timeout on hotplug command 0x07c0 (issued 2020 msec ago)
[    7.870159] pcieport 0001:00:00.0: pciehp: Timeout on hotplug command 0x07c0 (issued 2052 msec ago)

This not only spams the console output but also induces a delay of a
couple of seconds. To fix this issue, let's not set the HPC bit in
PCI_EXP_SLTCAP register as a part of the post init sequence to not
advertise the hotplug capability for the controller.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@gmail.com>
Tested-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 8f448156eccc..64b6a8c6a99d 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -140,7 +140,6 @@
 						PCI_EXP_SLTCAP_AIP | \
 						PCI_EXP_SLTCAP_PIP | \
 						PCI_EXP_SLTCAP_HPS | \
-						PCI_EXP_SLTCAP_HPC | \
 						PCI_EXP_SLTCAP_EIP | \
 						PCIE_CAP_SLOT_POWER_LIMIT_VAL | \
 						PCIE_CAP_SLOT_POWER_LIMIT_SCALE)
-- 
2.25.1

