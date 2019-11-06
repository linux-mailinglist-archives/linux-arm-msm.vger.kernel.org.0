Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99087F0F27
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 07:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729935AbfKFGuz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 01:50:55 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:44830 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbfKFGuz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 01:50:55 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 59BAC611A0; Wed,  6 Nov 2019 06:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573023054;
        bh=B0DR9mDhcMYGLkJjC/rUMgxQoPERFyhpr4W769Alybo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ou/bZ0lQ56Ditu1Q7mG8CxzOR0xQOYxYfl+ipR7SHN/EJ3ZMMlFsH+RqLs+NGZtiw
         6AwzPGckHXr+Gh1h2bcskAFN0i9b4MHvffHl7gz9FosWm/65QufHeG5PDbb2FnitMI
         meCb8C4c7fgklM7uBk4VFlCYWcLkQN5xMtOWSFqE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9A18D60A1B;
        Wed,  6 Nov 2019 06:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573023053;
        bh=B0DR9mDhcMYGLkJjC/rUMgxQoPERFyhpr4W769Alybo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CGEdfMw2AE0t4Nzl4tl9DZL+j+yBbR5L+VbiykhO5r8nRqH3kYfSW79cUpMunJLKb
         G7uyBTxCtndu1e2vf4q0A/Ibv0hbk+Yj0twYAD0PJ53INygM1Bh9eEyAWiV/i4fTzN
         U+/ZpGYrRmyj27u6boQPku7uNZb/4YR+QM03CMec=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9A18D60A1B
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        swboyd@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v4 01/14] dt-bindings: qcom: Add SC7180 bindings
Date:   Wed,  6 Nov 2019 12:20:04 +0530
Message-Id: <20191106065017.22144-2-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191106065017.22144-1-rnayak@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a SoC string 'sc7180' for the qualcomm SC7180 SoC.
Also add a new board type 'idp'

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
---
v4: Added schema for sc7180 IDP board

 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index e39d8f02e33c..11c3c02d8a80 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -36,6 +36,7 @@ description: |
   	mdm9615
   	ipq8074
   	sdm845
+  	sc7180
 
   The 'board' element must be one of the following strings:
 
@@ -46,6 +47,7 @@ description: |
   	sbc
   	hk01
   	qrd
+  	idp
 
   The 'soc_version' and 'board_version' elements take the form of v<Major>.<Minor>
   where the minor number may be omitted when it's zero, i.e.  v1.0 is the same
@@ -144,4 +146,8 @@ properties:
               - qcom,ipq8074-hk01
           - const: qcom,ipq8074
 
+      - items:
+          - enum:
+              - qcom,sc7180-idp
+          - const: qcom,sc7180
 ...
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

