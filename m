Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC5C3334709
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 19:45:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232788AbhCJSoY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 13:44:24 -0500
Received: from z11.mailgun.us ([104.130.96.11]:61092 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232934AbhCJSoT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 13:44:19 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615401859; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=h3hAZU0I4gFbWFD/bqpGuh3QFw2gtv9/q8EKmXg0xLM=; b=qGSvVU7IYfAUCweqAAOacTicoE3pWJ4YJ1JbemOAQ+0ueDaqR+nnThbTZ9Uo5Vb0kE1nQC85
 BYi1lfjPxoR1dg/uvGp9nuTCadLh1LGLONtnClkpL36tiDVhYsHWJCkgL4BjWo0aKpS+lvk4
 iQMZjayRMpsc076iQfFzZYrj3sg=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6049137a155a7cd234c1188a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Mar 2021 18:44:10
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9B23CC43463; Wed, 10 Mar 2021 18:44:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8FA7BC433ED;
        Wed, 10 Mar 2021 18:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8FA7BC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: [PATCH v3 0/2] Qualcomm's lpass device tree changes for I2s dai
Date:   Thu, 11 Mar 2021 00:13:43 +0530
Message-Id: <20210310184345.19016-1-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These patches are device tree changes to support audio over I2S.

Changes Since v1:
  -- Ajith's Certification is added.
  -- Alias name added for sound dai link node
Changes Since v2:
  -- sound node variable is added in sc7180-trogdor-coachz.dtsi.
  -- Audio-jack property is removed, as it may create conflicts with the boards 
     having different codecs.
Ajit Pandey (1):
  arm64: dts: qcom: sc7180-trogdor: Add lpass dai link for I2S driver

Srinivasa Rao Mandadapu (1):
  arm64: dts: qcom: Add sound node for sc7180-trogdor-coachz

 .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  | 18 ++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 58 +++++++++++++++++++
 2 files changed, 76 insertions(+)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

