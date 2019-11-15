Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81335FDA2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 10:59:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbfKOJ7D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 04:59:03 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:58526 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbfKOJ7D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 04:59:03 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6D460616EB; Fri, 15 Nov 2019 09:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573811942;
        bh=VaQ+M/cW4KikmTdqZ7Lp5Io5EF9nqMDanu2nvq5JxhM=;
        h=From:To:Cc:Subject:Date:From;
        b=g2gaq2P82b4gIi6mliua6QlChEX7dMy5fME76mq0xu6ToMB/W59X1aHePZZEYlEv5
         idnG0dmYTzYq1tPsiIz3Aea23g3hxSSwUOwVEi0GwZ314WhFDAAQnZfF2CNloV/QOQ
         RPaoqjpxfoXYxFuZPfsT38jbkek5vUFiEWOwM2kE=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9F7B5616EA;
        Fri, 15 Nov 2019 09:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573811940;
        bh=VaQ+M/cW4KikmTdqZ7Lp5Io5EF9nqMDanu2nvq5JxhM=;
        h=From:To:Cc:Subject:Date:From;
        b=WIPCvUPp2t4fGbguINUUMtwJAHdmqOz1NnpBQVNZRIvpkIFhreqaherAvbUnf/5mp
         UTeUesxHy2yd+bfceUDdfga0QaXJyLpLDDKUfeM1OVy8F6sdsQJk91gkaqshHMSTn4
         NwUVamJu5BsL8Lafou2E+tOX9tcf3fCrOGQXdfI0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9F7B5616EA
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
Subject: [PATCH v1 0/3] Add display clock controller driver for SC7180
Date:   Fri, 15 Nov 2019 15:28:46 +0530
Message-Id: <1573811929-21695-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the display clock controller found on SC7180
based devices. This would allow display drivers to probe and
control their clocks.

This driver depends on the display port clock ops support
https://patchwork.kernel.org/patch/11069087/

Taniya Das (3):
  dt-bindings: clock: Add YAML schemas for the QCOM DISPCC clock
    bindings
  dt-bindings: clock: Introduce QCOM Display clock bindings
  clk: qcom: Add display clock controller driver for SC7180

 .../devicetree/bindings/clock/qcom,dispcc.txt      |  19 -
 .../devicetree/bindings/clock/qcom,dispcc.yaml     |  67 ++
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/dispcc-sc7180.c                   | 776 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,dispcc-sc7180.h     |  46 ++
 6 files changed, 899 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc.yaml
 create mode 100644 drivers/clk/qcom/dispcc-sc7180.c
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-sc7180.h

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

