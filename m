Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E760736D05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 15:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231974AbjFTNS5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 09:18:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231727AbjFTNSd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 09:18:33 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E38FF1BC5
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 06:18:10 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b45e347266so56782871fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 06:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687267087; x=1689859087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KFA5rv0lr1oloQt1B0KnKq65YwKUj3TfUmZ2SAZq8Ag=;
        b=RON1O4AVw5GQPnoihbBBHmP/RAjBaLj9OeDg4bebBJ8ug9w3jGSrvrarIrHPcX3gFq
         A2l5Z9SDG1GBqXGZKg6yJWW9gyVed1veuzvSvMTFuxoejyZOqsjHoSxP5uNey2Tv4EVx
         wtIR6/BFWB8RrKBilbzSlYFXvMPqMI+1Gj+P5RuMLJQjsQcNW9GdYIbL6E4x/CWbKDZp
         rnKaEuRnNcWeVHp5RrZG21iFjhnTUv9gjorl4TTJUs/34fHyH/olnu++X3syqTrhnK7p
         A9qM+xJJpOtfJ0q6NoCIzSUzPKcFcSPqVaDUqvuL5KWCy/vn+cr7q3ngyEo59zqyJZFY
         oVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687267087; x=1689859087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KFA5rv0lr1oloQt1B0KnKq65YwKUj3TfUmZ2SAZq8Ag=;
        b=WpxJbMk4ccuQ7HL0/VagpMbRzbCnMOAlw7nsEL2ork8f1nK3b3+5HbaNlo0mEXDiji
         dLYmfrDRa6mMBkPVP6rSthPvIvg2Tm1yw/G4e+ToYmwzmxpr7s1GGo5uRR7JWkJ4styk
         mSVF5gB1XG+ObI7NQUANaRdqyfqivAgrqPyB5iTFAU38IryK31N8VGua8OIcEASmysLK
         C/Xmn4J+fqs2wEKSI02MJ/VWjFNFFhwdN2PsifcKQqNs4awfkUuVTPB7nJ4RAohHraaL
         y7iCNjZnLp+W5QHjL0ANEXlOCMb9X+8O76MEwTOJ/74hzLM8ffiFkYTg40G+68MtLXDd
         6HyA==
X-Gm-Message-State: AC+VfDwQ9pdjId5J5V79FrD/RJ951Ui8+wO5uz9rrbSayuDq93YmNKe0
        GP+hFRhk5x0z8vGT7h/n/0+7SQ==
X-Google-Smtp-Source: ACHHUZ7Q/ikJ/iv+/FD4VwJg7o/OJSJUN/e0qTeCUy4kD6D003Kg+fIHBf8YubyubYyJVYXONxHONA==
X-Received: by 2002:a2e:b050:0:b0:2b4:734a:35fa with SMTP id d16-20020a2eb050000000b002b4734a35famr4369815ljl.42.1687267086775;
        Tue, 20 Jun 2023 06:18:06 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
        by smtp.gmail.com with ESMTPSA id h19-20020a2eb0f3000000b002b3318c8d6fsm414433ljl.28.2023.06.20.06.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 06:18:06 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 20 Jun 2023 15:17:48 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: qrb4210-rb2: Enable GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230620-topic-gpu_tablet_disp-v1-4-7bb02bec8dc0@linaro.org>
References: <20230620-topic-gpu_tablet_disp-v1-0-7bb02bec8dc0@linaro.org>
In-Reply-To: <20230620-topic-gpu_tablet_disp-v1-0-7bb02bec8dc0@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687267079; l=706;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=JBonNiZe3CxDbV4Fmz0+WuWgEzcdGj7FHxWoDNsHw3g=;
 b=Vfz4R/euuwcF82gpDVjvdr+26Q1fZ8KWx4ICfhU1LOFk/KTVQ0K3Pu8h6L+3cHmszJd/lG8ER
 JXvmcWKJhI7D4jGM99KohrodZtSH68dDs+TgZYtOZRHY/LdhB987VkG
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the A610 GPU and provide a firmware path to the ZAP blob.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index e23a0406eacc..a7278a9472ed 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -179,6 +179,14 @@ &gpi_dma0 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/qrb4210/a610_zap.mbn";
+	};
+};
+
 &i2c2 {
 	clock-frequency = <400000>;
 	status = "okay";

-- 
2.41.0

