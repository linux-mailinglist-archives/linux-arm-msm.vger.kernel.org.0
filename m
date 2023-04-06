Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF4C76DA1D7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Apr 2023 21:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237597AbjDFTrR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Apr 2023 15:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237485AbjDFTrQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Apr 2023 15:47:16 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2096AE50
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Apr 2023 12:47:15 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id r29so40589206wra.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Apr 2023 12:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1680810433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BHIz3c+rkfz06Sf8NSwUCq2DbSMskpnedxbRiKolYg8=;
        b=nVRx4wz4CHS1HdYP5a9u/tqYWbB6fOinyORdjhh4t5204D41HHL79oIO/CFeaT6L11
         4GTuGY/Dh+MXeL4vzy2J8Zuee3wV18Rwyc4o5h1T2msmcMh4IAGRQuAcCl3Esib/8zj0
         zdLeojELnGQ6i+GElHhS97GckQmX4pNgry4TNRtk6jifs+rlTfhEppuzdgJQZiHQGmig
         Zy0vSnkr8oHFvsDlXEMhEpfS7bBAP8OsGz6WmkUXHE4cQlW2F5uZE6mmYpctL7WNmous
         QYLqO/ct2lj+YzLGHs3tjzkjGG7qVZNRU/BSaMtGigiYZBASqpeAmD6JqzEs6iX23dSc
         dJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680810433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BHIz3c+rkfz06Sf8NSwUCq2DbSMskpnedxbRiKolYg8=;
        b=gH1IBJk5VCS3H3TdoD5HIJvc9k6gsctYgcmGZZG/vs0W5SooBJq67zsBwbVsyp6dL7
         THNmJgjhXt+cqEBnQEHw4YVHNBFGLoafT299vgh8yy18bTdVAaXoNeOrNo6J6/qfh+Zv
         QoFdtAmt5z3dq+NE4GwNVO75/aICbnNaQgDV5ErA6JLA5LHbiJklTi+RVGR9xXoF7n6N
         gXxZJ4Yo/SSC9jd0aVTWC7eFRURTMSn9xmMygpiqBqDuBJYOFgKnb3GIBCIbCo6NASTq
         GYYxoZ3GUYMPuZMbuBB+ZqxB3HGpbR0/ngIu0yzBNBic73xxYst4KzTUy1KEnExuF2qX
         U0QA==
X-Gm-Message-State: AAQBX9e4mSDbyHcoejP0JsQc2Up9d7jiyyK8/+vIvP5geACSfBElHb07
        G2QETQkCLDhNmTXwVC6kLVT8cw==
X-Google-Smtp-Source: AKy350Yv8/Vi44BZfkJ1gJ8f2FGeuqH5yR48dzc/pmWlrkbe4sONzyJAbRFJhaanQgIyt8rDT7Oh7w==
X-Received: by 2002:adf:dd92:0:b0:2d4:a843:d000 with SMTP id x18-20020adfdd92000000b002d4a843d000mr7368870wrl.56.1680810433541;
        Thu, 06 Apr 2023 12:47:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4793:cb9a:340b:2f72])
        by smtp.gmail.com with ESMTPSA id k15-20020a056000004f00b002c71dd1109fsm2593323wrx.47.2023.04.06.12.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 12:47:13 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 0/5] arm64: qcom: sa8775p: add support for UFS
Date:   Thu,  6 Apr 2023 21:46:58 +0200
Message-Id: <20230406194703.495836-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Update relevant DT bindings, add new config to the driver and add UFS
and PHY nodes to the .dtsi and enable them in the board .dts for
sa8775p-ride.

v1 -> v2:
- order new compatibles alphabetically
- rework the UFS PHY bindings to accomodate more clocks
- add a comment in the .dts regarding a non-standard clock used
  by the UFS PHY

Bartosz Golaszewski (5):
  dt-bindings: ufs: qcom: add compatible for sa8775p
  dt-bindings: phy: qmp-ufs: describe the UFS PHY for sa8775p
  phy: qualcomm: phy-qcom-qmp-ufs: add definitions for sa8775p
  arm64: dts: qcom: sa8775p: add UFS nodes
  arm64: dts: qcom: sa8775p-ride: enable UFS

 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        | 26 ++++++++-
 .../devicetree/bindings/ufs/qcom,ufs.yaml     |  2 +
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts     | 19 ++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 58 +++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 38 ++++++++++++
 5 files changed, 142 insertions(+), 1 deletion(-)

-- 
2.37.2

