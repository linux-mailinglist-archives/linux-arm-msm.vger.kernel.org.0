Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85F923C1E55
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 06:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbhGIEeZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 00:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbhGIEeY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 00:34:24 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F11CC061762
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 21:31:40 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id a18so20604155lfs.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 21:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6ZCukB0H7lhNNnQd+1bAW9ZLZj+MDCA+DrfCxB87atU=;
        b=pUpRSDm2GW5P/FpEgw6wyQiZLxOd2tVKIXzj6A8zjb0KklDHXM+cZOnSDg6v0f7plo
         W6aUpwu3UTZ9S6WvR/hcx/zHyBuzTN/zWGQRqERxd1u8GSxEYB0hX66gU7Bs/dlQrIjL
         7YvkVCoKDXheMv7OEC+o/UvYwW6Qp3PZJ5qTdZhU+Y6jdsDVgu7lgzz5U8GhW77i7HZ0
         4rmlUL47ubhtq5vLjMhoGlKKuGKCiUIN2u8Ds3Kr6Gf2SpqOrfEoi69U+WCaZ3RFoX7f
         b3NH7o74U0kRayyVa1CbeL7zW4fe/xaxK29GdVedbsjQF88Jnm1iWVMGR1NbekBWLTS0
         /K7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6ZCukB0H7lhNNnQd+1bAW9ZLZj+MDCA+DrfCxB87atU=;
        b=XFwEGP9gfaWeJI33qkvn7RHdYyScqj+8hwL+P+hGbu/v8khKMufyPeYFjletPJ8OHX
         ugDoWdwWPUCl2E8lf/t6/7MUy22Q8Wba+yMUshHIfd44BkUZeLUBtf1HV0EHju4rHkYo
         INxUefZAswqdMNXm2N4mY1Z0OD+prPFzo33qKcCWRCloj0lRT9T94e/rzMBuPVdfhzra
         ywNLhwydfzipOJJpBhrlIGkRUWCySZhpsCuM+g1u+JB5NuHBn637TxJfyIHg7yWapUjJ
         eiWT44Mu5jdHvvlQnj09rgl3dlO6Fg5yYYgrejDung9r4h1WSoOspoj5rfR7BQUl7YCL
         mGyg==
X-Gm-Message-State: AOAM530WZJkPaHn9qEzweTEbjJsgfUCpjUu1WkJgpqjLNFURVM7VG4Ci
        UlIm5dsW1+9X+a0fJI5CbbLZQA==
X-Google-Smtp-Source: ABdhPJycDcRQ51E+yA+HmmtPei7V60DaErQ5rNIFcsWod+olmwaSk4Z1kb/oTEqlMLkqP2IvNB35ig==
X-Received: by 2002:a05:6512:3606:: with SMTP id f6mr15858081lfs.370.1625805098524;
        Thu, 08 Jul 2021 21:31:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h1sm13028lft.174.2021.07.08.21.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 21:31:38 -0700 (PDT)
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
Subject: [RESEND PATCH v2 0/7] clk: qcom: use power-domain for sm8250's clock controllers
Date:   Fri,  9 Jul 2021 07:31:29 +0300
Message-Id: <20210709043136.533205-1-dmitry.baryshkov@linaro.org>
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

Patches resent because I missed one hunk in the PM domains patch, which
got stuck in the git index. Now the patch is fixed.

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
      PM: domains: Add support for runtime PM
      clk: qcom: gdsc: enable optional power domain support
      arm64: dts: qcom: sm8250: remove mmcx regulator
      clk: qcom: dispcc-sm8250: stop using mmcx regulator
      clk: qcom: videocc-sm8250: stop using mmcx regulator

 .../bindings/clock/qcom,dispcc-sm8x50.yaml         |  7 ++++
 .../devicetree/bindings/clock/qcom,videocc.yaml    |  7 ++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 11 ++-----
 drivers/base/power/domain.c                        | 33 +++++++++++++++++++
 drivers/clk/qcom/common.c                          | 37 ++++++++++++++++++----
 drivers/clk/qcom/dispcc-sm8250.c                   |  1 -
 drivers/clk/qcom/gdsc.c                            |  5 +++
 drivers/clk/qcom/videocc-sm8250.c                  |  4 ---
 include/linux/pm_domain.h                          |  6 ++++
 9 files changed, 91 insertions(+), 20 deletions(-)





