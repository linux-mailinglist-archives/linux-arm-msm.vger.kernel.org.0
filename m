Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B35E7C3995
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2019 17:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389313AbfJAP4v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 11:56:51 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35392 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727387AbfJAP4v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 11:56:51 -0400
Received: by mail-wr1-f66.google.com with SMTP id v8so16216647wrt.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2019 08:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yA8LuJphApJUMeW7EnoqDBSa3QsP9lGr6ZPmbMXfEH8=;
        b=Ghvdl64a96N2aVk9qGQiF4Yf+Rr4r5Mhh7r5bvwp3rGPMahXdzD8ZrdNlIulL98Ysh
         ZoOmKT8pvpQb9eod72lMGffmwHKVXQ4SyKVX1fF8Vo1zLg3iWolfc7VY8X24qj1hk2hs
         +lrDSaNK9Dl+GGa38T7GhRnFiHNnllYhs4Lduq6wtaUTLTww1aho9oLWKWMeWWTnFxSE
         /M/1gXMST6y1gU6IUQiyPkJ4IzVaqdu8OntKxI9ZRIjZlUQQXvgaBxkVthizpx94StCH
         RUSMFlYuVCLAMDsrcn2QoVCYNFR4tzEL4+PVou9YHQkUE1JiDB6Xsym8MFx2s72S4myL
         /5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yA8LuJphApJUMeW7EnoqDBSa3QsP9lGr6ZPmbMXfEH8=;
        b=esrC6Eo7qnWvwPqU0yiE8ZzKitpstw9jrFS7F+XqUtrkKEHKjlPIvjkM8/VKLulJEM
         g7nH23g0my+CqaftdsijvMt7bWnnRe6w6RxOye1qy+Iee7xhLh17w5NLwPgqrOS4KcmT
         7Y7KKywAdfNoE7odKYs/GDwp7Cy/AxXAB/1AW3qlV36VqKEySD+IQgbBHCeyz0VvzJwv
         WRqfAjxTZsDlCaYjC98gsRrWqG+oj3FUDEpwzia/0hMSrQ2J9KVZ+6m7FRZ2+Bsu9KOq
         7wlFwaht7bUuyOUVZAmHQf7AKqJWWBj5qLj4bNuM1ScUq95A4RfP6ebnUwBcLLGFsEM5
         sMGw==
X-Gm-Message-State: APjAAAXtSWIB7adX4I0no54vx3sqyGyAM2dF0fkvZAKXmC27randoapn
        Y/tluQY91neMoka4rsZIq901dIBprIh/HA==
X-Google-Smtp-Source: APXvYqwfEElz17GkD+jenA0SuVWri/ZG4JGXiJfIVeUnaoyAt3RrOOfUJtsoccNlQ51DQB6hH/Cz1w==
X-Received: by 2002:adf:fe05:: with SMTP id n5mr19974278wrr.355.1569945407469;
        Tue, 01 Oct 2019 08:56:47 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id h63sm6209136wmf.15.2019.10.01.08.56.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 08:56:46 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, iommu@lists.linux-foundation.org,
        marijns95@gmail.com, agross@kernel.org, robdclark@gmail.com,
        joro@8bytes.org
Subject: [PATCH v3 0/7] Add support for QCOM IOMMU v2 and 500
Date:   Tue,  1 Oct 2019 17:56:34 +0200
Message-Id: <20191001155641.37117-1-kholk11@gmail.com>
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

Changes in v2:
- Fixed optional properties placement in documentation

Changes in v3:
- Rebased onto linux-next 01/10/2019
- Added missing SCM commit (required by the AArch64 PT switch support)

Angelo G. Del Regno (1):
  firmware: qcom: scm: Add function to set IOMMU pagetable addressing

AngeloGioacchino Del Regno (6):
  iommu/qcom: Use the asid read from device-tree if specified
  iommu/qcom: Write TCR before TTBRs to fix ASID access behavior
  iommu/qcom: Properly reset the IOMMU context
  iommu/qcom: Add support for AArch64 IOMMU pagetables
  iommu/qcom: Index contexts by asid number to allow asid 0
  iommu/qcom: Add support for QCIOMMUv2 and QCIOMMU-500 secured contexts

 .../devicetree/bindings/iommu/qcom,iommu.txt  |   5 +
 drivers/firmware/qcom_scm-32.c                |   6 +
 drivers/firmware/qcom_scm-64.c                |  15 ++
 drivers/firmware/qcom_scm.c                   |   7 +
 drivers/firmware/qcom_scm.h                   |   4 +
 drivers/firmware/qcom_scm.h.rej               |  13 ++
 drivers/iommu/qcom_iommu.c                    | 134 ++++++++++++++----
 include/linux/qcom_scm.h                      |   2 +
 include/linux/qcom_scm.h.rej                  |  19 +++
 9 files changed, 177 insertions(+), 28 deletions(-)
 create mode 100644 drivers/firmware/qcom_scm.h.rej
 create mode 100644 include/linux/qcom_scm.h.rej

-- 
2.21.0

