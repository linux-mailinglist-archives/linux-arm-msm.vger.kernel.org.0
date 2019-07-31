Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24B6E7CBF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2019 20:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729339AbfGaS1Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Jul 2019 14:27:24 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45116 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728214AbfGaS1Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Jul 2019 14:27:24 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 39152602F3; Wed, 31 Jul 2019 18:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564597643;
        bh=VLcNGDYl+Y+JUsCo4hRNvN4Xh78l/JOQjd9Q+s4n1fw=;
        h=From:To:Cc:Subject:Date:From;
        b=Ti6cPWNmRzjSucl1+bvF4xospnSlUq6JYZejt5wVW/hLVrh1VRt778Lpysgf0Krj0
         r4faGGCM18d8ktGJxAZxJG528H+n9rwdV4F1wpiDK6f/s+q516PxHgfOU6Sy2lS9ao
         0n8nsGXokZ5V9Btvit2SwCabDE8cv0h5HdRSsKbY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A4992602BA;
        Wed, 31 Jul 2019 18:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564597642;
        bh=VLcNGDYl+Y+JUsCo4hRNvN4Xh78l/JOQjd9Q+s4n1fw=;
        h=From:To:Cc:Subject:Date:From;
        b=Z/t9hm8nrFn6K6OZZkLEq2CcLoDYZM+1Hoyfz5DVrw6mcUXwabEyUgCxIw1FLorUu
         lrX8vrWFfp80xmqeXHNc4NPOJd/bhxqSA4AHF0MiawcRqCvNEfUe+f97IN7GB06AoN
         SLXZc/w59XDT1/5qZCFTSkzLmQ+JErx0HpMh3i78=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A4992602BA
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v3 0/2] Add support for display port clocks and clock ops
Date:   Wed, 31 Jul 2019 23:57:11 +0530
Message-Id: <20190731182713.8123-1-tdas@codeaurora.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

 [v3]
   * Update KCONFIG select in alphabetical order.
   * Remove pr_err in set rate.
   * Fix/update code indentation and logic.
   * removal of CLK_GET_RATE_NOCACHE completely from RCGs.

 [v2]
   * Update KCONFIG to select RATIONAL
   * Clean up redundant code from dp_set_rate/dp_set_rate_and_parent
   * Update the disp_cc_mdss_dp_link_clk_src to use the byte2_ops instead
     of defining the frequencies in KHz.
   * Clean up CLK_GET_RATE_NOCACHE from various RCGs of DP.

 [v1]
   * New display port clock ops supported for display port clocks.
   * Also add support for the display port related branches and RCGs.


Taniya Das (2):
  clk: qcom: rcg2: Add support for display port clock ops
  clk: qcom : dispcc: Add support for display port clocks

 drivers/clk/qcom/Kconfig                      |   1 +
 drivers/clk/qcom/clk-rcg.h                    |   1 +
 drivers/clk/qcom/clk-rcg2.c                   |  77 +++++++
 drivers/clk/qcom/dispcc-sdm845.c              | 214 +++++++++++++++++-
 .../dt-bindings/clock/qcom,dispcc-sdm845.h    |  13 +-
 5 files changed, 304 insertions(+), 2 deletions(-)

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

