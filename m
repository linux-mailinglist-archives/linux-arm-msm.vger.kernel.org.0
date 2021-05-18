Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5535C387E76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 19:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351186AbhERRfq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 13:35:46 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:35825 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346491AbhERRfo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 13:35:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621359266; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ZnbINgFappomhnwPXsl+61/DieghZol90Sd1vO2e+6Y=; b=sOazT5vb14vjr2mkb0aeZiu+fEhEx19/QoEvs1gvFtlVLvJ8vBRRJhV4qhnVxjAcLHw/+blz
 tDDvKZwN2IxiC3+TQRji693zCdU6oU2o/H3aGL5gSuUKAJYNt76q0SJip/RP6262IKA/Dsgz
 v9Hv3w7khFqjmSqt2cgq2B+cWQM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60a3fa9b67d156359ade471e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 18 May 2021 17:34:19
 GMT
Sender: okukatla=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 63F12C43217; Tue, 18 May 2021 17:34:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from okukatla1-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: okukatla)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 54029C433F1;
        Tue, 18 May 2021 17:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 54029C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=okukatla@codeaurora.org
From:   Odelu Kukatla <okukatla@codeaurora.org>
To:     georgi.djakov@linaro.org, sibis@codeaurora.org,
        bjorn.andersson@linaro.org, evgreen@google.com
Cc:     sboyd@kernel.org, seansw@qti.qualcomm.com, elder@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org,
        Odelu Kukatla <okukatla@codeaurora.org>
Subject: [V2 0/3] Add L3 provider support for SC7280
Date:   Tue, 18 May 2021 23:03:59 +0530
Message-Id: <1621359242-18641-1-git-send-email-okukatla@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add Epoch Subsystem (EPSS) L3 provider support on SM7280 SoCs.

v2:
 - Addressed review comments (Georgi/Sibi)
 
Depends on: https://lore.kernel.org/patchwork/cover/1418814/
 
Odelu Kukatla (3):
  dt-bindings: interconnect: Add EPSS L3 DT binding on SC7280
  interconnect: qcom: Add EPSS L3 support on SC7280
  arm64: dts: qcom: sc7280: Add EPSS L3 interconnect provider

 .../bindings/interconnect/qcom,osm-l3.yaml         |   3 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   9 ++
 drivers/interconnect/qcom/osm-l3.c                 | 135 ++++++++++++++++-----
 drivers/interconnect/qcom/sc7280.h                 |  10 ++
 include/dt-bindings/interconnect/qcom,osm-l3.h     |  10 +-
 5 files changed, 136 insertions(+), 31 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

