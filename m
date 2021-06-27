Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1D03B54B6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jun 2021 20:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231352AbhF0S6K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 14:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231288AbhF0S6J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 14:58:09 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7777AC061574;
        Sun, 27 Jun 2021 11:55:44 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id a5-20020a7bc1c50000b02901e3bbe0939bso9518943wmj.0;
        Sun, 27 Jun 2021 11:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gAa5Undjg/T4By4J3ChgR8S1R2CwQn5rJM130hj+4IU=;
        b=XemtwnJbPpP0NOMZzTrA3shACUa65X54mPuEkDUh8iaDyMRSFHyhbxXSjrMDcxiIv+
         o1cAJngN7q5x2XRCk5vOHaCzR6ak2Sc/q8rIIpndyoTOy936Cm5a8rvZSZChrHHv2rlk
         3CIKhnSYQFCQAOBKqcObHIUJ+am/EaF17wwMhaJm61TMo2tQeudJEw61VBEIR8wVlAo2
         b/7/tKwdDv/5e01//eUV2Iigkd8nlXrYdSzkxWkJljRsEGxlE8uuUOZQ73KoCNvTmpKo
         rDup3Jp9ZQzbuZjxdGRRUZ1oSkUEr6HM3jI7D31y5YY2Qgway4Q+pnBBBz5g7wn0z4VB
         LR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gAa5Undjg/T4By4J3ChgR8S1R2CwQn5rJM130hj+4IU=;
        b=tm3f943Mi2WPYqfq6rbXmJNMeSD9I5QgpOrk19VKyk8oCSOmQqIyX5dw7VpXgKKgyf
         SOYd5Gj4zSkU6nRpWy4LMnp6pnB9cGrHYzBo6uZouB7tyXY5P8NSgFwEwaOz7ifqntGJ
         yqG+yVgPqpuqJgj8DfnZl4mDIxDs5GfxnN85Tds6/f9ty2APMEDloy2Ylm9o6aS1vlLA
         9yfKUcI8fYvISLcjRQWaWegMOsFXNzqAV4HjuDzZATLqdIwy6bJSjfBwZvXxZ5aBoroU
         tGAGCXGSqEoe62Ul1lct4dEw1yYPMH/HbMAaoecODKHia/bVz+nhd5P0j0RLnP/4Re4z
         Pkeg==
X-Gm-Message-State: AOAM530xlUyVeytEZ7xLV6M2e7FeRmo+dmynOJKYgGTqtBW8K0N20d12
        +AN+d91UHyRlLN2oLn2M6qw=
X-Google-Smtp-Source: ABdhPJwCOasxxJ/1Eing5sMd4n9+hul0QWT3erZJKRhPWVyx8HuMQDZzLJVf0bEVIe8l8TyC5952uw==
X-Received: by 2002:a7b:cb55:: with SMTP id v21mr21489340wmj.19.1624820143108;
        Sun, 27 Jun 2021 11:55:43 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id r6sm5931826wmq.37.2021.06.27.11.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jun 2021 11:55:42 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v2 0/2] Add GCC for SM4250/6115
Date:   Sun, 27 Jun 2021 21:55:36 +0300
Message-Id: <20210627185538.690277-1-iskren.chernev@gmail.com>
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

Changes from v1:
- remove sm4250 compat, there will be a single sm6115.dtsi for both platforms

Iskren Chernev (2):
  dt-bindings: clk: qcom: gcc-sm6115: Document SM6115 GCC
  clk: qcom: Add Global Clock controller (GCC) driver for SM6115

 .../bindings/clock/qcom,gcc-sm6115.yaml       |   72 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-sm6115.c                 | 3623 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm6115.h   |  201 +
 5 files changed, 3904 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml
 create mode 100644 drivers/clk/qcom/gcc-sm6115.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm6115.h


base-commit: e71e3a48a7e89fa71fb70bf4602367528864d2ff
--
2.32.0

