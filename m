Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 023E8644E97
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 23:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbiLFWpY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 17:45:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiLFWpX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 17:45:23 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3B373E080
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 14:45:21 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id qk9so9915760ejc.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 14:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ynG1+3vjfiZSU+ogLcchnnNhSFaZ7xkMBxNXXA6Fio=;
        b=to+GedLlWnxgl5C8NWV55Dsu+mMHrlqNemJINvrDdO6dHqftQcMOt/MaTIyaBQE60U
         lqyhvLvUhkQ9KEmOYj0TM5WuQTIwK0gEPQ45+HO6pitql23LTSHCFhm0OwyQsMuC+p+I
         mhpzBmy9ks4ZBqBmdtU1Qo6KuGYYAqsTHNuMB4w5OCPvmNt/lawTRA+2keaXNOTn6xfq
         zTDhfBol+6XSoI2V/Oa6fea+HHpZmpLgToBpuKwgQ515gXb5fmpKq9LcOlpRVosul/YU
         5Yzve/NIUyD6ZTxGNY0CDFTKeDwo4IhybPOWjAkNVXT29+x1zCNGCFDestFCN1uNWMYG
         0jFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ynG1+3vjfiZSU+ogLcchnnNhSFaZ7xkMBxNXXA6Fio=;
        b=LmiW6wbK9YQLPBss8A2uFfsL4zVpkGsZ1Zmts0G5aEXhcIhAggv93t6Z/SXQ/rpbkP
         VF1CfS6ke7x5UoEde8RGW/4wHElyEvT1AUOps7TRtdOo8x/TwA08MK3GoWrlGyBAEl/T
         +Ard8Z7wG35m3aBJ9z+11hCmRLge3JM1GdtqdFooMKpHT3IcD7QHMYJWPtu8h31/vnZr
         lTKjpWCdo3vg0+er+9KuCIRR8BGFv1dByoJ0PkoUIfN8vTK6SwvSyzItqPf/NNSKPuQy
         4IxFPD8KA5YaWzBFHmCvZawM5wBVBBKrrOEIhlhWM/Qkbd2J41t7Vy6rhKFLiMdd6J8X
         YUlw==
X-Gm-Message-State: ANoB5pnc+bxUyAr5JTe5UHWB/RKbIuk/MhuVh3kde/oiPzSULgVo+1oc
        9pDsUO9jQudS6daIF437byqYIg==
X-Google-Smtp-Source: AA0mqf6SVN/jbnD7JjXauDzsKVMGrZjql/lfP7lnjBMby7NQ9kCzI1l3OWuGJ/W0kkphc9cMC/us3g==
X-Received: by 2002:a17:906:eb04:b0:7ae:77ef:d048 with SMTP id mb4-20020a170906eb0400b007ae77efd048mr59544718ejb.740.1670366720242;
        Tue, 06 Dec 2022 14:45:20 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id r17-20020a1709061bb100b007c0985aa6b0sm7820772ejg.191.2022.12.06.14.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 14:45:19 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v6 0/5] clk: qcom: Add support for SM8550
Date:   Wed,  7 Dec 2022 00:45:10 +0200
Message-Id: <20221206224515.1495457-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset adds more clocks support for the Qualcomm SM8550 SoC,
It adds the TCSR clock controller driver and the rpmh clocks.

Changes since v5:
 * moved the 3rd patch as 1st, since otherwise check for the example
   from the TCSR binding schema fails
 * changed the description of the clocks property in the TCSR schema
   file to "TCXO pad clock"
 * added syscon to compatible property for TCSR schema and in its
   example

To: Andy Gross <agross@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Abel Vesa (5):
  dt-bindings: clock: qcom,rpmh: Add CXO PAD clock IDs
  dt-bindings: clock: Add SM8550 TCSR CC clocks
  dt-bindings: clock: Add RPMHCC for SM8550
  clk: qcom: rpmh: Add support for SM8550 rpmh clocks
  clk: qcom: Add TCSR clock driver for SM8550

 .../bindings/clock/qcom,rpmhcc.yaml           |   1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml      |  55 +++++
 drivers/clk/qcom/Kconfig                      |   7 +
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/clk-rpmh.c                   | 110 ++++++++--
 drivers/clk/qcom/tcsrcc-sm8550.c              | 192 ++++++++++++++++++
 include/dt-bindings/clock/qcom,rpmh.h         |   2 +
 include/dt-bindings/clock/qcom,sm8550-tcsr.h  |  18 ++
 8 files changed, 366 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
 create mode 100644 drivers/clk/qcom/tcsrcc-sm8550.c
 create mode 100644 include/dt-bindings/clock/qcom,sm8550-tcsr.h

-- 
2.34.1

