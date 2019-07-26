Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E38D4761CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2019 11:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbfGZJXl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jul 2019 05:23:41 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:57732 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbfGZJXl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jul 2019 05:23:41 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id AA39B60ACA; Fri, 26 Jul 2019 09:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564133019;
        bh=q/P8XBCE/VMBesWTeQ09sbF5NyjaaLCNmistF0ToxCw=;
        h=From:To:Cc:Subject:Date:From;
        b=PrakyVUJEdQCCRMaJeLqvfPHz6a0mEn3o7YyqOJsA9Ne1AKq41SlW9vGvd3W7jxYQ
         AB3bZaOaOUPtFLvATFfG1IK/jUW2d0Y9FWwo/rWPSAqAC5Z+FTVpX71MYRIXl5x+iA
         ztakjTaqVPDtae3C22w/DFEHaTzQ1tX1JJsRO2Qk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from govinds-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: govinds@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5FF2D607DE;
        Fri, 26 Jul 2019 09:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564133019;
        bh=q/P8XBCE/VMBesWTeQ09sbF5NyjaaLCNmistF0ToxCw=;
        h=From:To:Cc:Subject:Date:From;
        b=PrakyVUJEdQCCRMaJeLqvfPHz6a0mEn3o7YyqOJsA9Ne1AKq41SlW9vGvd3W7jxYQ
         AB3bZaOaOUPtFLvATFfG1IK/jUW2d0Y9FWwo/rWPSAqAC5Z+FTVpX71MYRIXl5x+iA
         ztakjTaqVPDtae3C22w/DFEHaTzQ1tX1JJsRO2Qk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5FF2D607DE
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=govinds@codeaurora.org
From:   Govind Singh <govinds@codeaurora.org>
To:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     andy.gross@linaro.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v5 0/7] Add non PAS wcss Q6 support for QCS404
Date:   Fri, 26 Jul 2019 14:53:25 +0530
Message-Id: <20190726092332.25202-1-govinds@codeaurora.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add non PAS(Peripheral Authentication System) WCSS remoteproc
driver support and wcss clock/reset controls for QCS404 SOC.
Add WCSS q6 bootup and shutdown sequence handled from
Application Processor SubSystem(APSS).


Changes since v4:
 removed QDSP6SS clock controls and moved to wcss rproc.
 renamed wcsccc to q6sstopcc.
 cleanup/refactoring.

Changes since v3:
 dt binding cleanup.
 Fixed remoteproc recovery.
 Added remoteproc dump support.
 wcsscc cleanup/refactoring.

Changes since v2:
 Removed unused properties.
 Refactored code to have common logic b/w ipq8074 and QCS404, wherever possible.
 Added compatible example.
 Removed wcss-protected bool.

Changes since v1:
  Corrected clock names as per comments in v1 patch.

Govind Singh (7):
  clk: qcom: Add WCSS gcc clock control for QCS404
  dt-bindings: clock: qcom: Add QCOM Q6SSTOP clock controller bindings
  clk: qcom: define probe by index API as common API
  clk: qcom: Add Q6SSTOP clock controller for QCS404
  remoteproc: qcom: wcss: populate hardcoded param using driver data
  remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404
  remoteproc: qcom: wcss: explicitly request exclusive reset control

 .../bindings/clock/qcom,q6sstopcc.txt         |  26 +
 drivers/clk/qcom/Kconfig                      |   8 +
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/common.c                     |  20 +
 drivers/clk/qcom/common.h                     |   2 +
 drivers/clk/qcom/gcc-qcs404.c                 |  30 +
 drivers/clk/qcom/lpasscc-sdm845.c             |  23 +-
 drivers/clk/qcom/q6sstop-qcs404.c             | 223 +++++++
 drivers/remoteproc/qcom_q6v5_wcss.c           | 599 ++++++++++++++++--
 include/dt-bindings/clock/qcom,gcc-qcs404.h   |   3 +
 .../dt-bindings/clock/qcom,q6sstopcc-qcs404.h |  18 +
 11 files changed, 890 insertions(+), 63 deletions(-)
 create mode 100755 Documentation/devicetree/bindings/clock/qcom,q6sstopcc.txt
 create mode 100644 drivers/clk/qcom/q6sstop-qcs404.c
 create mode 100644 include/dt-bindings/clock/qcom,q6sstopcc-qcs404.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

