Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4CB43DA2BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 14:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234595AbhG2MCB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 08:02:01 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:44044 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236611AbhG2MCB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 08:02:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627560118; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ncuVk0tm8feeNx3H/BvLh3vi7YpsBR7Hq/K0HuPg+lI=; b=UeZZdtm0PMaFVKDpX+79TNixmoFSy+4vKbLBP9kaNTdLNXb2J0KT3sDmpxLSEOwv6Ip/NOM/
 xkH9VwdCmHCXc/oCPPRdoVelNBiPIqKQAfz+89HDRp1/z3Nu9Jk90pRv6mj8ydtq/sYBp9gD
 Fywnfy7S0Op3873GVl+AzlNZOfM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6102987996a66e66b20562c7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Jul 2021 12:00:57
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 094BCC4338A; Thu, 29 Jul 2021 12:00:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 679EBC433D3;
        Thu, 29 Jul 2021 12:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 679EBC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        srinivas.kandagatla@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rbokka@codeaurora.org,
        dianders@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 0/3] nvmem: qfprom: Add binding updates and power-domain handling
Date:   Thu, 29 Jul 2021 17:30:33 +0530
Message-Id: <1627560036-1626-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

v2:
* pm_runtime calls made unconditionally, should work even without the power-domains property in DT
* Added the missing pm_runtime_disable() handling
* DT patch rebased on msm/for-next

--
qfprom devices on sc7280 have an additional requirement to vote on a power-domain
performance state to reliably blow fuses. Add the binding updates and handle this in
the driver, also add the DT node for sc7280 platform.

Rajendra Nayak (3):
  dt-bindings: nvmem: qfprom: Add optional power-domains property
  nvmem: qfprom: sc7280: Handle the additional power-domains vote
  arm64: dts: qcom: sc7280: Add qfprom node

 .../devicetree/bindings/nvmem/qcom,qfprom.yaml     |  3 +++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 13 +++++++++++
 drivers/nvmem/qfprom.c                             | 26 ++++++++++++++++++++++
 3 files changed, 42 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

