Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84CF7100885
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2019 16:45:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbfKRPpS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 10:45:18 -0500
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18]:54848
        "EHLO a27-18.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726216AbfKRPpR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 10:45:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574091916;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
        bh=+YSVNgnbMs5EFhyJ4h+wAu2fT8OSBVhEsqPZBPNUd8k=;
        b=OLe7ntSFiI5QH+4ODVnOMey3u/xtl63G9H6PBoP/O9XErnftMJBpCv0SeevagLwJ
        /ijXqA3SK82OpyGRRglAmXFrODwVLVTwRYyGXVlCtvcPPR+G5RcA5gwocpJH77D2DHi
        BX9phdNicnko6/LCtCiYkysmQZP0iGmspjY1SwuA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574091916;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=+YSVNgnbMs5EFhyJ4h+wAu2fT8OSBVhEsqPZBPNUd8k=;
        b=DAAR1y6+xqmRuzR54Jm2txUDDRsZkOPpp3lDZRVk822MPucZHYkL7q7LPWRbovWk
        RxqJhgC90OQvx1x0iS8cZerxkS0Upv7OvKQ1OIWkIQYdOAK5x+M8nP5YLNyYMYAtBoo
        DAoFz+/xw7hYbj5sW5EiUxvCBQNuPoqbJQrXelhg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 46AD7C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     robh+dt@kernel.org, georgi.djakov@linaro.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        evgreen@chromium.org, daidavid1@codeaurora.org,
        saravanak@google.com, viresh.kumar@linaro.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 0/2] Add OSM L3 Interconnect Provider
Date:   Mon, 18 Nov 2019 15:45:16 +0000
Message-ID: <0101016e7f3085c2-87e9f748-ec76-4dbe-b8ad-3901e38c75dd-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2019.11.18-54.240.27.18
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series aims to add Operating State Manager (OSM) L3
interconnect provider support on SDM845 SoCs to handle bandwidth
requests from CPU to scale L3 caches.

v3:
 * switched the dt-bindings to dual-license
 * Rebased to linux-next

v2:
 * addressed review comments from Evan
 * dropped unused gpu icc node on SDM845 SoC

Sibi Sankar (2):
  dt-bindings: interconnect: Add OSM L3 DT bindings
  interconnect: qcom: Add OSM L3 interconnect provider support

 .../bindings/interconnect/qcom,osm-l3.yaml    |  56 ++++
 drivers/interconnect/qcom/Kconfig             |   7 +
 drivers/interconnect/qcom/Makefile            |   2 +
 drivers/interconnect/qcom/osm-l3.c            | 284 ++++++++++++++++++
 .../dt-bindings/interconnect/qcom,osm-l3.h    |  12 +
 5 files changed, 361 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
 create mode 100644 drivers/interconnect/qcom/osm-l3.c
 create mode 100644 include/dt-bindings/interconnect/qcom,osm-l3.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

