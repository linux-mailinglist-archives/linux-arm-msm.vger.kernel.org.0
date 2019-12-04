Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBE8E112492
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2019 09:21:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbfLDIVr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Dec 2019 03:21:47 -0500
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56]:52962
        "EHLO a27-56.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726166AbfLDIVr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Dec 2019 03:21:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575447706;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=gZXkqSU/a39Efrt2FbC+7Z4ewg5zJcA9TZ31Pu4BsP4=;
        b=LgOMDRmhi/mlsEUaHcCZkzExiFb++eHZLy/X14LVUIvKWVkMCwhi8Tf24b+VyuVF
        EGn0VS40pJYorExhcc0vqaJ0HHLNtxS6Es6fYsleOJJ+zZrmQNXOSpd6VqaMJNYkbcE
        I8hf6c2UAUIqooWyXEfCzxAjZNL4t5otsDoSW/Z4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575447706;
        h=From:To:Cc:Subject:Date:Message-Id:Feedback-ID;
        bh=gZXkqSU/a39Efrt2FbC+7Z4ewg5zJcA9TZ31Pu4BsP4=;
        b=NfP1Of3rnNRqBwZ/q9J0wwH5yv59Gs9/Y+AYUvKclhdSQTPt1i6HnbCR0+moLY4h
        yWaO2N3ikueNuHQpA/Ztf6oAp7hCjqhqEIC+gR6jH1OSjkPHMYeBWijbKPGryYp/7q8
        lQXQAZiUjT6imfVLn4svsMkmJCqr+90z2YLatVOs=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 636C6C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>,
        robh+dt@kernel.org
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 0/3] Add modem Clock controller (MSS CC) driver for SC7180
Date:   Wed, 4 Dec 2019 08:21:46 +0000
Message-ID: <0101016ed0003c0a-c3f2e19a-eb6f-42f6-b66f-4cabb055e828-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
X-SES-Outgoing: 2019.12.04-54.240.27.56
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add driver support for Modem clock controller for SC7180 and also
update device tree bindings for the various clocks supported in the
clock controller.


Taniya Das (3):
  dt-bindings: clock: Add YAML schemas for the QCOM MSS clock bindings
  dt-bindings: clock: Introduce QCOM Modem clock  bindings
  clk: qcom: Add modem clock controller driver for  SC7180

 .../devicetree/bindings/clock/qcom,mss.yaml        | 40 ++++++++++
 drivers/clk/qcom/Kconfig                           |  9 +++
 drivers/clk/qcom/Makefile                          |  1 +
 drivers/clk/qcom/gcc-sc7180.c                      | 70 ++++++++++++++++
 drivers/clk/qcom/mss-sc7180.c                      | 93 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sc7180.h        |  5 ++
 include/dt-bindings/clock/qcom,mss-sc7180.h        | 12 +++
 7 files changed, 230 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,mss.yaml
 create mode 100644 drivers/clk/qcom/mss-sc7180.c
 create mode 100644 include/dt-bindings/clock/qcom,mss-sc7180.h

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

