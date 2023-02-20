Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F80869C813
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Feb 2023 10:56:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbjBTJ4u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Feb 2023 04:56:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbjBTJ4u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Feb 2023 04:56:50 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C35CDBDE3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Feb 2023 01:56:48 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id g1so2064513edz.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Feb 2023 01:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I3LaiP62Ub+1bPHpSVnzKmjmu1lGjGamLIIbRLJsLSY=;
        b=Rny6XPuAx7Sk3MB7fFIttlhJ7THp/8IMlgv4K9ksXCTPjiPCLLePzv+W5Hr2stIN4M
         1dChMPJhfXVRF3JX4oepBWRdhbDR7yrwGmYioetPjDR+cAQ65ym68SKmfnJ2+7YEF4U1
         Yrs0nNT6tCVGReIPS9Ex1ssEZKUFPVOGKBlgJQ4P5YswIlXZyOAt3oBDk4zgHVDdaRbl
         na1vyqXbmK+iU5WiRsYaOV33juVMCSmlfAweL2IjQYzQG31IfGSZB0QAMQXIf5DFOt7A
         TA22y+o0Wl0n3eKKLqY+IDbxO0r4VfIwi1nyVEDtTkjVj0Bg9iKWvVD4XO78rmX8S0WU
         L/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I3LaiP62Ub+1bPHpSVnzKmjmu1lGjGamLIIbRLJsLSY=;
        b=EarAPH9QvRZxqB3fE5R9zkNgZ2NFbHqqipflMbooX/02TZIcfP81tPnyNbJDvo4kX4
         6+SvJDFk6rnj8FVM4vnWjCQjs9zGvuh2z5zc2TfMVFN/Znx7Kvs8qfdfOhj65RjxDte+
         AwLyRB5eMlCN3DnGO8iY/4/edozHdEcoyPTd+AojEV+bX/mB1Ay6CdLpgoEUZuyphxOg
         AhrGv/GVyWFMcybAlx+1SwWYBjIQs3eArnN3ICRswOfFCkRWJQ8EV6cbZIvVPpX5Ihdk
         0Wevh+Lt8SeQJUxr47GX62zvasEFoPCWjakKlKVgovQQ3FR3/YwgKF4wyG14ks58ljAw
         Ky2Q==
X-Gm-Message-State: AO0yUKV6YvlN5fdYs1kTM7OflsmbhO5mXO1livRLc5FaufH12hwxgPNL
        rDKKk9RAD2sXSBSjBoGm8WcEaQ==
X-Google-Smtp-Source: AK7set8fToKzilOyL2I4p6Bi7iekOkQRKH9anegkGP7crjC/5wFvruat7FXl54OI/yFlD83V4hEbRw==
X-Received: by 2002:a17:906:f0d1:b0:8b1:3009:536b with SMTP id dk17-20020a170906f0d100b008b13009536bmr7775763ejb.29.1676887007310;
        Mon, 20 Feb 2023 01:56:47 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id b25-20020a17090636d900b008b129b7f4e4sm5513120ejc.167.2023.02.20.01.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 01:56:46 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ASoC: dt-bindings: qcom,wcd934x: Reference dai-common
Date:   Mon, 20 Feb 2023 10:56:42 +0100
Message-Id: <20230220095643.64898-1-krzysztof.kozlowski@linaro.org>
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

Reference common DAI properties to get sound-dai-cells description and
allow name-prefix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
index ea09590bfa30..ae8346b9d332 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
@@ -151,6 +151,7 @@ required:
   - reg
 
 allOf:
+  - $ref: dai-common.yaml#
   - if:
       required:
         - slim-ifc-dev
-- 
2.34.1

