Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB66351940
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 20:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234629AbhDARwZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 13:52:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236647AbhDARta (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 13:49:30 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 462A6C00F7F6
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 08:15:20 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id x126so1673169pfc.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 08:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6hVxFcdqIWJsoJww2TX8Rs1EJ/1vV+wVzt8D6tZZ7vg=;
        b=V2SSL0Pi5+6mu3HiAmhqpMolEG4wuNHWrS2TVrZcHy9mpYl3rGgtq+Quq5UKfKlA1I
         /BowUj9PF06X3mwejz+A4ImVUz1iLhRkAI/qCJOcgCwIqKZc3JwpB3ayur3M+v4rFPbW
         qzqua/OwHMqEnMrnCeD5ilTR7H+RN7GToXmaWcsZm+rGNfI1TNTSPwt/YJInMBXTrTBW
         3upl4/jMJQO1dt97S5SFBr5aIAbFfQFPB+2CT8kyYstKqt4IBwjxzAsTgAuJSrte02a6
         tURtcps7W2BPrmm+TvkaQUW13BHkhx01llGLVuHVJxAlN1voarzqxgybOJ4FFV7QHIbG
         9mng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6hVxFcdqIWJsoJww2TX8Rs1EJ/1vV+wVzt8D6tZZ7vg=;
        b=FEj3jZaEEFuISQSs7FGA1GzwQwjwCGqxSf2049hPHdkqLFCqGsmGQqCFjxJiBNEhJD
         3PadbLBbWFgyhhpxGS0Tmx9lxbh2Wk8sczwcMnvWX8xEbtiNzJpxqlBxMOs/fnJ1eoeS
         DdjdzFQBxTfauu/4JQDau0I69jWAWRF6bQF7VyFYq+sA6Re8QRKJIDBmkc+MO0objek1
         2ASo22dDuGiVOrpfJH+qTn1k7sFFMTF9W09+YTMkhvYp8GaGrqjauoRZgIjsQ0eJN918
         HmOxof+x6iavamEAcERwQfDi7PfZ2q+7RQVse0qE7EO/fx3MNNMIhjkl7405AXWE3X97
         z8kw==
X-Gm-Message-State: AOAM532PHOzgSdtFRTIYPENqrG0YVNpJPEwmyl2COJaX3c6/C7/FEQhz
        M7srrCcTGb7LpRI32HPtKIDy
X-Google-Smtp-Source: ABdhPJxwsf37PFmW0FURNCujtvANPBeSWY2X75PU4vA3tHobt9EELwTTBv6yWyv1K8e8UN8+g5pOHw==
X-Received: by 2002:a65:5a4a:: with SMTP id z10mr7745684pgs.240.1617290119691;
        Thu, 01 Apr 2021 08:15:19 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.138])
        by smtp.gmail.com with ESMTPSA id 35sm5652769pgr.14.2021.04.01.08.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:15:19 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
        bjorn.andersson@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v9 0/4] Add support for secure regions in NAND
Date:   Thu,  1 Apr 2021 20:45:04 +0530
Message-Id: <20210401151508.143075-1-manivannan.sadhasivam@linaro.org>
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

