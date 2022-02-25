Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 200384C3DFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 06:42:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237594AbiBYFmU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Feb 2022 00:42:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237598AbiBYFmT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Feb 2022 00:42:19 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C5D02D1D6
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 21:41:47 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id l25-20020a9d7a99000000b005af173a2875so2952776otn.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 21:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P5HeReME+GcfH6o+5ceejN/BoRY5Qn6Q2pZMieR6LwY=;
        b=I87yVDO9cMlGPge/X6fJr1hxFp+dXwLYYTMb117hYBqwZH22wERp4ZmTSwpNhyZEv+
         TYlTikjN3jlnUaw/pIfYsvu+bhjMzYFGfxA48KPW0YGo9e6y5iiPSjm9LtWMF/rtKPUh
         sGtuGlo2iBYVJrljCpNDzyiokdDwhld6bAI4Fd0gsovvrvxFGustV/6nh9wiZALT+Wme
         MpHTILQjpA7dOfsAiLkIlmu7ro89vmztzOBPm+H/fUUrwCT4F0/l6kzcOghcb8WAPAGS
         ww0V6mGmf8hmIsHxfnJcl1VUFCfch0FdqR9gzZ7VL1MZrnF4bfO9npD9xT+YTUUUiO4s
         GApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P5HeReME+GcfH6o+5ceejN/BoRY5Qn6Q2pZMieR6LwY=;
        b=gOdaeKYdI3B7somKaAALdN2aIZ1FL7ZutmlEsPjI2XRqO+LVHwzozEXhzvalUApabz
         34dIGive4PgPpcoND6iLGgDY4723tanLDcdBILy0iKLQQFayMpQUQZDX4t1OuTg/4hqH
         bbpZ9OnOeFe6SdjNIwB055Mb88LUDr3w5gApvRtPRcqLkoNsp213q294fR20feVb3TZE
         Iiz7px0wLPbrljvcfubaEaBbWBDDhcn97WC0vewVx8mqmzvPWi/42LlVtbqB+AOphM51
         ZtwYuCFHXf+nZtUvV8SV1zCZS3jeHslPc5YnCYWffeyEVeoSOVzEcK6a4HLUt8EQfA3g
         +WTg==
X-Gm-Message-State: AOAM5300RUiQcr0rkjYuzJk8cKsvoFe6rUPHv7F3LmLwcptt/bwJYhj9
        1nrYXbMJHZJ4glJnUsPPk3gCGg==
X-Google-Smtp-Source: ABdhPJwQV+8TwgK5Q0ICIgzZ3e+whh9sDt2RMhN+LF5n5epY4A/U4dWnYBcelJrmuj/M/m7XJomFgQ==
X-Received: by 2002:a9d:18f:0:b0:5ad:9728:ecc3 with SMTP id e15-20020a9d018f000000b005ad9728ecc3mr2246856ote.309.1645767707008;
        Thu, 24 Feb 2022 21:41:47 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id bd32-20020a056870d7a000b000d43d4d2de1sm863567oab.5.2022.02.24.21.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 21:41:46 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RESEND 1/2] dt-bindings: power: rpmpd: Add sc8280xp RPMh power-domains
Date:   Thu, 24 Feb 2022 21:43:44 -0800
Message-Id: <20220225054345.2479565-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The sc8280xp has 8 power-domains controlled through the RPMh, document
the compatible and provide definitions for the power-domains - and their
active-only variants where applicable.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/power/qcom,rpmpd.yaml       |  1 +
 include/dt-bindings/power/qcom-rpmpd.h              | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index f48bc41d81ec..377162279455 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -30,6 +30,7 @@ properties:
       - qcom,sc7180-rpmhpd
       - qcom,sc7280-rpmhpd
       - qcom,sc8180x-rpmhpd
+      - qcom,sc8280xp-rpmhpd
       - qcom,sdm845-rpmhpd
       - qcom,sdx55-rpmhpd
       - qcom,sm6115-rpmpd
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index edfc1ff2acb3..aea23b929f12 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -117,6 +117,19 @@
 #define SC8180X_MX	9
 #define SC8180X_MX_AO	10
 
+/* SC8280XP Power Domain Indexes */
+#define SC8280XP_CX	0
+#define SC8280XP_CX_AO	1
+#define SC8280XP_MX	2
+#define SC8280XP_MX_AO	3
+#define SC8280XP_EBI	4
+#define SC8280XP_LCX	5
+#define SC8280XP_LMX	6
+#define SC8280XP_GFX	7
+#define SC8280XP_MMCX	8
+#define SC8280XP_MMCX_AO 9
+#define SC8280XP_NSP	10
+
 /* SDM845 Power Domain performance levels */
 #define RPMH_REGULATOR_LEVEL_RETENTION	16
 #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
-- 
2.33.1

