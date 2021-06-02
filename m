Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B398398E1A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 17:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232009AbhFBPRQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 11:17:16 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:23392 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230479AbhFBPRP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 11:17:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622646932; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=wONkowc2aU9yIojYgYnWALe2g/vOfIdV4AybmMpsICE=; b=WWhCNvm62gzMJF4FPlAZU5FDMqQVjTLOFY4SnV/jkmWO7asvuXUcbCfdBQW4wHBRI4Grab9/
 NdR0l7WATdC77wUNUTwTDXva2R8mossznaFonxyL2UVppl06DS3DsK6r9u1Ql2jfipi9VErx
 i1omkxbrHOAiYoEvqcw3k22fmeM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60b7a07ff726fa4188e7a33d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Jun 2021 15:15:11
 GMT
Sender: okukatla=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 18EC5C43147; Wed,  2 Jun 2021 15:15:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from okukatla1-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: okukatla)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 341C0C433F1;
        Wed,  2 Jun 2021 15:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 341C0C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=okukatla@codeaurora.org
From:   Odelu Kukatla <okukatla@codeaurora.org>
To:     georgi.djakov@linaro.org, bjorn.andersson@linaro.org,
        evgreen@google.com
Cc:     sboyd@kernel.org, seansw@qti.qualcomm.com, elder@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org,
        Odelu Kukatla <okukatla@codeaurora.org>
Subject: [V3 0/3] Add L3 provider support for SC7280
Date:   Wed,  2 Jun 2021 20:44:50 +0530
Message-Id: <1622646894-7833-1-git-send-email-okukatla@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add Epoch Subsystem (EPSS) L3 provider support on SM7280 SoCs.

v3:
 - Addressed review comments (Rob Herring)
 
Depends on: https://lore.kernel.org/patchwork/cover/1418814/
 
Odelu Kukatla (3):
  dt-bindings: interconnect: Add EPSS L3 DT binding on SC7280
  interconnect: qcom: Add EPSS L3 support on SC7280
  arm64: dts: qcom: sc7280: Add EPSS L3 interconnect provider

 .../bindings/interconnect/qcom,osm-l3.yaml         |   4 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   9 ++
 drivers/interconnect/qcom/osm-l3.c                 | 135 ++++++++++++++++-----
 drivers/interconnect/qcom/sc7280.h                 |  10 ++
 include/dt-bindings/interconnect/qcom,osm-l3.h     |  10 +-
 5 files changed, 137 insertions(+), 31 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

