Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1FA233E600
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 02:28:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbhCQB1r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Mar 2021 21:27:47 -0400
Received: from m42-10.mailgun.net ([69.72.42.10]:51866 "EHLO
        m42-10.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbhCQB1n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Mar 2021 21:27:43 -0400
X-Greylist: delayed 302 seconds by postgrey-1.27 at vger.kernel.org; Tue, 16 Mar 2021 21:27:43 EDT
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615944462; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=prRJqyplMooPFtSjbrDtYPwI/727BjBuJlZh58u9B08=; b=YJ4JgIwyxBnnnY8txYpQvdOwHZ2KFoln0IjamdERH6BsKIH5DqgoaB2daIk9CpLGQJDKpXCT
 yezYZebX6q269JBPF9mVp02nW2FN34S7eNJZpi68+cPp0M/hoSR5VN8/MKtA1Eruzr+Dj7ss
 6uDIDv3pBo1Mt/k8Es4zY97jBwI=
X-Mailgun-Sending-Ip: 69.72.42.10
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 605159db4db3bb6801177d4e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Mar 2021 01:22:35
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 09110C433CA; Wed, 17 Mar 2021 01:22:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 78E66C433C6;
        Wed, 17 Mar 2021 01:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 78E66C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 0/6] Add support for DISP/VIDEO/GPU CCs for SC7280
Date:   Wed, 17 Mar 2021 06:52:16 +0530
Message-Id: <1615944142-12171-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for display, video & graphics clock controllers on SC7280
along with the bindings for each of the clock controllers.

Taniya Das (6):
  dt-bindings: clock: Add SC7280 DISPCC clock binding
  clk: qcom: Add display clock controller driver for SC7280
  dt-bindings: clock: Add SC7280 GPUCC clock binding
  clk: qcom: Add graphics clock controller driver for SC7280
  dt-bindings: clock: Add SC7280 VideoCC clock binding
  clk: qcom: Add video clock controller driver for SC7280

 .../devicetree/bindings/clock/qcom,gpucc.yaml      |   4 +-
 .../bindings/clock/qcom,sc7280-dispcc.yaml         |  94 +++
 .../devicetree/bindings/clock/qcom,videocc.yaml    |   4 +-
 drivers/clk/qcom/Kconfig                           |  25 +
 drivers/clk/qcom/Makefile                          |   3 +
 drivers/clk/qcom/dispcc-sc7280.c                   | 908 +++++++++++++++++++++
 drivers/clk/qcom/gpucc-sc7280.c                    | 491 +++++++++++
 drivers/clk/qcom/videocc-sc7280.c                  | 372 +++++++++
 include/dt-bindings/clock/qcom,dispcc-sc7280.h     |  55 ++
 include/dt-bindings/clock/qcom,gpucc-sc7280.h      |  35 +
 include/dt-bindings/clock/qcom,videocc-sc7280.h    |  27 +
 11 files changed, 2016 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7280-dispcc.yaml
 create mode 100644 drivers/clk/qcom/dispcc-sc7280.c
 create mode 100644 drivers/clk/qcom/gpucc-sc7280.c
 create mode 100644 drivers/clk/qcom/videocc-sc7280.c
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-sc7280.h
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sc7280.h
 create mode 100644 include/dt-bindings/clock/qcom,videocc-sc7280.h

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

