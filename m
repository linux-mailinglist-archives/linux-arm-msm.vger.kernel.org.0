Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81C92E8E97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 18:48:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbfJ2Rsc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 13:48:32 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58462 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbfJ2Rsb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 13:48:31 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 19A3A60E20; Tue, 29 Oct 2019 17:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572371311;
        bh=O1zkui5yJKuNG0ziv1PZdCM5bIolIL/i4n+wVBNcTf8=;
        h=From:To:Cc:Subject:Date:From;
        b=Pss4uR2XOAHi+P6+iIsbJtklIy7LEdUwnUmMasEZgrreYsfVACoMYlhHuoaANeljS
         MGSIQwdPld8yx3uo91+EgG8gWkzzsKMQs1TJ90ynJtCGROIRQM8agdJIPd9sIUaTD6
         7zjM7iR/au4gY7RID+wk/eoNNPi6/P33fwTjTxYM=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1EDDB60D6F;
        Tue, 29 Oct 2019 17:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572371310;
        bh=O1zkui5yJKuNG0ziv1PZdCM5bIolIL/i4n+wVBNcTf8=;
        h=From:To:Cc:Subject:Date:From;
        b=fzhTJJ3BfFJIqC90U723NKKkxr+T8PTAvCjzUYcm/4yFeor7SPdhKDuBpEN6VKkz4
         b4XnpFFrK2i+VNA1YCsIKmnGsjyNdns0ktlZOBuMQTsjn9llSWi2ZfBMdqDehO6/E1
         YTNtXU/fFRqPjB85CfA8zpFw/b0q0TXKHhuH3yFg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1EDDB60D6F
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 0/3] Add support for RPMHCC for SC7180
Date:   Tue, 29 Oct 2019 23:18:16 +0530
Message-Id: <1572371299-16774-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[v2]
 * Fix indentation issues in YAML Documentation.

[v1]
 * Update the Documentation binding of RPMHCC to YAML schemas.
 * Add RPMH clocks required to be supported on SC7180.

Taniya Das (3):
  dt-bindings: clock: Add YAML schemas for the QCOM RPMHCC clock
    bindings
  dt-bindings: clock: Introduce RPMHCC bindings for SC7180
  clk: qcom: clk-rpmh: Add support for RPMHCC for SC7180

 .../devicetree/bindings/clock/qcom,rpmh-clk.txt    | 27 ------------
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     | 49 ++++++++++++++++++++++
 drivers/clk/qcom/clk-rpmh.c                        | 19 +++++++++
 3 files changed, 68 insertions(+), 27 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

