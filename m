Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63BBE975B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2019 11:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbfHUJLr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Aug 2019 05:11:47 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:43714 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726568AbfHUJLq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Aug 2019 05:11:46 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C454260E57; Wed, 21 Aug 2019 09:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566378705;
        bh=2pr9GsFvXQZE/Ux0QOjzu/XyhJcWbvJ4f0XnBsenS9U=;
        h=From:To:Cc:Subject:Date:From;
        b=UQjd8jt/z12GiWGnchz09OYDL9p9pwatGGbpK2HknwqQYkSauoMv/fNxqGbmolgUQ
         npySgwSn3aZmihuka1QQiUXjuc/hd94vZfiE0AUZh2uzlzq1+cubc8OLJU0JZeDEzR
         /AtwWnVyVV6kDoONCL7BGr8FE9Fi5W5YE7QR3NT4=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 53B8D60CED;
        Wed, 21 Aug 2019 09:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566378705;
        bh=2pr9GsFvXQZE/Ux0QOjzu/XyhJcWbvJ4f0XnBsenS9U=;
        h=From:To:Cc:Subject:Date:From;
        b=UQjd8jt/z12GiWGnchz09OYDL9p9pwatGGbpK2HknwqQYkSauoMv/fNxqGbmolgUQ
         npySgwSn3aZmihuka1QQiUXjuc/hd94vZfiE0AUZh2uzlzq1+cubc8OLJU0JZeDEzR
         /AtwWnVyVV6kDoONCL7BGr8FE9Fi5W5YE7QR3NT4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 53B8D60CED
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     robh+dt@kernel.org, georgi.djakov@linaro.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        evgreen@chromium.org, daidavid1@codeaurora.org,
        saravanak@google.com, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 0/2] Add OSM L3 Interconnect Provider
Date:   Wed, 21 Aug 2019 14:41:30 +0530
Message-Id: <20190821091132.14994-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series aims to add Operating State Manager (OSM) L3
interconnect provider support on SDM845 SoCs to handle bandwidth
requests from CPU to scale L3 caches.

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

