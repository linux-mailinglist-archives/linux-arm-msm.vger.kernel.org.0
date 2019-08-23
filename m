Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84D039B084
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2019 15:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392211AbfHWNOL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Aug 2019 09:14:11 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:51656 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731783AbfHWNOK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Aug 2019 09:14:10 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 61BF260A0A; Fri, 23 Aug 2019 13:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566566049;
        bh=p8ts/tdHOVVsWlMZsq07wfIHNIAqrQNOvJLXUtO7l4s=;
        h=From:To:Cc:Subject:Date:From;
        b=krp67C8KMtKf0Ia7lWQz/seR3C0UJ/ROJoWf6jmY2X3h1OZTAkGHtpv0K/kf+8d4F
         +zuWHiXB2jSG58ESU91vhhzxCR4NLPDzDE7lE8Wxy22FBMnFeWX5j3EeBX18Ioy/8r
         64pDmaC8riZDRVgCKDpQCdJNmrgakkURYRDu6Ctk=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BB84860271;
        Fri, 23 Aug 2019 13:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566566048;
        bh=p8ts/tdHOVVsWlMZsq07wfIHNIAqrQNOvJLXUtO7l4s=;
        h=From:To:Cc:Subject:Date:From;
        b=bUHHX2Y+sE1Ah/gOopfwu+Sefp9Lz0+GnHb5Y7z1pXqL+EgIALZanDOlI3bdCN5LY
         1UNzEREecqo0r7EA7CJM5R53qejcoLclVfjCiARoy4OE/5BiVFhLXpkOstVooz923M
         HV0apK5rCjM0bl1e2TyfrdZ63TZm237KnCt0IEFI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BB84860271
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=govinds@codeaurora.org
From:   Govind Singh <govinds@codeaurora.org>
To:     sboyd@kernel.org, robh@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
Subject: [PATCH_v3 0/2] Add Q6SSTOP clock controller for QCS404
Date:   Fri, 23 Aug 2019 18:43:59 +0530
Message-Id: <20190823131401.4011-1-govinds@codeaurora.org>
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

Changes in v3:
    - Fixed dt binding errors.

Changes in v2:
    - changed binding doc to yaml format.
    - Fixed alignment in q6sstop cc driver.

Govind Singh (2):
  dt-bindings: clock: qcom: Add QCOM Q6SSTOP clock controller bindings
  clk: qcom: Add Q6SSTOP clock controller for QCS404

 .../bindings/clock/qcom,q6sstopcc.yaml        |  47 ++++
 drivers/clk/qcom/Kconfig                      |   8 +
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/q6sstop-qcs404.c             | 223 ++++++++++++++++++
 .../dt-bindings/clock/qcom,q6sstopcc-qcs404.h |  18 ++
 5 files changed, 297 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
 create mode 100644 drivers/clk/qcom/q6sstop-qcs404.c
 create mode 100644 include/dt-bindings/clock/qcom,q6sstopcc-qcs404.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

