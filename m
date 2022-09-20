Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6E2C5BE99B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 17:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231824AbiITPEw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 11:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231734AbiITPEi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 11:04:38 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60D8261129
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 08:04:22 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id w8so4215708lft.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 08:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=1xM5SAgV2yOSXYHddecL2UZpF+0bVuts3JrhIOTJ0WI=;
        b=vouRKThlJjw88OHq2SUh+XYt6pKT+FRXjASslnQxkvUrkMK2JWof/+EsBxutoatRyD
         cTtjAVgcWuOzE7TElZ5bmvn3vjtcQn4kYe17sCop0M405bVp1L9nMLyXjA0KWkqu6LA9
         Y7pKOGih9xsUtrVPPj0AwSNh7N0pWXWCx+4ZzXirQVmx7lqO9OrnPKnYBjdvjzmX37I0
         nEjIg7pVhiBNyEmE9Iyucn4VJ9NyYAc8pmW4fJdK6QI8zQb2aAX5aXwopygaeEFjeMze
         rD+ENmA2IUYFgO0Cd4pKFAlYPhh9srM0KkI5m/aCgrsCJrF0hNZPz+QCumb4aaEq6DW4
         hcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=1xM5SAgV2yOSXYHddecL2UZpF+0bVuts3JrhIOTJ0WI=;
        b=z7js5qdQnLj/AOShIyeMP/13swBEqG4EiTHbcAgW5x+GciG3P95cCcLLR8wF50j3LW
         rZF/Nr3bEaSphfK3JuMFaYcAg4fDHjq0UGxJbwB0TgcErCBqanpagsuD/EK9dipFL5Ks
         gkvXULDBDpO2lqJdb9++K/Ts8Rs12u0khFr3X0eMB7PYbeF4xDXc+ALuT7bz6eVJde3I
         nvRb4BJWtaCaMMbcgPQ4IQNl0mHoLEHWepuEIFH0ZZFexyXDEOlckbLxqORuKmNDs2rJ
         52G/E7SzWRExhcVN0O42IDZywapfruvs0mRQyLJV5JUC4Y5Sn4HHoAoB4EVcz99vm9bn
         4HrQ==
X-Gm-Message-State: ACrzQf3C8yivKNK0TwM4Jgj+VJCh6PpcysPqqAv+juxeX/kzYC3uKhGI
        c5nb9zKwHAD1wWn7iiYJaAvBzA==
X-Google-Smtp-Source: AMsMyM4d1SHbHak7lgC5YBSzGtwKUKMIgYEBZwk/Ap0BUknR0fGFQ8O88T8n+Rsceuoha+C8T08/5Q==
X-Received: by 2002:a05:6512:3502:b0:493:e21:b77d with SMTP id h2-20020a056512350200b004930e21b77dmr8181149lfs.580.1663686260031;
        Tue, 20 Sep 2022 08:04:20 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p10-20020ac246ca000000b0049f54a976e3sm8294lfo.58.2022.09.20.08.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 08:04:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 2/3] ARM: dts: qcom: msm8974: add missing TCSR syscon compatible
Date:   Tue, 20 Sep 2022 17:04:13 +0200
Message-Id: <20220920150414.637634-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920150414.637634-1-krzysztof.kozlowski@linaro.org>
References: <20220920150414.637634-1-krzysztof.kozlowski@linaro.org>
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

TCSR syscon node should come with dedicated compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 7a9be0acf3f5..a4e12daf3eeb 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1239,7 +1239,7 @@ tcsr_mutex_block: syscon@fd484000 {
 		};
 
 		tcsr: syscon@fd4a0000 {
-			compatible = "syscon";
+			compatible = "qcom,tcsr-msm8974", "syscon";
 			reg = <0xfd4a0000 0x10000>;
 		};
 
-- 
2.34.1

