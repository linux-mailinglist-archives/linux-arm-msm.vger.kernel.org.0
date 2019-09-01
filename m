Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B106EA4AEE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Sep 2019 19:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728830AbfIARoX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Sep 2019 13:44:23 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:42100 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728496AbfIARoX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Sep 2019 13:44:23 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4AE6D6083E; Sun,  1 Sep 2019 17:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567359862;
        bh=8h1JaaJsfGFa8wEtmNJJQvcbs5BX8hfIPAfG6zkOX/M=;
        h=From:To:Cc:Subject:Date:From;
        b=J2tVcHTQA67DjZIh7Pl0lpVkGmIbYwPXMqC22qMDjGUZt8yczLiJEBe4o8EJ+EHoE
         M4MTGUcravwMQvUlmqVNeHMhIOop/0bN0qP5U9NN5O/4P12xyTJLcU6dmnta8c629Z
         CjdDYAK5T1/mCUYD3e8M88wVFUg81EMQXvcY2hyA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 48FE860264;
        Sun,  1 Sep 2019 17:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567359861;
        bh=8h1JaaJsfGFa8wEtmNJJQvcbs5BX8hfIPAfG6zkOX/M=;
        h=From:To:Cc:Subject:Date:From;
        b=RQhpnOrtMjMpQMwrTdagJUjWm/7A6H0zrWlZxLGbUmbaPS62e8h1w6+gRPAdNMcmR
         wXQDF98v08sTuKfMCTMT+nfD6eoeo9dwTDJmsWC5P50u8ord4qOpaddtaRvKChXWSN
         ennCZTZbgy+qpbbddx4n4l5ipHGwWZddZfamzgQw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 48FE860264
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        bjorn.andersson@linaro.org
Cc:     agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sboyd@kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 0/2] Add PDC Global and AOSS reset support
Date:   Sun,  1 Sep 2019 23:14:05 +0530
Message-Id: <20190901174407.30756-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series converts PDC Global and AOSS reset bindings to yaml
and adds support on SC7180 SoCs.

v3:
 * Convert to yaml bindings

v2:
 * Addressed Philipp's review comments

Sibi Sankar (2):
  dt-bindings: reset: aoss: Convert AOSS reset bindings to yaml
  dt-bindings: reset: pdc: Convert PDC Global bindings to yaml

 .../bindings/reset/qcom,aoss-reset.txt        | 52 -------------------
 .../bindings/reset/qcom,aoss-reset.yaml       | 47 +++++++++++++++++
 .../bindings/reset/qcom,pdc-global.txt        | 52 -------------------
 .../bindings/reset/qcom,pdc-global.yaml       | 47 +++++++++++++++++
 4 files changed, 94 insertions(+), 104 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
 create mode 100644 Documentation/devicetree/bindings/reset/qcom,aoss-reset.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
 create mode 100644 Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

