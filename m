Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6D7542F24
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 13:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238182AbiFHL1M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 07:27:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238178AbiFHL1L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 07:27:11 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27698163283
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 04:27:09 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id u12so40838198eja.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 04:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PlJbn4bNHTDXfVbeqo+RJ46MdRo3S8OzIqiYf3bCFFg=;
        b=w6oCeuCW85F2bY1la+P9McwrVJ5T4BrvQFtejLtN2xdcKqmI+dQG1SXjuh4aKYKix3
         t8yMpqn9Tk5DkkDC10nGdgnGjkcLd84YsBiEKTj6rOHwY2lYoe/U8q2RLUG3umMv0fDQ
         D8uxW+0D5+c4+xMghq7bk6589UqbK/4o9AbGGqAmZBWY3t2yA3vSAV0JhrUQL6np4+YO
         y9a9NLAzPMyw9SHJb0W6cvsPvXMzvJ8hkEOOCzgy5zHil9KEaekFbBe3XQdhrF7dmHl4
         lBix3meAPRSUmnZmCz41HRJ8fBw5NP5/gmNP/vwaqRZchKD2gN7sZi3TqKlx+Qeexiuq
         p02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PlJbn4bNHTDXfVbeqo+RJ46MdRo3S8OzIqiYf3bCFFg=;
        b=4QYhWh1FBsedFPNicKH1klNYpNlSNlG0Uw7GvVXSAHzzEHCf3EznjfPcsnDCeGZAlN
         iBc8aRU7PlAc2AKx+bsuF6oXpn2GX+agyCTWStl9Dbeo+KZUT5TDiVuuWf6WiD/0vu2S
         CC16TB0VfqQDKVP/6tn03l35P0FPf3puGijNZ0A0J9WXs3qjUP5/mex9RmB6AvkSR30Q
         lHT45Qhq0WkiQbT32eQZdJt0+LZWG+4QmW/FmyMnXKIBvS9cjDVIIN8gtYNUA6AP5lf/
         fsFRY99cDfqTAUXUlYjmf0eK1HBcILPF88IXkgA9TSYA9gHI6HxO7vb17wsyKFNjbZsA
         r9Pg==
X-Gm-Message-State: AOAM533nFJHwksN07oCes6Da5LLqxa4Oa8vROiWSZQ8GUhYz2YkbeTm9
        n8/DxHzDCEXR1PYWmQEPuQES0g==
X-Google-Smtp-Source: ABdhPJz+lXqy1j4v0OdkAe6JJbzQVDU2J9eFaz4d6ri4ThGwuFuF1m+OsQfkXsek6qRGnIa9uNiEOQ==
X-Received: by 2002:a17:906:216:b0:711:f623:8bb0 with SMTP id 22-20020a170906021600b00711f6238bb0mr2200799ejd.174.1654687627761;
        Wed, 08 Jun 2022 04:27:07 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g12-20020a056402424c00b00431962fe5d4sm2729956edb.77.2022.06.08.04.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 04:27:07 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Kumar Gala <galak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ARM: dts: qcom: pm8841: add required thermal-sensor-cells
Date:   Wed,  8 Jun 2022 13:27:02 +0200
Message-Id: <20220608112702.80873-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220608112702.80873-1-krzysztof.kozlowski@linaro.org>
References: <20220608112702.80873-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PM8841 temperature sensor has to define thermal-sensor-cells.

Fixes: dab8134ca072 ("ARM: dts: qcom: Add PM8841 functions device nodes")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-pm8841.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom-pm8841.dtsi b/arch/arm/boot/dts/qcom-pm8841.dtsi
index 2caf71eacb52..b5cdde034d18 100644
--- a/arch/arm/boot/dts/qcom-pm8841.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8841.dtsi
@@ -24,6 +24,7 @@ temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;
 			interrupts = <4 0x24 0 IRQ_TYPE_EDGE_RISING>;
+			#thermal-sensor-cells = <0>;
 		};
 	};
 
-- 
2.34.1

