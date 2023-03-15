Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD16A6BB5A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 15:12:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232988AbjCOOMc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 10:12:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233144AbjCOOMN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 10:12:13 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B91A9CFE9
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 07:11:44 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id f18so24515870lfa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 07:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678889502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NtJ3vFNxN3ulWegLUMLxPGL5fEpN3EwC/SH8BmcFyaA=;
        b=r5bmp5Qi8GsB9iOnryLlnMBm6qMhM3jE8e/AWc8v/jVHcajTLDlslJwCIcOBBcHWVc
         y11HdcZJ8EJrDylYysW+brO87vMx/MHiqCbDA+VeIqhAIio883RtITf+Ko4yQMEo2B9r
         NmhZ/+XYkXR4gHK2Fpn3G7lJP6Amz8y13ikCwMsfkTS/a+C7eAKvzJMzNp2aHJKW+Ped
         aGw7qOmTDCkroXtE/biZj1aEQ0fwiutwOBXZJNxXK7r18hzfpefUMSsRhkOukfXFXnLG
         l2IoXeyeYqgLlMshOd8u32rhL7yEss4T327JhozOwijEiF/CRWmBZtm+aCc+MN2KTOL0
         rolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678889502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtJ3vFNxN3ulWegLUMLxPGL5fEpN3EwC/SH8BmcFyaA=;
        b=cGZoXMy/N2eAPWbeA/OvirDmLKHOjS9bkkhKL0KU1MFeJI1TcxG/alNCNIfawjlG28
         bXTF4z/4hu53/qQhplenkrDya3dKTvMbserbPbbf1TGykN760qvUc7aGl0J9gv4nltUN
         qJwZTKxfzSQeTUBV/Vv+ShHJINYHVTr5JPXqwzDyGhfLlQCJFCtRcuPleaayW9KFpYv2
         czPRaDS+nH5q3y5KGUqijQq4wItM3jp2BjJXvR7yMVY/AeZYgh9HJfBK3SZKNJsGox7t
         sRP3QQAh7kzTPzmoccU7WJsOI2ktHO5K276d3rJbZr198RX2k8ktr3A3N2zdzfXSnXED
         X0yg==
X-Gm-Message-State: AO0yUKXx7+u1ySwV16DE6+M7kD01/irbm6FzYjw+R5UhA4Nme0r3PqCn
        WxpsSOtBYJSoZwUFTHPs5Km7Og==
X-Google-Smtp-Source: AK7set8U2f2jJCQnZGyHhK2xJ2jiR6mdyeJRvBJFzc4XJF6ufYMJwWid97m84I2qPGtny7eB77zUTg==
X-Received: by 2002:ac2:4297:0:b0:4cd:7fe0:24 with SMTP id m23-20020ac24297000000b004cd7fe00024mr2186112lfh.27.1678889502079;
        Wed, 15 Mar 2023 07:11:42 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id b8-20020ac25e88000000b004e845a08567sm824678lfq.291.2023.03.15.07.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:11:38 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 15 Mar 2023 15:11:25 +0100
Subject: [PATCH v3 7/7] arm64: dts: qcom: sm8550: Use the correct BWMON
 fallback compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230304-topic-ddr_bwmon-v3-7-77a050c2fbda@linaro.org>
References: <20230304-topic-ddr_bwmon-v3-0-77a050c2fbda@linaro.org>
In-Reply-To: <20230304-topic-ddr_bwmon-v3-0-77a050c2fbda@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678889480; l=915;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=dMLX1nr86ibogtZfftMqjl+ZEaZVlp2gW/2Ekfh4Qg4=;
 b=mMcmR4y/gsZjUv2tlyJ0SIklkEDolVPgP57/9+mWsULUFgqpDVqjV7uPqWeWFjPx1kCvQH2+XD4H
 91/t24IgDvQwqivh8870zKvltnkQHeHB0FsUya3rbMU+kimWCO0Z
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

Use the correct fallback compatible for the BWMONv4 with merged global and
monitor register spaces.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 25f51245fe9b..b5488c6822bd 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3391,7 +3391,7 @@ opp-8 {
 		};
 
 		pmu@240b6400 {
-			compatible = "qcom,sm8550-cpu-bwmon", "qcom,msm8998-bwmon";
+			compatible = "qcom,sm8550-cpu-bwmon", "qcom,sdm845-bwmon";
 			reg = <0 0x240b6400 0 0x600>;
 			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &gem_noc SLAVE_LLCC 3>;

-- 
2.39.2

