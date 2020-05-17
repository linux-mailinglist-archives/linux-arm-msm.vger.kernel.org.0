Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4043C1D6746
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2020 12:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727829AbgEQKFA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 May 2020 06:05:00 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:18555 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728003AbgEQKFA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 May 2020 06:05:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589709899; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=DwEoFol7vKfuWdob39DCEFtcFGJO1XzHftZVmDSnXos=; b=wlbMuHUptxaRDpDFagzZw1V+HBqdEhhRfFB2O4QNOUjmqyGDXEa8FD3YNJO+kU00+X8v4E/p
 36t4Wi+WS9Ynb+uvENr3qHL/wPv7rqVZfpz1SOqVj5MOkv6DEvqd5d9Sfck40Pp/C332YNWs
 kTb4G2tXZA8pArgLsqZPNITjx18=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec10c31.7fea7e353570-smtp-out-n01;
 Sun, 17 May 2020 10:04:33 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E70E0C44788; Sun, 17 May 2020 10:04:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D6C70C433F2;
        Sun, 17 May 2020 10:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D6C70C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 0/3] Add Misc GCC clock driver support for SC7180
Date:   Sun, 17 May 2020 15:34:18 +0530
Message-Id: <1589709861-27580-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

 [v2]
  * Update to use ARRAY_SIZE instead of hard-coded values for num_parents.
    Also add the fixes tag.

 [v1]
  * Add a new frequency of 51.2MHz for QUP clock.
  * Add support for gcc_sec_ctrl_clk_src RCG for client to be able to request
   various frequencies.

Taniya Das (3):
  clk: qcom: gcc: Add support for a new frequency for SC7180
  dt-bindings: clock: Add gcc_sec_ctrl_clk_src clock ID
  clk: qcom: gcc: Add support for Secure control source clock

 drivers/clk/qcom/gcc-sc7180.c               | 94 ++++++++++++++++++-----------
 include/dt-bindings/clock/qcom,gcc-sc7180.h |  1 +
 2 files changed, 59 insertions(+), 36 deletions(-)

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
