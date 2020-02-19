Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61D63164251
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2020 11:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbgBSKk3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 05:40:29 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:51271 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726270AbgBSKk3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 05:40:29 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582108828; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Yh387kKXHacTs+of14jK5UgoLbmjSoxNzBRJ83+pSig=; b=XvXz+wAFB9Enz2WdyjT7GzwqK2pWqxwB0Ert1TD9zK+uTr3Og2DEQ9PXHQ9kOPpZvq2ojHxP
 hT+FUYaSVl/VUVxyvcO6Faw/p7nUqv1ljX5bQGWyQcPEn+FjIdEXS8KlGln/psH20hBDAGjh
 bAlImqarRqJWYv03RregVJ56kRc=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4d109b.7fb06f19e030-smtp-out-n01;
 Wed, 19 Feb 2020 10:40:27 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A4706C433A2; Wed, 19 Feb 2020 10:40:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 86A37C43383;
        Wed, 19 Feb 2020 10:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 86A37C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v5 0/7] Add RSC power domain support
Date:   Wed, 19 Feb 2020 16:10:03 +0530
Message-Id: <1582108810-21263-1-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in v5:
- Add Rob's Acked by on dt-bindings change
- Drop firmware psci change
- Update cpuidle stats in dtsi to follow PC mode
- Include change to update dirty flag when data is updated from [4]
- Add change to invoke rpmh_flush when caches are dirty

Changes in v4:
- Add change to allow hierarchical topology in PC mode
- Drop hierarchical domain idle states converter from v3
- Address Merge sc7180 dtsi change to add low power modes

Changes in v3:
- Address Rob's comment on dt property value
- Address Stephen's comments on rpmh-rsc driver change
- Include sc7180 cpuidle low power mode changes from [1]
- Include hierarchical domain idle states converter change from [2]

Changes in v2:
- Add Stephen's Reviewed-By to the first three patches
- Addressed Stephen's comments on fourth patch
- Include changes to connect rpmh domain to cpuidle and genpds

Resource State Coordinator (RSC) is responsible for powering off/lowering
the requirements from CPU subsystem for the associated hardware like buses,
clocks, and regulators when all CPUs and cluster is powered down.

RSC power domain uses last-man activities provided by genpd framework based
on Ulf Hansoon's patch series[3], when the cluster of CPUs enter deepest
idle states. As a part of domain poweroff, RSC can lower resource state
requirements by flushing the cached sleep and wake state votes for various
resources.

[1] https://patchwork.kernel.org/patch/11218965
[2] https://patchwork.kernel.org/patch/10941671
[3] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=222355
[4] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=236503

Maulik Shah (7):
  drivers: qcom: rpmh: fix macro to accept NULL argument
  drivers: qcom: rpmh: remove rpmh_flush export
  dt-bindings: soc: qcom: Add RSC power domain specifier
  drivers: qcom: rpmh-rsc: Add RSC power domain support
  arm64: dts: qcom: sc7180: Add cpuidle low power states
  soc: qcom: rpmh: Update dirty flag only when data changes
  soc: qcom: rpmh: Invoke rpmh_flush for dirty caches

 .../devicetree/bindings/soc/qcom/rpmh-rsc.txt      |  9 +++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               | 78 +++++++++++++++++++++
 drivers/soc/qcom/rpmh-internal.h                   |  3 +
 drivers/soc/qcom/rpmh-rsc.c                        | 81 ++++++++++++++++++++++
 drivers/soc/qcom/rpmh.c                            | 49 ++++++++-----
 include/soc/qcom/rpmh.h                            |  5 --
 6 files changed, 203 insertions(+), 22 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
