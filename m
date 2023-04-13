Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A075C6E0CA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Apr 2023 13:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbjDMLfa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Apr 2023 07:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230397AbjDMLf1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Apr 2023 07:35:27 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0CC36183
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 04:35:08 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id e7so3815808wrc.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 04:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681385689; x=1683977689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1wJGhk6eNxrij0z+TLCnwDTUzj6ro7sb4oPdR7zNkk=;
        b=uZPFFvIIAA+BZJJcxRPRtjVVFbwU+RbD1HX56N3ommbVr10p+JPWv1S9rg50Z3KF6J
         +ZkqxZduvm0L6Aqx4ogZF/6tv8pXwB1eIttJh4GtnoQLwAQMqZuPOmzkS4UHMWQuNyEJ
         uq3njh5HUC0gccpHpo8P5dShc+PHOAUENJo4inzDpm0dXxKTqJ2BNzuqboPVk/V8Ad4S
         KAH0Xf/IvCBzkM+pS+qrRVm4Xr1S2vCFyTg9jfMuKPSB/PHDWNR+C1+UNvx9WG3J2f/k
         rIM1Pnzd1z3ZLsPNmW/KUOpFrOtbmo/80uxkUGplyaSIxkk5hB7NDjcVI9Oc6QJvFF6k
         jlcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681385689; x=1683977689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1wJGhk6eNxrij0z+TLCnwDTUzj6ro7sb4oPdR7zNkk=;
        b=P32pQoVa6q4gltLJ6R6isSow7QorJQW/v2SnyiqjXriwnouUBMugOgO5XfjyU95/AS
         2qN8fdBBbZeVcHT0MSCQBWdARZHI4qU3JkywE5yJkXy0es07oAznv9dWXcTznaC0YzXa
         vjAlyEmhg6nuyj+8Hh6RkxdGY1kcu0HzF7kl6SUnrnypsSOT355RcnryrGwYMpcN6J5S
         eIm+/R7zvtGlbPSnpX1UZrqVjfT3RB9RpPTwZ9TedBdU0wJEI9Qubgh3pdxLDtcvHRV7
         gj3y99fTieDzd5QaS75884iGbPPYpBCnsFj6KgdZFyqeMXmKsw70xQtQqJTHik0zK+I0
         LY8w==
X-Gm-Message-State: AAQBX9fGeEk5i3ENSKWbWvC88KYt19I+rbkzkiDEL0XxhWVHIF3uLksq
        372Lq+DMbEDrTRupinol2KkumQ==
X-Google-Smtp-Source: AKy350ZhWtet+LTjZOL9SZ5i9ussr1oFnjd0U08JrjzU6m9+INcQDfZqBpiNjtIHjpU2qEY4sc994g==
X-Received: by 2002:adf:f8ca:0:b0:2f0:244c:277b with SMTP id f10-20020adff8ca000000b002f0244c277bmr4800574wrq.27.1681385688980;
        Thu, 13 Apr 2023 04:34:48 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d4e90000000b002f2782978d8sm1108877wru.20.2023.04.13.04.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 04:34:48 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, bryan.odonoghue@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
Subject: [PATCH v5 06/14] dt-bindings: mfd: qcom,spmi-pmic: Add typec to SPMI device types
Date:   Thu, 13 Apr 2023 12:34:30 +0100
Message-Id: <20230413113438.1577658-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the PMIC Type-C port driver to the list of devices.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 84620ebc1efe8..a689e8d451f9c 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -154,6 +154,10 @@ patternProperties:
     type: object
     $ref: /schemas/thermal/qcom,spmi-temp-alarm.yaml#
 
+  "^typec@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/usb/qcom,pmic-typec.yaml#
+
   "^usb-detect@[0-9a-f]+$":
     type: object
     $ref: /schemas/extcon/qcom,pm8941-misc.yaml#
-- 
2.39.2

