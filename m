Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B040750043
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2019 05:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbfFXDgV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 Jun 2019 23:36:21 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:48350 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726549AbfFXDgV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 Jun 2019 23:36:21 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 087E360909; Mon, 24 Jun 2019 03:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561347381;
        bh=6Z7HBpMm0ZfrkIlORZl8tv7HCGEf+5YDT93YXDXDWe8=;
        h=From:To:Cc:Subject:Date:From;
        b=cP01GdQjvkgaC430GrHohAUDJx/rmhglz7zW6jGad7vRD1rGS+aKfRJ5DLs2Bzl/g
         1yTkK/jagqG/q+vrYrFxxvh2PIFLcDlq99S/4kfB9REBDipv8mmUsqcJYgsyc0ciKn
         J+hRzWgJGfxoYpm2l3oWxWnvLkvUiDeV9TFbh4LE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-311.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3C3B36038E;
        Mon, 24 Jun 2019 03:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561347380;
        bh=6Z7HBpMm0ZfrkIlORZl8tv7HCGEf+5YDT93YXDXDWe8=;
        h=From:To:Cc:Subject:Date:From;
        b=j5vZb98fYQoV+I9IQpReSI0jjBZghWaIOs8sSsVV2F3MvnEPI+NODC6DYq9Uy/gGA
         Lw0EopLXQ3MAK1kp6GgpikF1/uUspKmMr073l7fYpt0jWWVx1pxasCh1jBOr1GmooI
         d0MBjpc+x2DCEoDI2Pxgw4nP7PimK9hJMbvEmGRs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3C3B36038E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Leo Yan <leo.yan@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv3 0/1] coresight: Do not default to CPU0 for missing CPU phandle
Date:   Mon, 24 Jun 2019 09:06:08 +0530
Message-Id: <cover.1561346998.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In case of missing CPU phandle, the affinity is set default to
CPU0 which is not a correct assumption. Fix this in coresight
platform to set affinity to invalid and abort the probe in drivers.
Also update the dt-bindings accordingly.

v3:
 * Addressed review comments from Suzuki and updated
   acpi_coresight_get_cpu.
 * Removed patch 2 which had invalid check for online
   cpus.

v2:
 * Addressed review comments from Suzuki and Mathieu.
 * Allows the probe of etm and cpu-debug to abort earlier
   in case of unavailability of respective cpus.

Sai Prakash Ranjan (1):
  coresight: Do not default to CPU0 for missing CPU phandle

 .../bindings/arm/coresight-cpu-debug.txt         |  4 ++--
 .../devicetree/bindings/arm/coresight.txt        |  8 +++++---
 .../hwtracing/coresight/coresight-cpu-debug.c    |  3 +++
 drivers/hwtracing/coresight/coresight-etm3x.c    |  3 +++
 drivers/hwtracing/coresight/coresight-etm4x.c    |  3 +++
 drivers/hwtracing/coresight/coresight-platform.c | 16 ++++++++--------
 6 files changed, 24 insertions(+), 13 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

