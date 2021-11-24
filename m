Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB80245C7A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 15:40:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352355AbhKXOn5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 09:43:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352343AbhKXOnz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 09:43:55 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AD36C21AA75
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 06:04:54 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id gt5so2650410pjb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 06:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LKK6ExNzSQzy0j7H6kvB9GSvV7uuA0xvCSvp04ywCxM=;
        b=wq0g7u7qaPUTV/HImPQzef8z2eLsaWXYcsiZAYi753fzSsLFjYyly9AHClHd9U7ie1
         4aFQyVax836p0JRlympP7qSa51wqP9Sb5d4/DObqA5oDiomBkNlv9W53bZFqAo+rY6Ke
         RHNrmTQbePQ+Whu1W9AvoDCMgmhSq9ALLYzUD9y6bdoMAPfPkan/ToOBCHGeouPsCqbd
         zFMw4JxBJGojrRwYAb25F+RVDIXSQGwAQWoVA0DhbhWSfOSD9NEth+8LRO3LFIpCRZ+j
         sagw/7YTD2Xd/jQ0dwkUS+GLjCg8FT3RfRhEz+5QCJ7gdcq/CbhD3oqD/5LtHHkpZE2y
         t/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LKK6ExNzSQzy0j7H6kvB9GSvV7uuA0xvCSvp04ywCxM=;
        b=f/1gMkWqqapDCeGZGLYKvLI8XveOla/jXx0VkiWze83oh+peUqI8V0lf2HVGha8zT+
         ifQJpoz+8ocRv4Xwwn52JMtNQ9m5j+7QCRJFM/AYRPcNo7xgv8XEg4WvPtU8XSn0MKZO
         bV/4KfmvTgOrtvPs/FDKbcLG7vegyNkKBor2iVGiUnKaEmufhlmF4dJulaHI38XlJ3lZ
         r8dOiy0191xZ+Hw6p9xiMHsocR7tERaP2ot4ht6nWqxSEViz8lXo13Dy/SOn0L5xj8t3
         57ln1KfhJSlBMSvYrjnbSA2/yOWfZ9II9J/YYhLCQ9OYgYvZLJctjzZgqGjE9JwzemR1
         B6lA==
X-Gm-Message-State: AOAM532Im6PxdLl3USal3EqGwmIKLBBPxdXlLm/9UCfejh2ffXsiV/N7
        2AncMXpctrSuz6lRmy1fGYxJ
X-Google-Smtp-Source: ABdhPJz4gF1KEK89rws4cRqe6hwRhjQidhv10SVJBA+zplygTVNOUnNSjgqlYzxgjMr/tAWENJef6A==
X-Received: by 2002:a17:902:7fc3:b0:144:e29c:228d with SMTP id t3-20020a1709027fc300b00144e29c228dmr18474667plb.4.1637762693629;
        Wed, 24 Nov 2021 06:04:53 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6d01:b1fa:45f8:8977:6ea4:8b04])
        by smtp.gmail.com with ESMTPSA id q1sm17446019pfu.33.2021.11.24.06.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 06:04:53 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lorenzo.pieralisi@arm.com, bhelgaas@google.com
Cc:     svarbanov@mm-sol.com, bjorn.andersson@linaro.org, robh@kernel.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] PCI: qcom: Fix warning generated due to the incorrect data type
Date:   Wed, 24 Nov 2021 19:34:24 +0530
Message-Id: <20211124140424.51675-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the below sparse warning due to the use of incorrect initializer
data type (u16) for bdf_be variable that receives the return value of
cpu_to_be16(). The correct type should be __be16.

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/dwc/pcie-qcom.c:1305:30: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned short [usertype] bdf_be @@     got restricted __be16 [usertype] @@
   drivers/pci/controller/dwc/pcie-qcom.c:1305:30: sparse:     expected unsigned short [usertype] bdf_be
   drivers/pci/controller/dwc/pcie-qcom.c:1305:30: sparse:     got restricted __be16 [usertype]

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 8a7a300163e5..6c3b034e9946 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1312,7 +1312,7 @@ static int qcom_pcie_config_sid_sm8250(struct qcom_pcie *pcie)
 
 	/* Look for an available entry to hold the mapping */
 	for (i = 0; i < nr_map; i++) {
-		u16 bdf_be = cpu_to_be16(map[i].bdf);
+		__be16 bdf_be = cpu_to_be16(map[i].bdf);
 		u32 val;
 		u8 hash;
 
-- 
2.25.1

