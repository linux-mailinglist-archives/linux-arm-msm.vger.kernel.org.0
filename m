Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 775C632B1DD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Mar 2021 04:47:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241914AbhCCBOj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Mar 2021 20:14:39 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:40133 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1381403AbhCBH3b (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Mar 2021 02:29:31 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614670135; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=Wa6F5uz9Gu6HB8MIpLG/bVDkF2UVIJO6WwRB1PLr0u0=; b=Svwoyo1EfzQhoB8o7LTGSuvzrs7hqdmFjlQSLEvE4bAE8a84ubu/I7nauaj2O5HVrUx6TDVw
 TyIGhwAp2izBKD4a+kvS+MDi0eRyx8K4FPKklrUjG3049zRPnnBhgFqOuXOQwvspe4eQ25V4
 KDA6ylhrNIJBMugmuw1TlvsRSkM=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 603de9126bfdd67a0095d78b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Mar 2021 07:28:18
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0F3ECC433ED; Tue,  2 Mar 2021 07:28:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 173D7C433CA;
        Tue,  2 Mar 2021 07:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 173D7C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH 0/4] arm64: dts: qcom: Rename the qmp node to power-controller 
Date:   Tue,  2 Mar 2021 12:58:00 +0530
Message-Id: <cover.1614669585.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This short series converts the qmp DT node name to generic "power-controller"
for AOSS message ram instead of the protocol name QMP(Qualcomm Messaging Protocol)
since it is used for power management requests.

Sai Prakash Ranjan (4):
  arm64: dts: qcom: sc7180: Rename the qmp node to power-controller
  arm64: dts: qcom: sdm845: Rename the qmp node to power-controller
  arm64: dts: qcom: sm8250: Rename the qmp node to power-controller
  arm64: dts: qcom: sm8350: Rename the qmp node to power-controller

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

