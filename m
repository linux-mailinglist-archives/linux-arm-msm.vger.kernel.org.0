Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C680351BE9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 20:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235529AbhDASL6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 14:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238491AbhDASJa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 14:09:30 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D25AC022589
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 08:20:05 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id o2so1195593plg.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 08:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CbD76d1dqB6q8MXTffec9yNB90qyRTdmg3kpNe3oDsE=;
        b=k2pOlXXTM8fN/cGpPVsybsAWGnSRAxRRm3W4WVLToLIMzwK3lbEwCM3TqPfxodbE2J
         r3yY+owOLk5EKoeGbmrxxDhUfzBbuf4Dyqk8lW32hi1asrJHmsaLzF3A9fCIg6kaFsiW
         UgKWaBS38yhD1nMukXSa8ISpqQPu1OuFjigUcw3DwYUDyUSVm5JoD8Sk/RPpwQ+PD1o4
         5F5/Xk6u5S+kvieTgpnAQVD0mSaVpAcRxwy80OmiP1q9gSVKNhPG4ohY/YOwpScuGq3h
         LhFbNBilA+bftoqCAsuB8Vw+YFdVt9fEkxF1+2fzpZnuPnd4kJDYC9U5PgS5ftL2u3ZK
         pVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CbD76d1dqB6q8MXTffec9yNB90qyRTdmg3kpNe3oDsE=;
        b=fvCQ6ussP4xL+tik833NAMo+neu2tGSLpYhOxhHfVYyiyfZjS9iuErDzpObGWESFtv
         VIYCMgNSIFAQtXW+H6fnnW976a/CS+tPN9g4sdxAXH5H70f8OIIos9wp2M+EariMCgqS
         o5rgTVcEJjXyJDolgtWnwAF8Zgt11vv0jxL+Ic/g3tVLdC0BvAGZ+II+ywl9fMmYJt5u
         74GPTNYnMeDtsvNF7z5/ijopEBrFj5Kk5zTBJJictAp52dZrGaq6C47hW3yAnLhRmuHG
         vEjTIZmg5VmTYSNB9GD/AXJfOH9vJTUVU5+qxwJd2dMK5+ypsHSii35Xvu6oxw5FVLCM
         4Usg==
X-Gm-Message-State: AOAM530TUZe/dedOdpe0FSiQ3KZkCJUnbVM5WWLydzjaQXdaZhrNkSo4
        dOaMFn7DUbbPDY6zjTQtF/ju
X-Google-Smtp-Source: ABdhPJzfS/Kx1OAi9bjnKkHmQhTNDY6Cc4WwA375CsZZiIXoudnNb14Aqnx3JfGBo5ydSI+5HBVZHg==
X-Received: by 2002:a17:902:ec84:b029:e5:bd05:4a98 with SMTP id x4-20020a170902ec84b02900e5bd054a98mr8340208plg.76.1617290404772;
        Thu, 01 Apr 2021 08:20:04 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.138])
        by smtp.gmail.com with ESMTPSA id l22sm6500919pjl.14.2021.04.01.08.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:20:03 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
        bjorn.andersson@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v10 0/4] Add support for secure regions in NAND
Date:   Thu,  1 Apr 2021 20:49:51 +0530
Message-Id: <20210401151955.143817-1-manivannan.sadhasivam@linaro.org>
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

Changes in v10:

* Added Rob's review tag for binding

Changes in v9:

Based on review comments from Miquel:

* Fixed the secure-regions check
* Renamed the function to nand_region_is_secured() and used bool return
* Moved the parsing function to nand_scan()

* Added a patch to fix nand_cleanup in qcom driver

Changes in v8:

* Reworked the secure region check logic based on input from Boris
* Removed the check where unnecessary in rawnand core.

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

Manivannan Sadhasivam (4):
  dt-bindings: mtd: Convert Qcom NANDc binding to YAML
  dt-bindings: mtd: Add a property to declare secure regions in NAND
    chips
  mtd: rawnand: Add support for secure regions in NAND memory
  mtd: rawnand: qcom: Add missing nand_cleanup() in error path

 .../bindings/mtd/nand-controller.yaml         |   7 +
 .../devicetree/bindings/mtd/qcom,nandc.yaml   | 196 ++++++++++++++++++
 .../devicetree/bindings/mtd/qcom_nandc.txt    | 142 -------------
 drivers/mtd/nand/raw/nand_base.c              | 107 +++++++++-
 drivers/mtd/nand/raw/qcom_nandc.c             |   1 +
 include/linux/mtd/rawnand.h                   |  14 ++
 6 files changed, 324 insertions(+), 143 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/qcom_nandc.txt

-- 
2.25.1

