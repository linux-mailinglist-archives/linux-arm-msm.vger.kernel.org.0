Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6F3D3DB3C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jul 2021 08:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237607AbhG3Gqo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jul 2021 02:46:44 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:46409 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237604AbhG3Gqo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jul 2021 02:46:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627627600; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=IFl9D1FTUR50lNt/xruo5NKP3MfR2CWffZI/KUbWDCU=; b=MOVcSklAXNU60fWl76vwmh+ydPCP0YYNe5Z4UyUk1gD4QF1NQBklL87NpMk0C2vv+LSYFLva
 Qm2mdnTz7Alfpaw+ZwNwN+p72vH0UcM2c8S7TWffvBIOkDqNLp5onZBkf3h7pm0aZuSdUqtm
 Ras6Z34Y5qovVwmvZIaNi+wjNgY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6103a04d96a66e66b27596d3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Jul 2021 06:46:37
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F109AC4360C; Fri, 30 Jul 2021 06:46:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4FC01C433F1;
        Fri, 30 Jul 2021 06:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4FC01C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        srinivas.kandagatla@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rbokka@codeaurora.org,
        dianders@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v3 0/4] nvmem: qfprom: Add binding updates and power-domain handling
Date:   Fri, 30 Jul 2021 12:16:09 +0530
Message-Id: <1627627573-32454-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

v3:
* Dropped the description in bindings patch
* Added a patch to fix ordering in qfprom_disable_fuse_blowing()
* Fixed devm_add_action_or_reset() order

v2:
* pm_runtime calls made unconditionally, should work even without the power-domains property in DT
* Added the missing pm_runtime_disable() handling
* DT patch rebased on msm/for-next

--
qfprom devices on sc7280 have an additional requirement to vote on a power-domain
performance state to reliably blow fuses. Add the binding updates and handle this in
the driver, also add the DT node for sc7280 platform.

Rajendra Nayak (4):
  dt-bindings: nvmem: qfprom: Add optional power-domains property
  nvmem: qfprom: Fix up qfprom_disable_fuse_blowing() ordering
  nvmem: qfprom: sc7280: Handle the additional power-domains vote
  arm64: dts: qcom: sc7280: Add qfprom node

 .../devicetree/bindings/nvmem/qcom,qfprom.yaml     |  3 +++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 13 +++++++++
 drivers/nvmem/qfprom.c                             | 31 +++++++++++++++++++---
 3 files changed, 44 insertions(+), 3 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

