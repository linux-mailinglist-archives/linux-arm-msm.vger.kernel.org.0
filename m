Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9927222ADA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 13:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727940AbgGWL1d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jul 2020 07:27:33 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:17270 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725846AbgGWL1d (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jul 2020 07:27:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595503652; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=zMBGA4GBLjo26JmXFoaEr/6TroQfiUFJV+/N5KVNSYQ=; b=i0guGy4gOTqNNYNQMFOq8QnFWzO3JEwUiq6BfpTXug+6H5zMB63EjjzuiZ0EaH9m3irmMWWF
 L2VZm6Km4HWlXyaA6i2FEJyTr+PCVL30rh1wW451RYBeGy3bOniJOFIqQxN5658a7fKoxBKB
 DP0D3jj67ULVoUBwpugtbnxF+Hg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5f1974185b75bcda60af5816 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 23 Jul 2020 11:27:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3585BC433CB; Thu, 23 Jul 2020 11:27:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D5656C433C6;
        Thu, 23 Jul 2020 11:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D5656C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     stanimir.varbanov@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v4 0/5] DVFS support for Venus
Date:   Thu, 23 Jul 2020 16:56:47 +0530
Message-Id: <1595503612-2901-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

v4: Moved code from probe/remove/runtime_suspend into
different pm_ops callbacks

v3: Renamed the optional power domain as cx

v2: Fixed up the labels of OPP nodes in patch 4
    Included the bindings update patch as part of this series,
    a resend of https://lore.kernel.org/patchwork/patch/1241077/

These patches add DVFS support for Venus

Patch 1 will need to be picked by Rob.
Patch 2 and 3 will need to be picked by Stan,
Patch 4 and 5 should land via the qcom tree.

Rajendra Nayak (5):
  dt-bindings: media: venus: Add an optional power domain for perf
    voting
  media: venus: core: Fix error handling in probe
  media: venus: core: Add support for opp tables/perf voting
  arm64: dts: sdm845: Add OPP tables and power-domains for venus
  arm64: dts: sc7180: Add OPP tables and power-domains for venus

 .../bindings/media/qcom,sc7180-venus.yaml          |  6 +-
 .../bindings/media/qcom,sdm845-venus-v2.yaml       |  6 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               | 35 +++++++-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 40 +++++++++-
 drivers/media/platform/qcom/venus/core.c           | 17 ++--
 drivers/media/platform/qcom/venus/core.h           |  5 ++
 drivers/media/platform/qcom/venus/pm_helpers.c     | 92 ++++++++++++++++++++--
 7 files changed, 183 insertions(+), 18 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

