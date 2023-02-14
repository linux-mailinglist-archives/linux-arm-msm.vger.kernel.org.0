Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A29A6968DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 17:12:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbjBNQMU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 11:12:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjBNQMS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 11:12:18 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 882E01BED
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 08:12:17 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id t24so1082012eji.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 08:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4rNr92XTYh05KMDRB3D1RMUXt0CcOrUeKlehf1w84Dw=;
        b=eGS/GKZasLaCyDyDzyFSTvZjaTBHqH2BjuYt3cOgTL3as4epkjhnwyCVQCTGUrBr4t
         GN5h/WQGVYfhaouR2AiSF1hOcoyHQ1CJqsp8GfD7XLvUDwSdKVtcELnQaOBlTdQ8I3SR
         bhXLVsSBpIUnoagfCDAOiPs+E2SADfaMC5SyC2fx81FQWFBwZ+0RRym8+TdmRzWFQJJq
         fD1zcioIY7nP0qdO4aQOnVvBRDMSDsKG6e+sG5OnMsphypPvr0qJhPhS3qI0ALmbiL5w
         z3g4kiT4K7jBriajHagxng5lsgvVSxly9teRG6vMedZkPwG2d4d20YTpuZg9V4Kl/9PW
         M8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4rNr92XTYh05KMDRB3D1RMUXt0CcOrUeKlehf1w84Dw=;
        b=7wdT/W1eSgvBBAp5puYkw0bVPuFJcvdvy9MbXv2e5M7VTCUVL9bgjg3FFQmGxfm/p4
         /Hpz8jw0nxt+ZkFF4C7nSHkej6dgrxzCiuu0rrNzJu6CpVnxAq0+dI5+C9OL8cmAjuVP
         8FGD9yoZK32jo8z7F9W4iwCA48h7jrV2le7tN2Dfeu+Bu25uTchuWqkO/9Ae35BeaZL+
         Uj5YimIozYBJLa6wSFWabpPUoaytftTDn4Ll3rLa8pEqW8k48k4j2Buepntdf4TsJLTZ
         /aI5QFno/65CNjZn6qlckENV6Vgy0UoHjOorp5YxIXzEL46uw+w93IrEQY2/p7HAjrQH
         Mk1g==
X-Gm-Message-State: AO0yUKXlDkmBHb4Kem+iy6V4x7u7NmMLrQli2FHHAVG2tM2oR6JTliEb
        wa4jXZnXNp/1qVvx9kLuS+D+pQ==
X-Google-Smtp-Source: AK7set8OekKNKPZrJD6Erszgio47nQfQFRzRUuX0ixitHxZt4KiGpal97BHS1ZphbkRm1eibaOjC0g==
X-Received: by 2002:a17:906:e2c8:b0:8af:4327:cf38 with SMTP id gr8-20020a170906e2c800b008af4327cf38mr107709ejb.26.1676391136162;
        Tue, 14 Feb 2023 08:12:16 -0800 (PST)
Received: from fedora.. (cpezg-94-253-130-165-cbl.xnet.hr. [94.253.130.165])
        by smtp.googlemail.com with ESMTPSA id de56-20020a1709069bf800b00878530f5324sm8564376ejc.90.2023.02.14.08.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 08:12:15 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     luka.perkov@sartura.hr, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 1/4] ARM: dts: qcom: ipq4018-ap120c-ac: setup serial console
Date:   Tue, 14 Feb 2023 17:12:08 +0100
Message-Id: <20230214161211.306462-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.39.1
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

Add the required alias and stdout property so that kernel can setup
the console based off DTS and not have to set it in the cmdline.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi b/arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi
index a5a6f3ebb2749..38efd45433da5 100644
--- a/arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi
@@ -8,6 +8,14 @@ / {
 	model = "ALFA Network AP120C-AC";
 	compatible = "alfa-network,ap120c-ac", "qcom,ipq4018";
 
+	aliases {
+		serial0 = &blsp1_uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	keys {
 		compatible = "gpio-keys";
 
-- 
2.39.1

