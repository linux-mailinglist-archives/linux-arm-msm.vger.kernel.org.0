Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B53F231A26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 09:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727797AbgG2HRG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jul 2020 03:17:06 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:38118 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726918AbgG2HRG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jul 2020 03:17:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596007025; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=YneErWWmjZG2O+EK9sMYOtk5QgPXdqNPT0hjlzSs7f4=; b=WUNBhIpL72Sq9vBcylnZpYXgO8heVdbtm9GHYVr2oaQX+8BE8FcuFLMTUNzhso5umIoCTtpg
 Ko3vsUR9r2IoPtDW9pmkmawWbl6uVk8fsBCSeoUrwoey8d7A8ME3KcaOlIedybhf/bXwDyLB
 s07Mk9LiaP8Pwp40c5Ef5oPMjN4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-east-1.postgun.com with SMTP id
 5f2122717186ea1ee15ead72 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 29 Jul 2020 07:17:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 63B88C433C6; Wed, 29 Jul 2020 07:17:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A5EA7C433C9;
        Wed, 29 Jul 2020 07:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A5EA7C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     stanimir.varbanov@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v5 0/5] DVFS support for Venus
Date:   Wed, 29 Jul 2020 12:46:40 +0530
Message-Id: <1596007005-30425-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

v5: Fixed the opp-tables (patch 4/5) to avoid -ERANGE from
dev_pm_opp_set_rate

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

