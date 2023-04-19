Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1C926E8360
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Apr 2023 23:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231880AbjDSVT1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 17:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231846AbjDSVTQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 17:19:16 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F4197298
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 14:19:12 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id dm2so1619896ejc.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 14:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681939152; x=1684531152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNBcAEWabbMN2jaL20kWYpjszsvaOHQs80xc0K/bb6M=;
        b=njwghyR6i+9SWlWAYB6LBy1+93P16evssOEp7uLF/oS3A4252SyCZtvWKBONdJfOLP
         QHiihjypEjqEvOdSuJGEebGJZLdbb5BMbC5WjhkUM0AApW9PcRMMJvv7v1CofVD5WQj4
         VMW+XV0xOrH55TYrlhjZT0MjXhYGxtBl64Zm/vwh9bV7l7nP/beTwqFx56mT6evEQ8GR
         FOxvPj8ZoyXJgmC1Lc9XDiFMT68PVRMbJEn77M+3W8kyjyk5LoL0d+yZvU05eAazbnPY
         yvQXr+vsk+kVUiJunXtiAsXEOT1/ShTzYlNfGlkdMm1siABUOawj7AxfCedrTP/K41I5
         Aijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681939152; x=1684531152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNBcAEWabbMN2jaL20kWYpjszsvaOHQs80xc0K/bb6M=;
        b=dN3Mh7vFajthF/wcQ43ieAKCRoLBriSHEOBLjfm6zi8NkFWpuP3kG6EaUt1ir8kkAF
         eknPX9T4IujWLDM3Xd/arGxIFJlurOhIh7N7pzoKEGuYWNxNmNObBwV/bS8S02HFE6OA
         j+YeL1Zo1F4WMqAg0HBW7yWlu337ywUR3cG5VPwEJx6TKm0TMX8KwswUwk1+ffNqipEe
         AA1ovt+gSF07Egv1H5mmTb5GPsfnaXZiSpMBn53KuxTaHF2AXIkF5kjxMsuie3JOJBS7
         PWc+PkBDFhIK/ExeSBpPfSyheWB9sxP0wYKLZWKTt92jJGKac3WZM2S7Ebg0fPW408E6
         0R3Q==
X-Gm-Message-State: AAQBX9dDAdNbStn586wn33shRYf9rcyFgQuUFLUtitVgZbQPhTxXohXl
        HwH1eJ7/gVMCIxxFzRA2SY99hg==
X-Google-Smtp-Source: AKy350bdM4DlhkiJHOdSMtMex9q+M52Pq7KZzxJFU5AmxlFnun35UJNB5GClV4cWwfbOdwFHuo+q9A==
X-Received: by 2002:a17:906:590:b0:953:37d7:23c3 with SMTP id 16-20020a170906059000b0095337d723c3mr3684119ejn.32.1681939151990;
        Wed, 19 Apr 2023 14:19:11 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:976c:1d6c:6ed0:8935])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090682cc00b0094f109a5b3asm7092739ejy.135.2023.04.19.14.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 14:19:11 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Todor Tomov <todor.too@gmail.com>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Adam Skladowski <a39.skl@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Robert Foss <rfoss@kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Molly Sophia <mollysophia379@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 08/18] arm64: dts: qcom: msm8994: correct SPMI unit address
Date:   Wed, 19 Apr 2023 23:18:46 +0200
Message-Id: <20230419211856.79332-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419211856.79332-1-krzysztof.kozlowski@linaro.org>
References: <20230419211856.79332-1-krzysztof.kozlowski@linaro.org>
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

Match unit-address to reg entry to fix dtbs W=1 warnings:

  Warning (simple_bus_reg): /soc/spmi@fc4c0000: simple-bus unit address format error, expected "fc4cf000"

Fixes: b0ad598f8ec0 ("arm64: dts: qcom: msm8994: Add SPMI PMIC arbiter device")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index bdc3f2ba1755..c5cf01c7f72e 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -747,7 +747,7 @@ restart@fc4ab000 {
 			reg = <0xfc4ab000 0x4>;
 		};
 
-		spmi_bus: spmi@fc4c0000 {
+		spmi_bus: spmi@fc4cf000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0xfc4cf000 0x1000>,
 			      <0xfc4cb000 0x1000>,
-- 
2.34.1

