Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF5F999BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2019 19:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730719AbfHVRDD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Aug 2019 13:03:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:55358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729506AbfHVRDD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Aug 2019 13:03:03 -0400
Received: from localhost.localdomain (unknown [171.61.89.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A331520870;
        Thu, 22 Aug 2019 17:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566493382;
        bh=opZxMMPTTATXlpDMUC+cbKgkPiHxtoaB6iSP8Yk3r3s=;
        h=From:To:Cc:Subject:Date:From;
        b=DRDeRuxEl6eHiBDWoeF0Y/ZHtBH3xhWm3RYeCUOnfmh40eXiKBirGxtNlUSRV5Xe8
         HUWqcVzs3sTbybt+LbHIb/A060+OzWRZ0Ty1zzoOdzE0hfGIsBWayOx2hcwJiIP2Jj
         sGQnZdqm3qSB+L6NGncZ3DheEFpx9R+KIcUs11Vc=
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] clk: qcom: Add support for SM8150
Date:   Thu, 22 Aug 2019 22:31:36 +0530
Message-Id: <20190822170140.7615-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for rpm clock controller found in SM8150 and while at it update
the driver to support parent data clock scheme as suggested by Stephen.

Changes since v3:
 - Add reviewed-by from Bjorn
 - Update the parent name as xo_board
 - Fix style issue

Changes since v2:
 - Describe parent clocks for rpmhcc
 - Add support for parent data scheme for rpmhcc

Vinod Koul (4):
  dt-bindings: clock: Document the parent clocks
  clk: qcom: clk-rpmh: Convert to parent data scheme
  dt-bindings: clock: Document SM8150 rpmh-clock compatible
  clk: qcom: clk-rpmh: Add support for SM8150

 .../bindings/clock/qcom,rpmh-clk.txt          |  7 +++-
 drivers/clk/qcom/clk-rpmh.c                   | 37 ++++++++++++++++++-
 2 files changed, 41 insertions(+), 3 deletions(-)

-- 
2.20.1

