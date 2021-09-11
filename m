Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF390407666
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Sep 2021 14:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235178AbhIKMPJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Sep 2021 08:15:09 -0400
Received: from m-r2.th.seeweb.it ([5.144.164.171]:41001 "EHLO
        m-r2.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230249AbhIKMPJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Sep 2021 08:15:09 -0400
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 4C96F3F350;
        Sat, 11 Sep 2021 14:13:55 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] msm8998 clock-controller cleanup
Date:   Sat, 11 Sep 2021 14:13:32 +0200
Message-Id: <20210911121340.261920-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Clean up the clock-controllers for msm8998 similar to sdm660 by:
- Using parent_data/hws for internal relations;
- Removing the "xo" fixed-factor clock that only existed for drivers
  that rely on this global name (the DT only provides "xo_board");
- Using ARRAY_SIZE for num_parents instead of hardcoding array length;
- Removing unnecessary fallbacks to global names of parent clocks, these
  are already specified in the DT;
- Updating DT-bindings to reflect the clocks used by gcc.

Note that this should land some time after [1] to give users time to
update their firmware (DT) before updating the kernel.  Additionally [2]
should make it in before DSI PLL nodes are added.

[1]: https://lore.kernel.org/linux-arm-msm/20210911120101.248476-1-marijn.suijten@somainline.org/
[2]: https://lore.kernel.org/linux-arm-msm/20210830182445.167527-2-marijn.suijten@somainline.org/

Marijn Suijten (8):
  clk: qcom: gcc-msm8998: Move parent names and mapping below GPLLs
  clk: qcom: gcc-msm8998: Use parent_data/hws for internal clock
    relations
  clk: qcom: gcc-msm8998: Remove transient global "xo" clock
  clk: qcom: gpucc-msm8998: Use ARRAY_SIZE for num_parents
  clk: qcom: mmcc-msm8998: Use ARRAY_SIZE for num_parents
  dt-bindings: clocks: qcom,gcc-msm8998: Reflect actually referenced
    clks
  clk: qcom: gpucc-msm8998: Remove unnecessary fallbacks to global
    clocks
  clk: qcom: mmcc-msm8998: Remove unnecessary fallbacks to global clocks

 .../bindings/clock/qcom,gcc-msm8998.yaml      |  26 +-
 drivers/clk/qcom/gcc-msm8998.c                | 705 ++++++++++--------
 drivers/clk/qcom/gpucc-msm8998.c              |  13 +-
 drivers/clk/qcom/mmcc-msm8998.c               | 183 +++--
 4 files changed, 475 insertions(+), 452 deletions(-)

-- 
2.33.0

