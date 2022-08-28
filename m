Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C462B5A3C6C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Aug 2022 08:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231967AbiH1Gvc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Aug 2022 02:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231223AbiH1Gva (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Aug 2022 02:51:30 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73CB24F1AB
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Aug 2022 23:51:29 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id x10so5214227ljq.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Aug 2022 23:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=3zCcNLolaqiU0nv+kOVUbxb7najvSem8qb3ELh4TmaM=;
        b=WcH20wJApxcf5iBftpYgn1YWEcSXqwQHzBIDi7l7zh7L+Ap3Dmk3yZOxSyScrKzxoF
         x+FrU4btEKg22TwadlUOkGbfRzPz34uYhOF3SObhueCszKk6HXi57OXWZaRn8ndfanSc
         /ywWxp3d6u5dGCjmoUFD15fdQIOKvMjrz41Fuz7fk93S0npTXnkNU9hPz3mSTXiaeikk
         zn95KebR0Xt+esnyzSgMrfQJrgYoak9pDyud+ORHm42YcVV4lgBPigtSTGIUGEDPQUSQ
         GLXp6lTy75ClU4hJnWyO+hpCYy866OvWlFkqGuL+FpVjBwrWGT2gtQd26GmEykTHhPQs
         SLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=3zCcNLolaqiU0nv+kOVUbxb7najvSem8qb3ELh4TmaM=;
        b=TiQrhm9RAZtC9Lw6F2aNM/xaJPaaHEXCYeI8t3JD+2zN5B8i5QRm69oSKEk8R5WEzt
         V/K8gXmXpXZUSnEKr7MGVMdrKy/Y+YgLfZUqDOjD4GyTtnrotjoM8HNExpjgOjPftlb7
         zlf97MUnE4U9eV5FuQNT69pAH7+3E87pGRMNXJSepyRhqwAqQyHXIoWcsO0iUZXqd7HP
         /pJxvz4qRZJl5vm1TdAkGYuqqM9bBD2n0lifwn03+Eh6YNLSwg1ZV2NEW9CieXTWDg3m
         KowaFQb2Bd6kpGTGG3Gw6DX29yxc/kjijIZ5N2hiiNiAUlbNPAm8rfxJ1uHW7DzdXuFc
         3neQ==
X-Gm-Message-State: ACgBeo0mS7Liu01D+KtDFDxbGD31r919Kzm4P0JoTYVaZLFxYn3Nzb65
        dE4T9TZbvkojatjM40kNjDfv6A==
X-Google-Smtp-Source: AA6agR4pYtBXlMk7OgqtW+RTEqcGnsxXeIkI19Ye2nV0OWGNmCpMvosD7URoa3so2N2p0jXxBhT1ZA==
X-Received: by 2002:a05:651c:54a:b0:261:e131:6496 with SMTP id q10-20020a05651c054a00b00261e1316496mr4072523ljp.281.1661669487799;
        Sat, 27 Aug 2022 23:51:27 -0700 (PDT)
Received: from krzk-bin.starman.ee (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id f29-20020a19381d000000b0048af3154456sm870586lfa.146.2022.08.27.23.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 23:51:27 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: add missing compatibles
Date:   Sun, 28 Aug 2022 09:51:23 +0300
Message-Id: <20220828065123.39734-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Conversion from TXT to DT schema lost several compatibles.

Fixes: 3f5117be9584 ("dt-bindings: mfd: convert to yaml Qualcomm SPMI PMIC")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 2a5bafe0660a..f4e1e64a6ea0 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -43,9 +43,11 @@ properties:
           - qcom,pm8005
           - qcom,pm8009
           - qcom,pm8019
+          - qcom,pm8028
           - qcom,pm8110
           - qcom,pm8150
           - qcom,pm8150b
+          - qcom,pm8150c
           - qcom,pm8150l
           - qcom,pm8226
           - qcom,pm8350
@@ -56,6 +58,7 @@ properties:
           - qcom,pm8916
           - qcom,pm8941
           - qcom,pm8950
+          - qcom,pm8953
           - qcom,pm8994
           - qcom,pm8998
           - qcom,pma8084
@@ -64,6 +67,7 @@ properties:
           - qcom,pmi8962
           - qcom,pmi8994
           - qcom,pmi8998
+          - qcom,pmk8002
           - qcom,pmk8350
           - qcom,pmm8155au
           - qcom,pmr735a
-- 
2.34.1

