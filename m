Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E785E217EE3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 07:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729320AbgGHFJj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 01:09:39 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:35726 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729500AbgGHFJj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 01:09:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594184979; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=0JJ9DbrGUQIwDT0ndajoi50M94kcat3XIqEpPP6r3Pw=; b=l8kf/gm799XrpdpjxAjggDzJU1mGadSuz7AoIPoWHied1f20XCZLVF2wRsdVMUk0wnHANPPp
 3KSvuwnqo4RRxNQtiFkkTdVXwAAkcEDN8X2hyP6t7Npg2ZtX0pelFFFgJCpYsMfI8Jbs7tsc
 XPEHNOpAv0KXoqmiecNC0/XgQtU=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f0554f8c431f7323b614aef (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 08 Jul 2020 05:09:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6B771C433A1; Wed,  8 Jul 2020 05:09:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rohkumar-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rohitkr)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 794C7C433C6;
        Wed,  8 Jul 2020 05:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 794C7C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rohitkr@codeaurora.org
From:   Rohit kumar <rohitkr@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Rohit kumar <rohitkr@codeaurora.org>
Subject: [PATCH v3 6/8] dt-bindings: sound: lpass-cpu: Add sc7180 lpass cpu node
Date:   Wed,  8 Jul 2020 10:38:14 +0530
Message-Id: <1594184896-10629-7-git-send-email-rohitkr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add dt-bindings to support "qcom,lpass-cpu-sc7180" node.

Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
index 32c2cdb..04e34cc 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
@@ -4,7 +4,8 @@ This node models the Qualcomm Technologies Low-Power Audio SubSystem (LPASS).
 
 Required properties:
 
-- compatible		: "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu"
+- compatible		: "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu" or
+			  "qcom,lpass-cpu-sc7180"
 - clocks		: Must contain an entry for each entry in clock-names.
 - clock-names		: A list which must include the following entries:
 				* "ahbix-clk"
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

