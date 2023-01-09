Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE43662523
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 13:12:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237122AbjAIMLn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 07:11:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234450AbjAIMLL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 07:11:11 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ED0E1147C
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 04:11:10 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id p1-20020a05600c1d8100b003d8c9b191e0so6513254wms.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 04:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JYqj72YDN9vX7ORYinDNrSmo+FXDzYVs0CG3Gil7Bo0=;
        b=a0qf2DV4GaUSSIZSn1jiG6E68EDzvFGQ0hZJmJiqZwGgh33HVMdTkBQAqdeTuakQrH
         PSfJg7MklfoZXaX9Kk8RzlUN3vgHu1AsJ9EDUFGtvR0e3hVRPGftlw8ZlFoYkaE7V7AD
         NXDyuEwC2huBYU6J6hNFeACy8NhQMO77DUXPkVnuETck90RZeEp2l7sTAgD9NrXtvIie
         e/PW3E5/XI5idH7KkJoaOTvu0JEWuqLxGgxxuDofNrtdr2FRfILiqhM5lNg2zSgwb7O+
         /bVtrtF/BYcNj8w+ySCeJu+Kl5hRBNR0mlOv3BEZB5Kcjbtf1C/jrglxCdRRtQzKz8LK
         oHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JYqj72YDN9vX7ORYinDNrSmo+FXDzYVs0CG3Gil7Bo0=;
        b=JVD5WX2Uy+zxBYEkZcaVyV2x/VQhOk2mHOJtkW+EsulixPL9O+kW2kNzY0MeFEyi2S
         Z2t/Ht8IoVlf+YrP5t1sQsl+BD3O1bCKFjN1u2tPCLbTagxS2vxH1Fl91bmhs3YkzX1n
         stoZyM70FCMgTwX4HWLfZ7SYR1d62UwkXMQ1Njz1y23zdZy/Lsh6cDNsEXrPqwpBG1ip
         xNSXhIjtg+NogsiCd0Igj2Nb0WrwnQ0H5NOQIbEdda8HehXGeXmHF/k66e/K0sHCSDCd
         t+MAZ1N4THGvVhL2aY4m2GbEdmVbYisMk+x4He2+v30/jxdHPVezhYd6DmCcAjpavm8e
         IgYw==
X-Gm-Message-State: AFqh2kpGwtSeFr1DeIGQMeIYoGRyB6wEvvyq8c9OXDinhDZHBiUI35p+
        AozuC7cUkD4uU28iJYHwf/5tlw==
X-Google-Smtp-Source: AMrXdXv58i0EvUFM224bVaUybSb+1rJybRzqjq0ixhhNzL6IrqeJKfJF9AArKrnFJGTO00L3hNyFDw==
X-Received: by 2002:a05:600c:2252:b0:3d3:5d8b:7af with SMTP id a18-20020a05600c225200b003d35d8b07afmr49004382wmm.41.1673266268787;
        Mon, 09 Jan 2023 04:11:08 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id l14-20020a05600c4f0e00b003d96c811d6dsm16914222wmq.30.2023.01.09.04.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 04:11:08 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 09 Jan 2023 13:11:06 +0100
Subject: [PATCH v3] dt-bindings: interconnect: qcom-bwmon: document SM8550 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221114-narmstrong-sm8550-upstream-bwmon-v3-1-7d63d2ae6bce@linaro.org>
X-B4-Tracking: v=1; b=H4sIAFoEvGMC/5XNTQrCMBAF4KtI1o4kqWmrK+8hLiY/toEmkaSNS
 OndHdy57Gp4A+97Kysue1fY9bCy7KovPkUKzfHAzIhxcOAtZSa5lEKIM0TMocw5xQFK6JXisLwo
 Owyg3yFFwM60UnZP1K1lxGgsDnTGaEaC4jJN9Bx9mVP+/GaroHPfsVAFcCDd8v5CQ426TZ5K6ZT
 ywB6kV7lXlCRKbpRSrtGo7J+4bdsX9oBI/ygBAAA=
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the compatibles used to describe the Bandwidth Monitors
present on the SM8550 platform.

A BWMON v4 IP monitors the CPU bandwidth, and a v5 does the LLCC
bandwidth monitoring.

This is described by adding "llcc" and "cpu" into the compatible
strings to differentiate the BWMON IPs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
--
---
Changes in v3:
- rebased on v6.2-rc1
- Link to v2: https://lore.kernel.org/r/20221114-narmstrong-sm8550-upstream-bwmon-v2-0-20c555e3ba5d@linaro.org

Changes in v2:
- Reworded commit message
- Added Reviewed-by from Krzysztof
- Link to v1: https://lore.kernel.org/r/20221114-narmstrong-sm8550-upstream-bwmon-v1-0-b6dd08927f35@linaro.org
---
 Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index 0c720dbde36e..12a0d3ecbabb 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -27,11 +27,13 @@ properties:
               - qcom,sc7280-cpu-bwmon
               - qcom,sc8280xp-cpu-bwmon
               - qcom,sdm845-bwmon
+              - qcom,sm8550-cpu-bwmon
           - const: qcom,msm8998-bwmon
       - const: qcom,msm8998-bwmon       # BWMON v4
       - items:
           - enum:
               - qcom,sc8280xp-llcc-bwmon
+              - qcom,sm8550-llcc-bwmon
           - const: qcom,sc7280-llcc-bwmon
       - const: qcom,sc7280-llcc-bwmon   # BWMON v5
       - const: qcom,sdm845-llcc-bwmon   # BWMON v5

---
base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
change-id: 20221114-narmstrong-sm8550-upstream-bwmon-a7c6227fab6d

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>
