Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B963C27AB29
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 11:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgI1Jt3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 05:49:29 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:60884 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726526AbgI1Jt0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 05:49:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601286566; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=WZnFcSSBWh5/uEF6fLzEL3125XGvLI0bBZgF8cApXXw=; b=tUFhzncrsiwFmJiSqhhAXFzG1JCLJ0ZRPlIA/O+IlgvQ3bhUK7Lfu6LXc1iSk/ltxDhGsoXZ
 cvV38QIPIhcj/XdjYBel696GnwvnZgfZVcBhia/AWsocPPa01wuAqPuMMQdlIEQ0GGmZSABt
 8NPjGf73DQyUTsiHY4Mg/pHLQac=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f71b1a589f51cb4f1b5f142 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 09:49:25
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E1332C433CA; Mon, 28 Sep 2020 09:49:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B0C03C433C8;
        Mon, 28 Sep 2020 09:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B0C03C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: [PATCH v2 0/2] Qualcomm's lpass device tree changes
Date:   Mon, 28 Sep 2020 15:19:03 +0530
Message-Id: <1601286545-25429-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These patches are device tree changes to support audio over DP.
It includes changes of HDMI reg, interrupt and iommu and 
hdmi dai link.
These patches depends on the lpass I2S patch series
and DP dts node patch series:
  -- https://patchwork.kernel.org/patch/11785073/
  -- https://patchwork.kernel.org/patch/11785235/
  -- https://patchwork.kernel.org/patch/11719511/

Changes Since v1:
  -- hdmi dai is added in lpass-cpu node.

V Sujith Kumar Reddy (2):
  arm64: dts: qcom: sc7180: Update lpass cpu node for audio over dp
  arm64: dts: qcom: sc7180-trogdor: Add lpass dai link for HDMI

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 15 +++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi         | 17 ++++++++++-------
 2 files changed, 25 insertions(+), 7 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

