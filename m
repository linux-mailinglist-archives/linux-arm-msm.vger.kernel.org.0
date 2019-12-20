Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92E3C1275DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 07:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbfLTGsn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Dec 2019 01:48:43 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:47934 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725801AbfLTGsn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Dec 2019 01:48:43 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576824523; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=1IonuiHRPzoZV5ACqf5nBSlek0JKNKmw4r+PjgwPa1A=; b=lGRGj8sxb/c9+KiaEeUQz9hqC8Ym203fx88f4pDB7wkESa8u5t4Yx9u9pJOezAol8qtnw/xh
 wjSg3QleNdNcWSL1tYe114LTVGoBckkQkcOBVB5SB1YtXYZYnwH0DhPbe7COn/t2wkH/RC0B
 A+qasMjSVAUZKeL0kphxCcMsUjM=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfc6ec3.7f63bc3bb228-smtp-out-n03;
 Fri, 20 Dec 2019 06:48:35 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B23A7C4479F; Fri, 20 Dec 2019 06:48:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D5BA3C43383;
        Fri, 20 Dec 2019 06:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D5BA3C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        rnayak@codeaurora.org, swboyd@chromium.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mark.rutland@arm.com, dianders@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 0/2] Add RPMH power-domain node for SC7180 SoCs
Date:   Fri, 20 Dec 2019 12:18:21 +0530
Message-Id: <20191220064823.6115-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series converts the RPMH/RPM power-domain bindings to yaml and
adds the RPMH power-domain device node for SC7180 SoCs.

V2:
 * Addressed Stephen's review comments
 * Added "Reviewed-by" from Stephen and Rajendra

Sibi Sankar (2):
  dt-bindings: power: rpmpd: Convert rpmpd bindings to yaml
  arm64: dts: qcom: sc7180: Add rpmh power-domain node

 .../devicetree/bindings/power/qcom,rpmpd.txt  | 150 ----------------
 .../devicetree/bindings/power/qcom,rpmpd.yaml | 170 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |  55 ++++++
 3 files changed, 225 insertions(+), 150 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/power/qcom,rpmpd.txt
 create mode 100644 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
