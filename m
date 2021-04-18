Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5C48363523
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Apr 2021 14:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbhDRMaX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 18 Apr 2021 08:30:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbhDRMaX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 18 Apr 2021 08:30:23 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD283C061763
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Apr 2021 05:29:54 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id sd23so40092948ejb.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Apr 2021 05:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EgJUsv/4a1WlmZRhh3NP7mPqIFDtHjPIO3xT+/bTQ3M=;
        b=mGAZ/eMQKdpaqyvcsMwLAQNRxfLi42601T7UY9TJ9xH07Y0Q03XVL9EIddcJ9lktOZ
         DkFcke/2tLV1lghiQwHcGHrzho2GKV5V2/CWDpyY8D2wKJl3FsTLLVvBpDtyPqB4Sh5v
         xzLnEFw9COD2rgjN+pITUvwyDXeSbCXES4EZPoBHF81Vot7CQLY5tu62CwZShJXVH4F8
         52rUyXEl0nJIWIkH+UU3CxNpHODlzcN2nKtz06LjeLCfluDk9/pguBT+Ho6ZoDJWpmNh
         YbbGd2VDISp56zCKXiSSlvu/HEmNOA5pyIYjRjgWMq05rfHSoG0/1aecAqNSMdV2NhZm
         3/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EgJUsv/4a1WlmZRhh3NP7mPqIFDtHjPIO3xT+/bTQ3M=;
        b=KVaoKsiryxlZx4a9YvO5NXoQls3odkZSjy34+lP6cNfMjdSUy4t/ckBHrgKy7bIKWE
         sY7Lpj7kw2VqUa2Fy+sHH+D1kyS4aOe4Vr43WCw2dWSWf1X3wOOugrN5sqPTQzYufatd
         jI6Uuy5YHWX6slV2L/1PETHbyTjUevVams/OMbvP/IIOy+eJo9+VmpjFQRJ7o4m+uVvp
         Z9dyuqgn6Ilny+cpI4Q2M/HXux6naP6+ThzGNUQcoHW4bPE/+kyXxascWDE2tdpVK/Zi
         nUe8FqVu9ALmJ9aG9Z73tb0oZRl8xv+Wx8X0re7c8PLC8i+E8wk4c6Fg9tzVVVr852mI
         8r7g==
X-Gm-Message-State: AOAM531c869vrHYu1XlqH5nDJfOVdvxoTN+AFAh48evt1hp8g52zquJf
        SHV5nIx/fiHBkm8xJ5bltE0IEhgFB/0Dl6t2
X-Google-Smtp-Source: ABdhPJzpjYdLqUp7FIGn8JqO3S7ToxqO9wK2a/aXOXXMrjJw/uQ0asvZKgWtTJQt/Ihy1WoR7jVePA==
X-Received: by 2002:a17:906:4ec3:: with SMTP id i3mr17526128ejv.119.1618748992178;
        Sun, 18 Apr 2021 05:29:52 -0700 (PDT)
Received: from PackardBell (87-49-44-144-mobile.dk.customer.tdc.net. [87.49.44.144])
        by smtp.googlemail.com with ESMTPSA id a27sm8213677ejk.80.2021.04.18.05.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 05:29:51 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 370073c6;
        Sun, 18 Apr 2021 12:29:49 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: [PATCH v2 0/5] Samsung Galaxy S III Neo Initial DTS
Date:   Sun, 18 Apr 2021 14:29:04 +0200
Message-Id: <20210418122909.71434-1-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable booting of Samsung Galaxy S III Neo mobile phone with MSM8226 SoC.
Implemented clocks are on top of MSM8974 GCC driver because there is really
little difference between them. UART serial communication is working.

Changes in v2:
 - Removed alphabet sort includes in MSM8974 GCC driver
 - Keep using qcom_cc_probe() function instead of qcom_cc_really_probe()
 - Add only MSM8226 SoC related includes to qcom GCC clock bindings
 - Changed DTS files license to BSD 3 Clause
 - Made changes in qcom-msm8226.dtsi DTS file:
   > Remove occurrences of clock-frequency property from timer nodes 
   > Removed model and compatible properties
   > Renamed pin controller label to "tlmm"
   > Moved compatible and reg properties first in the nodes 
   > Lowercase hex address values
   > Fix make dtbs_check warning in memory node

Bartosz Dudziak (5):
  dt-bindings: clock: qcom: Add MSM8226 GCC clock bindings
  clk: qcom: gcc: Add support for Global Clock controller found on
    MSM8226
  arm: dts: qcom: Add support for MSM8226 SoC
  dt-bindings: arm: qcom: Document MSM8226 SoC binding
  arm: dts: qcom: Add initial DTS file for Samsung Galaxy S III Neo
    phone

 .../devicetree/bindings/arm/qcom.yaml         |   6 +
 .../devicetree/bindings/clock/qcom,gcc.yaml   |   5 +-
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/qcom-msm8226-samsung-s3ve3g.dts  |  25 +++
 arch/arm/boot/dts/qcom-msm8226.dtsi           | 147 +++++++++++++++
 drivers/clk/qcom/gcc-msm8974.c                | 169 +++++++++++++++++-
 6 files changed, 344 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom-msm8226-samsung-s3ve3g.dts
 create mode 100644 arch/arm/boot/dts/qcom-msm8226.dtsi

-- 
2.25.1

