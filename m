Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35AFD3C2859
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 19:32:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbhGIRev (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 13:34:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbhGIReu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 13:34:50 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD774C0613E7
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 10:32:05 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id s18so9191453ljg.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 10:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zurjrq0cjWsoLjJ82l7/G+ZPz9xVTNl1bQFZKNmCIz4=;
        b=vY5VGvegEbBAQDLsiGjd3Z6fmafGVfAHansYs6vDurjf4qvtnzun6FtBF2hc6IOFP1
         WzLDMPNYLckVmCjF9D41ANfGwPlWEtBQASMNaDdZxDKvYTyIpTQbz1ywC5eTCj2cMuVy
         rECD9/tTg/0CtdUnuAsfSd1xpShlUY3Njve2VmuKmVvemT7QY2MTUTV4mqhool6vYfD+
         3nN7wBSqPmqOMFwu0KiTmkO6BablOsws/EHzGGvCvSDsibrmUsu3cYN1xmU894VQWyXo
         AKgs+nS55wo4Dou+vBmrwbz+OnxmCpbIkSZDW6uJ+9CfU7oavhLSw5swXkBHScPBdAAN
         QWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zurjrq0cjWsoLjJ82l7/G+ZPz9xVTNl1bQFZKNmCIz4=;
        b=aj+p8LlE6YqG9zC+j/V7dzyhkpYhjuePaZEbMIi+da2vMqgNp+8eyQPK1DBytUZv5j
         Q2cvFsUeFGuJ8/IJFaKOU5USF6c96XTmxdEAbxBOaFPFEvwbEEfzlX7lOe1RD58ZkhD4
         O+Wh3/QcSR+Y9H6OYMitHVdEfcWt3JyeGlmDDxI/UWU7ZpVhGlwuIx9Cbi2ty7XbGHuJ
         5KMqT6oXt5symX6/E/fEdaOa2ApFebWAiYTIUhdJGHZnWZ+nXY3Uoodb/KQlDbdS6AyB
         VOkHWUyv6V9d4NENfaJ2RHJM8+UV0SoUU96ab+cDfGReLuZlkXIQphbAH1S5R89GFg1E
         juOQ==
X-Gm-Message-State: AOAM5336o76cjC0AkA3Xd+AYHUq2vJrQMEhmv4MMKQUXvb4Kf8Oh8m6f
        bueJ60giHMlf+36ATDoUsKwoew==
X-Google-Smtp-Source: ABdhPJxsANV4aNXVC9/SO84SsQPHBKNbv8Qac6D4KSgoSwy+kI1kP/W8QusifdOkojnPnrHEoAEhbA==
X-Received: by 2002:a2e:a54f:: with SMTP id e15mr30095958ljn.42.1625851924190;
        Fri, 09 Jul 2021 10:32:04 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b14sm511129lfb.132.2021.07.09.10.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 10:32:03 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/7] clk: qcom: use power-domain for sm8250's clock controllers
Date:   Fri,  9 Jul 2021 20:31:55 +0300
Message-Id: <20210709173202.667820-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On SM8250 both the display and video clock controllers are powered up by
the MMCX power domain. Handle this by linking clock controllers to the
proper power domain, and using runtime power management to enable and
disable the MMCX power domain.

Dependencies:
- https://lore.kernel.org/linux-pm/20210603093438.138705-1-ulf.hansson@linaro.org/ (merged in 5.14)
- https://lore.kernel.org/linux-arm-msm/20210703005416.2668319-1-bjorn.andersson@linaro.org/
  (pending)

Changes since v2:
 - Move pm_runtime calls from generic genpd code to the gdsc code for
   now (as suggested by Ulf & Bjorn)

Changes since v1:
 - Rebase on top of Bjorn's patches, removing the need for setting
   performance state directly.
 - Move runtime PM calls from GDSC code to generic genpd code.
 - Always call pm_runtime_enable in the Qualcomm generic clock
   controller code.
 - Register GDSC power domains as subdomains of the domain powering the
   clock controller if there is one.

----------------------------------------------------------------
Dmitry Baryshkov (7):
      dt-bindings: clock: qcom,dispcc-sm8x50: add mmcx power domain
      dt-bindings: clock: qcom,videocc: add mmcx power domain
      clk: qcom: gdsc: enable optional power domain support
      clk: qcom: gdsc: call runtime PM functions for the provider device
      arm64: dts: qcom: sm8250: remove mmcx regulator
      clk: qcom: dispcc-sm8250: stop using mmcx regulator
      clk: qcom: videocc-sm8250: stop using mmcx regulator

 .../bindings/clock/qcom,dispcc-sm8x50.yaml         |  7 +++
 .../devicetree/bindings/clock/qcom,videocc.yaml    |  7 +++
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 11 +---
 drivers/clk/qcom/common.c                          | 37 ++++++++++--
 drivers/clk/qcom/dispcc-sm8250.c                   |  1 -
 drivers/clk/qcom/gdsc.c                            | 70 ++++++++++++++++++++--
 drivers/clk/qcom/gdsc.h                            |  2 +
 drivers/clk/qcom/videocc-sm8250.c                  |  4 --
 8 files changed, 115 insertions(+), 24 deletions(-)


