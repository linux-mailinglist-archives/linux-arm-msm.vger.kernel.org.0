Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78E443D1D5D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 07:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbhGVEsP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 00:48:15 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:23125 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbhGVEsP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 00:48:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626931730; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=0ThV7TcP+i5hNQOZisJFlVf2qkHHGm1u6B27SpSGYsM=; b=TLS/xJqQQuOIQuRktecHF6UfBkkK/WVTiEs6ZGe8StiY4ppcA1sm505P/RwEIvnWS/2pZTNc
 e+qZ8IuZgYaktbiQKcVzrUgyl2RMf+yKzlKbERZUwaRo83NDr3S1Gp4nbmMUdf6faZLaOr2i
 AQj7ums+kgdfEm4pbEOQcd89gDs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60f90211b653fbdadd0644e2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Jul 2021 05:28:49
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 10F2FC4338A; Thu, 22 Jul 2021 05:28:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 07C60C433D3;
        Thu, 22 Jul 2021 05:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 07C60C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        srinivas.kandagatla@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rbokka@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 0/3] nvmem: qfprom: Add binding updates and power-domain handling
Date:   Thu, 22 Jul 2021 10:58:33 +0530
Message-Id: <1626931716-10591-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

qfprom devices on sc7280 have an additional requirement to vote on a power-domain
performance state to reliably blow fuses. Add the binding updates and handle this in
the driver, also add the DT node for sc7280 platform.

Rajendra Nayak (3):
  dt-bindings: nvmem: qfprom: Add optional power-domains property
  nvmem: qfprom: sc7280: Handle the additional power-domains vote
  arm64: dts: qcom: sc7280: Add qfprom node

 .../devicetree/bindings/nvmem/qcom,qfprom.yaml     |  3 +++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 13 +++++++++++++
 drivers/nvmem/qfprom.c                             | 22 ++++++++++++++++++++++
 3 files changed, 38 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

