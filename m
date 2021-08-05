Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED513E192C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Aug 2021 18:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231321AbhHEQLc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 12:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231161AbhHEQLb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 12:11:31 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98AB0C0613D5;
        Thu,  5 Aug 2021 09:11:14 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id e25-20020a05600c4b99b0290253418ba0fbso4104535wmp.1;
        Thu, 05 Aug 2021 09:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3yVfr8nI8PLISyELvilTpZf23yuPK/Chs+AbBCYqhwI=;
        b=o29RqF6g5OddzmP0Hm1cVDwOAgHgLA2Pe5tDHHWRxN1H7t5+3uec63+nx3i21s1fTs
         s9Mf2mVR5b+qdPXUmgtW0BCdVV9FoJALKIp4MdFTLJ/HXFn0rdtxCMuCee0EEYHirJOD
         ybBAvprn8fE/eRVEogGnL1caa1E5rZY0x0JF95gHFrceG/P4AhjmSERcndZTJzYH0fuO
         aQEID/xeCw/Gm2o43uvniw8U3sna3ht13iwPsWtL9ugZwpuZmg4VXT5V6wOXokoHAtaz
         yD6PLm/XcFEGyK8PYjvDBzOX9vceocPkkoWxxn62QwGn2vaO74tknn8/NrLGxyovmcuo
         Zlpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3yVfr8nI8PLISyELvilTpZf23yuPK/Chs+AbBCYqhwI=;
        b=nA9652cvLMA4d96xomHacssBiM/4jIhbIc7UyH6Udj1n9zjGB548agnbvnWMf4AycC
         USBzVZyKoz8JYE9TfOIpWii8lwzzXevmZ7bjI461QGWYtDsuNqk1a3gBKyXzIfnrcf/h
         WMW6WUgjx2cDcSUgeNTBEiA7z7fD4fIRyCE+NUV0Jz2FztTCIidoZIZ2HdEq8QClADf3
         toiio59f/VFMJEkvpu3+k5GMQwOV3qPP8Q394y1qJkQWgsxsiwC7AasPdWpAHhJMfpHv
         2vEuwOg1YG+XPJ2BNbSDEUhvz7P5Fe62k/Aaq742NRBPpuyKIymfoRxsk5tP6DAcAe/o
         DC9g==
X-Gm-Message-State: AOAM530C/KZyso1dVoFKesLRVS2cxpBB7GfloJTZlv4FL13rCduoY+Z8
        yxfwp9fa9CGmyiC33wGuSYA=
X-Google-Smtp-Source: ABdhPJzdBtA8C3ab4YGROs84S7Mh1Ga3np+vhm9BC6CQEldH4BttWOMOJH29A4kw8snvz14TXwKUNw==
X-Received: by 2002:a05:600c:1ca7:: with SMTP id k39mr16580779wms.115.1628179873285;
        Thu, 05 Aug 2021 09:11:13 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id w10sm6336007wrr.23.2021.08.05.09.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 09:11:12 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v4 0/2] Add GCC for SM4250/6115
Date:   Thu,  5 Aug 2021 19:11:05 +0300
Message-Id: <20210805161107.1194521-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds support for the Global Clock Controller on QCom SM4250 and
SM6115, codename bengal. The code is taken from OnePlus repo [1]. The two
platforms are identical so there is only one compat string.

[1]: https://github.com/OnePlusOSS/android_kernel_oneplus_sm4250

v1: https://lkml.org/lkml/2021/6/22/1131
v2: https://lkml.org/lkml/2021/6/27/157
v3: https://lkml.org/lkml/2021/8/1/68

Changes from v3:
- removed test clock from driver/binding
- fix GCC_SDCC2_BCR value as spotted by Konrad
- simplified probe function

Changes from v2:
- Suggested by Stephen Boyd
  - switch to parent_data in place of parent_names
- other
  - drop parent refs to invalid clocks
  - use pll-alpha regs when possible
  - drop unused parent defs
  - add pll test clock to bindings

Changes from v1:
- remove sm4250 compat, there will be a single sm6115.dtsi for both platforms

Iskren Chernev (2):
  dt-bindings: clk: qcom: gcc-sm6115: Document SM6115 GCC
  clk: qcom: Add Global Clock controller (GCC) driver for SM6115

 .../bindings/clock/qcom,gcc-sm6115.yaml       |   72 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-sm6115.c                 | 3544 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm6115.h   |  201 +
 5 files changed, 3825 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml
 create mode 100644 drivers/clk/qcom/gcc-sm6115.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm6115.h


base-commit: 8d4b477da1a807199ca60e0829357ce7aa6758d5
-- 
2.32.0

