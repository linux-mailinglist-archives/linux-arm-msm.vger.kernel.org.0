Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26FFCC435C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2019 00:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727918AbfJAWCL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 18:02:11 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38160 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbfJAWCL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 18:02:11 -0400
Received: by mail-wm1-f67.google.com with SMTP id 3so4832131wmi.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2019 15:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vxOgO1AYxiKtqziwjTRehHOuCKDD+E2RIq5SeYCl3mM=;
        b=SU9Sh4cU7wRN8bqgDY//SM9ohtN1UTI8c3FeaRhzaPiAI/Z3Ox2fIFRV7k/qFBb+BJ
         A/wgHFPFmGijMCQPTb40qtRtod8QZWOXIITDamOaRdntJulrfHcwhDoC43DoTc9ZBTAa
         AThhNxb8J/6yvNQWVvtOfbEOH5Uph6/n5eX2rkW81HNUzYTuup5LY7VpbZ1WTdct++/3
         M/BGiBFf8ClDnNzni2xXtj86sT8Jqa/FbqY7BGQf4/LeXz1o9JxTUJ1j3R8nek+g4qsW
         lYcjK5jU2SC9CiGJV67awvwFiJqKjTF0ZcALCyu9e9fqsMMUnpe86i+GY5as9kMr3/37
         RUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vxOgO1AYxiKtqziwjTRehHOuCKDD+E2RIq5SeYCl3mM=;
        b=nXDkFISN8ogMKISierF9t5ee+Smjm2gd0nZpnsUqWu+0saMi+DqPPLj68E+OMpjRdx
         lw4HgjRmUqUhaJYr3LE7OkwLEa/TOpiLTY159sZnPrCuVz3LCNI/b9sJ1vTixLIrdv9X
         bP8Tuui1sqXPEOkoS2HKMVM8HfI5srJ7KJeoDYxoY6Oy/krkTszTGfSgrHIH4tQeP6bn
         TRYw1DxjXba8mUux2GzNrJeMnD8IuuZZI3LtijkOQU7E1mzFwTtKeL5qsgHf8oD0lqJr
         zE5yCfAk1DQmvinRCH6mPRidEnZMQc+Ojf9ZxSUYG85UwyttxSuRtfKDqXOd14L4Fi/Y
         amYw==
X-Gm-Message-State: APjAAAUIJAchQQPv0rYO2Z26inQl/MMyDczgfuFJU/w+/sa6XVUucbTR
        umiFRP6hoLq0SWQy3k3BQfZPoxQyJkY99w==
X-Google-Smtp-Source: APXvYqyQo+tkOe830VTLlZ6xjCWNwUMwKXL+NYcNp2OCi4AegVagJTbLGvXiuLRYacPa7GV9+yI8Dg==
X-Received: by 2002:a1c:9d52:: with SMTP id g79mr172077wme.91.1569967328289;
        Tue, 01 Oct 2019 15:02:08 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id v16sm21811219wrt.12.2019.10.01.15.02.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 15:02:07 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, iommu@lists.linux-foundation.org,
        marijns95@gmail.com, agross@kernel.org, robdclark@gmail.com,
        joro@8bytes.org
Subject: [PATCH v4 0/7] Add support for QCOM IOMMU v2 and 500
Date:   Wed,  2 Oct 2019 00:01:58 +0200
Message-Id: <20191001220205.6423-1-kholk11@gmail.com>
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

Changes in v4:
- Removed rej files from the SCM patch (I'm truly sorry for the noise...)

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
 drivers/iommu/qcom_iommu.c                    | 134 ++++++++++++++----
 include/linux/qcom_scm.h                      |   2 +
 7 files changed, 145 insertions(+), 28 deletions(-)

-- 
2.21.0

