Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B156C68EC7E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 11:15:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbjBHKP4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 05:15:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjBHKPw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 05:15:52 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4585F38002
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 02:15:51 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id az4-20020a05600c600400b003dff767a1f1so1063013wmb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 02:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eU6t5S19qfP9S/338lMbvl6syTeQ25IZRs/UFhzDsMA=;
        b=xAgJOQTtwNrVJrNTfT5OsEjumUulgPcqd+hkTlkBCkq9Q+8fyumZqYT004/fo9KeZh
         4eES/ylqvkP/Qmcw06wqlaSFqo1tUgkzzuLQYBPy2zokiaeNOfH3p9ecuGTWTfpLUQtd
         imQJCyYsIi1gQCM+J7YBsfjFFZpMPPlvIMCaKL+p3SKujBtA0TW6b4qR9awJM97r6vcB
         BFE8gtZz9Dripy1Y0sNQvMrC+v+j5f0KmnBbibWGDUV0YBtfpm+LvEtpk8XlaAZvmqe2
         QDTdxqjvhDWl0wH1djTencI1QckLv7cmcUVLDl8VTk8hdO1QabwL2IefQ77N1sRL8SjI
         l5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eU6t5S19qfP9S/338lMbvl6syTeQ25IZRs/UFhzDsMA=;
        b=CAvR1Yy8L042PUpxJWP1tTXl9LvzHDCQHYS1t75pavw4taHUZw61s2ouhMf3oX9RY7
         5euUDB8ER8XZtTMG8llPezDAlQvucxFBtVwga1e6iE214Z9IxK/zSrfqVlblBVDcJU+F
         v7r/Ufg/1xNqWfIr8la1YoRoM2HjqVYKyHL0TvcwHSLqNAvJFlc/5nM6wyOfzks+dyS7
         adQ5ChCjCJcr8OOCzKKg6M7/6bk1cDcgm+rEgCOX0JjYDJQJd6qioEBP1eDJDaRb4OsM
         Ib/MitlDBqcnhEx4KvXKhKLbRN6y8STssaqHS5kad79NitH4eYqCFWhmy/4F7DUFHI41
         5p8g==
X-Gm-Message-State: AO0yUKWtiuPUQzMV1wfeMrwu7xWGSo4jnL8XSDQbIgeI6+X71Cx7HHEw
        HKkSGci5wC3NogLtSzjTgEr8PQ==
X-Google-Smtp-Source: AK7set+3SMFP2OpvNgvLeXy7mER86UTqQJAVe/mbVxWgJzDl3CcIVKEZEMzUr63nz3N38oChbUWJ2w==
X-Received: by 2002:a05:600c:230f:b0:3da:f665:5b66 with SMTP id 15-20020a05600c230f00b003daf6655b66mr8239345wmo.6.1675851349867;
        Wed, 08 Feb 2023 02:15:49 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c198e00b003dc4ecfc4d7sm1496328wmq.29.2023.02.08.02.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 02:15:49 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 1/7] arm64: dts: qcom: ipq6018: align RPM G-Link node with bindings
Date:   Wed,  8 Feb 2023 11:15:39 +0100
Message-Id: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bindings expect (and most of DTS use) the RPM G-Link node name to be
"rpm-requests".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

---

Changes since v1:
1. Add Rb tag.
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index d32c9b2515ee..bbd94025ff5d 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -176,7 +176,7 @@ rpm-glink {
 		qcom,rpm-msg-ram = <&rpm_msg_ram>;
 		mboxes = <&apcs_glb 0>;
 
-		rpm_requests: glink-channel {
+		rpm_requests: rpm-requests {
 			compatible = "qcom,rpm-ipq6018";
 			qcom,glink-channels = "rpm_requests";
 
-- 
2.34.1

