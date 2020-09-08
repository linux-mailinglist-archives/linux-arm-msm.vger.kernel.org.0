Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E120261648
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 19:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731961AbgIHRH5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 13:07:57 -0400
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188]:60154
        "EHLO a27-188.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731353AbgIHRHr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 13:07:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599584866;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=JebWk3quLaFS4yWUZICsIfI+TcdkpkejSpl979elzLw=;
        b=Z7mlioD/ediT13BOhXMY9ka2rBqVbDzd8uKrO8+tRKya0WGtgijKy1fFe6v70CJS
        lv4BW/hMVBogGngdpvHSSMKlCg/Z56ytYQgXsgFFkz6SmxTyEvLzOfbfWQqz9GlEb7K
        rhDd7qN7k4gogpKlN0ENLu8vEZUmH4p4iM8i+oXs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599584866;
        h=From:To:Cc:Subject:Date:Message-Id:Feedback-ID;
        bh=JebWk3quLaFS4yWUZICsIfI+TcdkpkejSpl979elzLw=;
        b=Z9DY5MheA5SxsMwYVQmi12dIDE4Zbf7lDJwtiACvrcA6YNaqGHTAinP9nQr+GAVq
        PX97TD/s2EOdAAjpbuzDWqmVMw34gFI9iuuhTXQ87Flhw+Qev6GWLaVWEdwY+raaif4
        /uOangDVPE3Cbdwz6y35+hzeFZyhbLbiEMGqcils=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2EA5BC433F0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 0/3] Add Camera clock controller driver for SC7180
Date:   Tue, 8 Sep 2020 17:07:46 +0000
Message-ID: <010101746eb010a0-c71e2164-60d6-4b15-8860-6b40d85ffec3-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
X-SES-Outgoing: 2020.09.08-54.240.27.188
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[v1]
 * Add support for Agera PLL which is used in the camera clock controller.

 * Add driver support for camera clock controller for SC7180 and also
   update device tree bindings for the various clocks supported in the
   clock controller.

Taniya Das (3):
  clk: qcom: clk-alpha-pll: Add support for controlling Agera PLLs
  dt-bindings: clock: Add YAML schemas for the QCOM Camera clock
    bindings.
  clk: qcom: camcc: Add camera clock controller driver for SC7180

 .../bindings/clock/qcom,sc7180-camcc.yaml          |   73 +
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-sc7180.c                    | 1737 ++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c                   |   82 +
 drivers/clk/qcom/clk-alpha-pll.h                   |    4 +
 include/dt-bindings/clock/qcom,camcc-sc7180.h      |  121 ++
 7 files changed, 2027 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.yaml
 create mode 100644 drivers/clk/qcom/camcc-sc7180.c
 create mode 100644 include/dt-bindings/clock/qcom,camcc-sc7180.h

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

