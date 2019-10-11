Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD81FD412D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2019 15:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728470AbfJKN3q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Oct 2019 09:29:46 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39826 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728084AbfJKN3q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Oct 2019 09:29:46 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 0C7CC60CEC; Fri, 11 Oct 2019 13:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570800585;
        bh=EiKwHSUKsiWiPgzLbx9dlHgg4p/n/0K08eF4zyOdz3Q=;
        h=From:To:Cc:Subject:Date:From;
        b=On8aAXdMUAmGLZN9xDkKDWMVurA8De4UyAnP88mQCUhJrwg/s3dRzXWpo3PtOHgDj
         rVY8jWpnDCha6xiYZC614Mwikegk5sO8C0p5yWJTbsyR3Vx4NLjgPdx9GWtwA+8ozu
         Ryh6749jW3cmExUdLA3Xm/cowhQIdXIBsN6Xf7bg=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1EF1F60CEC;
        Fri, 11 Oct 2019 13:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570800584;
        bh=EiKwHSUKsiWiPgzLbx9dlHgg4p/n/0K08eF4zyOdz3Q=;
        h=From:To:Cc:Subject:Date:From;
        b=cqyi5D2vOYDfBeI8RdS7x/Xuw02YQqL8uq6QceJO48/rVPB2ZNsACm8Ba0FMMPdZG
         KSSJulDzoNVz4mqYC3W4lhxdw19yglJ/6KFzCPI6erRCKFm93lb3J0uCktqoaNO9v7
         GKLR0unUkZ2v1Avtd3whOcnxrAOFDt3KXI5z6rss=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1EF1F60CEC
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=govinds@codeaurora.org
From:   Govind Singh <govinds@codeaurora.org>
To:     robh@kernel.org, sboyd@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v4 0/2] Add Q6SSTOP clock controller for QCS404
Date:   Fri, 11 Oct 2019 18:59:26 +0530
Message-Id: <20191011132928.9388-1-govinds@codeaurora.org>
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

Changes in v4:
    - changed binding doc license to (GPL-2.0-only OR BSD-2-Clause).

Changes in v3:
    - Fixed dt binding errors.

Changes in v2:
    - changed binding doc to yaml format.
    - Fixed alignment in q6sstop cc driver.

Govind Singh (2):
  dt-bindings: clock: qcom: Add QCOM Q6SSTOP clock controller bindings
  clk: qcom: Add Q6SSTOP clock controller for QCS404

 .../bindings/clock/qcom,q6sstopcc.yaml        |  43 ++++
 drivers/clk/qcom/Kconfig                      |   8 +
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/q6sstop-qcs404.c             | 223 ++++++++++++++++++
 .../dt-bindings/clock/qcom,q6sstopcc-qcs404.h |  18 ++
 5 files changed, 293 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
 create mode 100644 drivers/clk/qcom/q6sstop-qcs404.c
 create mode 100644 include/dt-bindings/clock/qcom,q6sstopcc-qcs404.h

-- 
2.22.0

