Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C779C67269C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 19:19:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbjARSTP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 13:19:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbjARSSy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 13:18:54 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6C8559B78
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 10:18:16 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id ud5so85348809ejc.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 10:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y8rqpNSnWJoAd7RWNJ6pL6pBeBIa9y6Cr5BMeltezbo=;
        b=RNoL7UiEkkmjxXRiCl533s+afBXH1KBd4bTWyRRito1gOoPzaYIdVyjDfYW2RaNYSR
         BYsYWyB9vuZeDdevkjREhPw0rbozUv9r8gZ/PAPM6wNp7O3tc4WXkkoDGpSjlv3b/sAV
         Evu0HW+Bw2NckrwpzxobIkflnjy7EONMlNm/Vr/Y7Umf1CcxwstEoEYNufVcZCYi0ysm
         0PeLOyVQRCpR363Jm7OuhnRJLgz3JBeyuC9wNTZpC4ISzdkJtEzsQAHjfjfUDRI8CI77
         KjVYqa3OmR9eJqBybOqBradgUnh38veYzybOwjTSln+hiRM9vEMOfwBzgtS1WNL1L086
         DDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y8rqpNSnWJoAd7RWNJ6pL6pBeBIa9y6Cr5BMeltezbo=;
        b=n3E8I3U6lQ22lDa6c/1/MtE5zH1XYckSQlmgb8blfesVBpNhvfG6343SrIHnmvKFno
         wOIJ1k+ED/LcFS3rPjrCCXxUWFsttLVhbua7JA2mu/rDckcRtt8KxWciUoCFE70i44aZ
         zKtEfIM0OwLZ7ALu/YjE+0l2fE1yrzsrkgcCKzMR19/7WP0DPrFCPRaMX90P+NLTNQeR
         8to31GZyGtLOKHSG4ucMGh3eP4/O3/THhYL0lNHm7R+Td+RE6FpIfXf6SMkXswaab1Bd
         Mb83t5qLp7K7jsJdj3XOtkXx9eYj3FyXk3G//91bnZ0gBwhaJTDBkZBH4U2xbD9uLohj
         GhrQ==
X-Gm-Message-State: AFqh2kojB2BixZYdEC7fWynH0ORLPQCzlhzR/lK9FPvpfT/mh87osZSW
        q8Mmwsf9r5HrNFaW/bDYxJrz0u7MuuaG8DOo
X-Google-Smtp-Source: AMrXdXtxFdF8DT83LJssmcSGedCQyhhgbv5d4EsL08lnegVvAzV1P/QbgamA2nxPLvARf+7HVoTbjA==
X-Received: by 2002:a17:906:33cb:b0:86d:7c0e:c816 with SMTP id w11-20020a17090633cb00b0086d7c0ec816mr16910788eja.27.1674065895323;
        Wed, 18 Jan 2023 10:18:15 -0800 (PST)
Received: from localhost.localdomain (abxh150.neoplus.adsl.tpnet.pl. [83.9.1.150])
        by smtp.gmail.com with ESMTPSA id kw16-20020a170907771000b0084d43e23436sm13103711ejc.38.2023.01.18.10.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 10:18:14 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2] regulator: dt-bindings: qcom-labibb: Allow regulator-common properties
Date:   Wed, 18 Jan 2023 19:18:10 +0100
Message-Id: <20230118181810.119922-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
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

Allow regulator-common properties on lab/ibb regulators, such as
regulator-always-on, etc.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v1 -> v2:
- Remove unnecessary quotes

 .../bindings/regulator/qcom-labibb-regulator.yaml           | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
index f97b8083678f..e987c39b223e 100644
--- a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
@@ -20,7 +20,8 @@ properties:
 
   lab:
     type: object
-    additionalProperties: false
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
 
     properties:
       qcom,soft-start-us:
@@ -46,7 +47,8 @@ properties:
 
   ibb:
     type: object
-    additionalProperties: false
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
 
     properties:
       qcom,discharge-resistor-kohms:
-- 
2.39.1

