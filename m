Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 382B83C2CA5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 03:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231253AbhGJBgv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 21:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbhGJBfn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 21:35:43 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B611C0613E8
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 18:32:57 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 11so6891217ljv.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 18:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UZvbJ8ZUJ5TOQauPo5aJpdbPhjigM8gpXKGnojAJE1A=;
        b=WIIIXCH/0grjnJfRVQQWRPY6PMIz9weSlcKEnahD5UjpZoIJphzg1KtFuTPiuNIBTW
         6eZyNSFf9ZUtRUYyy5XQQwiF7+U3xNaYiYkcTdr3vU1pP4W6PdSxfLW+RTuWueekizAS
         EGJpOTFbp6qTH+4wJfwxxEQWgNz2j4YLbNPGtPJRQ9F1FE9b7dkXAx87f0ipLJ5OEAxV
         ctj0+CRlMay/zvLZEyTwHEb5N5OdZXBZ0CvcMLPIlqkmZtCrhqWLpIxXCMQmu/ObxgmD
         TpaK4Ndhh9DbrMjKSJ2le3OBpHUHIni84De5YScp/fE+zpAzjCibetBlYWAc0Hrg7td1
         E2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UZvbJ8ZUJ5TOQauPo5aJpdbPhjigM8gpXKGnojAJE1A=;
        b=R6iCCX2RHhveZVR+kKOoMivTHrf0PfTos25fkvSgIwzycaavmglEJxy7T66CvBXoXn
         RIUnupysHUKrUGfPiXoC77Jbzz0Qj2y0kUnBM4A3q462CKXv+c751ElFRKJucjVcp5tT
         qVIf/R9Pl4Fim1jG+IiWCQXP11sB3fGql5PT08eu4Jc908R6SKGHCdFC4wN7qb6J2Tqv
         98LDkaBtAP+/9MNTOraRZseWPpV98N32Lk7P2a9OJ4KWDsJgoisk3STCHPAclNrSau4q
         bwwZbg3GeYxerNadQtlhIaISGgPm++JZBYGAJGbXE3oc+opFXSSby5q9l8cHRnkaLrTv
         WSmw==
X-Gm-Message-State: AOAM532wZewEvgE5oWF+ifPvPTMXtK+JHh9+FW4UVcEJk9mfW0IzkrDr
        OUkzF6BQMuCiJ1TL8fX76xVp1o4XbBvdGw==
X-Google-Smtp-Source: ABdhPJz9qq3ddd8ZYFqgl1bfPpyJHeiAHZGN2qeXhAgngn2HKb0nKeJADQ/mf7RyFD3M7uxTaPB64w==
X-Received: by 2002:a2e:5812:: with SMTP id m18mr5683932ljb.327.1625880775204;
        Fri, 09 Jul 2021 18:32:55 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p13sm588788lfh.206.2021.07.09.18.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 18:32:54 -0700 (PDT)
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
Subject: [PATCH v4 0/6] clk: qcom: use power-domain for sm8250's clock controllers
Date:   Sat, 10 Jul 2021 04:32:47 +0300
Message-Id: <20210710013253.1134341-1-dmitry.baryshkov@linaro.org>
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

Changes since v3:
 - Wrap gdsc_enable/gdsc_disable into pm_runtime_get/put calls rather
   than calling pm_runtime_get in gdsc_enabled and _put in gdsc_disable
 - Squash gdsc patches together to remove possible dependencies between
   two patches.

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
Dmitry Baryshkov (6):
      dt-bindings: clock: qcom,dispcc-sm8x50: add mmcx power domain
      dt-bindings: clock: qcom,videocc: add mmcx power domain
      clk: qcom: gdsc: enable optional power domain support
      arm64: dts: qcom: sm8250: remove mmcx regulator
      clk: qcom: dispcc-sm8250: stop using mmcx regulator
      clk: qcom: videocc-sm8250: stop using mmcx regulator

 .../bindings/clock/qcom,dispcc-sm8x50.yaml         |  7 +++
 .../devicetree/bindings/clock/qcom,videocc.yaml    |  7 +++
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 11 +---
 drivers/clk/qcom/common.c                          | 37 ++++++++++--
 drivers/clk/qcom/dispcc-sm8250.c                   |  1 -
 drivers/clk/qcom/gdsc.c                            | 67 +++++++++++++++++++++-
 drivers/clk/qcom/gdsc.h                            |  2 +
 drivers/clk/qcom/videocc-sm8250.c                  |  4 --
 8 files changed, 113 insertions(+), 23 deletions(-)


