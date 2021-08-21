Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 070453F3B4D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Aug 2021 17:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232133AbhHUP5o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Aug 2021 11:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231690AbhHUP5n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Aug 2021 11:57:43 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D89DBC061575;
        Sat, 21 Aug 2021 08:57:03 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id v2so18658287edq.10;
        Sat, 21 Aug 2021 08:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dQeI7rq5UyNj25/cgHXT21cjW1M3absAwcr0nFDGAXQ=;
        b=fZYtJBeIc2tsEP0dXutmscR7rVvQUGZi7n6iVg6qm9xG1rP4pi4p/BnWh+LLjyF7el
         VH0X5JUuzLMui8Nqz0/0JYmP/axGa1rnZOCbMlX7qZPNgGErUt1DIfYPvdyDmoSP9n1z
         eyaFqm4GfgVkGLYbDqfXH48Omo1urK2MSbpGm8BvRn/Vh/TAdtaucJQ2Leu6svNs8goL
         +GMrsDdWK7NLEqYrcOM7oevwXQ33hmxyyjaRha9a3ZStxSGdIqIOOCuJeiXfAGtDWJe9
         FX/ww03O2gFBEgrrCyGL9YY+EGQRZJoWImjHquIEfqsPEPz/AF8x/IS8ipY7/PG1DvAL
         bJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dQeI7rq5UyNj25/cgHXT21cjW1M3absAwcr0nFDGAXQ=;
        b=PeYyxmwPtD6y/znCSzhDL38v9IFV+C6oYZRHMWyMUlZhsLPQcY8S8TZywdJewO2JX5
         p4+3K6gQv1lbINhinwL+Ck+6n1r0CnrnFdSJy4lxmO2OfHEibjSpjY586a9AM2yGrEWl
         X4nkS+0abI4xAVlamMqmJpyBWmF+oxeW12Vrih3dML7Jv8XfDl9GFZ6KvatG0/GjhQn3
         HS3pdwlFOYLIiImEDDSnprL9J6LxHhC7pegCYknuDNJvTWMHfSsxTRSsdYxtwXAXbDgV
         yyuRNOhL8Ul3lUwuogmenfLRFAhLNv/hCcM3odHkHVb9j3gO4DURG5AxffYmbzEF68a4
         hl0A==
X-Gm-Message-State: AOAM532Noira9dSBTPPmmG35zkFVYXbvubCJGV6QZM9jOVHQdpyEF2t3
        gvIDvdFo7/L1PuTe4Eajc/o=
X-Google-Smtp-Source: ABdhPJzQmYjLjA+FlqyLcD31UFy2RE43X7Yv4nv+8ViR9APl56Rb7LO0JixDaD6gtbVbcIPInHLuNw==
X-Received: by 2002:a05:6402:3099:: with SMTP id de25mr28016818edb.36.1629561422535;
        Sat, 21 Aug 2021 08:57:02 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id g10sm4471314ejj.44.2021.08.21.08.57.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Aug 2021 08:57:01 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v3 0/2] Add UFS PHY support for SM6115/4250
Date:   Sat, 21 Aug 2021 18:56:54 +0300
Message-Id: <20210821155657.893165-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The UFS PHY found on SM6115/4250 has a lot of common registers with ufs phy v2,
even though in downstream it is named v3-660. Due to register similarity with
v2, the few extra registers that are needed are added as v2 registers.

The register values/sequences are taken from OnePlus repo [1].

[1] https://github.com/OnePlusOSS/android_kernel_oneplus_sm4250

v1: https://lkml.org/lkml/2021/8/5/235
v2: https://lkml.org/lkml/2021/8/13/889

Changes from v2:
- Suggested by Vinod
  - the 6115 registers had a lot in common with v2 registers (and not v3, as
    was initially assumed), so those were reused whenever possible, and new
    regs were added along other v2 registers.

Changes from v1:
- Suggested by Vinod
  - removed v3-660 constants for regs with same name and value as v3 regs

Iskren Chernev (2):
  dt-bindings: phy: qcom,qmp: Add SM6115 UFS PHY bindings
  phy: qcom-qmp: Add support for SM6115 UFS phy

 .../devicetree/bindings/phy/qcom,qmp-phy.yaml |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp.c           | 124 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |  18 +++
 3 files changed, 143 insertions(+)


base-commit: 86ed57fd8c93fdfaabb4f58e78455180fa7d8a84
-- 
2.32.0

