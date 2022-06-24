Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 855E155A01B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jun 2022 20:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231986AbiFXSAw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 14:00:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231944AbiFXSAt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 14:00:49 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91E674B419
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 11:00:48 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id fd6so4529407edb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 11:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PVF1kQELJGnzeWwHQpr93Ja3CpfIbtJSBiq/WRe2Aqw=;
        b=yIN36rTJWuMdPh8V2chZVAKTrNjd02evEAOOBG7tnsxPBD9iRKdCNtpiHQlIf3S/+v
         KebiThdpyDKGeT+tocAPjmmfRq4WPnRqv17ZpGKUJFafQ6zbADW/PUJ3kegmq+D0j4iC
         05PzH/EV6QYXtpbQHYaULEw6PrGsYlqAZkxvWjmqZ43FHJfwmK4DhOCwNHTDsPFf7sgw
         adRZxjQc1QZ7ezPre4Tt/xPueepCmNqgPVPqH50irrTonfZg9SEsUeCcHL04ijzfgIwc
         njm/a1PzRqx5k2k7kwL2bTVD0qSCxANDzg4nK9PnT1OAK6Hh1/mRtElmAn7Z0+zg2TGr
         eY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PVF1kQELJGnzeWwHQpr93Ja3CpfIbtJSBiq/WRe2Aqw=;
        b=OISg+DMZkaf/T6XSvC3dT1mi1kQHbCN2kEmunFknKhX9x4pFau3r23hqHvrREtAb12
         NTk4cFiwufY86+2KccZa1LOPdmakTai89ouU3NwSkLCQ2rTKXXSeY07J9fVmmLpr9C6B
         LpSj8mR/751EgaJFDveVLE1SZiXCFlnYhf3yk0+3xVljjp2dXgKVkI6WOlgfQnTNXZqz
         ig6sH0kg1GuLgyHOudBZj/symW44yWLjWe/0oR7LJFwhPmck4pf0NhxrubioCCJ6Nx69
         sQoidzwmE4iUOyaQ+Rr4/rLFMmWXGkA2fyviUrA7nCmLQfN/ZO8hP25MkzrDI+DV4CfU
         FLcw==
X-Gm-Message-State: AJIora8bQ+FUepnfWUul4e/VGttadNNP5baImvcP+udsYcMFCT0myf3H
        FTY0m0JYQzX9mmri2I3FSW1opw==
X-Google-Smtp-Source: AGRyM1vWeCRg0q2tC0VvZ87RhPAlSposRAQ4DNwHRzbQ2bGcG2ZksnIijyMyr3BZjrfjTm/kH/c30g==
X-Received: by 2002:a05:6402:2710:b0:435:bf54:8569 with SMTP id y16-20020a056402271000b00435bf548569mr357638edd.165.1656093648159;
        Fri, 24 Jun 2022 11:00:48 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id p22-20020a170906839600b00711d5bc20d5sm1420681ejx.221.2022.06.24.11.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 11:00:46 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v5 3/3] arm64: dts: qcom: msm8992-xiaomi-libra: split qcom,msm-id into tuples
Date:   Fri, 24 Jun 2022 20:00:36 +0200
Message-Id: <20220624180036.102510-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220624180036.102510-1-krzysztof.kozlowski@linaro.org>
References: <20220624180036.102510-1-krzysztof.kozlowski@linaro.org>
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

The qcom,msm-id is an uint32 matrix, so a list of tuples.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
index 7748b745a5df..15467b697e94 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
@@ -17,7 +17,7 @@ / {
 	chassis-type = "handset";
 
 	/* required for bootloader to select correct board */
-	qcom,msm-id = <251 0 252 0>;
+	qcom,msm-id = <251 0>, <252 0>;
 	qcom,pmic-id = <65545 65546 0 0>;
 	qcom,board-id = <12 0>;
 
-- 
2.34.1

