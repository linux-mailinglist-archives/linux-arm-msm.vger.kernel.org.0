Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C90A748518
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jul 2023 15:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231539AbjGENgg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jul 2023 09:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232095AbjGENgf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jul 2023 09:36:35 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A36B171D
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jul 2023 06:36:33 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b63e5f94f1so9749191fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jul 2023 06:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688564191; x=1691156191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDehjscIk2SWf6ZQIAfGyZlVXOMBjkBzSfoQGLWDyj4=;
        b=feC0yXfQzzZp6eVr5IJdwjCUikDuSUaJAmKIXJOZwZ5+R10CQ6r+DOZEudkiQQaWI6
         wdHgR9qbWqnZxhLX7rBfJbl1oOfV25bC0SznNqG0DIqQrB8sBUFslNtuv2aOMqgR1jAN
         PITEjF9m+9oHY3DMrySOuzd4NVdcO2O4WlLCiLaMmHZSQ7/iHPALb+MWKswwALk04Ttl
         ra2PA/zoTwZPTZ5gjnz4iwINYH9TAwDzS3myZTkmcIZMoSPJD5O6fyctkPwfYZlsjkx5
         3A7KeefQiggNHDtjNhUomOOuhYSkvlRg5I5qB2At21K7CX9pQ8PV4dm3ZimRhlOsHoOG
         tcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688564191; x=1691156191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDehjscIk2SWf6ZQIAfGyZlVXOMBjkBzSfoQGLWDyj4=;
        b=f7nuWRreFdxpFS3dv02GR4bdUHZZfOfnarXCRHA4dMtM2tH8Wq2iNz6jA2OFeDwHNr
         tUMWkJgY/rNH7q70xtnXb/5e+sGafpIuJPnsmpiHSpp+o8HsmcKtDWuPtLK8hsFAA2Rl
         wlhcX1xbIDmUBKd1vIE4mEmngxUXBcR8b9ZGdJ0yK8MHFxS57nMUcbGy49zgYBIIore7
         kincaoK3deLqHGnM4yklX+7TI7eluSFGODJBlvPelt9yTdLM0U2Zoa1TaHUn+2HxyEmD
         VWe0Dk/HdQyM7I/tBSd0q9X1ZcLKRfytOnSXpNS2HQe2D+xtr5wVVtaD90v6LyZzaKfi
         7/dg==
X-Gm-Message-State: ABy/qLYLrTJk+7+PhHO70JS07qeCVoajydeBqcnViuG9XXl7vwFAW1Ka
        K8rR8BMAZNOD9neRZA9w6R1UQg==
X-Google-Smtp-Source: APBJJlENKDp6usuj9WAYjV2ygLavZQZtouQgc4/QErgo4SaYp00oPmTEDTUZQgVR/54rNsqyoe/kuQ==
X-Received: by 2002:a2e:aa13:0:b0:2b6:f942:ad50 with SMTP id bf19-20020a2eaa13000000b002b6f942ad50mr910220ljb.11.1688564191441;
        Wed, 05 Jul 2023 06:36:31 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id z16-20020a2e7e10000000b002b700952298sm246803ljc.33.2023.07.05.06.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 06:36:31 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 05 Jul 2023 15:36:21 +0200
Subject: [PATCH 1/3] arm64: dts: qcom: sm8350: Add missing cluster sleep
 state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230705-topic-sm8350_fixes-v1-1-0f69f70ccb6a@linaro.org>
References: <20230705-topic-sm8350_fixes-v1-0-0f69f70ccb6a@linaro.org>
In-Reply-To: <20230705-topic-sm8350_fixes-v1-0-0f69f70ccb6a@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688564188; l=1346;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=2d2DhQq++j2DfhV91lvpb7i8X8VdjQL38pPB0W6MgOc=;
 b=L7k96R2XaasHAcso5HGo7jWJ4j61BNSo3itSsd3rvV5zyuYSTOOhPNh5t1l6nO0q1pu8DvA6g
 RLIwJk/aRbXCIRAsuycgO4uQefMW3/pgDFuDPghe+tfY01d2uw3uf81
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM8350's cores can be shut off, without engaging full-on SoC-wide power
collapse. Add the missing idle state to allow for that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index ec451c616f3e..e1a09d4a83c4 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -264,7 +264,15 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
 		};
 
 		domain-idle-states {
-			CLUSTER_SLEEP_0: cluster-sleep-0 {
+			CLUSTER_SLEEP_APSS_OFF: cluster-sleep-0 {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x41000044>;
+				entry-latency-us = <2752>;
+				exit-latency-us = <3048>;
+				min-residency-us = <6118>;
+			};
+
+			CLUSTER_SLEEP_AOSS_SLEEP: cluster-sleep-1 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x4100c344>;
 				entry-latency-us = <3263>;
@@ -346,7 +354,7 @@ CPU_PD7: power-domain-cpu7 {
 
 		CLUSTER_PD: power-domain-cpu-cluster0 {
 			#power-domain-cells = <0>;
-			domain-idle-states = <&CLUSTER_SLEEP_0>;
+			domain-idle-states = <&CLUSTER_SLEEP_APSS_OFF &CLUSTER_SLEEP_AOSS_SLEEP>;
 		};
 	};
 

-- 
2.41.0

