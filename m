Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 163632F9959
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 06:41:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731799AbhARFjp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 00:39:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731791AbhARFjn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 00:39:43 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31474C061757
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 21:39:03 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id p18so10224399pgm.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 21:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fnAVmej2rq/H3tO0qvpZKrc8RVH8NPdida0HcjaCWTI=;
        b=zCoHx7Hik/oTFNnKHu1TlVCeF2vqQ77oFXhmP25gQsF7lwX3a9Y2kei1javBYBNRO5
         woYBCO7iQkQw/OJbmxWEDUiCkz3BPghdQw3n9qDrb4JRIYZLky98zYrFsTZS5xhh3lXe
         vL2IpcgDvuVDkbB6sMcEMyyOQC2/VAXDLYIsUZgrrdBpnu9bM7Stc/7E/7Bzfd9R6yGz
         N9Brcik82QCdzx/ewtXe+3DEYvC9yQpTK6uS6rsEVqSLW693i7WulFfDOiep/yU5VDML
         rm1/FyoP/RjBr69Ii/5zNttJgxPbUFj+sks91RbIn5wEA5rTFSGADaZ53hfOnvsY9YcX
         huEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fnAVmej2rq/H3tO0qvpZKrc8RVH8NPdida0HcjaCWTI=;
        b=eXNoEtfMNSkMjzYl9xv8m7AvK35u77I6TRCq7/iiGDJwD5iDLc4VLiVtxN97vNG2Xd
         ZKPq1yt99riu+uGuoVtqgH+tmr1t0qMEHVpdVOC2CBLfLSNKe+urSMfGEwA5dM2UE88T
         dPIBZJ/GnQDd7O3kI2QP+ydY7680zUTCHpknHgaBye3Wz9gFkppCf+YrBTKPFGNOPAfN
         cv6qbgP0uV9NLcsq7K8vtB2erAslK7r4W5p34wu0/KhWnyDR3IA9wKnOAZYVGhpna2Y9
         YNSSFwkej75hwWRPI/wu6k2QZasVqYFkksb5SHfBh+PFeJ7wP3Gtams6/TBHO57XzEDe
         yKVA==
X-Gm-Message-State: AOAM530ZRd983nM0bcpJwhDEv6c/C2W7IlCxGfN2iCK4vAzi2pHkrM9B
        qxvAtXj5uNifsh/DQuO9m/sQUHKeKvwR
X-Google-Smtp-Source: ABdhPJy9zwu+ruspsVAz+q+DEjAOgQi9zq9l5T+ALrNi+glr56SUj10k7FGYVORYGAixkmauo+lC5A==
X-Received: by 2002:aa7:9486:0:b029:1b2:686d:38c5 with SMTP id z6-20020aa794860000b02901b2686d38c5mr19881146pfk.0.1610948342625;
        Sun, 17 Jan 2021 21:39:02 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.182])
        by smtp.gmail.com with ESMTPSA id z6sm14627271pfj.22.2021.01.17.21.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 21:39:02 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 00/13] SDX55 defconfig updates
Date:   Mon, 18 Jan 2021 11:08:40 +0530
Message-Id: <20210118053853.56224-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Bjorn,

Here is the defconfig updates for related to the SDX55 platform. All of the
drivers enabled are part of v5.11-rc1.

There is no specific order I could figure out for adding the entries, so did
them in a kind of random manner based on the previous ones.

Please consider merging!

Thanks,
Mani

Manivannan Sadhasivam (13):
  ARM: configs: qcom_defconfig: Enable RPMh drivers
  ARM: configs: qcom_defconfig: Enable SDX55 pinctrl driver
  ARM: configs: qcom_defconfig: Enable SDX55 GCC driver
  ARM: configs: qcom_defconfig: Enable SMEM partition parser
  ARM: configs: qcom_defconfig: Enable MTD UBI driver
  ARM: configs: qcom_defconfig: Enable UBI file system
  ARM: configs: qcom_defconfig: Enable DWC3 controller and PHYs
  ARM: configs: qcom_defconfig: Enable ARM SMMU
  ARM: configs: qcom_defconfig: Enable RPMh regulator
  ARM: configs: qcom_defconfig: Enable watchdog driver
  ARM: configs: qcom_defconfig: Enable ARM PSCI support
  ARM: configs: qcom_defconfig: Enable RPMh power domain driver
  ARM: configs: qcom_defconfig: Enable Command DB driver

 arch/arm/configs/qcom_defconfig | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

-- 
2.25.1

