Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 168823FAE82
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 22:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232450AbhH2UtV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 16:49:21 -0400
Received: from relay02.th.seeweb.it ([5.144.164.163]:35993 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234667AbhH2UtS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 16:49:18 -0400
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 53D6E1FABE;
        Sun, 29 Aug 2021 22:48:24 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] sdm660 clock-controller cleanup
Date:   Sun, 29 Aug 2021 22:48:18 +0200
Message-Id: <20210829204822.289829-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Following earlier cleanup in gcc to replace parent_names with
parent_data to use pointers to internal clk_hws, this patchset removes
more dependencies on global clock names through clk_parent_data's .name
field, and uses ARRAY_SIZE to determine the number of parent clocks in
the parent_data arrays instead of hardcoding it.

Marijn Suijten (4):
  clk: qcom: gcc-sdm660: Use ARRAY_SIZE for num_parents
  clk: qcom: gpucc-sdm660: Use ARRAY_SIZE for num_parents
  clk: qcom: mmcc-sdm660: Use ARRAY_SIZE for num_parents
  clk: qcom: gpucc-sdm660: Remove fallback to global clock names

 drivers/clk/qcom/gcc-sdm660.c   | 80 ++++++++++++++++-----------------
 drivers/clk/qcom/gpucc-sdm660.c | 15 +++----
 drivers/clk/qcom/mmcc-sdm660.c  | 72 ++++++++++++++---------------
 3 files changed, 83 insertions(+), 84 deletions(-)

-- 
2.33.0

