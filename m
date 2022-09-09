Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60A805B3371
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 11:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232170AbiIIJVE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 05:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232128AbiIIJUy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 05:20:54 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37450B69C0
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 02:20:51 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id bt10so1697366lfb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 02:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=BzLkT0nncnpwU42zLJxcSRVkF2Ex1yz3Pc4ZA2GSLC8=;
        b=FHqPwq8SZPtIOvmrB53gIhnfTK1Uo5xnenuj/+HxeU0pV3rgk2KJVxJ2vRZI8Fq7ax
         wxrIrWQtA1MQ2jnfBSSfmbDxsR0kzNw4H4W+lyq9GwQbGRh4RoS+30jR1Jj8Gq+8rWq4
         GLD5NoZWMjxKTeaUGQWNmpFKC09L0ooV7m84o3gXlmx1kteAdQe1afo4AOuJKorsv3z4
         X+kID8WNP1aBlKgaGGSkmvmXJtT7SlYI28p3LnMjD/iB7GjxXG281e9in7nMibi9poCt
         82mSwURU65a7/nFk0nrL3pA/Q9GEeNvTvsO+cnjEA9ReUK3TzpZFzStOfRP5HZ5nebfS
         WxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BzLkT0nncnpwU42zLJxcSRVkF2Ex1yz3Pc4ZA2GSLC8=;
        b=j8xJ8jD/ZAu300nwZMkOqHxwJgg0LL4wqKel1NdaspaLq0W5tClPboDxzMB0gqOMi3
         tEU4RAD0jQJ7S0Pg2sE05bFgdACNGbrwZSWGyQWU8z0QIPyxtXQ9yDg5ZaAhZtUFJQGI
         JQ3uyLGY5Sn34zXbeyDjg7KP7mJ5VpZpUost1S/PSU0oEBKNrqbh1e3SMFlrD3jPWPnw
         tteeR/EvqoHbJ3jbI1kdtoSiiKuV0AUEWPxX0Rbe+SaB6siG2xwBKtjkOa1D1ognugwN
         W8CBsGrTQHMxf4DbtG6EBTjA/MdTEtjs53/IXI/tycE+ZoXGlB3YQu6xIm7pH9BW0xyd
         xpTw==
X-Gm-Message-State: ACgBeo3uDWoAfWoDPzpxeMsoidzD+GfYEWKrL/celJsPk7QVd6TQiytv
        RdrkJ1KG8jyJqf0CYdOwm2Io7g==
X-Google-Smtp-Source: AA6agR4napjyc1rdUN/J8XTqsrNAWlUFtAnz7WL5YD/y9lW4szpT+VXmBUve/wEanVgQPlpQntKMFA==
X-Received: by 2002:a05:6512:2251:b0:496:c3b9:c18d with SMTP id i17-20020a056512225100b00496c3b9c18dmr3799205lfu.403.1662715250609;
        Fri, 09 Sep 2022 02:20:50 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s6-20020a056512214600b00498fe38ea0fsm2170lfr.174.2022.09.09.02.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 02:20:50 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 08/15] arm64: dts: qcom: msm8996: add missing TCSR syscon compatible
Date:   Fri,  9 Sep 2022 11:20:28 +0200
Message-Id: <20220909092035.223915-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909092035.223915-1-krzysztof.kozlowski@linaro.org>
References: <20220909092035.223915-1-krzysztof.kozlowski@linaro.org>
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

TCSR syscon node should come with dedicated compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 166374566a49..5f45d0589265 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3499,7 +3499,7 @@ frame@98c0000 {
 		};
 
 		saw3: syscon@9a10000 {
-			compatible = "syscon";
+			compatible = "qcom,tcsr-msm8996", "syscon";
 			reg = <0x09a10000 0x1000>;
 		};
 
-- 
2.34.1

