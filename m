Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 999AF33A347
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Mar 2021 07:12:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234881AbhCNGLq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 14 Mar 2021 01:11:46 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:49975 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234806AbhCNGL0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 14 Mar 2021 01:11:26 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615702284; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=8SGOqZlyRPP2+njR07dK9sjMRMueemVbAcdjclnHkfg=; b=N8Xi7K0T77IyRLswz+57mw05u+DqYIZguU120z7qp7quBARgOhw0oabwC+Cg02BPsWRUEKo7
 OUx1rDvytXszJIAM0Nizh/epLfJe8mg7SEBXQMKOScNDkr02GGMsoho1lXMyFxRHmwU4iyVg
 FnAgOETggldXw7NQ1ennlHSC3SA=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 604da9034db3bb68012f09b2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 14 Mar 2021 06:11:15
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A8CD0C433C6; Sun, 14 Mar 2021 06:11:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7AEE9C433C6;
        Sun, 14 Mar 2021 06:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7AEE9C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: [PATCH v7 0/2] Qualcomm's lpass device tree changes for I2s dai
Date:   Sun, 14 Mar 2021 11:40:52 +0530
Message-Id: <20210314061054.19451-1-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These patches are device tree changes to support audio over I2S.
Changes Since v6:
  -- Changed mi2s node names
Changes Since v5:
  -- Removed lpass macro in codec dai cell
  -- Renamed multimedia dai codec alias name
Changes Since v4:
  -- Removed duplication of dai-link in sound node.
  -- Replaced reg values with common dt-bindings macros in coachz dtsi
  -- Included sc7180-lpass.h instead of qcom,lpass.h
  -- Sound node placement change in coachz dtsi.
Changes Since v3:
  -- Compatible name changed as per trogdor 
Changes Since v2:
  -- Sound node variable is added in sc7180-trogdor-coachz.dtsi.
  -- Audio-jack property is removed, as it may create conflicts with the boards 
     having different codecs.
  -- Replaced reg values with common dt-bindings macros
Changes Since v1:
  -- Ajith's Certification is added.
  -- Alias name added for sound dai link node

Ajit Pandey (1):
  arm64: dts: qcom: sc7180-trogdor: Add lpass dai link for I2S driver

Srinivasa Rao Mandadapu (1):
  arm64: dts: qcom: Add sound node for sc7180-trogdor-coachz

 .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  | 10 ++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 58 +++++++++++++++++++
 2 files changed, 68 insertions(+)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

