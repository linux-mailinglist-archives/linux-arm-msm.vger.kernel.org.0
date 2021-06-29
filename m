Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0833B708D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 12:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233051AbhF2K1N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 06:27:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233026AbhF2K1L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 06:27:11 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DFA9C061766
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 03:24:43 -0700 (PDT)
Received: from localhost.localdomain (bband-dyn27.178-40-203.t-com.sk [178.40.203.27])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 7A92B3EBA6;
        Tue, 29 Jun 2021 12:24:38 +0200 (CEST)
From:   Martin Botka <martin.botka@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        paul.bouchara@somainline.org,
        Martin Botka <martin.botka@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2 0/3] RPMCC for SM6125
Date:   Tue, 29 Jun 2021 12:24:01 +0200
Message-Id: <20210629102405.192053-1-martin.botka@somainline.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds support for the
RPMCC found in SM6125 SoC.

In this resend i didnt include 2 patches
that were already merged.

Changes in v2:
Add commit description to all the patches

Martin Botka (3):
  rpmcc: Add sm6125 compatible
  dt-bindings: clk: qcom: smd-rpm: Document SM6125 compatible
  rpmcc: Add support for SM6125

 .../devicetree/bindings/clock/qcom,rpmcc.txt  |  1 +
 drivers/clk/qcom/clk-smd-rpm.c                | 56 +++++++++++++++++++
 include/linux/soc/qcom/smd-rpm.h              |  1 +
 3 files changed, 58 insertions(+)

-- 
2.32.0

