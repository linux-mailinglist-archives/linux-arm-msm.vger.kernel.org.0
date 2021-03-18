Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59F45340770
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Mar 2021 15:12:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbhCROMQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Mar 2021 10:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbhCROLs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Mar 2021 10:11:48 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4046C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Mar 2021 07:11:47 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id o10so4808815lfb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Mar 2021 07:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AM/Ll5KkOxkTBAonI2Fnw1gYvxAm1x1c9zXwysXQM1E=;
        b=ZAUnyce8KxNEfygMuIyRvdQzBo8fsF0qHZb8SVyJpJTHdtgHmeFhAmRRAEI33dYv9d
         tnWdczfpo75fKi3AsqAhl3PiX5t4cQbO39mdSAwsQrZKUM0uUUQDO+JOI5zBwbouaTVE
         dzw6aJ/pf5rsWg4WgX29uhnRIqDJDPsEmNkLQQF8Nkbw+aYPYuNC1Zk8Ual7GzuFEsXt
         pOHWttD/0N5hzeAt3GxZFDZgAjR8QDdXCz+k9ferwLCEfx0O0DCnBBBP0r0Y0PFpXEho
         qhGNoSKLHbK9ovPATen1WSUSAZmj1cl1upK5poPv/nUOkl0bcph8kZ2lgiseikcGocf2
         7fcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AM/Ll5KkOxkTBAonI2Fnw1gYvxAm1x1c9zXwysXQM1E=;
        b=jss4ea65H5JKlVdgizfsNhWlsu8x3Yl4kHbPvuP57M/OzM4kSb6BmuwkMqux73NqPc
         i0eGDmwp6nxnt43CaCPCQAKQxGYxqaod4uKKf2bCPzQfUTYtDpEgEJu1UKmMuPkf67PB
         ZMA5KBAjIaWBrl+axSdpZRoh7dxBNWakwlYYN4HUdgbabx2Z7qj8ZOJvsjI4ri88pixY
         TA7jyA9W4T18u2m4THCM3MjY/YQ/Sr7Yls5XaYH5IVlm4YMwT84iKKh+dgholUIOulYd
         XJYdrAGMne5nvkyQkeGj8LwX+faBaXa41nemaAuqKMqtV9DUrDdD2XkcWfOn+kk4N/2c
         YhvQ==
X-Gm-Message-State: AOAM533U+XAIBx2KlcmijuiQEujW5hdWRw3N1WabrllwXhvyGUuvGi7C
        ykxux9wi1FAZdkZSMnOEv2wqdA==
X-Google-Smtp-Source: ABdhPJyE7Kh18otNDCN8WkMSBEQsoBkKa5KYCSAvQfNGh2Mc/ZUNzyWZet6UmS7OEa97Yy647fNEmQ==
X-Received: by 2002:ac2:4a75:: with SMTP id q21mr5396497lfp.457.1616076706428;
        Thu, 18 Mar 2021 07:11:46 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f20sm254713ljn.123.2021.03.18.07.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 07:11:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Manu Gautam <mgautam@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 0/6] phy: qcom-qmp: provide DP phy support for sm8250
Date:   Thu, 18 Mar 2021 17:11:38 +0300
Message-Id: <20210318141144.2147610-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v1:
 - Provide dt bindings
 - Split register renaming from sm8250-dp-phy patch
 - Add respective changes to sm8250 device tree

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git sm8250-dp-phy

for you to fetch changes up to 112496035090508ff6e901d6b373bb6ab1ccc9ad:

  arm64: dts: qcom: use dp_phy to provide clocks to dispcc (2021-03-18 17:01:53 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (6):
      dt-bindings: phy: qcom,qmp-usb3-dp: Add support for SM8250
      phy: qcom-qmp: move DP functions to callbacks
      phy: qcom-qmp: rename common registers
      phy: qcom-qmp: add support for sm8250-usb3-dp phy
      arm64: dts: qcom: sm8250: switch usb1 qmp phy to USB3+DP mode
      arm64: dts: qcom: use dp_phy to provide clocks to dispcc

 .../devicetree/bindings/phy/qcom,qmp-phy.yaml      |   1 -
 .../bindings/phy/qcom,qmp-usb3-dp-phy.yaml         |   2 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  31 +-
 drivers/phy/qualcomm/phy-qcom-qmp.c                | 862 +++++++++++++++------
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  77 +-
 5 files changed, 704 insertions(+), 269 deletions(-)


