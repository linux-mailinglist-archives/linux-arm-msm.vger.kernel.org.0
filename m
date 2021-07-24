Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46FD93D4524
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jul 2021 07:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbhGXEzU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Jul 2021 00:55:20 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:29476 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229935AbhGXEzT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Jul 2021 00:55:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627104952; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=2BBLb9ExCDJDDxnUirk2RI5VsvHBWE03GTFT4faf+bQ=; b=KvFgt3we1VjpcDu0YwGbgXjMGTgzuawaEDDbIXy0S5+mjaS+50qCmVAxd5Hls/7KvACYMiQH
 tTRG3U5nCLQItCBsXpH3WWmqhjXcZaEmVq+QupmIm9hc3F6FlAEXf9oanXTdG8bjngdDua/g
 1gqpJo+3R/Cnnp9uWP4i8C+tzAY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60fba6b71dd16c8788b7893b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 24 Jul 2021 05:35:51
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CEFE1C43460; Sat, 24 Jul 2021 05:35:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A6DD1C433D3;
        Sat, 24 Jul 2021 05:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A6DD1C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: [PATCH v6 0/2] Qualcomm's lpass device tree changes
Date:   Sat, 24 Jul 2021 11:05:27 +0530
Message-Id: <20210724053529.14460-1-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes Since v5:
  -- Dai node numbers change.
Changes Since v4:
  -- Signed off address change.
Changes Since v3:
  -- Changed DP node name.
Changes Since v2:
  -- Removed obsolete hdmi-jack property.
  -- Updated sound dai cells property
Changes Since v1:
  -- hdmi dai is added in lpass-cpu node.

V Sujith Kumar Reddy (2):
  arm64: dts: qcom: sc7180: Update lpass cpu node for audio over dp
  arm64: dts: qcom: sc7180-trogdor: Add lpass dai link for HDMI

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi         | 16 ++++++++++------
 2 files changed, 26 insertions(+), 6 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

