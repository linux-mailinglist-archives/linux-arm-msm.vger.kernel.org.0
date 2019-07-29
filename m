Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5911278B43
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2019 14:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387662AbfG2MGt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jul 2019 08:06:49 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:36696 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387637AbfG2MGs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jul 2019 08:06:48 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B7F3C60736; Mon, 29 Jul 2019 12:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564402007;
        bh=bvEmJLLutQsxuJQPfWeI2M2lzgG7cHvWewxBuldtSuI=;
        h=From:To:Cc:Subject:Date:From;
        b=PvMHHqEZEL2gM4bFpn7FBbNeejQumuW3p16GiGQ7d6ZiRaxeoMyqrXa8I4aandisw
         Me6uFwYemJoIyeddK9w9lPSvOUUbafyWfVT4djfTjMCU6I45iUt6K0cHyNROKpt4Kt
         0VJ0tFUFeWaU4kJfY7/jc6zxX3cSYlU0Fi2573Oc=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0D07660255;
        Mon, 29 Jul 2019 12:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564402007;
        bh=bvEmJLLutQsxuJQPfWeI2M2lzgG7cHvWewxBuldtSuI=;
        h=From:To:Cc:Subject:Date:From;
        b=PvMHHqEZEL2gM4bFpn7FBbNeejQumuW3p16GiGQ7d6ZiRaxeoMyqrXa8I4aandisw
         Me6uFwYemJoIyeddK9w9lPSvOUUbafyWfVT4djfTjMCU6I45iUt6K0cHyNROKpt4Kt
         0VJ0tFUFeWaU4kJfY7/jc6zxX3cSYlU0Fi2573Oc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0D07660255
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, vkoul@kernel.org,
        aneela@codeaurora.org
Cc:     mark.rutland@arm.com, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        clew@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 0/6] Add support for Qualcomm SM8150 and SC7180 SoCs
Date:   Mon, 29 Jul 2019 17:36:27 +0530
Message-Id: <20190729120633.20451-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds SCM, APSS shared mailbox and QMP AOSS PD/clock
support on SM8150 and SC7180 SoCs.

Sibi Sankar (6):
  soc: qcom: smem: Update max processor count
  dt-bindings: firmware: scm: Add SM8150 and SC7180 support
  dt-bindings: mailbox: Add APSS shared for SM8150 and SC7180 SoCs
  mailbox: qcom: Add support for Qualcomm SM8150 and SC7180 SoCs
  dt-bindings: soc: qcom: aoss: Add SM8150 and SC7180 support
  soc: qcom: aoss: Add AOSS QMP support

 Documentation/devicetree/bindings/firmware/qcom,scm.txt      | 2 ++
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt    | 2 ++
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt | 5 ++++-
 drivers/mailbox/qcom-apcs-ipc-mailbox.c                      | 2 ++
 drivers/soc/qcom/qcom_aoss.c                                 | 2 ++
 drivers/soc/qcom/smem.c                                      | 2 +-
 6 files changed, 13 insertions(+), 2 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

