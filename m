Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28218340EAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Mar 2021 21:00:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232940AbhCRT7u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Mar 2021 15:59:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232858AbhCRT7h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Mar 2021 15:59:37 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E1F9C061760
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Mar 2021 12:59:36 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id w37so6487079lfu.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Mar 2021 12:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P1rcveWXMVbmUI08P7yo7o1jOZYDTdFMfxcMXg2Pco4=;
        b=kUTQqs9YUwKdZmMyssA/Agyv6JmeKyuAgfawFJCENWtZK5O7Be7DDIgF49UvOBiUc5
         7T42EzfYh91WoSW7LerGOBEkSoHWzmSTzP1RPZjidmEToZbskkBuuL12tz06ioVZy1iW
         jpVtXWfqj9NHIX8xOI8hxKhRyRvCsXcc5+EWsPLcaJnF434roiwOBoGp37tReOA9gtKt
         E0vrEHYGaxwZrtwHQukzZZmPIcLYNdqM0LdPcPOMVIS8HKXJgmBQ85TYSctKLdb8bnQk
         ay0oRCdDxz57E1loyHCWYQ79efWmdZ6e/h92VDb2YOUrrbaRi8c40DBQzJIaFeYLtwz8
         ZkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P1rcveWXMVbmUI08P7yo7o1jOZYDTdFMfxcMXg2Pco4=;
        b=oXeAHtutEbcDLpgl1dogQ54aDh7L/DadBmYEioYnb4Vu/B16S+pQOmjDj+w+Exaqw9
         KNWraEfjLqkUBYsYGwvOKtnCmF7oNaR8sg3TAgKKdNOvDdtTeOZp+mmozm3+qhYpWu61
         Hi5fBc8W56ON/XaA09p0r1u/lhE/ZHmS25f0PjdluQsRMwqpjJw4+Bu2q6sBqQxuww9k
         L9CRQn/JDIqrQ4dVgwcfQNOSvZ4JNQ2/muz+awaRp3NscXq4Mim0NWGmxV/jiX0TViQ4
         b0A5LxA/RnAGNlg41vPdzr3zss5T3AFl5938tz4WCze33c551xXKpHtJJDQPxpyH+o4m
         9tdQ==
X-Gm-Message-State: AOAM532mcJo6KSk8Acr8EBwxAzf+M3Cm+N979GLrFzNZXPM2qzgu0F/l
        D4YVdaGktvtzLf9sXmS5an0OkQ==
X-Google-Smtp-Source: ABdhPJx/L6412T2QwZNfbmMG8R469G27LuwHg+Rf+E0cXxQ6YdoOIFV00Wq6ZR0oUtpUsWRmz8t5tA==
X-Received: by 2002:a19:23c7:: with SMTP id j190mr6230266lfj.148.1616097575129;
        Thu, 18 Mar 2021 12:59:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g6sm344159lfh.232.2021.03.18.12.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 12:59:34 -0700 (PDT)
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
Subject: [PATCH v3 0/6] phy: qcom-qmp: provide DP phy support for sm8250
Date:   Thu, 18 Mar 2021 22:59:24 +0300
Message-Id: <20210318195930.2229546-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v2:
 - Drop unused qmp_v4_usb3_rx_tbl

Changes since v1:
 - Provide dt bindings
 - Split register renaming from sm8250-dp-phy patch
 - Add respective changes to sm8250 device tree

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git sm8250-dp-phy

for you to fetch changes up to 31f660041a72c2321ebc5328a9cfdaa6e0c63ff1:

  arm64: dts: qcom: use dp_phy to provide clocks to dispcc (2021-03-18 22:57:57 +0300)

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
 drivers/phy/qualcomm/phy-qcom-qmp.c                | 850 +++++++++++++++------
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  77 +-
 5 files changed, 692 insertions(+), 269 deletions(-)


