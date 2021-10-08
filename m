Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95C62426C7B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 16:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241698AbhJHOL6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 10:11:58 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:12564 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240788AbhJHOL6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 10:11:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633702202; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=5bh2ALVp/MQwLEQRzbd4cJd5QzKCjc164IpyRQOYNP8=; b=rqs0rEuTlVQlgzuMgE8ILRndzRBnV/iWbAihcR1oMIygmWiguHO9HyPxBObbrb/svsUnhm2L
 ZEyz4k1Jv/maBzRyMDKcaQ3Y63tbk5a6DFeru+GBqcPM0Vu637fJvxXW2ms+apbK18asxj/b
 vb9bRHC6/e+UrsGOt/D0b+H6VL0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6160511f446c6db0cbf8c7af (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 08 Oct 2021 14:09:35
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C65C1C43618; Fri,  8 Oct 2021 14:09:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C25FAC43619;
        Fri,  8 Oct 2021 14:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org C25FAC43619
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Venkata Prasad Potturu <potturu@codeaurora.org>
Subject: [PATCH v3 2/5] ASoC: qcom: dt-bindings: Add compatible names for lpass sc7280 digital codecs
Date:   Fri,  8 Oct 2021 19:39:01 +0530
Message-Id: <1633702144-19017-3-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633702144-19017-1-git-send-email-srivasam@codeaurora.org>
References: <1633702144-19017-1-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update compatible names in va, wsa, rx and tx macro codes for lpass sc7280

Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 4 +++-
 Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml  | 4 +++-
 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 4 +++-
 Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml | 4 +++-
 4 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 443d556..bc762b3 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: qcom,sm8250-lpass-rx-macro
+    enum:
+      - qcom,sc7280-lpass-rx-macro
+      - qcom,sm8250-lpass-rx-macro
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index 6b5ca02..74f5386 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: qcom,sm8250-lpass-tx-macro
+    enum:
+      - qcom,sc7280-lpass-tx-macro
+      - qcom,sm8250-lpass-tx-macro
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 679b49c..99f2c36 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: qcom,sm8250-lpass-va-macro
+    enum:
+      - qcom,sc7280-lpass-va-macro
+      - qcom,sm8250-lpass-va-macro
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index 435b019..13cdb8a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: qcom,sm8250-lpass-wsa-macro
+    enum:
+      - qcom,sc7280-lpass-wsa-macro
+      - qcom,sm8250-lpass-wsa-macro
 
   reg:
     maxItems: 1
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

