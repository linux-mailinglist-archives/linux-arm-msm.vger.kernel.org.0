Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB208B99D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2019 15:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728936AbfHMNKA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Aug 2019 09:10:00 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:43780 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728656AbfHMNKA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Aug 2019 09:10:00 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 763F260735; Tue, 13 Aug 2019 13:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565701798;
        bh=mPbUj3mPtBw6yrfnFjd57S426CyxYQNJUAv5tkVT2Vg=;
        h=From:To:Cc:Subject:Date:From;
        b=WdmUK8Uk/0egRI62210qTAA9lSSfmhxsq8srHgzf3Pj7/80GyapvFZCYEA5KS0Ycz
         PLBGWWkxPLJG6H2m3C9wOCVIfrGgxKBnZSw459aBndGcNUxdIpAPVkQOrt8gpW/FWT
         eeAIlYjLUlaB5L2wy7TXcxMq4bIClyJT0ZsuEjpo=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 342D760ACA;
        Tue, 13 Aug 2019 13:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565701797;
        bh=mPbUj3mPtBw6yrfnFjd57S426CyxYQNJUAv5tkVT2Vg=;
        h=From:To:Cc:Subject:Date:From;
        b=TMFE3oweB6V9Y9H4JdyT543YeyYQMTf2EH0ghIWZuf1a+Nj6rCZLA2b9D+Mc+oM+Y
         a1KnNblB3JimVui+0uJbw/+Ri5uhO6S8H8y2KZ7mBvpbwPrW7nJJLPwJd095Dzm7Cn
         j3uxKOBAWTln3k5yhl+1oWOydbkFDQCrZJXC/MfI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 342D760ACA
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=govinds@codeaurora.org
From:   Govind Singh <govinds@codeaurora.org>
To:     sboyd@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-soc@vger.kernel.org, andy.gross@linaro.org,
        linux-remoteproc@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
Subject: [v2 0/2] Add Q6SSTOP clock controller for QCS404
Date:   Tue, 13 Aug 2019 18:39:44 +0530
Message-Id: <20190813130946.16448-1-govinds@codeaurora.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the Q6SSTOP clock control used on qcs404
based devices. This would allow wcss remoteproc driver to
control the required WCSS Q6SSTOP clock/reset controls to
bring the subsystem out of reset and shutdown the WCSS Q6DSP.

Govind Singh (2):
  dt-bindings: clock: qcom: Add QCOM Q6SSTOP clock controller bindings
  clk: qcom: Add Q6SSTOP clock controller for QCS404

 .../bindings/clock/qcom,q6sstopcc.yaml        |  45 ++++
 drivers/clk/qcom/Kconfig                      |   8 +
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/q6sstop-qcs404.c             | 223 ++++++++++++++++++
 .../dt-bindings/clock/qcom,q6sstopcc-qcs404.h |  18 ++
 5 files changed, 295 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
 create mode 100644 drivers/clk/qcom/q6sstop-qcs404.c
 create mode 100644 include/dt-bindings/clock/qcom,q6sstopcc-qcs404.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

