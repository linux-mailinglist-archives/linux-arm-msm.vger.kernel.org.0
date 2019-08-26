Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA7E29D4FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2019 19:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732634AbfHZRcq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Aug 2019 13:32:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:53282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727211AbfHZRcq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Aug 2019 13:32:46 -0400
Received: from localhost.localdomain (unknown [122.178.200.231])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4E33D206E0;
        Mon, 26 Aug 2019 17:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566840764;
        bh=Tf8pgf4qsWMDIu9iASnrH8+/6Md//1BIO+qOMGZ7Sbc=;
        h=From:To:Cc:Subject:Date:From;
        b=nJhB/azxLgE/hP7ebGUhrP2FxgQdL4F2WPOC3ZwYvpVMeSYG7zrfnXSEqZG0/mRUr
         PcRbb5AU6ynwb1ub+KiAkPeSv6dWrbgRFhWkreWPCyVqpNkwPSzvkQJzc2GmOlUvUM
         FQwEJFyXF5Qvev14stfNlEnVNBlrMmqGUjfSn8qo=
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/4] clk: qcom: Add support for SM8150 rpmh
Date:   Mon, 26 Aug 2019 23:01:16 +0530
Message-Id: <20190826173120.2971-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for rpm clock controller found in SM8150 and while at it update
the driver to support parent data clock scheme as suggested by Stephen.

Changes since v4:
 - Fix the .fw_name as xo instead of xo_board (v4 erroneously did for
   .name)

Changes since v3:
 - Make clock parent name as xo instead of xo_board

Changes since v2:
 - Add reviewed-by from Bjorn
 - Update the parent name as xo_board
 - Fix style issue

Changes since v1:
 - Describe parent clocks for rpmhcc
 - Add support for parent data scheme for rpmhcc

Vinod Koul (4):
  dt-bindings: clock: Document the parent clocks
  clk: qcom: clk-rpmh: Convert to parent data scheme
  dt-bindings: clock: Document SM8150 rpmh-clock compatible
  clk: qcom: clk-rpmh: Add support for SM8150

 .../bindings/clock/qcom,rpmh-clk.txt          |  7 +++-
 drivers/clk/qcom/clk-rpmh.c                   | 38 ++++++++++++++++++-
 2 files changed, 42 insertions(+), 3 deletions(-)

-- 
2.20.1

