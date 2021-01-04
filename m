Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05AFE2E8FB5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 05:12:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbhADEM1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Jan 2021 23:12:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbhADEM1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Jan 2021 23:12:27 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1CB8C061574
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Jan 2021 20:11:46 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id b5so9991479pjk.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Jan 2021 20:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Grh8LVLxZbPSeLfGLY8K51tF7uQFUuJHdSxM01ZGF7c=;
        b=uJzrp68vKoBt3m1TKKBBazO/BXkmXTTsLlX+dKObQDFHrjJXm0MXp8OrQQMTnaLWvk
         sNGOHR4ByD+3nIhj/DIjvNigOLCRwn8dx3EzYsPPVPOfc2C4aZcTl5Aj3LtovPdj5JTw
         mBK7aqEkdJ6+tG5VMaqaY2s3iVp0wdRm+fc3N+p5GYZbKZzUpDd0hHd27fu4kBSOp5A/
         gowTEAQc6P5337/bZbuQhVcCTWiliy9qhGyeVXhFn6nU5aXwkFDvqLcTqO5dyak+l12s
         16I9Zy9EleXwL8EgNVC3QgE8J5/IEe8+VZJ6fsNlIL9XiGd6A+VYCUIFJ92jS/sxmUtE
         l47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Grh8LVLxZbPSeLfGLY8K51tF7uQFUuJHdSxM01ZGF7c=;
        b=MNCXjqqLKODQUeLaeuROo4+y8MEmmTx8eNLNQrorQqy2NwZqR9gse3WRiKElfcRPTL
         BSFXMfXvIPUusWJiV4+dXswF/D+oZVC0TFXV2FCBSJRWKol3GBSrhRRcVvmf1D0Y4ins
         mV94hZIo4OQOUnaoTCgeiqKNffBMmn/duHfQny1LP3f9PXYaP1c/PitV63WYqtg1w3BN
         ItAB1LE7uoFkpl10W46VE7A7Z16DaZ+FS0zFyKOW5vhP5TxXUX0rAzG2/zHncIw/tazc
         x+QEBx/8Vhr0FgX9gmkcZnZPx/OBt63x25M6PR9BqHtBAqeCpVe0aCqLkayG396FSN/C
         Hbtw==
X-Gm-Message-State: AOAM531F3dvEL78tuLLy2CqLo3ZdJkEM0jpjpQxQnKqCu3qiVpCMPY5i
        7W5PKUDn/NzH6H22GItGRe8r
X-Google-Smtp-Source: ABdhPJwae8vPcMs1Lo2Hf5RvnoiB/HN9I3+ucXjlyUIXzsVbpdX43N9vnb431pb0W7TO0yFqOLIh5A==
X-Received: by 2002:a17:90a:de95:: with SMTP id n21mr27323714pjv.62.1609733506091;
        Sun, 03 Jan 2021 20:11:46 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.160])
        by smtp.gmail.com with ESMTPSA id x22sm54899930pfc.19.2021.01.03.20.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 20:11:45 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 0/4] Add support for Qcom SMEM based NAND parser
Date:   Mon,  4 Jan 2021 09:41:33 +0530
Message-Id: <20210104041137.113075-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

This series adds support for parsing the partitions defined in Shared
Memory (SMEM) of the Qualcomm platforms supporting NAND interface.
Current parser only supports V3 and V4 of the partition tables.

This series has been tested on SDX55 MTP board which has an onboard NAND
device.

Thanks,
Mani

Changes in v4:

* Added Rob's review for binding

Changes in v3:

* Handled le32 parameters in parser, collected review from Linus W.

Changes in v2:

* Added additionalProperties: false and removed unit address in binding

Manivannan Sadhasivam (4):
  dt-bindings: mtd: partitions: Add binding for Qcom SMEM parser
  mtd: parsers: Add Qcom SMEM parser
  mtd: rawnand: qcom: Add support for Qcom SMEM parser
  mtd: parsers: afs: Fix freeing the part name memory in failure

 .../mtd/partitions/qcom,smem-part.yaml        |  33 ++++
 drivers/mtd/nand/raw/qcom_nandc.c             |   4 +-
 drivers/mtd/parsers/Kconfig                   |   8 +
 drivers/mtd/parsers/Makefile                  |   1 +
 drivers/mtd/parsers/afs.c                     |   4 +-
 drivers/mtd/parsers/qcomsmempart.c            | 170 ++++++++++++++++++
 6 files changed, 216 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
 create mode 100644 drivers/mtd/parsers/qcomsmempart.c

-- 
2.25.1

