Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B9044EAC45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Mar 2022 13:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235801AbiC2Law (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Mar 2022 07:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235780AbiC2Law (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Mar 2022 07:30:52 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 694C121545D
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Mar 2022 04:29:09 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id h1so20346909edj.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Mar 2022 04:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mKGTMgRm2/BrDh+pWLzL6um9KANlYMhjAWBOG3cfNDc=;
        b=WM6dih3EcxauyaQgIbZOPk6LwSs4KfqXQ+c4evQM1jxj1rAx7F++3xB1Uj5q8G9AAL
         MvNBsnx4zkLHl6Tr4eTugXeNiHBB+JURrcAZW0aFlnMcZuCTAOji342XUmbI9C9/UvUg
         8amtkeo1YgSokSN15i/vAT0mTWpGkUxQj8rkqwoRevTiFIUd6yPfAWdRUtSysb1ShjR7
         eRSkyAYP2bj6xljmoPxTw1aViSsk7dQEAakMqCNSF9XnTm4biRDs7NfyOEQwSEzqTnyK
         jZ7pIjFDLwA0N7Fk+4DNAdTYjSm0n2275TWauYokui0CkuWwtZgg3/Epi0CGJEiuyAja
         tR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mKGTMgRm2/BrDh+pWLzL6um9KANlYMhjAWBOG3cfNDc=;
        b=bNDxXY03iX7ONXFplaC7xNwDk97BJhYtXkrqu+W4yN/d2omPnMtooS4UJUYhh5SKab
         DUBCPaKIJdlb8LArPtPA6VezmjKBMsXsqfvul1rN9vx4920ReNxixT/UCySeuDkXkNRT
         VvJINzkwpfFgx9JIxnqsBvd0JfEQEavtLL5ZWIPh4RcwqjPe/nw9CAfw2QRFmjPcNdzk
         hgpyMOXDMv8ujWxd7hQHjhLicgm+IoC5JKZ2LJGsx8SVVSSZh7Cj4iPiiQbZgUzBktWx
         sercI5IJtQ6J44jfL3itiBZz/2FhpHZgK+GBw2hUvjp1U+2b2kxlPqfhoPOn8pJVYRIg
         wO8g==
X-Gm-Message-State: AOAM533qoTQW08dBOdyUKXp2+6i6O/F3uxDHhuw4amu8fAAlIyYyKIFM
        VMVnem+JCWYxZP52qeNF4fdwNSQmAJlgoYUj
X-Google-Smtp-Source: ABdhPJzobl8xD8cMFO22+MoetBVD+tEeJikLiyMeOkdT+9Lk5U/4qEnHaasL74D0qZfmxbF6SQn3aw==
X-Received: by 2002:a05:6402:1941:b0:413:2b80:b245 with SMTP id f1-20020a056402194100b004132b80b245mr3946739edz.252.1648553348013;
        Tue, 29 Mar 2022 04:29:08 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id t19-20020a056402525300b0041952a1a764sm8510909edd.33.2022.03.29.04.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 04:29:07 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/4] ARM: dts: qcom: ipq4019: align dmas in SPI with DT schema
Date:   Tue, 29 Mar 2022 13:28:59 +0200
Message-Id: <20220329112902.252937-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220329112902.252937-1-krzysztof.kozlowski@linaro.org>
References: <20220329112902.252937-1-krzysztof.kozlowski@linaro.org>
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

The DT schema expects dma channels in tx-rx order.  No functional
change.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index a9d0566a3190..dc8260684aee 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -253,8 +253,8 @@ blsp1_spi1: spi@78b5000 { /* BLSP1 QUP1 */
 			clock-names = "core", "iface";
 			#address-cells = <1>;
 			#size-cells = <0>;
-			dmas = <&blsp_dma 5>, <&blsp_dma 4>;
-			dma-names = "rx", "tx";
+			dmas = <&blsp_dma 4>, <&blsp_dma 5>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -267,8 +267,8 @@ blsp1_spi2: spi@78b6000 { /* BLSP1 QUP2 */
 			clock-names = "core", "iface";
 			#address-cells = <1>;
 			#size-cells = <0>;
-			dmas = <&blsp_dma 7>, <&blsp_dma 6>;
-			dma-names = "rx", "tx";
+			dmas = <&blsp_dma 6>, <&blsp_dma 7>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
-- 
2.32.0

