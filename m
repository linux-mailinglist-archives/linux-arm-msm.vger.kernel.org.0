Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF1671F472B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 21:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389288AbgFITkh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 15:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728328AbgFITke (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 15:40:34 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B09E0C03E97C
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2020 12:40:34 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id b27so22020974qka.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2020 12:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fooRxBUyxBVZY7kJJL8VBy6grxiTlxx+OOYM9dBJ/2A=;
        b=M8PvEfs14mubrLj1XaXYuw77/9Sq33tjev7K9cNSQaxOHDR6yrSRTFwfmH4RdcsptN
         clItDCqBLGzhMO6BQxz8iY+SD7ORaFgogN0+hGx3LhLx2U5if5zrUtze9Cvuqx2wWmyf
         rVWn2umVU71LVwdc9Y1ADjYiP3GYlZBhLhBYHkT9ZvvGyzJj/7/lKO1Qfa3N/42fl1hk
         wj9BQXiP3HLYmgLp0xcIf6ahnjNgYmYP2y2OzCIQKvx3vfjKou6iKGKCX6eZFp5CVQoa
         bnB0dIKg22iA7Iv6XuLQCJATB1ao2T2Nm3oZNEVNKJDKHvUSmTPUMgV7nCcwWSdoExnm
         BmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fooRxBUyxBVZY7kJJL8VBy6grxiTlxx+OOYM9dBJ/2A=;
        b=IJu2T5nG4gC4aj7qSwGN3YpgR7s/9cA3/PH5jg6fWTvzqDFqOM39weXwrFUANt8BiC
         bEJuB9IGRSp6hsULBs6HRen0PYYvABhBiqA+Lf7B24N1beQ6K2blvze2JDaCmlxpamTN
         dMr4XaquAQsucnqqxnTwun4Me7nEQAXUdGtsRCg8mhy26FyYcxrObjXY5vfNiwQjfY7X
         c6v1lTWYqOItc/iFySk5OQja/UAus7vNXaX5Q2/c563piRfpwrC4ofdinGXYPx1SuBiK
         PdGm89EueWMTNkuq3hU31HkANW0m1sLKW9DhGlOJo4YkTHI6I0o0LGaFniLQI/EpuHI2
         laGw==
X-Gm-Message-State: AOAM531qjp9beWoICZE4WZnfEiKDGl3JJQyoHDifjUeCVHoHK81/qj5Q
        +MCG3KdzqvWiG1ReuX+FhL5WG/QF2zTEvw==
X-Google-Smtp-Source: ABdhPJyBKbeiX6PPFfn4v6iP/rDxW8LkNd+ZfOa5pftTCgh+62D/kuaiIKUv+4K4cVgbFk/e+K0MsA==
X-Received: by 2002:a05:620a:153c:: with SMTP id n28mr29203054qkk.457.1591731633704;
        Tue, 09 Jun 2020 12:40:33 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id v8sm10513181qto.21.2020.06.09.12.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 12:40:32 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        iommu@lists.linux-foundation.org (open list:IOMMU DRIVERS),
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        linux-kernel@vger.kernel.org (open list),
        Rob Herring <robh+dt@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>
Subject: [PATCH v2 0/8] arm64: dts: qcom: smmu/USB nodes and HDK855/HDK865 dts
Date:   Tue,  9 Jun 2020 15:40:18 -0400
Message-Id: <20200609194030.17756-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add dts nodes for apps_smmu and USB for both sm8150 and sm8250.

Also add initial dts files for HDK855 and HDK865, based on mtp dts, with a
few changes. Notably, the HDK865 dts has regulator config changed a bit based
on downstream (I think sm8250-mtp.dts is wrong and copied too much from sm8150).

V2 changes:
* Added two patches for sm8150 and sm8250 iommu compatibles
* Changed apps_smmu node patches to use new compatibles
* Updated commit messages for apps_smmu patches to be more correct
* Updated HDK dts patches based on Bjorn's comments

Jonathan Marek (8):
  dt-bindings: arm-smmu: Add sm8150 and sm8250 compatible strings
  iommu: arm-smmu-impl: Use qcom impl for sm8150 and sm8250 compatibles
  arm64: dts: qcom: sm8150: add apps_smmu node
  arm64: dts: qcom: sm8250: add apps_smmu node
  arm64: dts: qcom: sm8150: Add secondary USB and PHY nodes
  arm64: dts: qcom: sm8250: Add USB and PHY device nodes
  arm64: dts: qcom: add sm8150 hdk dts
  arm64: dts: qcom: add sm8250 hdk dts

 .../devicetree/bindings/iommu/arm,smmu.yaml   |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts       | 463 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi          | 180 +++++++
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts       | 454 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 287 +++++++++++
 drivers/iommu/arm-smmu-impl.c                 |   4 +-
 7 files changed, 1391 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8150-hdk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-hdk.dts

-- 
2.26.1

