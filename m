Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA9183307A9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 06:46:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234604AbhCHFp0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 00:45:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234608AbhCHFo6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 00:44:58 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95899C061760
        for <linux-arm-msm@vger.kernel.org>; Sun,  7 Mar 2021 21:44:58 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id n9so4766309pgi.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Mar 2021 21:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/SXCYzspKBCoyyJ1FFt7aWMYlwDTufHYvWslcl7WK64=;
        b=lwHpzsee0fzcbNu5lYKDDS+LdgwVgLwSPOaJNZYr3qLYXarSg8G1rASLkNI0f7Bueb
         eD3JuKtQCoAo5HokyozXqBHlv2n8lgwvomRc8DCmJ4vQI4TFIEXiOD4rRXvEXCyVQ0Fc
         R5LUdwhIcPy8EfOxN3P3Gjl7VvSq71lo934bAs0FhKUlpb9JlEthhnlrSzp/+Anx6A7Z
         9Vkys7kKGYIDZdT9kGv6REmx4Xm7PMDNMppdTcwGv5Z5VlDzcqx2kIngjuyTwlw3+LAe
         XSDQyHnp1JjuFJeWGYG2RbENXrgxDSsVRPfHFj6+qiUo1HolX/mNbOaaJltbu2LlzeYt
         kteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/SXCYzspKBCoyyJ1FFt7aWMYlwDTufHYvWslcl7WK64=;
        b=Rv3uC7x04Zp+aKvbO654iZMsf4KqDDlJKWWzWsBSKhzKMWpCBJhhrLWMz9siKLu8rA
         5d2FBZ8DFy+FpwSbQ7B/7oGrQNJudgPto8Ih8psc3sO16QMvCnZ5gxHr02UmAvyDgwjj
         RYPtaR1FrCyUXQknc4BCg5O/nUbGDjlH3zA1hwpnOIlqlTwJ7k8mGlkGqBvNq+mHrlVL
         dz8KkWtZi/1aXbWtTJuGxluSd6/yG2hmf/7KBW8RTTtKR29lAWs6kBjCLPDLw8fIXhaR
         oVeYa4kU2z61GIw7Ubzwf+Z1KybW7t7sRk1mL3A4P/j8H7Ua3fwOgeCh23mCsaGX624K
         cqyg==
X-Gm-Message-State: AOAM532+oG8rBZZC+eeRYC+mWjB2canZMoQHZaYBtWcnQCf06icBaOu9
        JXdOoWRWMEofbPFVDYIvivB7
X-Google-Smtp-Source: ABdhPJzGe+8gHr46qDNXakAL+WuSxgWyHWTWrJ/1/9zpTuM0aJyok+9hxLLvvrOpK4J3wJJ/AEz1AQ==
X-Received: by 2002:a05:6a00:8d2:b029:1f1:5b57:85ae with SMTP id s18-20020a056a0008d2b02901f15b5785aemr12963263pfu.60.1615182297909;
        Sun, 07 Mar 2021 21:44:57 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6e84:fef9:1070:d306:6d0e:bf6b])
        by smtp.gmail.com with ESMTPSA id y29sm4331506pfp.206.2021.03.07.21.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 21:44:57 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
        bjorn.andersson@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 0/3] Add support for secure regions in Qcom NANDc driver
Date:   Mon,  8 Mar 2021 11:14:44 +0530
Message-Id: <20210308054447.28418-1-manivannan.sadhasivam@linaro.org>
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
  mtd: rawnand: qcom: Add support for secure regions in NAND memory

 .../bindings/mtd/nand-controller.yaml         |   7 +
 .../devicetree/bindings/mtd/qcom,nandc.yaml   | 196 ++++++++++++++++++
 .../devicetree/bindings/mtd/qcom_nandc.txt    | 142 -------------
 drivers/mtd/nand/raw/qcom_nandc.c             |  72 ++++++-
 4 files changed, 266 insertions(+), 151 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/qcom_nandc.txt

-- 
2.25.1

