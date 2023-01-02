Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D3F265B026
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jan 2023 11:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232065AbjABK66 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Jan 2023 05:58:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232638AbjABK64 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Jan 2023 05:58:56 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36F0DBFA
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jan 2023 02:58:55 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id d9so12500253pll.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jan 2023 02:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gTpGZwpAG4MJ3LdtNc4aCdH0bfJGBsl8uhNu6srluPM=;
        b=HG6R4fJuhMXNyiFvcMA0dzQGu0TiZVLkJ3tm0M2x0HJrUbnRxoUZfjozyCcAHUkwvT
         1hQ+LEaqzoRMECQeqYvWwlPzg/8TY+McwlMTyHE/XP3SBts+V+1wtt4YAM02WplM0+Oz
         lqslykyTwOcTctXS1xEyPq2VPYCLuNsIGYchjCLEI2hs98QTb3bjqDu4wbXxodWr6JIc
         cACZkqPdliGpYT3IdyvgzbQrVvATwVDc7SxJl5GZuCQL7QO2YAGj+Lk5VrIrXxEjzAzh
         1dwObTekpzZKmw6suLbTJRoqFpr/jI4Cyxly3U9DzuHRsQ/5LniR5+7fxQnLuaO072XF
         t2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gTpGZwpAG4MJ3LdtNc4aCdH0bfJGBsl8uhNu6srluPM=;
        b=FhUnJNJUOMNoDu4RbMpH0EkTCOLx9SAujPlUUFi2YnY9TOEmYSbdcYejyWR2n4K6gR
         38aRlpxcsy4qqSbIGDkgfr2yxTR8/tPV8bs59WuJnH6cFJILWp9Nhd1zXN2v4CEtvBnE
         WYBNJywl6Gu3A5y3e+Yvm2+iGHJyqCTEUTLttat4qn6kvdk3mp5UqZ4km9y3EzlZYKXX
         5RqOUUOULVT9v7KqTEQ4AkZYXxZ2af4aMzMv2/GK9prN4sG6YoRT7zc5N5UXwwYcOmFB
         PxIQXCvvZ3duaCSf4GD5NEY29zSagumRLgKkKh9GZUiOF9OdRhMPzlbigxxPTzTCdwOV
         6pyA==
X-Gm-Message-State: AFqh2kq1TtNoovq/kfJr6JbAuPTxhY/uu1tX8Wwr0pTliRxMF2sqLUpi
        fLrcX9EIHZKaE47jleYI2C32
X-Google-Smtp-Source: AMrXdXuRviKvRtMS3cRsqgYfR/ybMdpT6z1FM8RWscul6pd8eKsQG2X1od60pkzIuEtr0+LwLuhJaw==
X-Received: by 2002:a05:6a20:2d1f:b0:ac:9d6b:c1f0 with SMTP id g31-20020a056a202d1f00b000ac9d6bc1f0mr54199601pzl.40.1672657134657;
        Mon, 02 Jan 2023 02:58:54 -0800 (PST)
Received: from localhost.localdomain ([220.158.158.187])
        by smtp.gmail.com with ESMTPSA id k26-20020aa79d1a000000b0058130f1eca1sm12756773pfp.182.2023.01.02.02.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 02:58:53 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     bhelgaas@google.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        lpieralisi@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 0/3] Qcom: Add GIC-ITS support to SM8450 PCIe controllers
Date:   Mon,  2 Jan 2023 16:28:18 +0530
Message-Id: <20230102105821.28243-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

This series adds GIC-ITS support to SM8450 PCIe controllers for signalling
the MSIs received from endpoint devices to the CPU cores.

The GIC-ITS MSI implementation provides an advantage over internal MSI
implementation using Locality-specific Peripheral Interrupts (LPI) that
would allow MSIs to be targeted for each CPU core.

This series has been tested on SM8450 based dev board that works using an
out-of-tree dts where the MSIs from endpoint devices are distributed across
the CPU cores.

Thanks,
Mani

Changes in v2:

* Reworded the commit messages as per Lorenzo's comments
* Rebased on top of v6.2-rc1

Changes in v2:

* Swapped the Device ID for PCIe0 as it causes same issue as PCIe1
* Removed the definition of msi-map and msi-map-mask from binding
* Added Ack from Krzysztof

Manivannan Sadhasivam (3):
  dt-bindings: PCI: qcom: Update maintainers
  dt-bindings: PCI: qcom: Document msi-map and msi-map-mask properties
  arm64: dts: qcom: sm8450: Use GIC-ITS for PCIe0 and PCIe1

 .../devicetree/bindings/pci/qcom,pcie.yaml    | 14 +++++++++----
 arch/arm64/boot/dts/qcom/sm8450.dtsi          | 20 +++++++++++++------
 2 files changed, 24 insertions(+), 10 deletions(-)

-- 
2.25.1

