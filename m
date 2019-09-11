Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33290AF52D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2019 06:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbfIKEyw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Sep 2019 00:54:52 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:41252 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726058AbfIKEyw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Sep 2019 00:54:52 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 46AA16087F; Wed, 11 Sep 2019 04:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568177691;
        bh=TeklqQVsSK0gQfeaHS3Ua9S9/fzB/3ZkkjDfN+wUtrs=;
        h=From:To:Cc:Subject:Date:From;
        b=XRL4dlhMhytAtpzoHuprwmK4hXTQCFE7N10Fc5QEOA5sY43aeK0fIpGbGd6/yxL85
         l6XxeFM2giE/i0dCf8MDBTGmFJqtIK7WclE3C1wFX/dx6QTyhqRrtZn+DLN8Gst5d0
         Y5gbj26Cq1Yoa8vI89YGEe+RO2r4Ew1U41K9dYno=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from cchiluve-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: cchiluve@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 66DE16087F;
        Wed, 11 Sep 2019 04:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568177690;
        bh=TeklqQVsSK0gQfeaHS3Ua9S9/fzB/3ZkkjDfN+wUtrs=;
        h=From:To:Cc:Subject:Date:From;
        b=jOMtEjifBq+wjyYs1rFLEeDSG9tudx70q1ucNWwBbdu1VjyTR+QxywOcYF2h/ieEi
         aMCZD2EkawfKshtLHGFXh9ltLA7Afbd+7we3ncLpauJQsgLM5njk/rdo4Y8m5VRgjc
         PHeOpiwQEqnpn3RoLwA/FXyMe7jrmDuQ539/dqv8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 66DE16087F
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=cchiluve@codeaurora.org
From:   Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
To:     balbi@kernel.org, agross@kernel.org, david.brown@linaro.org
Cc:     linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: [PATCH 0/3] ADD interconnect support for USB
Date:   Wed, 11 Sep 2019 10:24:32 +0530
Message-Id: <1568177675-18764-1-git-send-email-cchiluve@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This path series aims to add interconnect support in
dwc3-qcom driver on SDM845 SoCs.

Chandana Kishori Chiluveru (3):
  dt-bindings: Introduce interconnect bindings for usb
  usb: dwc3: qcom: Add interconnect support in dwc3 driver
  arm64: dts: sdm845: Add interconnect properties for USB

 .../devicetree/bindings/usb/qcom,dwc3.txt          |  13 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  12 ++
 drivers/usb/dwc3/dwc3-qcom.c                       | 147 ++++++++++++++++++++-
 3 files changed, 170 insertions(+), 2 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

