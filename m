Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5E7177E0DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Aug 2023 13:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244813AbjHPLwN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Aug 2023 07:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244894AbjHPLwF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Aug 2023 07:52:05 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F0E26A9
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Aug 2023 04:52:00 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fe1a17f983so58193325e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Aug 2023 04:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692186719; x=1692791519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hv1dByAC4O+93wVPqRp/nC5owKK9YptPjWZq1jFb2OQ=;
        b=OGLweqSCYLH4Y50og178nxVSV2wIPmtbQ8teMsDmwO74PAxkJOm4v2hz9W76ggMq24
         A/A2phvV8hBEQVqteTyvtfAqUus5NoZUjKzO+XIH/7o9mZFN2MQv6u+J0R29uYsr++I7
         OJm1pmiEUyVAQljYYLA06XKcSYY8tsC5GKeg+YvWULJtrrKN/GAPMomsh+vI8VuV+bn/
         LGjwipuxvcl/T+J91VzDw8Z97nhRHY5KKfXzVLWttycvW/3sWZ3+OXBOmmpcEvA9eDdH
         D0thz530tW6qwPACKsab3ydai6otC/zww4ErnrdqfIz7eVBv2WWDBnoulCZFsebGWHiD
         BaUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692186719; x=1692791519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hv1dByAC4O+93wVPqRp/nC5owKK9YptPjWZq1jFb2OQ=;
        b=cHsKEmNtAk0vYNc/GTcoAyf4nnKJArLwvTq9Lhflr6FiM66p1HNEiMy1FYadJjwcfA
         0qw19I7e0UGNBKMM6SbIC3qtxvNCAy4O853FWXF3yWVbz5pizIjWlcT0AedeN8+mHwyg
         oqR1zt2YaKhVB6wKA2BiqjkoNpt/gDtA3shJ4AtE+fRY/QAK/3Ok9KvJvRuPBhcqJnQx
         WyDKXvNStGzN+kJ5D8Mg8ayAZqyWfXl4rl2IBjCCOqe42SDf0TCvOryP74sgBapK1Fm6
         mFwbXIEVqUJwxzKepovnspGfvgTxwSWnNqEr6PqwSfSJmGB8/zoI+fOf0pehzVTzx8oo
         Hs5Q==
X-Gm-Message-State: AOJu0YytAtI4xMOQgiT2+EL/2ky5jqkVRfA8vglvI2bRc4KPglU+c6W+
        QCs1ruBNFFP4M5VBgzV5xWRVTg==
X-Google-Smtp-Source: AGHT+IFx6vhmAs+gDskNm8HUy26/1I+GNC9to4jvOk6cJiEmy5y9jqJi7/JMtXFaNJyA17AYmKDwNw==
X-Received: by 2002:a05:600c:228c:b0:3fe:16c8:65fa with SMTP id 12-20020a05600c228c00b003fe16c865famr1263861wmf.4.1692186719505;
        Wed, 16 Aug 2023 04:51:59 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id fk3-20020a05600c0cc300b003fc05b89e5bsm21280663wmb.34.2023.08.16.04.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 04:51:58 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        sboyd@kernel.org, luca.weiss@fairphone.com
Cc:     bryan.odonoghue@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 4/7] arm64: dts: qcom: qrb5165-rb5: Switch on Type-C VBUS boost
Date:   Wed, 16 Aug 2023 12:51:48 +0100
Message-ID: <20230816115151.501736-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816115151.501736-1-bryan.odonoghue@linaro.org>
References: <20230816115151.501736-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Switch on VBUS for the Type-C port. We need to support a higher amperage
than the bootloader set 2 Amps.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 9022ad726741c..624d6ffc2f12f 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1334,3 +1334,9 @@ &qup_spi0_data_clk {
 	drive-strength = <6>;
 	bias-disable;
 };
+
+&pm8150b_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <3000000>;
+	status = "okay";
+};
-- 
2.41.0

