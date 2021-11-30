Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24B18462E3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Nov 2021 09:09:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239459AbhK3IMz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Nov 2021 03:12:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239446AbhK3IMy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Nov 2021 03:12:54 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D6D7C061714
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Nov 2021 00:09:36 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id y14-20020a17090a2b4e00b001a5824f4918so17646420pjc.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Nov 2021 00:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bly9GlQE9/JyEKSh/5GI0ST+fFzm9mG/myfF2bLxku4=;
        b=UvbICQtz9xncEJyS6L4w9UHSs484FId5l+ggZSBTf1C+xccW3Li+S0FZZFLSdyb6Nh
         WBBca/gF9Nf5qdsq23KLGQ0oZkrqrsMJZOTQWwvD0VAUmDTT6VIs27heyGqIhnwXCN6J
         RuXxzacRfreZWohUUuvY6mxZ4Avxk89rSd/XUYRrr965SlUAQ0a4T7gAmMGkW7uvxCRf
         eJWyfwRnrJMNCH/nrrUzZMLvZqy0sVVGZ3Cc0necyJWbUFtc3EM43WU+eYilK7/C8jek
         PV20XAZQcLBkHkuxx8OBbpBrEauM1nt4ZYMyvICUBpMCFRhH3vyKPAS4OMQuVX1busxo
         CKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bly9GlQE9/JyEKSh/5GI0ST+fFzm9mG/myfF2bLxku4=;
        b=miYl4uulDICWXjttEZeIoC5kaMfPVIuqTFde2H4AagIldGH/CQJMW2nzw6gN3+0Xo1
         ESjluYX16gslahzbIOdXLPP1HmdEJ+aoqPQykT9c0tnTnYCp55U73NXxmtMdVeJGDHrt
         D68GGH/S1hWz9v5AqIudsate6Ksd/kdlLwpDNPs+YXMyW6uqRbQxA4xcMNnryS3rBLvv
         uebkxU+E4EZu19G6hp8ON4Li2K8ewflU5KhZ6eBtWV7POtFyLhEsgu3/GXTUNlvIluzv
         YoWhb9yz27ipjz8oqANvztfZLsUOmGQ093pQ7XuQd0ihUkW5UGcOEAJGZTLfaF3Ft27N
         s85w==
X-Gm-Message-State: AOAM532pPjNsKO8seFgbVjRzXd+FFHqO6qD5gOF7DmhPIwKLHBAr+aAj
        /ijjem6S7aHQiI74GbxXWnM7
X-Google-Smtp-Source: ABdhPJxtTZUBC0SRMaIc0y3cQL/FKYQEWA0qhBlBJKChPYousUEzqNOJoTbiVazJVXx9uOsqsH6Xeg==
X-Received: by 2002:a17:902:bcc4:b0:141:bfc4:ada with SMTP id o4-20020a170902bcc400b00141bfc40adamr65113728pls.20.1638259775500;
        Tue, 30 Nov 2021 00:09:35 -0800 (PST)
Received: from localhost.localdomain ([202.21.42.3])
        by smtp.gmail.com with ESMTPSA id c18sm20366043pfl.201.2021.11.30.00.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 00:09:34 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lorenzo.pieralisi@arm.com, bhelgaas@google.com
Cc:     svarbanov@mm-sol.com, bjorn.andersson@linaro.org, robh@kernel.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        kernel test robot <lkp@intel.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
Subject: [PATCH v3] PCI: qcom: Use __be16 type to store return value from cpu_to_be16()
Date:   Tue, 30 Nov 2021 13:39:24 +0530
Message-Id: <20211130080924.266116-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

cpu_to_be16() returns __be16 value but the driver uses u16 and that's
incorrect. Fix it by using __be16 as the data type of bdf_be variable.

The issue was spotted by the below sparse warning:

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/dwc/pcie-qcom.c:1305:30: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned short [usertype] bdf_be @@     got restricted __be16 [usertype] @@
   drivers/pci/controller/dwc/pcie-qcom.c:1305:30: sparse:     expected unsigned short [usertype] bdf_be
   drivers/pci/controller/dwc/pcie-qcom.c:1305:30: sparse:     got restricted __be16 [usertype]

Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Krzysztof Wilczyński <kw@linux.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Changes in v3:

* Added Krzysztof's reviewed-by tag and modified the commit message as per
his comments

Changes in v2:

* Modified the commit message and subject to describe the actual issue
as per comments from Bjorn.

 drivers/pci/controller/dwc/pcie-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 1c3d1116bb60..ddecd7f341c5 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1343,7 +1343,7 @@ static int qcom_pcie_config_sid_sm8250(struct qcom_pcie *pcie)
 
 	/* Look for an available entry to hold the mapping */
 	for (i = 0; i < nr_map; i++) {
-		u16 bdf_be = cpu_to_be16(map[i].bdf);
+		__be16 bdf_be = cpu_to_be16(map[i].bdf);
 		u32 val;
 		u8 hash;
 
-- 
2.25.1

