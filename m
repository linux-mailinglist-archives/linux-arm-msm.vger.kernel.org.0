Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF6A33F04B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 13:26:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbhCQM0D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 08:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbhCQMZl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 08:25:41 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F30AC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 05:25:30 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id x126so985909pfc.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 05:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dytfyZh+t/6hBvEK1wCLf/jrNd0VZgcEm5bChCDpMzg=;
        b=T8mMHzfr8C/YC+9JiBfAbhRi52k5vAbU1VVHjqSTp3ajN4ZKLsUYVNhz0EYauoAGnJ
         Z7UUo63Zr9zkYEyhXZZM8ARh8/UHXXPR+XznYaUit7xmRsRY78J9rUmRtLjynb254c41
         hiH/Hdonpd46H7Fv3uvZ9bXzU64vn0UZ1InzI/8I2zfNnjcYAf7aeJGmJJZmDqAroUfa
         RUJwxQQDAbWtj9v/eHgVrtvzdizvw59Ryky9bpdn7XS3QxLI7jGFKMIycbUV+rqLZYQG
         bJ4KNzUdYCtl/VgFYXbqnGLeyTprjcxQy7inOiff5CFNh17dEGC7A+9cSfSLVRSh8K5+
         tSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dytfyZh+t/6hBvEK1wCLf/jrNd0VZgcEm5bChCDpMzg=;
        b=mgVjnLtq6sS+5GdKiG8/TJUrrKQhQH03s+CzreH+wXJlnNkUuxfky6LvQlioNsVxrj
         SPDx16BWOFERsB/66gok8g/IXPT7XlglgGRzUEgZ3XB0VUycFpyd8Zf4IhdSCvMNn7Vh
         swoC26JqhhpnA34C7/P5p2kQaA++ko0gHpvrUaPZ8u/qGCTmxMRp+XSGZRW8d5bYbYKL
         lJOfP4uTx2oVQaw5nYuzzWvgb5I+m/TY9NgB9zRcAi90fC+EEbZesegszQ740Wwtp8lh
         tNeeesx8VlmoEwtOG6uR03xcCk2Qf6xeEC22hD/HrpoQSn9pqiWk+gl92gaSgOmi69P7
         8nfw==
X-Gm-Message-State: AOAM53068LC5P7mtgsuopd1dHwlpVSBKhj5S4IK9wnJZbd3CPK7AxjoQ
        sjTRIzMWnrQv7jSxk5v+aHZY
X-Google-Smtp-Source: ABdhPJxQBvjNynU90CGeAQhvI+CodJMu3cpJ1BPfySYq2j+bTcpYj1MoGwp4aHHogsCKuoK9qkeGuQ==
X-Received: by 2002:a63:1d0b:: with SMTP id d11mr2426883pgd.190.1615983929440;
        Wed, 17 Mar 2021 05:25:29 -0700 (PDT)
Received: from localhost.localdomain ([103.66.79.72])
        by smtp.gmail.com with ESMTPSA id y23sm19285730pfo.50.2021.03.17.05.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 05:25:29 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
        bjorn.andersson@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v5 0/3] Add support for secure regions in NAND
Date:   Wed, 17 Mar 2021 17:55:10 +0530
Message-Id: <20210317122513.42369-1-manivannan.sadhasivam@linaro.org>
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
 drivers/mtd/nand/raw/nand_base.c              | 105 ++++++++++
 include/linux/mtd/rawnand.h                   |   4 +
 5 files changed, 312 insertions(+), 142 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/qcom_nandc.txt

-- 
2.25.1

