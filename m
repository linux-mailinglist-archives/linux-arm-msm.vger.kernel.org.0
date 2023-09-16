Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 911617A30B1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Sep 2023 15:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238907AbjIPNm0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Sep 2023 09:42:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236702AbjIPNl7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Sep 2023 09:41:59 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEE5B1A8
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Sep 2023 06:41:52 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-32008b5e2d2so99388f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Sep 2023 06:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aceart.de; s=google; t=1694871711; x=1695476511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dq5MVWHSLDa3ue2z16rOjOH4TMxsojWJwYBj2T0FxCo=;
        b=QqAl+beqTosvZVcMPPmHACOVO1wqf0WgkFbKp6YylEB+2UNoUmGOZyTlhd1geG0Jmx
         g4cistb/dXZdmYFPFj0dEVv2eiogWHJEsuJALO5YCcug9N5f3wQGKgHLaHqAkPLum8D8
         b6J2+bY2DHAA3iZhrehIrlOVQAT+Ij3lkt22ZXqGhYihPOdMz9JwQzFBCaob0LcSUrvj
         J5fXwL/imBJc64vYuO7A9FM7jgZgU3OPJvKCMM8ABrCRS/OztFnIs++jd150xsaX06lh
         ax04HRPxPAOIrehIduOri9kRrz8oc1CV/YEfKn+FljR9So0nldzinLJmkqsxlz7Cd83P
         J8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694871711; x=1695476511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dq5MVWHSLDa3ue2z16rOjOH4TMxsojWJwYBj2T0FxCo=;
        b=LULyOm7Fe4dn5K6RV0J54fJA/Okx9BdjDHcCtngenuSUXzy1pKjgOsiSitLltjvlF+
         pb7ndcYyHd1qeBBwtUsdzH5IVk8CWV5zzRuCcWjVS16Q6R2Xaww2gYx/9/CATTUMTe8P
         M6yUawcnEC4w3eyZCbjWav6fhpu/rv8sJLhs3oGguEszC335TVAxU7AKaJ3acahSFDPx
         UOhwG2GkAG3zljJGb2HjkMP8qscKJmqgsH8Coj3+LzR3P66YTkhB5U6oH9YrV1rXPXxI
         Wl784PDTDkXYHUvaPln1OXRmIbJHBWrDXP8QFmG48e/6gxxPLP63G6/LIRuOwYR6m4Dg
         jhjA==
X-Gm-Message-State: AOJu0Ywf0xnbYze1y6cd/dbby+arp8YPKc7uQfbLV/oLwVq7Y854F0YX
        7rbIlZYSUp+Rdd4XAueA/n7LOQ==
X-Google-Smtp-Source: AGHT+IFl7ojvB+vli8z8CIemz0JnDFCyKUAaw6oHAfDopUyuChUSPIE5Zs0Zep4Z2vR1CrcPWYSgHQ==
X-Received: by 2002:a5d:65cc:0:b0:314:3e96:bd7e with SMTP id e12-20020a5d65cc000000b003143e96bd7emr6029919wrw.4.1694871710815;
        Sat, 16 Sep 2023 06:41:50 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8070:d84:9160:acd3:26fc:724e:a2dd])
        by smtp.gmail.com with ESMTPSA id f13-20020a5d568d000000b0031fd849e797sm7144278wrv.105.2023.09.16.06.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Sep 2023 06:41:50 -0700 (PDT)
From:   Lukas Walter <lukas.walter@aceart.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Lukas Walter <lukas.walter@aceart.de>
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add Huawei Honor 5X / GR5 (2016)
Date:   Sat, 16 Sep 2023 15:41:46 +0200
Message-ID: <20230916134147.163764-1-lukas.walter@aceart.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a compatible for Huawei Honor 5X / GR5 (2016).

Signed-off-by: Lukas Walter <lukas.walter@aceart.de>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index adbfaea32343..eabd7f6af07f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -189,6 +189,7 @@ properties:
 
       - items:
           - enum:
+              - huawei,kiwi
               - samsung,a7
               - sony,kanuti-tulip
               - square,apq8039-t2
-- 
2.42.0

