Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BBBE84A90
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2019 13:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729348AbfHGLYr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Aug 2019 07:24:47 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39892 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbfHGLYr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Aug 2019 07:24:47 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 5803B60D0C; Wed,  7 Aug 2019 11:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565177086;
        bh=lF5MI0cvz8DkElhWA5ft5fjbVdzAf0tfTcgX1Lt4Oxs=;
        h=From:To:Cc:Subject:Date:From;
        b=EShlHJNY3gxYDyFo1IvScyHYt6+742ETEXjyPEscG4nFJVA8gnQUupA4A2nTuN/UX
         I8IYMXvwQfb7koql915k4Ye9IzWYlbl6SwWbpeoh1ORgLUnFL77hyMVPOAMMk//RVN
         yyks7fzMUo3QVK1KnDpwa99DEd/6dlLX2hWg2+g8=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7879C6058E;
        Wed,  7 Aug 2019 11:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565177085;
        bh=lF5MI0cvz8DkElhWA5ft5fjbVdzAf0tfTcgX1Lt4Oxs=;
        h=From:To:Cc:Subject:Date:From;
        b=NgD6Mn1J5RQvgJyt5RtRR6RYWOgw8m3NVEHq3f19o94UCkEGRyvRa2ZDbz6AytqYj
         dz8so2h/Ne6HVUXrHk+bow0TF1cwHimpGthaQ9z56IiyymE4u61AYcgi+ZdRUXfsU/
         LXJeD2L1rWcb5BZKnffyg/UtyCU1AxW4fjxvV2+o=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7879C6058E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     robh+dt@kernel.org, georgi.djakov@linaro.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        evgreen@chromium.org, daidavid1@codeaurora.org,
        saravanak@google.com, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 0/2] Add OSM L3 Interconnect Provider
Date:   Wed,  7 Aug 2019 16:54:30 +0530
Message-Id: <20190807112432.26521-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series aims to add Operating State Manager (OSM) L3
interconnect provider support on SDM845 SoCs to handle bandwidth
requests from CPU/GPU to scale L3 caches.

Sibi Sankar (2):
  dt-bindings: interconnect: Add OSM L3 DT bindings
  interconnect: qcom: Add OSM L3 interconnect provider support

 .../bindings/interconnect/qcom,osm-l3.yaml    |  55 ++++
 drivers/interconnect/qcom/Kconfig             |   7 +
 drivers/interconnect/qcom/Makefile            |   2 +
 drivers/interconnect/qcom/osm-l3.c            | 292 ++++++++++++++++++
 .../dt-bindings/interconnect/qcom,osm-l3.h    |  13 +
 5 files changed, 369 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
 create mode 100644 drivers/interconnect/qcom/osm-l3.c
 create mode 100644 include/dt-bindings/interconnect/qcom,osm-l3.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

