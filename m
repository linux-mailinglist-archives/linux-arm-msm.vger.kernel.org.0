Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCA796E8362
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Apr 2023 23:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231910AbjDSVTd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 17:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231901AbjDSVTR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 17:19:17 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BF736A6E
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 14:19:15 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id vc20so1583961ejc.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 14:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681939153; x=1684531153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9QPvfE3NjcwvEgxYvM974qTypUj2hewodk0hJUiEGis=;
        b=o2xxMKhWf7lWXAKvLMPYpYa9jd9z+qLzCkDp7GvQdEWIHj+9MDcxa12pwWIm1eBrs2
         Ne3sj9YVMhgu+MrEsGz02xFn+5F1aJk687yJwcuayI4c+oTuxVeuqHrIkDpwqU93MOSK
         ZVeGnC5e/yqN1SetdB+6fRb4Jii51ykVtTETvdm6bF2UddM+MwkojQv61uvhk32AIGjW
         O08GsgtqHHQA60UTKF5V6M+PmXnvwrfjLUYgqONwfNKbnDjr7cOsyOqhsp/79t2yQIu/
         iPB68hF/bEEfM8jwebIc3PRffVZ99xmo0822Gx5zvpuyMNltT5X/JDvB+m1xjV2LxLpH
         xgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681939153; x=1684531153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9QPvfE3NjcwvEgxYvM974qTypUj2hewodk0hJUiEGis=;
        b=TWdMDIU8d289JCsK8JFOacKFSfEHkUfAa0owCu7weKyIhVex+C7CGv0geD4q9zdhyG
         MDXzEqJr6gON1lBs9IjCSpVZC1uGIGr1WpInVrr5hBOoNAu6ELFxJ4C4TlU7ZB7OVaMH
         2STHzFNmSnh5qnwSEp8wvnJ0RYSB1Oy+zyC3Z496kEIM13Mib1pm3eidPaNxDpGGjjQo
         92bIwxxYNf8THG2tpGsXgDZ5rfMNHFcI28B38gNwbWEnQb/74bgGLf5ZtrTNFWeenC0P
         G2uyZL+4rYUv9jXO2PZPTpAi6PHs3ZAyrE7xvSEgNsgtk4YxY5l0s2AoX4XcX0Q+7fT+
         yFBA==
X-Gm-Message-State: AAQBX9dlcAhfb1uMkvNjFqkJrS7U1oyjWxffwPf9QnfyxpD9K5vguIO8
        tsZF8bhpnanQW25aP4JMJ8P3FA==
X-Google-Smtp-Source: AKy350b6pQG2ZfnAcvVvCyj5MtEONQUY+beQxcRcapPPUIKC9wEkO9dClvWpBalXDQCHuvNkvhNndQ==
X-Received: by 2002:a17:906:dac8:b0:94f:968e:4c00 with SMTP id xi8-20020a170906dac800b0094f968e4c00mr10645057ejb.31.1681939153551;
        Wed, 19 Apr 2023 14:19:13 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:976c:1d6c:6ed0:8935])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090682cc00b0094f109a5b3asm7092739ejy.135.2023.04.19.14.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 14:19:13 -0700 (PDT)
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
Subject: [PATCH 09/18] arm64: dts: qcom: msm8996: correct camss unit address
Date:   Wed, 19 Apr 2023 23:18:47 +0200
Message-Id: <20230419211856.79332-9-krzysztof.kozlowski@linaro.org>
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

  Warning (simple_bus_reg): /soc/camss@a00000: simple-bus unit address format error, expected "a34000"

Fixes: e0531312e78f ("arm64: dts: qcom: msm8996: Add CAMSS support")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 30257c07e127..25fe2b8552fc 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2069,7 +2069,7 @@ ufsphy_lane: phy@627400 {
 			};
 		};
 
-		camss: camss@a00000 {
+		camss: camss@a34000 {
 			compatible = "qcom,msm8996-camss";
 			reg = <0x00a34000 0x1000>,
 			      <0x00a00030 0x4>,
-- 
2.34.1

