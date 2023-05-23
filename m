Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3070A70D4B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 09:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235412AbjEWHQI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 03:16:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235383AbjEWHQD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 03:16:03 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62A801A1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 00:15:55 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f41dceb9d1so68565895e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 00:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684826153; x=1687418153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=euEE75tKi3cqGTjeMlIZ4N8qPZ11Ooh1j+ZxhXbpsFI=;
        b=FfGp27BfCu5MWfz+d6Nx0jXWd+bvkIJCekR+apoWmimlKoXreA3kgpm9T5BZc9KE/l
         Qt6HD3BlAGxyycKFijYPRGGXYGET14IGtSu6i6Mzx35v1wZTGdqGFbCwHdsC8yfYr5MD
         zVBU1ojk7iw7BqqNYZlrpCbbeaymMQmktn0QfbjQqkhxKisoPSG+yCvluRpnGKe4H2bo
         8B6tELKY5ihOYnG1HtQHfjf+luxcHxtxAzS9wdCkc2rLel58i9HfalxauR/M1odj0n/q
         gSepTRbUrOyVj06gjj5NrDNHOmQa6Gv+RYy9AXusVYTiPCH9yBFKvXfzABclLKHE1YHl
         BD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684826153; x=1687418153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=euEE75tKi3cqGTjeMlIZ4N8qPZ11Ooh1j+ZxhXbpsFI=;
        b=NSEQFvQmzDxTQbWtG2MWdliLpH2fJQkT6jFp6/gx3DMi0+tIdLFIxyonRK/mUycpXo
         VQjUjAg/NXuLrxJN4nAnDHVLJe0OjMtZuhnQRdL4kw5+vCDpJktKEg590LL+/htMHE+I
         LyMgVXQbdKs/DbqbQWOVGA8PmaKSfcpSC+i/6o1OW4KBQrQZGySSk6OOEQG9kExj9YCc
         CnmuDr0Ir/ZLP+uyIuv8iG+hyDtugkTvRBECjX+ohZ4fSgMwixgM3oDkzsvA9O9Yksfp
         5TqsZdihkCrzJYx4jN3di8qhyetQCrv3Zevf5SP8HAmCJjm1WJSpdN4TRGz7d12d34JV
         tHtQ==
X-Gm-Message-State: AC+VfDyI7rkMMSwBLelhKgaEG+Yiy41BCpFJNU3PT4AkLcPiIJ+mZF8y
        7TO8eM0jRELvnhLzrmQ8a94rhQ==
X-Google-Smtp-Source: ACHHUZ4fs5Ev0TeA3VyA8cBDPX4R1+JeAnsB/XaBxSMJQffeMekVsOJUtevPH4s1fc3ev5KoVXzs3Q==
X-Received: by 2002:a5d:63c6:0:b0:306:3381:67fe with SMTP id c6-20020a5d63c6000000b00306338167femr8755879wrw.27.1684826153729;
        Tue, 23 May 2023 00:15:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id x15-20020a5d490f000000b00306299be5a2sm10096239wrq.72.2023.05.23.00.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 00:15:53 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 23 May 2023 09:15:46 +0200
Subject: [PATCH v3 2/6] arm64: dts: qcom: sm8450: add ports subnodes in
 usb1 qmpphy node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230503-topic-sm8450-graphics-dp-next-v3-2-6c43d293995f@linaro.org>
References: <20230503-topic-sm8450-graphics-dp-next-v3-0-6c43d293995f@linaro.org>
In-Reply-To: <20230503-topic-sm8450-graphics-dp-next-v3-0-6c43d293995f@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1041;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=03IEmDrMBSANu38UOlHT7AhDQNDNcVKz+ywk26O48No=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkbGgkAE/95UxNmS6z6T24s9SKeklQNlAXn5l5XXC9
 xT/rY4CJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZGxoJAAKCRB33NvayMhJ0acoD/
 oDw18PcgEdYR7GAEVyguVASjk7sPi9T1NyTcbUPIS8ZCyF0GvqmBq0JgtyQ53yoTO94X0jH1k1P5gl
 vewytH5qCu7DjS08DYS0LDpDBIhRZmA3hRdA8CvZmMqLM69FIdbY8Z+Ju+fRaILuz5pwH/6XMQmvWv
 WQpcUErTai3pDVZJXO9w1Twa24PE+kfSpECBsNuLgXuOgr1ErswNAWcATPyePys/SKajhptZqM/yn4
 tIqmKaDvp0uVQ2/bnWVP8V2F1s2DoHQzdSzoieEcBA8mWUO59xgZzz2gSCD2qNNR0jfZuYEh60fj/N
 3z3yEYgs6u3CxPB8474mY2tDYedmrTJyS8szBDGj1YuHvLgBuilpakULTtX/InLa2Pr1CtLwyMqdQy
 CQ221iRIi1wsHQ2bUEEjul/e+s3mwS378dLDCvDfdiK+7/1nikIS0mPxCtGARC+YljMHtAwz3qD0eb
 4f3tpsV95EmEPZAc67LhPcSMv1vmI0cUmA0NM9Her/tZmBcO6dntu5NyX11Llrkif5pTBeS1erBEBR
 KJvIZ+/nAhJEkJI19cVJ5+DGMrw8u3la9uIXhjcsqlhfKcbAhgzgLEM05vO7nWax3QseN9/G5W2CYB
 Q0wwNkeAxzxxJOD0jkou1dKqbVclkmwGbWxSmAjXB82KGDf+fHYG6g7+S/vA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the USB3+DP Combo QMP PHY port subnodes in the SM8450 SoC DTSI
to avoid duplication in the devices DTs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index d59ea8ee7111..7f193802a7c4 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2053,6 +2053,32 @@ usb_1_qmpphy: phy@88e8000 {
 			#phy-cells = <1>;
 
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_qmpphy_usb_ss_in: endpoint {
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_1_qmpphy_dp_in: endpoint {
+					};
+				};
+			};
 		};
 
 		remoteproc_slpi: remoteproc@2400000 {

-- 
2.34.1

