Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 684F86E381E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Apr 2023 14:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbjDPMiB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Apr 2023 08:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbjDPMh6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Apr 2023 08:37:58 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B48403A80
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Apr 2023 05:37:56 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id q23so47791959ejz.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Apr 2023 05:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681648675; x=1684240675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0HPx42QUlUrIgol6iT7rI+K2Mx3HeR6PV/33hfPyrk=;
        b=u8/evSXUyc8lUAiyGXDKvua7QJQUTv5TZJhlGuTyc0sB+aa2xuqONXI0+WrwP3JTfl
         N3X88Zu+j5wFQqeocutBPdlb7BGJ7l6983SgyOOhWV7JGrLHEwOJ9qmrAzUW6HWnuf1j
         OkeVIb0JOY+GQ6dNnZNeGmuoJDM4fuFC2U71OXd1b9cDr1pPBJbvbFwEk5I/dR1f0ihO
         ORE03qDPqm9b+rbe3dtJ2ngIHn1OOr3LmuGnKRIHGhI0ooVoefYMDU2bXKt1GhQaJPBC
         uNc26anBAbmYoSQTHl1H7F/GzVWz0B1xYyUmL7JTrviJBezglvQDvVqAcim6Dbx9Ac8x
         NarQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681648675; x=1684240675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r0HPx42QUlUrIgol6iT7rI+K2Mx3HeR6PV/33hfPyrk=;
        b=hnP+I23LcdRdmUjDD1eRVVaQrV9MoknMoNKCzyRCgUkNK0N63r1nA5/gtonzM1idLv
         RuQXxt1qyNUakHW3efEN+jhAq6hj0B8X2erZ/2pZzd+aGrvJSTf10PzgFve0+mFDFwbO
         w6vyeC1Q/rQErz1hEnODhCIdtGnHLv5rqY4qaejylv5yiJwJBqfl8S/f59ZZDeiNb3cb
         RaTj59bu64jZPXAIFMVoRSbAsc9OCDgn9g0cLYWv04MLBXHEVYfNW8+KhBF2dKz4EcGX
         B2dCC/QToKLedH+40pGWMQUDTS9aFWgdul3Qh/Uf3UKYmPbhQLZGiabQQKuCdB8GW/MW
         s0FA==
X-Gm-Message-State: AAQBX9cxK6j8I97h90HFZR5QJ9MA+2K+3r1e5uRckBMhof0J+LjjTtbL
        juGXA+gUK2wUiUoSXFL4SM+NAA==
X-Google-Smtp-Source: AKy350ZUVn1slojtD4IsCWk4vIejtqMK9/KVGcdNaKZhs9zUjwUfAvjAnepDlhC4f1EGSliGIoFLbg==
X-Received: by 2002:a17:906:c407:b0:94f:9f0:e897 with SMTP id u7-20020a170906c40700b0094f09f0e897mr5401002ejz.38.1681648675166;
        Sun, 16 Apr 2023 05:37:55 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:29dd:ded4:3ccc:83db])
        by smtp.gmail.com with ESMTPSA id j23-20020aa7de97000000b0050432d2b443sm4556889edv.48.2023.04.16.05.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 05:37:54 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 5/6] arm64: dts: qcom: sm8550-qrd: add missing PCIE1 PHY AUX clock frequency
Date:   Sun, 16 Apr 2023 14:37:29 +0200
Message-Id: <20230416123730.300863-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230416123730.300863-1-krzysztof.kozlowski@linaro.org>
References: <20230416123730.300863-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SM8550 DTSI defines a fixed PCIE1 PHY AUX clock and expects boards
to define frequency.  Use the same as in MTP8550 to fix:

  sm8550-qrd.dtb: pcie-1-phy-aux-clk: 'clock-frequency' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index d5a645ee2a61..a08aa438bba8 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -359,6 +359,10 @@ vreg_l3g_1p2: ldo3 {
 	};
 };
 
+&pcie_1_phy_aux_clk {
+	clock-frequency = <1000>;
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
-- 
2.34.1

