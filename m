Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6100702D64
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 15:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242121AbjEONEg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 09:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242107AbjEONEd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 09:04:33 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE8119BE
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 06:04:32 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2ad819ab8a9so105307301fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 06:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684155870; x=1686747870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2/tkDIoYNjgUmzZJee4bBP3k9tNdqD/UOXI+DkOBoc=;
        b=gy32jItCDuWHzsiEBoXF+Lxe78CF2xA6qCgJLYKIRzjMYE9xEhu4ewIfGiR+FsIvcX
         4m7BwmZy6iy9y5EmRQcsj1E2wpeYTGIAuTEUxIVnKkHmEduUAFBu2oFvBWNfCcjgJ8bf
         VD31nJKbvI+rr7DQdpbvoKRWkGCpCTC89oDsMiQXa6KWevRnU9mpDy2u9UImVQGBZzeW
         SrjgHwm/TUxsJP8tLLBSFYpnT6d/udz3OFRxKC5/ky/P5GIqJGuR4ouKzVHp1bH4BQ22
         vyCVrfqWhEiClClzYViofKIxBOUq3lI2BUGlNuQFf8/scbzF7gbyZwn5UW8Q/laJHobC
         JD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684155870; x=1686747870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2/tkDIoYNjgUmzZJee4bBP3k9tNdqD/UOXI+DkOBoc=;
        b=KTbrhveGl/KRdtoGwJseeNeGcr0OUZtfX0TsJCOXcgelGW+n7+/w65EEql8N2KTXQS
         PMRyA7KeUfPlD2ej0A2iSuyjSJcEmb1cZsPpNQFZpfQT8KEzKTVDGIfgJmPBq8s9O2Ac
         E5G/QDQVBmhE4c6wVhS4i93Yl4bwQwNzR9XNSFggilTJ6XrxigWTrJmpyw1msszZHeU5
         BtNUfJgIBV9i5o9FwAQx0EORfHimuj5eR1jqxN3ciH+QRt6agRR6RQ41wJv4HutEbp+J
         kHb8o0BzN1HpbQaaikV4q7poSpYyaMAKsywEOG0gLXpJbggklfGovoKTu8dJgNLsTDm6
         qFwg==
X-Gm-Message-State: AC+VfDzZiTFDN2V8htazTpB+/gw7Npe1xtsN/FL7HLNLpJGpSpibaJzD
        0u02Lf6vaQfnOiUSd4yXwi6aSg==
X-Google-Smtp-Source: ACHHUZ6dhCM9WsTOgBuzUKY8VdLldrJJ2ARzWzNRChRiYgE79NdxYYyP+feT993QbDiIqNt/ICqGWg==
X-Received: by 2002:a2e:9d03:0:b0:2a7:a616:c39 with SMTP id t3-20020a2e9d03000000b002a7a6160c39mr7060152lji.48.1684155870641;
        Mon, 15 May 2023 06:04:30 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id x27-20020ac25ddb000000b004f37a64c90asm785823lfq.303.2023.05.15.06.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 06:04:30 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 15 May 2023 15:04:15 +0200
Subject: [PATCH 4/5] arm64: dts: qcom: qrb4210-rb2: Enable load setting on
 SDHCI VQMMC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230515-topic-rb2-bits-v1-4-a52d154a639d@linaro.org>
References: <20230515-topic-rb2-bits-v1-0-a52d154a639d@linaro.org>
In-Reply-To: <20230515-topic-rb2-bits-v1-0-a52d154a639d@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684155864; l=994;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=5QQdPjDBeY9vuV0k49Svsx2cwcJ7/t3g8jImhtA6NXg=;
 b=KWq0dG+FBeabaLiR2bgh96N0xMCpj8Ka3o/MSpg0kbUs/LqrwosH+WVvzQ8PclNGQopB6U0YX
 7nI4tVqXY8kAQLmECPpJBSsrYqcB71CGhySzryHIW4D91R0YSaL/rFP
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MMC core calls regulator_set_load on VQMMC, enable loadsetting to
make it effective.

Fixes: 8d58a8c0d930 ("arm64: dts: qcom: Add base qrb4210-rb2 board dts")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index eeee268ebfe2..224c96bba35f 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -283,6 +283,7 @@ vreg_l4a_0p9: l4 {
 		vreg_l5a_2p96: l5 {
 			regulator-min-microvolt = <1648000>;
 			regulator-max-microvolt = <3056000>;
+			regulator-allow-set-load;
 		};
 
 		vreg_l6a_0p6: l6 {
@@ -313,6 +314,7 @@ vreg_l10a_1p8: l10 {
 		vreg_l11a_1p8: l11 {
 			regulator-min-microvolt = <1704000>;
 			regulator-max-microvolt = <1952000>;
+			regulator-allow-set-load;
 		};
 
 		vreg_l12a_1p8: l12 {

-- 
2.40.1

