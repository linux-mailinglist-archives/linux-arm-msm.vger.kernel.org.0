Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A937B596E0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 14:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239282AbiHQME6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 08:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239288AbiHQMEt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 08:04:49 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF0F1558DB
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 05:04:34 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id a9so18700991lfm.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 05:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=DqeinnIMS7tnZ1s/F5WbYXe7dS10PhHD2RlaXqtenk4=;
        b=HA4YX3lATWHZy1PycT9JEiDmaVCC74tJ89+lBTjqcQesxYBXT6y37LEBBk9hjQE1m1
         cLisYJI+duLjN0FEqQH0R7h53RyPZLxgcA0Q1AyY/3SmYfsCb4pwk5SGe3yj7MlNk8Bo
         MiZzcOHR0qLkntxsOPVC9RGn7CoXNqkSgV9gR55uucH3vSASXDp6THl3sZhPsAjAT/fM
         SiTFRsRTpd0Lm1W+OLhQbbuN0HuZ6VOnWsXoYcluoSbtEuraU07JaVqhYXXvZo6JXKy8
         lWIsDaWTsLtcg5m+WyVoXINwchBoMIRMLYJ3b4yNj7IgMl9rfFKThNOTCDjFhNfdSa0G
         zt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=DqeinnIMS7tnZ1s/F5WbYXe7dS10PhHD2RlaXqtenk4=;
        b=JbHCwel5nImE2wbfU9omhtmbH0jZmnF+V/zoRDYdcl34ujsIK/dgHDxL69S5SSv+F7
         JLyxgxKh8dVwAWaMnIg5XNU0nptlkv0oiM+ufIa/jgssLpNzK2Gd2mmdvBhq/zG8rh/H
         u9De+qcnuZBDExZDJ35OykUJb5YbWtfKHbK3jtiZy0KC/3ydbQpYSGuZSDSochzo9Fdc
         pQlkcYXKpfXAWrsw/zt6iPjLKeNJh685k+GqG7VGtm48H0tUsFu6aYCHCOLkinUEfYxj
         xcNto5iaDFhD8cjaC39IgH2ekUPkm52IAWBA89aVZ3kgxcwGcbvB6cuGVck1Zd8F0lkQ
         jDAg==
X-Gm-Message-State: ACgBeo1uFBxzqYghS8DSrLlfidZHMUEkab6OLVcQyFaefz+jpVRkFoDu
        A2F1sOiq7ccl/auZGUdncIvgrQ==
X-Google-Smtp-Source: AA6agR6Ad+YVXQ2ESPuMzul02yuxva58dgnkUgd2uhe5MsvfrsJV4vu40ijZIXllqyCSouRi1YOZtA==
X-Received: by 2002:a05:6512:6c4:b0:491:c8f9:1994 with SMTP id u4-20020a05651206c400b00491c8f91994mr5822628lff.179.1660737872906;
        Wed, 17 Aug 2022 05:04:32 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id d15-20020a05651221cf00b0048a97042251sm1670496lft.22.2022.08.17.05.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 05:04:32 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 13/14] arm64: dts: qcom: sdm630: switch TCSR mutex to MMIO
Date:   Wed, 17 Aug 2022 15:04:02 +0300
Message-Id: <20220817120403.458000-15-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817120403.458000-1-krzysztof.kozlowski@linaro.org>
References: <20220817120403.458000-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The TCSR mutex bindings allow device to be described only with address
space (so it uses MMIO, not syscon regmap).  This seems reasonable as
TCSR mutex is actually a dedicated IO address space and it also fixes DT
schema checks:

  qcom/sdm636-sony-xperia-ganges-mermaid.dtb: hwlock: 'reg' is a required property
  qcom/sdm636-sony-xperia-ganges-mermaid.dtb: hwlock: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 1bc9091cad2a..40a40d00eae4 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -697,9 +697,10 @@ tsens: thermal-sensor@10ae000 {
 			#thermal-sensor-cells = <1>;
 		};
 
-		tcsr_mutex_regs: syscon@1f40000 {
-			compatible = "syscon";
-			reg = <0x01f40000 0x40000>;
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x01f40000 0x20000>;
+			#hwlock-cells = <1>;
 		};
 
 		tlmm: pinctrl@3100000 {
@@ -2351,12 +2352,6 @@ intc: interrupt-controller@17a00000 {
 		};
 	};
 
-	tcsr_mutex: hwlock {
-		compatible = "qcom,tcsr-mutex";
-		syscon = <&tcsr_mutex_regs 0 0x1000>;
-		#hwlock-cells = <1>;
-	};
-
 	sound: sound {
 	};
 
-- 
2.34.1

