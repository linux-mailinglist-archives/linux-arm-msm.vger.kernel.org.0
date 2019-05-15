Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8213F1E767
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2019 06:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbfEOEUu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 May 2019 00:20:50 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:52496 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfEOEUu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 May 2019 00:20:50 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id BBA8660AA2; Wed, 15 May 2019 04:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557894049;
        bh=Pe6KwC43hdQm5VNSIb0eqCdl1lG0ut6H4wr9eCIdXsg=;
        h=From:To:Cc:Subject:Date:From;
        b=WkKGddlp7aotccZwhTODjcElP1VdFAMizp5wWsfGK2jly5WfQEguNUQ1KMeOt59tf
         6+POaYUzVeY/NNtU7PJHpLTLDG7bWLoRchnd2xsZhIqPjS4B4kVLBbZ3cJnYXNK0aB
         CkT0HJcstoIigt7dGiTxnF6213PFR8eQOvYRjEd4=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D03DA60128;
        Wed, 15 May 2019 04:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557894048;
        bh=Pe6KwC43hdQm5VNSIb0eqCdl1lG0ut6H4wr9eCIdXsg=;
        h=From:To:Cc:Subject:Date:From;
        b=LwTuYxPl51Y1anq8l4clrWWy1PG/gPhsQsR3JE4kYz6s3YAJAt9tkPONpYz3qyn5E
         J4LdM/49uO7ot2KZZLkeZqqwmHY/1AsiXohWCxVe++k9qu0wxiIK3kEgnCsZOLUtYv
         ZDJpwcU7Io3y1gaAekSmtuqIW8xDAOzA0ESBI2qs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D03DA60128
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 0/2] Add support for display port clocks and clock ops
Date:   Wed, 15 May 2019 09:50:37 +0530
Message-Id: <1557894039-31835-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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

 drivers/clk/qcom/Kconfig                       |   1 +
 drivers/clk/qcom/clk-rcg.h                     |   1 +
 drivers/clk/qcom/clk-rcg2.c                    |  81 +++++++++-
 drivers/clk/qcom/dispcc-sdm845.c               | 216 ++++++++++++++++++++++++-
 include/dt-bindings/clock/qcom,dispcc-sdm845.h |  13 +-
 5 files changed, 309 insertions(+), 3 deletions(-)

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

