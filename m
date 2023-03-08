Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87A426AFC5F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 02:27:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbjCHB1r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 20:27:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230112AbjCHB1i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 20:27:38 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CD09AFBBA
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 17:27:30 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id t11so19501268lfr.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 17:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678238849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2LQI9ML6EtIY5x2Onb8YDmJNrTIH7IXM1Yy3nDfRXp0=;
        b=KKQ4SGYWQPAl0zLwAIPtGSy2yEIvv0iTIjQBfy2YjhLByyOOuzkmc5RHjpBwvKB3IL
         bUXyPczJHo5noF09pgD2wLsM0udBMgBDY2vSRbpTothLzBsHFsFrNmQIdWoJZUShmRK3
         ku1V/AwuuP3n38SpYCL/cLu2KKqb9iaztwK9q+AiFG92oXVZXq8J1TogJ1D7OLSZ/DsX
         AdGcyuuYMuaBURPfRoyFzXpOlzfQ2vDYJ+O3sMDNVS+cx4X5fu9/Qfm5seR83gU1dDi5
         mjnCaLEs9l6rE2hwx7LMmt/DScjxC4uX5jkUJ6YQr4ptH0j/lnpMkpqHd5XEPl2BBl0K
         Wyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678238849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2LQI9ML6EtIY5x2Onb8YDmJNrTIH7IXM1Yy3nDfRXp0=;
        b=L+uFLG2Y2Hqpy9Gg53eb1MIhi6H3Nyc9mxwiEgf2YoTasjdx6llDMHNAA73AajHS52
         74s24D3z5QMYKhU2Z8uCmF5uzUkbJnfvB4xbt6tjdSLv/0sQnzVAWlc5a1Ylj5T9NW8x
         7UAer02ctbREHmr3FbxFURpZO1VlaLUpJ/YQYrKd0OSAFWm+nAN7A6bcawL3HYoKKbLz
         5+gHHlqKYN3wIOL2tS1weisO7lcNuDiPCgWxA/sbq7gcuH8dURok3BuLJ7vvn8GaT+tc
         1jJoXLlernX/ivexCeNIYzx7BfKx66qU5DGtATos1+smEI9r88o95AVY3fCAh1aLQ5Zh
         tSNw==
X-Gm-Message-State: AO0yUKUNJJ6PPsCyrwF/c6tYMPQIhjQ8jGgEURZ9NaNtHGfZyyca6JK9
        S960PPBdZgAtg0hl+B5yINHR8GzvExnFa9Tmw9s=
X-Google-Smtp-Source: AK7set+14UI2X2BxTanZ6TiN8wnmzbGjWZgA+1gA3ZV/aMIytYT5IgJ7eFAN/NGvxElOsykb7BcE2A==
X-Received: by 2002:ac2:46e5:0:b0:4db:3e31:20fa with SMTP id q5-20020ac246e5000000b004db3e3120famr4701910lfo.53.1678238848995;
        Tue, 07 Mar 2023 17:27:28 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id o24-20020a056512051800b004a2c447598fsm2182944lfb.159.2023.03.07.17.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 17:27:27 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 08 Mar 2023 02:27:05 +0100
Subject: [PATCH 8/8] arm64: dts: qcom: sm8150: Add SoC-specific compatible
 to cpufreq_hw
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230308-topic-cpufreq_bindings-v1-8-3368473ec52d@linaro.org>
References: <20230308-topic-cpufreq_bindings-v1-0-3368473ec52d@linaro.org>
In-Reply-To: <20230308-topic-cpufreq_bindings-v1-0-3368473ec52d@linaro.org>
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678238834; l=815;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Yil8E/XkNgavmPfgeJjlA348O7O8bWH2q0Xhcem/1o4=;
 b=hT4GJN2Clqv+qZfFWTcy+kaTyXx+kQRgm3+nrlVcLvq6/tsjnzeUpGcpB1SYf6u0c7n8JhG9chDO
 aJylT8yJDDTOC8E8wXgbXPNEqb4rs18SEtLmt6j349tG8+IuSpKZ
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a SoC-specific compatbile to cpufreq_hw for compliancy with bindings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index fd20096cfc6e..e7e66bc3e6c4 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -4263,7 +4263,7 @@ osm_l3: interconnect@18321000 {
 		};
 
 		cpufreq_hw: cpufreq@18323000 {
-			compatible = "qcom,cpufreq-hw";
+			compatible = "qcom,sm8150-cpufreq-hw", "qcom,cpufreq-hw";
 			reg = <0 0x18323000 0 0x1400>, <0 0x18325800 0 0x1400>,
 			      <0 0x18327800 0 0x1400>;
 			reg-names = "freq-domain0", "freq-domain1",

-- 
2.39.2

