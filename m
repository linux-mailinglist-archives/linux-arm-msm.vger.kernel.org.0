Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6FC410947
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Sep 2021 04:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235075AbhISCfO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Sep 2021 22:35:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235036AbhISCfN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Sep 2021 22:35:13 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 665C5C061768
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Sep 2021 19:33:49 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id b7so12876237pfo.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Sep 2021 19:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=knsQUtmuMiVfH/52E1/TKg3i9rf00ZFYDTvnm0LCoa0=;
        b=dRf9hgQcFAJke6SFE0yZ0siuVxorr9rS/19fqnqsdyzwOhkVMGBhh/Aag3Gq3VFyNZ
         i8fHak1fTj1/3uaUuGEndDZRSEzmMiqPfkfyueRVNNgAIGAjbOh4VRfK87gGqGKVxLXh
         z76I4GuUmnm5wfp+iypQkFhIjfmGxnbYsW2iRsbHugZOHwtgc6OgUm/paI88dMnnC9DT
         SI9AhmZ35J9usXKJ97QecIqIpKvQthaDEuEzQ7KAGxN/FwshIGtl2HZ00/PujNYNKYRN
         YoTVTvhgKy7eM9+oG3S8GrBcV+vO1X1e3aAOeSzeaqaYA1yjkIC9ZEZXk9LuzcgNFat7
         +NVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=knsQUtmuMiVfH/52E1/TKg3i9rf00ZFYDTvnm0LCoa0=;
        b=GEGHiQyU6lAwsozAo3q0t/1AZk//qtX4f7zE0f7T/aqWRP0F7fjFfuGUi09+IzEZS+
         6S/sRTvO8NLU4/hZvQaR3b2HRVEeonK1uGcmDTUQEZusa6yJVcQlvk2PMUHsd2uFy4Wy
         VKa9JrfjY6wniClzpmjAyrDPxbNxm52gmUL7TQddP7g01YFNCfhxhnd+2lgdev7CuGkt
         cnbI7PaWHrTVwe2UhS7OsEtLF7uhfcCUf0SJ7Dg7h5lZIhGb6P28fOPnInkadDCp9fvV
         Rnam2zryfzgTNBB0jWFAG73933rKuJ4uOAS0SCTC10DBAkm1CzTqq6Ed5UX5REn17jwT
         pp4A==
X-Gm-Message-State: AOAM530osDk0BzW3nBPU9EF9VTivGvsAsZxJ8SLrXkNiqMk47kOFh1Dh
        jwUXfdnXC7d+peP3+aBAz64r02T6WzARuA==
X-Google-Smtp-Source: ABdhPJzIXEg7jU2ehSrl2QwVv+gf2CeyUrWuPz+OULqbByVY9R5oDx9Vab6jVYrt7TBKMB8ZBkO0TA==
X-Received: by 2002:a63:5947:: with SMTP id j7mr17217942pgm.193.1632018828853;
        Sat, 18 Sep 2021 19:33:48 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id t13sm9316687pjg.25.2021.09.18.19.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 19:33:48 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v3 0/2] Add QCM2290 Global Clock Controller driver
Date:   Sun, 19 Sep 2021 10:33:06 +0800
Message-Id: <20210919023308.24498-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The series adds QCM2290 Global Clock Controller driver support.

Changes for v3:
- Include GDSC support.

Changes for v2:
- Drop unused gcc_parent_map and gcc_parents to avoid clang
  unused-const-variable warnings.

Shawn Guo (2):
  dt-bindings: clk: qcom: Add QCM2290 Global Clock Controller bindings
  clk: qcom: Add Global Clock Controller driver for QCM2290

 .../bindings/clock/qcom,gcc-qcm2290.yaml      |   72 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-qcm2290.c                | 3047 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-qcm2290.h  |  188 +
 5 files changed, 3315 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml
 create mode 100644 drivers/clk/qcom/gcc-qcm2290.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-qcm2290.h

-- 
2.17.1

