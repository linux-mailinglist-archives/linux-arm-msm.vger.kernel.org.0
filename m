Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5FF669E02
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 17:28:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbjAMQ21 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 11:28:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbjAMQ2F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 11:28:05 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 122057D273
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 08:22:20 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id qk9so53498376ejc.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 08:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M9oKZpLB3KLxNjht49zMQ5zevFbZ/bcUUbDkM3FfyYA=;
        b=yz/VebqfEp1bmhZjr9FNC1ihtfQnR9SeGG3hAJziFTTvriFYLQCyTY3TTjL93C5MKA
         hla/sInL4jnIB1nKZJAyFRBaHSvNdGSCqqZ1I7hDPhrRKfuTr+RoZB1E0MKx7oZVY64h
         iKU+DDNYQwUUUhZ92UbsIUHk8by803W17KKNdpFFLyZgiCP0zpkV0zdfePV1+aUnlNHc
         6vaJvgT3KNT60pZ6cszElSPhqfX9BBB4po46IhOvJkB6fmZ8MogstCBzywuA0vKjrhle
         hSB+ykAAJ6lFL+C/Tnf1soGmRB9OLBE4I3n0/uFJOonGnzDcY/PYQW1z6MZUl6Se2Ndm
         garQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M9oKZpLB3KLxNjht49zMQ5zevFbZ/bcUUbDkM3FfyYA=;
        b=qAEnApdHdVZThhQS+qYq2LYq7MZdjuGYTXQZrkA2StJb537vlI6LGtpJxQ1lC2hH5Q
         UTx7L34BGgW5FvRh5vSx7ylnK9Tn5MxdQu45L//Ia0CyyIqxNjgiFM2LYaFdmvRDQ66J
         EZR1bABd/kYU+Bznm2S2IVUrI/2gC6ztAIOxx0Isap2/Rb+HBVPGLz5tgG9nmhKhtKAn
         uqGJmFvJWUUFDkRGVfVNgXLZBJaBGcMDLL5BRe/Kx/f/jBrwGz825bewg9aDYXfvL7P/
         I4HBib6yqNc5d/nZIT+awvtkuY0YwnyPS/IdELiMh+Lq2rIjnsfKYraBV8eigcwdjqAG
         fBXg==
X-Gm-Message-State: AFqh2krPr/DABWNhcNMXHFyjFUVGy2wynLloIeydZCFYQTsxwHC6U/8q
        1hJX+mfYjxGkGnGfdAMCmxol9g==
X-Google-Smtp-Source: AMrXdXvd45K78hFtMbn/TLgUzGtyghVKPnuwBJk4k2UCCXd5I59g2iRZLy7eqsLZ58B/VpDHcrS18Q==
X-Received: by 2002:a17:906:7fc3:b0:7c1:10b8:e6a4 with SMTP id r3-20020a1709067fc300b007c110b8e6a4mr65343071ejs.19.1673626938650;
        Fri, 13 Jan 2023 08:22:18 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o11-20020a170906768b00b0084d242d07ffsm8376737ejm.8.2023.01.13.08.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 08:22:18 -0800 (PST)
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
Subject: [PATCH 1/3] ASoC: dt-bindings: qcom,wsa881x: Allow sound-name-prefix
Date:   Fri, 13 Jan 2023 17:22:12 +0100
Message-Id: <20230113162214.117261-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reference common DAI properties to fix:

  sdm845-db845c.dtb: speaker@0,1: 'sound-name-prefix' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
index d702b489320f..ac03672ebf6d 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
@@ -15,6 +15,9 @@ description: |
   Their primary operating mode uses a SoundWire digital audio
   interface. This binding is for SoundWire interface.
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: sdw10217201000
@@ -39,7 +42,7 @@ required:
   - "#thermal-sensor-cells"
   - "#sound-dai-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1

