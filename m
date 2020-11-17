Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C12F2B6C32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 18:49:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729936AbgKQRs7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Nov 2020 12:48:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729010AbgKQRs5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Nov 2020 12:48:57 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C4AC0617A6
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 09:48:56 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id w20so912299pjh.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 09:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=O0PA9nf7G4M2udGN4+q47WXE4Qy7KA5bu5YIoNe2LFg=;
        b=I+O7Yo6COQWNxmqewYTuql/S/oMpEKVhTAdBS6QxYTq7LJQp4PLzTmXAmd3z88YZZn
         bey0pn5KrqwJScrlAVY602fvKUOwSj746GPwgI1tSNZWPf5HhRj3glWj4MhaPYfoPFiL
         QnP0psRV9rvO4Ia34yAeIb4djJdEGNbxJLNIrQrQ8zDaJjmrWbV5dXFY6TQIo/joVePx
         qEdw8bi0fQOnKnd0tGSPb2MPvWtgCwQHeEB28KbOR+YkQgzv5hGtLHa2JbYQ+3VmXboa
         E3cy5W6SYtwwug1WKODqHKlJF83ehh/G2e1DA2XoXj0ZY2/ghOrfbvcSHrJl7fJDcjF2
         wmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=O0PA9nf7G4M2udGN4+q47WXE4Qy7KA5bu5YIoNe2LFg=;
        b=sdK6KXXtRcGGI+mVtmRdNcuZjml9J14q7atS9+j0ZasEkcY2w/nbDPx3u+IFtK9Hps
         zKLmCNxd2aer6Skz0Yr4YsQtXVKxjARfl0vA3BPf0/gKY44gG36B1ozL4lAsf58wgKye
         IjHxSWU4kf4rnNvUd33huIxN06EzHXkGhWBOMoMOx6Z4CpkeOOaFHbgKl68THmD1YYaA
         mPZ81ry1g1Z5cC6L0Lk5i4BHfCdOXx8I37nEXnIXKIXn6nfbjejscN1ggjrIbuIAD+t4
         zPB9gQujaq1PNxuwJYUjTQtW79WNucrmuzVl5fDyHRGyH/q3G2GMUMhcU6pYTIS2NECX
         CjaA==
X-Gm-Message-State: AOAM530/komT+hKOEah088kU/se5RqWKlMxZlmmM9dr9PDqrtKuBcBHg
        ukfAB42t990UsGx0P9tLAaZg
X-Google-Smtp-Source: ABdhPJwXUv3E3rnopnWn4cwu/xUeTSKe0sisjYQxjooarhF/w/Rb+XZEE47uu2Zdb/NCgRQcv8krHw==
X-Received: by 2002:a17:90b:345:: with SMTP id fh5mr226340pjb.198.1605635336430;
        Tue, 17 Nov 2020 09:48:56 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id 192sm22222810pfz.200.2020.11.17.09.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 09:48:55 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 0/4] Add support for Qcom SMEM based NAND parser
Date:   Tue, 17 Nov 2020 23:18:41 +0530
Message-Id: <20201117174845.28684-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
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
 drivers/mtd/parsers/qcomsmempart.c            | 169 ++++++++++++++++++
 6 files changed, 215 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
 create mode 100644 drivers/mtd/parsers/qcomsmempart.c

-- 
2.17.1

