Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADC085FDDB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Oct 2022 17:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbiJMP4Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Oct 2022 11:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbiJMP4Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Oct 2022 11:56:24 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FB6BCC830
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Oct 2022 08:56:22 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id f22so1633580qto.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Oct 2022 08:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=53EuV9UQ/Mb7S2v6t1ZN+F8J1ET1E/NNnIYZaJ4c89w=;
        b=Lgy5PbG81vHfv6RQxNdAQmXXP/k1ZezrEEGhcxaCM0t/jQaQly1DRe4p02VCBogocG
         lObymnOCt4QXqjddnbVnqilGqumxer15rLBrIw5l85flRjgxuSSQH0kNxt0q+Na7+EfS
         bIbOO2VofipnXOIoANb79JT3d6LIk7Pr0xZGAkv/AR8jrGVWFr9gGUQBXsJsxBDzivKF
         XzUjBV197P/ruMIrNSUXSOertRpxMsQ4V2PuuC41KfLXZ/KcHq0mVff0P1z4OIK+wm8G
         HGH3wJPOxvRMH1Kh0Ml9UYlC/iTtX/ohJfLTyNA/gx4GR+CTx0IPH44QabjW8STe2Kt2
         pYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=53EuV9UQ/Mb7S2v6t1ZN+F8J1ET1E/NNnIYZaJ4c89w=;
        b=F+LOoWKwqjJPgUHlFv2vQHjufv92LcUwk9nDGHcfkeywg5+7VFJsQyOAPjry3lmtyO
         DASGHqHbJzm1SKs/y8HFOrGoz8Tperjo+2yGDemOIpGMJVG08Nt1maJzKgl057TfsEuQ
         aBf6P2U4kHftMt/g8HKhwguRPGv0E6H69EIDDKzrTUJnDRf6BfLqTv2YFIZKYprhCY67
         9fJLDNnFsdqaVTcZ5G3uakNj902M1oN5wDpd4sb5HbDMza5IMheOpQvU0jQ7RFIuZI+K
         Z1IhUjFRn0/6MWGoV4Wo8w+Y+0uS970ZDr+d/jl+RYjFld6MduW/zshFnMIgs/gvGbbv
         CIJA==
X-Gm-Message-State: ACrzQf2sNJHNtiFfMpsyS394+w5zSvq4gV5aygikE2USVzS9Y3jZo/Vf
        BprnvbEibZNY47CenghwJGk7KsBx07HgHg==
X-Google-Smtp-Source: AMsMyM53fPPYTsXIVWFDNRdpgpqWceh6FfyFUNEx/QXaHLKh1L3yebniGuDaGdE6/zwPjjKwkRSONg==
X-Received: by 2002:a05:620a:4450:b0:6ee:74c6:7e3 with SMTP id w16-20020a05620a445000b006ee74c607e3mr388697qkp.667.1665676581797;
        Thu, 13 Oct 2022 08:56:21 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id u6-20020a05620a0c4600b006cec8001bf4sm65280qki.26.2022.10.13.08.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 08:56:21 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: Add ALFA Network
Date:   Thu, 13 Oct 2022 11:54:15 -0400
Message-Id: <20221013155418.47577-1-krzysztof.kozlowski@linaro.org>
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

Add vendor prefix for ALFA Network Inc.

https://www.alfa.com.tw/

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6e323a380294..71e51b240af9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -69,6 +69,8 @@ patternProperties:
     description: Annapurna Labs
   "^alcatel,.*":
     description: Alcatel
+  "^alfa-network,.*":
+    description: ALFA Network Inc.
   "^allegro,.*":
     description: Allegro DVT
   "^allo,.*":
-- 
2.34.1

