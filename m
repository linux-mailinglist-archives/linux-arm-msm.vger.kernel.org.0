Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3514BF276
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2019 14:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbfIZMFX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Sep 2019 08:05:23 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45911 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbfIZMFX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Sep 2019 08:05:23 -0400
Received: by mail-wr1-f65.google.com with SMTP id r5so2138357wrm.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Sep 2019 05:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y07ZnDzexUD9RKC6iDZUZKRTQv+E4IUsmSABNZBPtUg=;
        b=lY6GbUxDwmlppCz8w03u/a/XKs1RebO1CG027tKSNUaMrCOL8ApwY1PKEKNwQiijNv
         Qx3QOqmN3hLxwFtt3LT7xVKr2agK8bWkY853sXPO9eNJVIsw6i9utP3tCp4tavm7gzhy
         wTT9qtjlXC8cVD6LSTof8k3zNzcutc7mSWaRJYHUG9dTLDOPySv/fIsEBuhqwExMK/fW
         9r1l71CQluQ7cA3hnmBCwhvssmlDzU9igERNYlX+KJ+PNq/+7aEknQtP2WaQH+oUBuJG
         6lYZEM4kLnZrtn1gruTHc55ZxCbsOm3700NyJxk+VAk33qizvQkPo9FSAx21M8qnvrqe
         zIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y07ZnDzexUD9RKC6iDZUZKRTQv+E4IUsmSABNZBPtUg=;
        b=bro2FoCZF3wkBt+uLewtV6K75RmcYrvTR3P0pqElps0mHwOfXTCovww7k1dcVN/9NA
         Ri4i+rpayImG5AVfv7wIW1SM8eDg8t+dH94EQvbVMOF/mwptRLFjQ4EJEd8VzUvi5xC/
         nIcnzTiubbV8qY3CJE61rfgjcX3Lfpkyp2DrI/z7fcgO0FSM7tkYoxG38x7ElMGRx+ki
         9/fLc8IENWWvLtug9SycjXIqaQSw/J14jSbjNtJuJPQUDX98Tc7HXBkrxwVB6GOURpGf
         Ure7t3bIDXxxFqbBxxkmxwI24AAHB5pxcS75OsDKb0sjLygAxfp383ZEkNgfhlWP1iVe
         XD9g==
X-Gm-Message-State: APjAAAVlvWTHF6xCsKp114jw6VVoyRX7dCHgBmSj8Y+uxlH1oX3k5gq3
        7gqn8guteHQW3s3Z9yguu27SRslfvr0=
X-Google-Smtp-Source: APXvYqx9k0cZlYHe0P8eggYC/xz9L/TEupr8wVGgeoHdGd9BMRiHHRWA4yfN9cmikfylNkLDgEIz9g==
X-Received: by 2002:a5d:4044:: with SMTP id w4mr2885084wrp.281.1569499519632;
        Thu, 26 Sep 2019 05:05:19 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id d193sm5289584wmd.0.2019.09.26.05.05.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 05:05:18 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     iommu@lists.linux-foundation.org, marijns95@gmail.com,
        agross@kernel.org, robdclark@gmail.com, joro@8bytes.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH 0/6] Add support for QCOM IOMMU v2 and 500
Date:   Thu, 26 Sep 2019 14:05:10 +0200
Message-Id: <20190926120516.4981-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Some Qualcomm Family-B SoCs have got a different version of the QCOM
IOMMU, specifically v2 and 500, which perfectly adhere to the current
qcom_iommu driver, but need some variations due to slightly different
hypervisor behavior.

The personal aim is to upstream MSM8956 as much as possible.

This code has been tested on two Sony phones featuring the Qualcomm
MSM8956 SoC.

AngeloGioacchino Del Regno (6):
  iommu/qcom: Use the asid read from device-tree if specified
  iommu/qcom: Write TCR before TTBRs to fix ASID access behavior
  iommu/qcom: Properly reset the IOMMU context
  iommu/qcom: Add support for AArch64 IOMMU pagetables
  iommu/qcom: Index contexts by asid number to allow asid 0
  iommu/qcom: Add support for QCIOMMUv2 and QCIOMMU-500 secured contexts

 .../devicetree/bindings/iommu/qcom,iommu.txt  |   5 +
 drivers/iommu/qcom_iommu.c                    | 133 ++++++++++++++----
 2 files changed, 111 insertions(+), 27 deletions(-)

-- 
2.21.0

