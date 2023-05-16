Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B9DB705987
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 23:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbjEPVd0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 17:33:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230470AbjEPVd0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 17:33:26 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56CEA7A8B
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 14:33:19 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1ae3c204e0aso1147295ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 14:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684272798; x=1686864798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LLMgIHPQmJu/1Np7gwEEcuFmiDPkCPkBr1mT4JM4rzo=;
        b=Az5SOSmnGCHlhTw6JDTWUSNIDuggqumq6SA4lePlgV0raNwlHdt4P2UZKXDWNQIlEr
         f3aHsNFvYjkWJcl44gvYnBkVW0CdBzGa9Vad1GC/hYs9LGBJs/6dRRdUDFgg007AXB2k
         cszC2hrl5pG0t7EBgNvGihnGgzVzyvKtu9WG4D/9PpZOKYwcIxioXz51z2u9Amq3XcKy
         fE5EFNDx3KviKMnantY4TokbwFvZSWCnP3hbza8AYvRwBMt5zEDRiScd9kUobOBbkX7o
         abnovn1fcv9qgLk8f6cNNJLihfWAHD5MFPwmeW6cbFlpZ3Lsy7ufwn7kcoloXh6xyzi/
         qLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684272798; x=1686864798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LLMgIHPQmJu/1Np7gwEEcuFmiDPkCPkBr1mT4JM4rzo=;
        b=I52MWsYzu4ANki8dcyJ787nzXF2g8BsgpnptdHIYaEcZh8YGTif39UsYbXiDJXCEMP
         kndlvFpcjxIz/XA/DemAqDdFvH6PMupltgfyb3bl+ldTXMBy3YZH04tC5GvYHtg2iJU2
         224WFOVk93tIuJ3+Zy9BJKf9qJ6pg7lavkj+Mude9Fr/MK75Bxw7I00zkwBbUOZKwZn+
         bnqNjdv8yiK4Uz9Uq+RCLuwE47+l/1VI8iKVp1hIvCFwI3hB3SAakLMJDWPjY20artDj
         ZYEgBLm8WzH/J0EMMi8j2njwGBkmUfGAStA4/oMrPL0VL6rlbHNJYj+9iOnv2lXhqowC
         WIHQ==
X-Gm-Message-State: AC+VfDzbY4IJb0I4HEx/WIryvPr31/wKrRk5w/zza+UfLxe/YZYB+y73
        GJINfXtfLc8Shjbel73fb+NMk0FU1z8Y6kdvBzY=
X-Google-Smtp-Source: ACHHUZ5zz3hRVPRyPe9s55BvxQJvCyVwE7M2uvP1Gh3v6P20qkv0aKgNqssHHzdhRsvxyCxQqzvutQ==
X-Received: by 2002:a17:902:a503:b0:1ae:197f:dba9 with SMTP id s3-20020a170902a50300b001ae197fdba9mr9156244plq.2.1684272798302;
        Tue, 16 May 2023 14:33:18 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:6bed:7a51:340a:a439:1b87])
        by smtp.gmail.com with ESMTPSA id jh19-20020a170903329300b001ac7af57fd4sm16027676plb.86.2023.05.16.14.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 14:33:17 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org
Subject: [PATCH v5 0/5] Add Qualcomm SM6115 / SM4250 EUD dt-bindings & driver support
Date:   Wed, 17 May 2023 03:03:03 +0530
Message-Id: <20230516213308.2432018-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v4:
----------------
- v4 can be viewed here: https://lore.kernel.org/linux-arm-msm/20230505064039.1630025-1-bhupesh.sharma@linaro.org/
- Addressed Konrad's review comments regarding EUD driver code.
- Also collected his R-B for [PATCH 4/5 and 5/5].
- Fixed the dt-bindings as per Krzysztof's comments.

Changes since v3:
----------------
- v3 can be viewed here: https://www.spinics.net/lists/linux-arm-msm/msg137025.html 
- Addressed Konrad's review comments regarding mainly the driver code.
  Also fixed the .dtsi as per his comments.
- Also collected his R-B for [PATCH 1/5].

Changes since v2:
----------------
- v2 can be viewed here: https://www.spinics.net/lists/linux-arm-msm/msg137025.html 
- Addressed Bjorn and Krzysztof's comments.
- Added [PATCH 1/5] which fixes the 'qcom_eud' sysfs path. 
- Added [PATCH 5/5] to enable EUD for Qualcomm QRB4210-RB2 boards.

Changes since v1:
----------------
- v1 can be viewed here: https://lore.kernel.org/linux-arm-msm/20221231130743.3285664-1-bhupesh.sharma@linaro.org
- Added Krzysztof in Cc list.
- Fixed the following issue reported by kernel test bot:
  >> ERROR: modpost: "qcom_scm_io_writel" [drivers/usb/misc/qcom_eud.ko] undefined!

This series adds the dt-binding and driver support for SM6115 / SM4250
EUD (Embedded USB Debugger) block available on Qualcomm SoCs.

It also enables the same for QRB4210-RB2 boards by default (the user
still needs to enable the same via sysfs).

The EUD is a mini-USB hub implemented on chip to support the USB-based debug
and trace capabilities.

EUD driver listens to events like USB attach or detach and then
informs the USB about these events via ROLE-SWITCH.

Bhupesh Sharma (5):
  usb: misc: eud: Fix eud sysfs path (use 'qcom_eud')
  dt-bindings: soc: qcom: eud: Add SM6115 / SM4250 support
  usb: misc: eud: Add driver support for SM6115 / SM4250
  arm64: dts: qcom: sm6115: Add EUD dt node and dwc3 connector
  arm64: dts: qcom: qrb4210-rb2: Enable EUD debug peripheral

 Documentation/ABI/testing/sysfs-driver-eud    |  2 +-
 .../bindings/soc/qcom/qcom,eud.yaml           | 42 ++++++++++-
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts      | 27 +++++++-
 arch/arm64/boot/dts/qcom/sm6115.dtsi          | 50 ++++++++++++++
 drivers/usb/misc/Kconfig                      |  1 +
 drivers/usb/misc/qcom_eud.c                   | 69 +++++++++++++++++--
 6 files changed, 179 insertions(+), 12 deletions(-)

-- 
2.38.1

