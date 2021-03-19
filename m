Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 729B734205E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Mar 2021 16:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbhCSPAl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Mar 2021 11:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbhCSPAY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Mar 2021 11:00:24 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 165EAC06175F
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 08:00:24 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id cl21-20020a17090af695b02900c61ac0f0e9so8577802pjb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 08:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M5Nw3l3C9BhgQoUREMWsI0hgInH8MQVfR6+8IVWCIdo=;
        b=LRfVRr52FqDBkEVxTUXWNlPa4tABOweGyyPlJeYU/Y4rVMgc4Bk30CXouKPWd/ngAt
         c/kNNTvvcSVlT58veMoXnjecZ2pAftOLbWfUWf3A0DdBhBsC71WmhL1mRSBbGB05GyBc
         JN+r9/zzKisMlhi4ItfeSr0fcJVsk9KuCM638bJikQJG3c7J2r8i0WOcImvgzyzWp+/V
         UB0XnGmHoUpNFBN7v99yEwj8hBysFV+73wkjXSmvv4wrWiiJ4ds14SaWY1Ow7AEnLml+
         Lp2hbrVKQwlQ2+VOIV40epu/D99cdP2CPfv27K1nIh6+jWmkbLx+pwAWKQi78eXDjAdt
         U4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M5Nw3l3C9BhgQoUREMWsI0hgInH8MQVfR6+8IVWCIdo=;
        b=KnetNQB3X9PiUCmZ/BUFfu2bSNRmTt/K2SgxmsYUm9ji5DkowhryPEaL+InLQyVbVz
         bTwHFIh5HLsgnaFs2r4QjDG7S0kVJFX3pSY9hv7SmVmfDIuPOHRbeXkxo1QmWdhaGGP7
         6d7RbDsAx63OUzREzqn/7kJ9KiJ4I6r2HOzfnz6igCbePgEzraity+6p2z3DJN/hOhe8
         +IECOlkiGnukfQixSdLh2QUJ94iUSt3rPEpX4mnv1yQr+YCsap/xrQuSs+0hAeXp49Nd
         FgA0jbcf8wOB7ussvie/llgv2IwXenWNVba1i/SqlieZG6W6ZzO2JVrp2Rt/BkjBLipx
         gvmA==
X-Gm-Message-State: AOAM531+/MEQyJS9/2ePQpOQpwev0tYkfdO7byK+OpgRnoCIz0eRHMsy
        s8QxPWN0UggyCq+x7+Ewbhrn
X-Google-Smtp-Source: ABdhPJzRdG3EHRNcsqeZH3zxvrakB+67UgBZfGqv+04SW1ZSsKQqM3nJoZmfPsjgN7aWs6aw8q5tdQ==
X-Received: by 2002:a17:90a:be07:: with SMTP id a7mr10450804pjs.75.1616166023408;
        Fri, 19 Mar 2021 08:00:23 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:387:dba9:92f4:36c7:1aec:59de])
        by smtp.gmail.com with ESMTPSA id h19sm6092345pfc.172.2021.03.19.08.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 08:00:22 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
        bjorn.andersson@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v7 0/3] Add support for secure regions in NAND
Date:   Fri, 19 Mar 2021 20:30:07 +0530
Message-Id: <20210319150010.32122-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On a typical end product, a vendor may choose to secure some regions in
the NAND memory which are supposed to stay intact between FW upgrades.
The access to those regions will be blocked by a secure element like
Trustzone. So the normal world software like Linux kernel should not
touch these regions (including reading).

So this series adds a property for declaring such secure regions in DT
so that the driver can skip touching them. While at it, the Qcom NANDc
DT binding is also converted to YAML format.

Thanks,
Mani

Changes in v7:

* Made "size" u64 and fixed a warning reported by Kernel test bot

Changes in v6:

* Made use of "size" of the regions for comparision
* Used "secure" instead of "sec"
* Fixed the sizeof parameter in of_get_nand_secure_regions()

Changes in v5:

* Switched to "uint64-matrix" as suggested by Rob
* Moved the whole logic from qcom driver to nand core as suggested by Boris

Changes in v4:

* Used "uint32-matrix" instead of "uint32-array" as per Rob's review.
* Collected Rob's review tag for binding conversion patch

Changes in v3:

* Removed the nand prefix from DT property and moved the property parsing
  logic before nand_scan() in driver.

Changes in v2:

* Moved the secure-regions property to generic NAND binding as a NAND
  chip property and renamed it as "nand-secure-regions".

Manivannan Sadhasivam (3):
  dt-bindings: mtd: Convert Qcom NANDc binding to YAML
  dt-bindings: mtd: Add a property to declare secure regions in NAND
    chips
  mtd: rawnand: Add support for secure regions in NAND memory

 .../bindings/mtd/nand-controller.yaml         |   7 +
 .../devicetree/bindings/mtd/qcom,nandc.yaml   | 196 ++++++++++++++++++
 .../devicetree/bindings/mtd/qcom_nandc.txt    | 142 -------------
 drivers/mtd/nand/raw/nand_base.c              | 111 ++++++++++
 include/linux/mtd/rawnand.h                   |   4 +
 5 files changed, 318 insertions(+), 142 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/qcom_nandc.txt

-- 
2.25.1

