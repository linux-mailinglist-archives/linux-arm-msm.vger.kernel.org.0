Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0CFD459C88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 08:00:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233823AbhKWHED (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 02:04:03 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:44883 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233635AbhKWHEB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 02:04:01 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637650853; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=oht57nTph0SuhNK0eo38EdPykhgIuHJwBUcXdH0yvHw=; b=pLhUDcxXQbI620iuu7RHyZb5FVik/V8GKPiUPzmkTOr/YCHjs6u4DQjZv5nbRbHg8UZPDz/Q
 Vvc3iXia5y6a714+9d7PvHGQPuAHB9QltU6kAhQwPBMHZuXdbh3Hiy6j6X85OyxatIRYP1r4
 A1gGmLZhyem8iqBFYUyzm/bV67g=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 619c9195135a8a9d0e775a5e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Nov 2021 07:00:37
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1DA77C4360C; Tue, 23 Nov 2021 07:00:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 990DBC4338F;
        Tue, 23 Nov 2021 07:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 990DBC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sboyd@codeaurora.org,
        dianders@chromium.org, mka@chromium.org, kgodara@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 0/4]  arm64: dts: qcom: Add support for the sc7280 CRD board
Date:   Tue, 23 Nov 2021 12:30:09 +0530
Message-Id: <1637650813-16654-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for sc7280 CRD (Compute Reference Design) Board.
It shares the same EC and H1 as the IDP2 boards, comes with an eDP
display and supports both touch and trackpad.
Since the EC and H1 nodes are identical across CRD and IDP2 this
series also adds support for EC/H1 on IDP2 devices.

Kshitiz Godara (2):
  arm64: dts: qcom: sc7280: Define EC and H1 nodes
  arm64: dts: qcom: sc7280-crd: Add Touchscreen and touchpad support

Rajendra Nayak (2):
  dt-bindings: arm: qcom: Document qcom,sc7280-crd board
  arm64: dts: qcom: sc7280-crd: Add device tree files for CRD

 Documentation/devicetree/bindings/arm/qcom.yaml |   2 +
 arch/arm64/boot/dts/qcom/Makefile               |   1 +
 arch/arm64/boot/dts/qcom/sc7280-crd.dts         |  95 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280-ec-h1.dtsi      | 110 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280-idp2.dts        |   1 +
 5 files changed, 209 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-crd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-ec-h1.dtsi

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

