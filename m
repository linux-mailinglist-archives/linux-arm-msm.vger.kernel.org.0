Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8545B6AAFB9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Mar 2023 14:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjCENAF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Mar 2023 08:00:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbjCENAB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Mar 2023 08:00:01 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70E5412BE2
        for <linux-arm-msm@vger.kernel.org>; Sun,  5 Mar 2023 05:00:00 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id ay14so24292292edb.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Mar 2023 05:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678021199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAQ5DLT10boyJ0Zf2HsCdt+H3MVzFy+9aYosQQ7ZXMk=;
        b=z8T7XmmxaiMvNKMSgg9djHWpYbx1oqUpDiWX4wMDBarjZzIF/tJhd2EUyUPC4CxrhT
         Suz1wUmqSNz+fEp9KtQPixcvh+BbojL026cfY6A5ypJYZPSNSb2sDoC4lOhq0wlPGfVe
         eUxN1sVUOrUbjA3nma0TOKQokrIuhbe7dCkU16tKTDSA/CRu54YOZ3lFafS/Tv6k36vF
         qg3YiJcCpvEsDXjn7+f6hPHrULsmv41bJCHK8t6EcrecV/OzffB+pfKcm0DR//U8MzFf
         DHLPZs5TU7DThMvX410njtrsc4AW72r2hnRnHLnwdQs7L4JDy8mlhUFxuWQuw4IWuDby
         OC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678021199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AAQ5DLT10boyJ0Zf2HsCdt+H3MVzFy+9aYosQQ7ZXMk=;
        b=Cg3aWXvDlHI+6F+JpfXKg4JCjSysPxzCq42OV5MBZukxuGrPHRyf22IT0Cyt01Dj5E
         dzSchzao5bCW33nLVeL6dDhXPfVXcXzcGDre1Lqbg2FmiNjFzdYEf9aVW6Xf/u8qD0Z0
         qCv4ShxNufmxhSgM/svNIxcsJ07cY5kTkbsLmttgWNsxGsnSZQ72aA6KGrK1aGUuyO+P
         T405IndoKg0hWft8kHGww8dSkmuyoJiQOrB0PG4UpAsyp6MyoFnQsu4+DjGAoYMm7DdU
         yfrP2H/FCy9vQs+BUj+MndH/UyhNr6ctzxQ3Y3191jK7ZtWKW86mkIR5KK8tsqz/RzB6
         q+9g==
X-Gm-Message-State: AO0yUKVPIvsDJCtrm5z4nPK3uk6IsXkcIfli/TLt4eU2/3NxSCk+c7LG
        ODTOaQqn5QEQVNq4RB+kEfYG8Q==
X-Google-Smtp-Source: AK7set9coBxgPeTN0N1sAO27eVOCYW9D5GCgf5EXsXSKc8TrQ5Cd3GaEHGN8eXADw64r0sBxwGwdeQ==
X-Received: by 2002:a17:906:b0d9:b0:8af:3519:ea1 with SMTP id bk25-20020a170906b0d900b008af35190ea1mr8547271ejb.57.1678021198785;
        Sun, 05 Mar 2023 04:59:58 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:71e7:13d:1c29:505f])
        by smtp.gmail.com with ESMTPSA id l15-20020a170906078f00b008ea8effe947sm3193158ejc.225.2023.03.05.04.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 04:59:58 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 03/11] arm64: dts: qcom: qdu1000: drop incorrect serial properties
Date:   Sun,  5 Mar 2023 13:59:46 +0100
Message-Id: <20230305125954.209559-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230305125954.209559-1-krzysztof.kozlowski@linaro.org>
References: <20230305125954.209559-1-krzysztof.kozlowski@linaro.org>
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

The serial node does not use/allow address/size cells:

  qdu1000-idp.dtb: geniqup@9c0000: serial@99c000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)

Fixes: 6bd20c54b589 ("arm64: dts: qcom: Add base QDU1000/QRU1000 DTSIs")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index f234159d2060..c72a51c32a30 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -412,8 +412,6 @@ uart0: serial@980000 {
 				pinctrl-0 = <&qup_uart0_default>;
 				pinctrl-names = "default";
 				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 				status = "disabled";
 			};
 
@@ -581,8 +579,6 @@ uart7: serial@99c000 {
 				pinctrl-0 = <&qup_uart7_tx>, <&qup_uart7_rx>;
 				pinctrl-names = "default";
 				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 				status = "disabled";
 			};
 		};
-- 
2.34.1

