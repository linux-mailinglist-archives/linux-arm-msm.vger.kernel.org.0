Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54AA3B4C95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2019 13:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbfIQLLX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Sep 2019 07:11:23 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:41522 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726679AbfIQLLX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Sep 2019 07:11:23 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 86D5660271; Tue, 17 Sep 2019 11:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568718682;
        bh=nEzcsL6eAc7VaYq5G2E9rkf6lW2L34cgXGdePbCE+dQ=;
        h=From:To:Cc:Subject:Date:From;
        b=Ac0DRHydht8vpZieMDU7QnBFlswTWS5chks3gG+CjMv/BQGaosVDLNedu5zugPCxR
         CWPaXvABKEgbfEqOALotcustigGwj/9mxLHaDESbuLeaGqDZ644uqQDYs7onGg6+d3
         Qa9NL59zrkEgORxQYxrLpP61IM8o7/EI8ToLNCRo=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CF9BC60271;
        Tue, 17 Sep 2019 11:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568718682;
        bh=nEzcsL6eAc7VaYq5G2E9rkf6lW2L34cgXGdePbCE+dQ=;
        h=From:To:Cc:Subject:Date:From;
        b=Ac0DRHydht8vpZieMDU7QnBFlswTWS5chks3gG+CjMv/BQGaosVDLNedu5zugPCxR
         CWPaXvABKEgbfEqOALotcustigGwj/9mxLHaDESbuLeaGqDZ644uqQDYs7onGg6+d3
         Qa9NL59zrkEgORxQYxrLpP61IM8o7/EI8ToLNCRo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CF9BC60271
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=cchiluve@codeaurora.org
From:   Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
To:     balbi@kernel.org, agross@kernel.org, david.brown@linaro.org
Cc:     linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: [PATCH V3 0/3] ADD interconnect support for Qualcomm DWC3 driver
Date:   Tue, 17 Sep 2019 16:40:46 +0530
Message-Id: <1568718649-20124-1-git-send-email-cchiluve@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This path series aims to add interconnect support in
dwc3-qcom driver on SDM845 SoCs.

Changes from v2 -> v3
  > Fixed review comments from Matthias and Manu
  > changed the functions prefix from usb_* to dwc3_qcom_* 

Changes since V1:
  > Comments by Georgi Djakov on "[PATCH 2/3]" addressed
  > [PATCH 1/3] and [PATCH 3/3] remains unchanged

Chandana Kishori Chiluveru (3):
  dt-bindings: Introduce interconnect properties for Qualcomm DWC3
    driver
  usb: dwc3: qcom: Add interconnect support in dwc3 driver
  arm64: dts: sdm845: Add interconnect properties for USB

 .../devicetree/bindings/usb/qcom,dwc3.txt          |  13 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  12 ++
 drivers/usb/dwc3/dwc3-qcom.c                       | 145 ++++++++++++++++++++-
 3 files changed, 168 insertions(+), 2 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

