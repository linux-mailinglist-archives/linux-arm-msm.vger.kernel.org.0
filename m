Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0769879381D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 11:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236773AbjIFJZM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 05:25:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236725AbjIFJZK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 05:25:10 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 735371707
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 02:25:06 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5230a22cfd1so4962839a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 02:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693992305; x=1694597105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDAh0aCllih17eVlFn1jaipFdLOlK9NfNTLcE0E+Gek=;
        b=eQhgiDckWFM2iW69fTGqU3JOxMjLP/oEjETlmkWKL6sbrDBwyWeWb7qFXbt27JN4K1
         K5Exd9GgCOAO1kKdOwp8Sz9Lkk0FbE0/4Hkb4gko8CRzHK2+6tBRmHZg6sWBiQ5wJPR0
         lRZcs6jdJNJnrJ/MvZwYzC3fhTMwnYb2N2H0EQhaRkOsXJDuKSG1mm6n2RAqxdUy+1W6
         XLOWRckAdIxQogUSF9QScEefXklrPpCvOU4gr03tcToy+k8VlhTt2ZvUj7hudEB7JvAW
         2snT4KHKtAcXuY5b6uY78TGZxWpdei6N6kBTYeYWf32UtJfeRsBG1upBsvQMhtbMNxX4
         Ycuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693992305; x=1694597105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDAh0aCllih17eVlFn1jaipFdLOlK9NfNTLcE0E+Gek=;
        b=Y5AH8DC4tETS0nsK0MKr44gnDSXqMIMv3k6REZM6xRAxXq36ox28pm/zbikOoDxwyX
         0ZgLsZfMpto7v5BQDxYGy8G8OdHdSYDcJCCDoY/z2+0ZK08E5UxnBMnp7VzDCxfhjk8j
         RFFXWAbEarkLpCs7dnz1MyivUfwAWfHnpdEjJPiAz6v7IG+8+8ujFDmNBWTbuO/Q/S0I
         LTwx82LSzWASbURVvjLAWE32PvwuKYhoZXp2gmy/Mn7Bv2dwUHZ5gfxZwef7FsM75D+n
         C9PZcUJenxXND5feuRvkgjtEsCN0ArYLMB5Ve7QW6ZLdYwmFCBZXQPoHsJTZMLaVPH6N
         hYMw==
X-Gm-Message-State: AOJu0YypIYEsXLLvgZwqPEyNFY7iCZfFy2XyebwQnNN83BwHuU8Saz/4
        74Uk1i4QnJn1ipPftt2+tZY9Qg==
X-Google-Smtp-Source: AGHT+IFFo+QJScmITF/zsTHhCFf8BwYb/OcZFemUtjPrr/hckmIBNoTGAzRiOkyVbW+lJx86HX6gGA==
X-Received: by 2002:aa7:dace:0:b0:525:69ec:e1c8 with SMTP id x14-20020aa7dace000000b0052569ece1c8mr1578435eds.40.1693992305071;
        Wed, 06 Sep 2023 02:25:05 -0700 (PDT)
Received: from [10.167.154.1] (178235177204.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.204])
        by smtp.gmail.com with ESMTPSA id q10-20020aa7cc0a000000b005232c051605sm8096155edt.19.2023.09.06.02.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 02:25:04 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 06 Sep 2023 11:24:59 +0200
Subject: [PATCH 5/5] arm64: dts: qcom: qrb2210-rb1: Hook up USB3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230906-topic-rb1_features_sans_icc-v1-5-e92ce6fbde16@linaro.org>
References: <20230906-topic-rb1_features_sans_icc-v1-0-e92ce6fbde16@linaro.org>
In-Reply-To: <20230906-topic-rb1_features_sans_icc-v1-0-e92ce6fbde16@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1693992295; l=712;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=QbeFe51vD05DVZiBOlvsL2lYN7leouI3Bx68sEs+dDY=;
 b=xmDOXv3FY/Ud72be9WmQQ9zSBqko7R9Q8DTNzNZ8Ua/mjgwnlHSaLQ42k2pAfxYRXj0uaAuNP
 jkk5NfbwsbeCPMK8r4ok4+0kTm6ofr5uhAwqWDn95GVs0ebMCkLRXIk
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Configure the USB3 PHY to enable USB3 functionality

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index fd45f58e254d..94885b9c21c8 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -409,6 +409,12 @@ &usb {
 	status = "okay";
 };
 
+&usb_qmpphy {
+	vdda-phy-supply = <&pm2250_l12>;
+	vdda-pll-supply = <&pm2250_l13>;
+	status = "okay";
+};
+
 &usb_hsphy {
 	vdd-supply = <&pm2250_l12>;
 	vdda-pll-supply = <&pm2250_l13>;

-- 
2.42.0

