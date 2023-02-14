Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0B56968DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 17:12:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbjBNQMW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 11:12:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjBNQMV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 11:12:21 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC0906A74
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 08:12:19 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id qw12so41399949ejc.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 08:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSSJt+kS57U0b/aHhy8b1Fqf1a7DeUwwB+89+sI4SVk=;
        b=QsrTeUZSVGH9EShX9wKA+T7kbQ2HkC8lwKIvipZSOz4e26YMdLsxl4MsiIAxumiPLD
         CMXc5emgp1c9PzkGQzf7sOE2Rh5HghYo85DWydqaJ2QqyJ61E3o4Q0tGUCp0ZRvWvUpx
         7v3WFu3uWWZcQk72Yc0/86/Fto9lEKREjx/Igmz9pGKUU7OBxgohzb9cx2p29LkmPzj7
         u0d5Z7JSGRyfoJsrXDvG5H87GQWA4LFimX+Adt91LDU/7h1vhSviS62WapmTDCApWu5+
         m4BQdrlsfHEyhvSfKy63Vv8euEdz/16iM2EIEoacMcmJSibGQk+U2ytmP59kw/ix2jzi
         oCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSSJt+kS57U0b/aHhy8b1Fqf1a7DeUwwB+89+sI4SVk=;
        b=CJ7lAEDgV3vUKChiuSaFcLsx7oB311Y/u2DNrdALvi5km5YmItm+wctsWAMooae7KU
         XuDW2W7edPelpCSxV/SXjSdyiNcW6Lkr0PVV1siXQ9nH2+yPMYC19YzO7DGn3k4XIKZk
         L4ud8OhEbkyC/DKnzDL+hCxySuD7Nlpmp9s0nkJv/fqJuPgEmROJOVc4rrB7g3XtIdHU
         Ivn5bHtHFXbne5O9oI0mN3LUclxK9utVKLb5uOSp6EFF33iWNlZ4SRihVg7mYwPyfZ3Z
         PmsnbJlygLQ16Eb/+6ONuZwd4iBf5onRORAVbMgveGdhn94bOSRxnbMxbB1tCM0kmY6j
         FpwA==
X-Gm-Message-State: AO0yUKWyboW0ptpt4HGikE7vIkbIRar2dYAZK7hj4KZFrWeKwcuqJqjt
        LYqZPUbX9/9bXZyoip1K+c8gJQ==
X-Google-Smtp-Source: AK7set8CvtgB6lgS8atTtIoeVZSiaBuTr5BsZWys+evJgwp5Xl7FFGgfJIXV6FssOtro9RbVbZ8duQ==
X-Received: by 2002:a17:906:52d5:b0:886:7eae:26c4 with SMTP id w21-20020a17090652d500b008867eae26c4mr2897375ejn.5.1676391138332;
        Tue, 14 Feb 2023 08:12:18 -0800 (PST)
Received: from fedora.. (cpezg-94-253-130-165-cbl.xnet.hr. [94.253.130.165])
        by smtp.googlemail.com with ESMTPSA id de56-20020a1709069bf800b00878530f5324sm8564376ejc.90.2023.02.14.08.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 08:12:17 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     luka.perkov@sartura.hr, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 3/4] ARM: dts: qcom: ipq4018-ap120c-ac: align SPI-NAND with DT schema
Date:   Tue, 14 Feb 2023 17:12:10 +0100
Message-Id: <20230214161211.306462-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214161211.306462-1-robert.marko@sartura.hr>
References: <20230214161211.306462-1-robert.marko@sartura.hr>
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

SPI-NAND node name should be flash@1 and not nand@1 according to schema.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi b/arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi
index cd2a32d0d5548..bb0c888b048ec 100644
--- a/arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi
@@ -186,7 +186,7 @@ partition@190000 {
 		};
 	};
 
-	nand@1 {
+	flash@1 {
 		compatible = "spi-nand";
 		reg = <1>;
 		spi-max-frequency = <40000000>;
-- 
2.39.1

