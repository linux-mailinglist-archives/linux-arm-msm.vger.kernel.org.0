Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE1805E7F65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Sep 2022 18:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232761AbiIWQQV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Sep 2022 12:16:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232565AbiIWQQO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Sep 2022 12:16:14 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B246133CA7
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 09:16:11 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id a2so1054866lfb.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 09:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Lrd9Ag3kQFn9grspIehTV3wHAbbn3W40XhTDucisaac=;
        b=vG4aYOJxubPZ6k9oOUcui4yAtG/ezr3PvDauAplq08/P+NNbTbNPO68rKy9FIafKJz
         ItDxDpZoF/3bTCVijyfn/6M7dPZ9XxWqM/H0/Q73hcVZg4xurB1GXsCW2Vp5X048MmuZ
         25wJxkhP/zCA29qRe2PWiLosjZkMMLfqPg13MPmVguIpOLEyuYD2wM1JD/Vcx91UhD0d
         gtCuTIojnGZCqWUcQWZJPijrXrmgRN0Xis3vzs0FpuPYKJ8jpV0sTy/iws71n9p2764G
         bJoxTL+tJNgoE0XeRgP8ursMOZCg2k7BuAnBPjCwvOQJufvCGCjPJdV61SU2xmkYAnzQ
         g6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Lrd9Ag3kQFn9grspIehTV3wHAbbn3W40XhTDucisaac=;
        b=Jzwo+20K2bu8QD1Ie9bi/Xu1AcnKgP3Ej6CpscrQVH20qEh8TM64Jal4OSFKdRZQ45
         XTloAQwYw37gsZ60vpgosZTVV4Wr79jK3iwCtMMX+2RKGbMijd9L/QGe70mdOB0S40C/
         t+7DIfEPQvMWin96HkV9xgVzos91HAmVNrGjwKnzzPaDjWdEUp7tYhSVTKyxOP7tNFS/
         BD7OEeMcEXRul6E4YXrEjZjrgjFS9VQIQwj3HtVgvCu9M7MWKGmfUbbKit2ccdHbXIrC
         eVPu7sjXTu9HhVQJtHSd4SVyCxKJ5QKLCOugh5/cMLFSbMhx3YQANNSH3mIGw6MW2GrS
         LAXg==
X-Gm-Message-State: ACrzQf2CIwL276CLrXpZ7/2Pd5EEH3ClBJfHx2NdEbCzDUVOdAsQ8cLw
        QyJJLD/KERuN1msGEd0+gnNG8g==
X-Google-Smtp-Source: AMsMyM48qFkxH4H4cuuFPOGwgMdTwjyoFcATid7MMqAGbHlAt9ZoXGyDzoY0GOQ86U7VI1ol7rP/JQ==
X-Received: by 2002:a05:6512:3159:b0:492:d660:4dd7 with SMTP id s25-20020a056512315900b00492d6604dd7mr3272431lfi.204.1663949769983;
        Fri, 23 Sep 2022 09:16:09 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f9-20020ac25cc9000000b00492f45cbbfcsm1493491lfq.302.2022.09.23.09.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 09:16:09 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 03/11] arm64: dts: qcom: sdm845: correct slimbus children unit addresses
Date:   Fri, 23 Sep 2022 18:14:45 +0200
Message-Id: <20220923161453.469179-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923161453.469179-1-krzysztof.kozlowski@linaro.org>
References: <20220923161453.469179-1-krzysztof.kozlowski@linaro.org>
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

slimbus uses address-cells=2, so correct children unit addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 9db1fce6b198..2264bba69f84 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3841,12 +3841,12 @@ ngd@1 {
 				#address-cells = <2>;
 				#size-cells = <0>;
 
-				wcd9340_ifd: ifd@0{
+				wcd9340_ifd: ifd@0,0 {
 					compatible = "slim217,250";
 					reg = <0 0>;
 				};
 
-				wcd9340: codec@1{
+				wcd9340: codec@1,0 {
 					compatible = "slim217,250";
 					reg = <1 0>;
 					slim-ifc-dev = <&wcd9340_ifd>;
-- 
2.34.1

