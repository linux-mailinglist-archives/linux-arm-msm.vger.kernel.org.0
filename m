Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D370324CE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 10:31:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236382AbhBYJbr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 04:31:47 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:53909 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235270AbhBYJbn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 04:31:43 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614245481; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=Se6iQyjGJd8igMcoYPEvgpXPldXyd8UU9UkcbPu3Q5o=; b=kTWlUv7dCTWk0khspuRT+bpHJPRcW1c1V2gUlCpRpxTfDoD7Kz+dWCeKN3+o7mYWuUwTWsdl
 dT2t+hrZ5Egt2DBLNgc12Ox9wXNtOBEioZWmnRCW/soENbK/uEPlYgPgvC3EYKm3Njd3td+Q
 uH9+YDJs5yfDwqjuwiZFQIFeDB8=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60376e4e4ba4640b2b01f19f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Feb 2021 09:30:54
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9E71EC43466; Thu, 25 Feb 2021 09:30:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 053EAC433ED;
        Thu, 25 Feb 2021 09:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 053EAC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     devicetree@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH 0/9] qcom/sc7280: Enable various hardware blocks on SC7280 SoC
Date:   Thu, 25 Feb 2021 15:00:16 +0530
Message-Id: <cover.1614244789.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series enables various hardware blocks such as LLCC, IPCC, AOSS QMP
and Coresight on SC7280 SoC.

This series is dependent on the base support added for SC7280 in [1].

[1] https://lore.kernel.org/patchwork/cover/1379842/

Sai Prakash Ranjan (9):
  dt-bindings: arm: msm: Add LLCC for SC7280
  soc: qcom: llcc: Add configuration data for SC7280
  arm64: dts: qcom: sc7280: Add device tree node for LLCC
  dt-bindings: mailbox: qcom-ipcc: Add compatible for SC7280
  arm64: dts: qcom: sc7280: Add IPCC for SC7280 SoC
  dt-bindings: soc: qcom: aoss: Add SC7280 compatible
  soc: qcom: aoss: Add AOSS QMP support for SC7280
  arm64: dts: qcom: sc7280: Add AOSS QMP node
  arm64: dts: qcom: sc7280: Add Coresight support

 .../bindings/arm/msm/qcom,llcc.yaml           |   1 +
 .../bindings/mailbox/qcom-ipcc.yaml           |   1 +
 .../bindings/soc/qcom/qcom,aoss-qmp.txt       |   1 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi          | 520 ++++++++++++++++++
 drivers/soc/qcom/llcc-qcom.c                  |  19 +
 drivers/soc/qcom/qcom_aoss.c                  |   1 +
 6 files changed, 543 insertions(+)


base-commit: d79b47c59576a51d8e288a6b98b75ccf4afb8acd
prerequisite-patch-id: d8babdd3c8a9923360af342f3d8d9876820272e5
prerequisite-patch-id: 5757e07e4336d773d402769d09106924962ce31b
prerequisite-patch-id: 9b21eb51aa86619f5695a511c65c9236e3bc0f2b
prerequisite-patch-id: 2f834cc892f7f9109cbf32a87d504ba27b64a5df
prerequisite-patch-id: 14b1185357703d750c3411a16e97675489ca7dde
prerequisite-patch-id: 55c143f21b646c18da921a62bbd2801a5df38c8f
prerequisite-patch-id: 66f4c58aff2f1a7283b0103590ff82384907bae3
prerequisite-patch-id: 75e73e6b13ab91ed5e3a96b59957aa5e867d65ea
prerequisite-patch-id: eb46845b4f9eb3706a26911042c2865a58577198
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

