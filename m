Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06F5D20766B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 17:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404108AbgFXPBk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 11:01:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404102AbgFXPBe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 11:01:34 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F7EDC061573;
        Wed, 24 Jun 2020 08:01:34 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id o2so2844109wmh.2;
        Wed, 24 Jun 2020 08:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bVP8UZ4IHKrL+X8gjnWR8bdS5bGguU8e2dXcySpdCyo=;
        b=txxQqYanhxjipxL7sbiuRoaplL6XH1yoiMXbPpam3DlZQQQCPEo89KUSvsIwOFnCpE
         XPgDt3TMKRiGVbqV/ocfa0PtnuQVnA1cXDs+9pKY3Jepyf7g7/vm4WfAB90k+PEYTHJG
         HquMXSy7G0l0C2YKUuk/CeWWVFNaQcsEPMN3jm7QozCQ6idLmuynOOOgOw5W9ASYbPif
         UZkPer+wR1Kvblddgq/bVI374V1irJVBciGM8LH7kJl7He2wGxY8mrNX2Vym6T3ycOx4
         QVpH+aaA4DIMVOv27o6Rjp57CAzdxnqfyf2KuJ4axu+JK+mpzYo9S2C8dbJDHnvDLSns
         WJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bVP8UZ4IHKrL+X8gjnWR8bdS5bGguU8e2dXcySpdCyo=;
        b=EA7IeyJXSAp+6Mb11i8gbKektzurktOpianKn6XFyycUeIKseYyaarvAPInOAatBuY
         um7XC1R4c13uERH32U0UreU6CDOAqJzGbFuFhuy5HI2lJbWi/cs9lz7Y4ZGxcx7MFkOq
         sinjoueDP9Rk+Jv1jKYwi2ZVYpXlYWSBMnlPG6NC8WsOTcSljRsi6Ph0L/dsFBfiUoog
         n9eKbiPGq7gD5D6FPdkhLyw6ionx1s53JMQKgu/VIbvmLIZh8X2Lecz+8Uw2GZ+7ugcI
         OHiH7NG6joVlvVbuY94RqKdsZljRxVOZ6bAp3DP8kmMS3lWOEgUntWmuJCXGcsy9EZZp
         xgNg==
X-Gm-Message-State: AOAM5332h5/3qUdl0OooBCN10bitKn6pYkQyK50FYL8FmxFDFA13+PPj
        41frYcUVfefNySHS1IL44RE=
X-Google-Smtp-Source: ABdhPJwsj3r17OahPuQ/1bBpEarwkSDglbOUxSUYkoEdopFSJoCPQHptlXiIXYnlLKwN8GKOtMqQJg==
X-Received: by 2002:a05:600c:2dc1:: with SMTP id e1mr17000897wmh.108.1593010893119;
        Wed, 24 Jun 2020 08:01:33 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id s8sm21339390wru.38.2020.06.24.08.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 08:01:32 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/8] mailbox: qcom: Add msm8994 apcs compatible
Date:   Wed, 24 Jun 2020 17:01:03 +0200
Message-Id: <20200624150107.76234-6-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200624150107.76234-1-konradybcio@gmail.com>
References: <20200624150107.76234-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8994 has an APCS block similar to 8916, but
with a different clock driver due to the former
one having 2 clusters.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml   | 1 +
 drivers/mailbox/qcom-apcs-ipc-mailbox.c                      | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 12eff942708d..5125ca3533d2 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - qcom,ipq8074-apcs-apps-global
       - qcom,msm8916-apcs-kpss-global
+      - qcom,msm8994-apcs-kpss-global
       - qcom,msm8996-apcs-hmss-global
       - qcom,msm8998-apcs-hmss-global
       - qcom,qcs404-apcs-apps-global
diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index cec34f0af6ce..6d892136e0e6 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -41,6 +41,10 @@ static const struct qcom_apcs_ipc_data msm8916_apcs_data = {
 	.offset = 8, .clk_name = "qcom-apcs-msm8916-clk"
 };
 
+static const struct qcom_apcs_ipc_data msm8994_apcs_data = {
+	.offset = 8, .clk_name = NULL
+};
+
 static const struct qcom_apcs_ipc_data msm8996_apcs_data = {
 	.offset = 16, .clk_name = NULL
 };
@@ -146,6 +150,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
 	{ .compatible = "qcom,ipq6018-apcs-apps-global", .data = &ipq6018_apcs_data },
 	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq8074_apcs_data },
 	{ .compatible = "qcom,msm8916-apcs-kpss-global", .data = &msm8916_apcs_data },
+	{ .compatible = "qcom,msm8994-apcs-kpss-global", .data = &msm8994_apcs_data },
 	{ .compatible = "qcom,msm8996-apcs-hmss-global", .data = &msm8996_apcs_data },
 	{ .compatible = "qcom,msm8998-apcs-hmss-global", .data = &msm8998_apcs_data },
 	{ .compatible = "qcom,qcs404-apcs-apps-global", .data = &msm8916_apcs_data },
-- 
2.27.0

