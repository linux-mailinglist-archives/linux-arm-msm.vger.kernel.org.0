Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75074596F11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 15:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239577AbiHQNEj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 09:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239576AbiHQNEJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 09:04:09 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7607D356C6
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 06:03:59 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id s7so320114lfp.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 06:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Oc1vz9/DWeA4ULM94yDKxE44YQvZ9a9JuzHX3olMNuY=;
        b=Fc9cabtFx1GJRo4qrTB1EhBZ7hgujc16iVvpb3ePFvG7T1vcX0scRoIps3RRq8NtN+
         DL6+dWYcEg3ceKPL2PyTfkrMrW1SnWrgfKi3fyBxqQjjZzjSS/31qwzITB7Df7Dhf6V1
         jIO9+VNh21NxuM8sc/hm5JRWUda/hlXtfMpr9CR4EDsrV9pG3PNHnMx9KWtGtZW46dbh
         ofza/0xET9r3x2cneAdfuR9tA7Q0UMH93VnLod/yHIxs4Imeb62+0unZImweenPvGxxh
         wIVPnk+/pg495RSGZVTs83+E4KUJnlf5RgrpmMRt6eHsW5C48azxrN/PtQHpd82+WvyS
         lnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Oc1vz9/DWeA4ULM94yDKxE44YQvZ9a9JuzHX3olMNuY=;
        b=UYu2MKrSN0aZHUkW8U/L20X4sITZPMhDGk0S7EhRHYKfx++3jqiGbGJ/ABEvyjphiN
         hKayHBxcDWG3n4F6u1pHEcGs5AdGWKUxaRc0ildo5CITV9/l77i1nJEad4fNk83xzfto
         rPaInz5MBUdq2pIrlVuZA8BePXw2yAPxYHZh8FZh/xj8qiScPj4oGrBxyFmzdbeSzBup
         8KXfVJK0JgodSECuqrf5fBlPf23LyX7ZSwFJrV394L95exRPzBygPiWQsngkz2wJ8ylp
         pTjVzjqYYWqZByoKw22Htoqv4YHY+HNATuq78qJ15PQEH0DwKodM5WektzkfLQiXiWLj
         QFlQ==
X-Gm-Message-State: ACgBeo3jaRpGiKa+ij/Vy5DvxJqEeHch2eQpJ4tCLUtdKLH0K3+PJ3oc
        cjQk5WvBFgaCbOnnxdjCt2yAAA==
X-Google-Smtp-Source: AA6agR6S9efhZzy0qbQxF1CplVeckdK+xn7G3qkjrDJjItBPaU5fJX7F/Rpvq3DguQqr5p/Ke3w0Fw==
X-Received: by 2002:ac2:4c42:0:b0:482:cb18:25ac with SMTP id o2-20020ac24c42000000b00482cb1825acmr9289923lfk.643.1660741437470;
        Wed, 17 Aug 2022 06:03:57 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id v1-20020ac25601000000b0048b3768d2ecsm1683243lfd.174.2022.08.17.06.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 06:03:57 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH v2 05/14] arm64: dts: qcom: msm8998: switch TCSR mutex to MMIO
Date:   Wed, 17 Aug 2022 16:03:33 +0300
Message-Id: <20220817130342.568396-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817130342.568396-1-krzysztof.kozlowski@linaro.org>
References: <20220817130342.568396-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The TCSR mutex bindings allow device to be described only with address
space (so it uses MMIO, not syscon regmap).  This seems reasonable as
TCSR mutex is actually a dedicated IO address space and it also fixes DT
schema checks:

  qcom/msm8998-asus-novago-tp370ql.dtb: hwlock: 'reg' is a required property
  qcom/msm8998-asus-novago-tp370ql.dtb: hwlock: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index f0806ed103f1..22b2da74d105 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -308,12 +308,6 @@ scm {
 		};
 	};
 
-	tcsr_mutex: hwlock {
-		compatible = "qcom,tcsr-mutex";
-		syscon = <&tcsr_mutex_regs 0 0x1000>;
-		#hwlock-cells = <1>;
-	};
-
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
@@ -1047,9 +1041,10 @@ ufsphy_lanes: phy@1da7400 {
 			};
 		};
 
-		tcsr_mutex_regs: syscon@1f40000 {
-			compatible = "syscon";
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
 			reg = <0x01f40000 0x20000>;
+			#hwlock-cells = <1>;
 		};
 
 		tcsr_regs_1: sycon@1f60000 {
-- 
2.34.1

