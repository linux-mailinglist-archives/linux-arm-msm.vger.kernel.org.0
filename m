Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B578FFDBD4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 11:59:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbfKOK7a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 05:59:30 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:34020 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbfKOK7a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 05:59:30 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id CBFD460721; Fri, 15 Nov 2019 10:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573815569;
        bh=0Nah58GSAL88/uY+EvDDspGeElq/PM1FdgvLNEhSmgM=;
        h=From:To:Cc:Subject:Date:From;
        b=EICh4fBD/b47qTIbJtdh6NYjYw8tR5Z47oZUBPlzmzHjRu9yA7bAICp62mGMKCViR
         b/3q4ZKiKPSWucVY2LpmrVpHA6TDNs0nEhbaOg0UNW6XWIPkzWVYy2NlEuAWzIPtFp
         radf5HVJ/eG9M7UyWa0D7Rxs+8H1A/EwTGsoq+Mc=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 78443602EF;
        Fri, 15 Nov 2019 10:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573815569;
        bh=0Nah58GSAL88/uY+EvDDspGeElq/PM1FdgvLNEhSmgM=;
        h=From:To:Cc:Subject:Date:From;
        b=EICh4fBD/b47qTIbJtdh6NYjYw8tR5Z47oZUBPlzmzHjRu9yA7bAICp62mGMKCViR
         b/3q4ZKiKPSWucVY2LpmrVpHA6TDNs0nEhbaOg0UNW6XWIPkzWVYy2NlEuAWzIPtFp
         radf5HVJ/eG9M7UyWa0D7Rxs+8H1A/EwTGsoq+Mc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 78443602EF
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH 0/2] Rename LLCC cache-controller to system-cache-controller
Date:   Fri, 15 Nov 2019 16:29:10 +0530
Message-Id: <cover.1573814758.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DT schema checks for the node name 'cache-controller' and enforces
that there has to be a cache-level associated with it. But LLCC is
a system cache and does not have a cache-level property and hence
the dt binding check fails. So let us rename the LLCC cache-controller
to system-cache-controller which is the proper description and also
makes the schema happy.

Sai Prakash Ranjan (2):
  dt-bindings: msm: Rename cache-controller to system-cache-controller
  arm64: dts: sdm845: Update the device tree node for LLCC

 Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml | 2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi                     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

