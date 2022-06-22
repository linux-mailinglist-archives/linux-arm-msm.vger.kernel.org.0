Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BACC554140
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 06:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356679AbiFVEKX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 00:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233409AbiFVEKV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 00:10:21 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0B7A33E21
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 21:10:20 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id a8-20020a05683012c800b0060c027c8afdso12181304otq.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 21:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KKIz5tnMbAzg2NTgeo3md9ebE7cBvAVZ/cPgDeboDYc=;
        b=vnUfKCyey+9D47t4+fBJNDpMiXQmXk52knlTD60xh/r1aWgbpk6QNFQvnVfIi8baWT
         nlogEZBGYb5XZGB/4BAEucIqkKW04aMSvzJLa81SgyGF09TYxv4nt2BHeRRdRmadRoIJ
         I/IUYa/OJMEA5oRx1OINg+mPjgA4/UpHRceIO9PKqmnW6NwOv87Psc1eyG11rV/UmAeN
         uu/QCPXmyjY53Am0o0Xy7KD4ajmeu73duPDWksp5KecgNjmGyYpO6RsmnqKk5y2LumHe
         9bZ3mpN50LHSnfRirzE/hkhidANsLd8xBYk64LXTFOrnGzohmdg0h5KbA8COvS375jEX
         EbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KKIz5tnMbAzg2NTgeo3md9ebE7cBvAVZ/cPgDeboDYc=;
        b=N/lP83sw6thgrEcQl+AkDO27+rhYg60T6qyNWdc6Bkm7HNovf7QSqxIjgxATbqeBOd
         oRJXsznjlv6ogBxp+dwPjbNqIFb0f5rarh7N2Ia85lD9SboJGhvds/+M3+rGv3Z+rilO
         7Ketnliu/V3B9RuMPRWUgpUDfAoOhhHe0qGN34JDa0lPtd88TzSqv6miR8I5yc/hht+7
         S71xcdWLlRunVOsTS+yiXEzU5LzNbcl2UcBJz2R4ZaZs7sgepCkqMntBr5TX3C3otwsO
         oSnskh8/V7t/n9abelXsQtMDwzqxdpkfsr1W+uLRkwNNLhJCLAh0Jr1eDyK+JTLUhxnf
         mAew==
X-Gm-Message-State: AJIora8B65sIdWJ3E935TBzeqtef5bvusfCI5CehOUBDfmMkLn2gg1Lq
        9EbYVujuM4AuyBijgOeJd2iwfQ==
X-Google-Smtp-Source: AGRyM1sWT0gOCuqBLlvADMHlst9VYSq5f2w5tIFcioSWUzKDFU8DOoqY4cd6CePeFZGAP2deC2pa/Q==
X-Received: by 2002:a05:6830:6306:b0:614:c6db:9d3e with SMTP id cg6-20020a056830630600b00614c6db9d3emr714330otb.60.1655871020116;
        Tue, 21 Jun 2022 21:10:20 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b7-20020a056870918700b000f2455e26acsm2314718oaf.48.2022.06.21.21.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 21:10:19 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] dt-bindings: arm: qcom: Document additional sc8280xp devices
Date:   Tue, 21 Jun 2022 21:12:19 -0700
Message-Id: <20220622041224.627803-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220622041224.627803-1-bjorn.andersson@linaro.org>
References: <20220622041224.627803-1-bjorn.andersson@linaro.org>
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

Add the CRD (Customer Reference Design?) and the Lenovo Thinkpad X13s to
the valid device compatibles found on the sc8280xp platform.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Added the two missing board compatibles

 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5c06d1bfc046..6ec7521be19d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -238,6 +238,8 @@ properties:
 
       - items:
           - enum:
+              - lenovo,thinkpad-x13s
+              - qcom,sc8280xp-crd
               - qcom,sc8280xp-qrd
           - const: qcom,sc8280xp
 
-- 
2.35.1

