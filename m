Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE2A817FBE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2019 20:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727893AbfEHSZL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 May 2019 14:25:11 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:54172 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbfEHSZK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 May 2019 14:25:10 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 1857A60132; Wed,  8 May 2019 18:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557339910;
        bh=mn5g6iGvI2jmQwQ92iHJz0YqAINmEWshw7aWFCQfT8w=;
        h=From:To:Cc:Subject:Date:From;
        b=RIdf54AQ1bGrooB1DtKFLhtCG7SO0ZHb3S1CBOLJ4xUOnPQl6/wmNgr7R/9/OWgDx
         163ILqkJRgVwrYByux0Wxm1kaMhYggcEM14wZQFX/R00Bw8EA2dH4T7QWxj8DCoOk2
         lliYvEIQCcvHHFaFJ1lvuSwaulWmku3lFc//fddo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EFA7060300;
        Wed,  8 May 2019 18:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557339909;
        bh=mn5g6iGvI2jmQwQ92iHJz0YqAINmEWshw7aWFCQfT8w=;
        h=From:To:Cc:Subject:Date:From;
        b=cUkf6ob1eVuJfc9srVi59Ws6hszxrQGe8uxQIxlAFVEBEX81xI5fwgdzMj5HmAPbw
         zbfCA5S3lo8HcmhgdhtHRIrl+lawI8jA+EU6zIr5gJBq80XH4QxIKTFchJzZBksg0K
         bJG6HSXcpYLsYA3RdaSPpGOuJ3QqeA2YHJ/FDJXM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EFA7060300
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 0/3] clk: qcom: Misc updates for Root Clock Generators
Date:   Wed,  8 May 2019 23:54:52 +0530
Message-Id: <1557339895-21952-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds support for the below

1) There could be failure while updating the RCG and not returning the
   failure could cause the consumer to assume the clock update is a
   success and not handling the failure gracefully.
2) There are few clocks in certain clock controllers which might require
   the hardware control mode to be enabled explicitly.
3) Update the DFS macro as per the hardware plans.

Taniya Das (3):
  clk: qcom: rcg: Return failure for RCG update
  clk: qcom: rcg2: Add support for hardware control mode
  clk: qcom: rcg: update the DFS macro for RCG

 drivers/clk/qcom/clk-rcg.h    |  5 ++-
 drivers/clk/qcom/clk-rcg2.c   |  5 ++-
 drivers/clk/qcom/gcc-sdm845.c | 96 +++++++++++++++++++++----------------------
 3 files changed, 56 insertions(+), 50 deletions(-)

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

