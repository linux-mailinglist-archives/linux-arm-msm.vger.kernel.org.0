Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA4F1B3C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2019 12:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728584AbfEMKUf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 May 2019 06:20:35 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55606 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727690AbfEMKUf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 May 2019 06:20:35 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 58D0260A05; Mon, 13 May 2019 10:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557742834;
        bh=xeung/fcJPz0PMtwZCGQUbZWLdgHpjUWzXB+uUPGwQA=;
        h=From:To:Cc:Subject:Date:From;
        b=Iuo+dLjIJHRxCqtLAjD3A8QovQyy2MJMGt/PbRD/wBOeKvn09kLS+bioQetlGMLCj
         eSSOa9WHteVe3mWzBVgqGK0hlo/YmUccF+aKpJKQKfuQSX5AtJgQcYTD9f/xEFPOdZ
         RYCXoVUELilHEPT3H0HCMA+zcCdhGk1ttGWDRLdA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B41AC6029B;
        Mon, 13 May 2019 10:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557742833;
        bh=xeung/fcJPz0PMtwZCGQUbZWLdgHpjUWzXB+uUPGwQA=;
        h=From:To:Cc:Subject:Date:From;
        b=HAxsASr2LGl/8iIH/2g5WXiW6WGR4EiLyOBivMAeuG1Ryoj+l2khdCktOuSdejEAl
         mMnSaVL2aS8CaSEv9iw4OMwEAzvKPN0QoUN0scitVP90NvV4mCHz+M53wPhujkdIX+
         tEUShI0DPiBT7AdZwhelQnzpKyEOSdNA0zmmd51Q=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B41AC6029B
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc:     david.brown@linaro.org, mark.rutland@arm.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        marc.w.gonzalez@free.fr, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 0/9] RPMPD for QCS404 and MSM8998
Date:   Mon, 13 May 2019 15:50:06 +0530
Message-Id: <20190513102015.26551-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Re-worked the macros of the rpmpd driver. Add power domains support
for QCS404 and MSM8998.

V4:
* fixup fixes tag and commit message in patch 1 [Marc]
* fixup typos in qcs404 and msm8998 dt nodes
* fixup comments regarding resource type in patch 8 [Marc]

V3:
* always send level updates to vfc and vfl in set_performance state
* fixup commit messages [Rajendra]
* fixup s-o-b ordering

V2:
* Add rpmpd support for msm8998
* fixup corner/vfc with vlfl/vfl

Bjorn Andersson (4):
  soc: qcom: rpmpd: Modify corner defining macros
  dt-bindings: power: Add rpm power domain bindings for qcs404
  soc: qcom: rpmpd: Add QCS404 power-domains
  arm64: dts: qcom: qcs404: Add rpmpd node

Sibi Sankar (5):
  soc: qcom: rpmpd: fixup rpmpd set performance state
  soc: qcom: rpmpd: Add support to set rpmpd state to max
  dt-bindings: power: Add rpm power domain bindings for msm8998
  soc: qcom: rpmpd: Add MSM8998 power-domains
  arm64: dts: qcom: msm8998: Add rpmpd node

 .../devicetree/bindings/power/qcom,rpmpd.txt  |   2 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |  51 +++++++
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  55 +++++++
 drivers/soc/qcom/rpmpd.c                      | 134 ++++++++++++++----
 include/dt-bindings/power/qcom-rpmpd.h        |  34 +++++
 5 files changed, 252 insertions(+), 24 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

