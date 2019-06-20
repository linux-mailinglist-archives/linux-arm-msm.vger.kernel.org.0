Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 301954D948
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 20:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbfFTScx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 14:32:53 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:53582 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbfFTScH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 14:32:07 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 540EB6028D; Thu, 20 Jun 2019 18:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561055527;
        bh=b75oQgX62jUgFlcJID73lZaMHa+SwbvHtq/u6y0s1fQ=;
        h=From:To:Cc:Subject:Date:From;
        b=ie7rVlTxwE4pQlAgHAX2cWN6MiSsSBYJphov5Gu6MUe+WKnu1fvI3hdaUAwZua6u2
         L5MKLuN7z9cEeoKWvjFcL19tQlV/t/Asi00h8kquZ0U6LyryLtjWM1ebxoNKyg4DQo
         HIaruI58J+y68hJuntEw5ngrRdP96QBioAszX6d0=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 186206020A;
        Thu, 20 Jun 2019 18:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561055527;
        bh=b75oQgX62jUgFlcJID73lZaMHa+SwbvHtq/u6y0s1fQ=;
        h=From:To:Cc:Subject:Date:From;
        b=ie7rVlTxwE4pQlAgHAX2cWN6MiSsSBYJphov5Gu6MUe+WKnu1fvI3hdaUAwZua6u2
         L5MKLuN7z9cEeoKWvjFcL19tQlV/t/Asi00h8kquZ0U6LyryLtjWM1ebxoNKyg4DQo
         HIaruI58J+y68hJuntEw5ngrRdP96QBioAszX6d0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 186206020A
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
Subject: [PATCHv2 0/2] coresight: Do not default to CPU0 for missing CPU phandle
Date:   Fri, 21 Jun 2019 00:01:50 +0530
Message-Id: <cover.1561054498.git.saiprakash.ranjan@codeaurora.org>
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

Patch 2 allows the probe of coresight etm and cpu-debug to abort
earlier in case cpus are not available.

v2:
 * Addressed review comments from Suzuki and Mathieu.
 * Allows the probe of etm and cpu-debug to abort earlier
   in case of unavailability of respective cpus.

Sai Prakash Ranjan (2):
  coresight: Do not default to CPU0 for missing CPU phandle
  coresight: Abort probe if cpus are not available

 Documentation/devicetree/bindings/arm/coresight.txt |  2 +-
 drivers/hwtracing/coresight/coresight-cpu-debug.c   |  3 +++
 drivers/hwtracing/coresight/coresight-etm3x.c       |  3 +++
 drivers/hwtracing/coresight/coresight-etm4x.c       |  3 +++
 drivers/hwtracing/coresight/coresight-platform.c    | 13 ++++++++-----
 5 files changed, 18 insertions(+), 6 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

