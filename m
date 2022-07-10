Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A35156CE27
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Jul 2022 11:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbiGJJAr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jul 2022 05:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbiGJJAo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jul 2022 05:00:44 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FCBE11C00
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 02:00:43 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id bx13so3063021ljb.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 02:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bs8QcdQy1djDK+VwdSiBURhhZ88rl9ZJFN4yb8iwpTk=;
        b=Z5xFyCHBCVYLY1mZfAZfsU5c6pkVZ6MlPczZS71RWrQtF7VcFHZWX+qWZQOndLG8gU
         /QDhAD750LzOVIsSMGx4baiRCUGNJ+eg/BNDKDTmrVbr6LbavUuG0Mw7pl/sF4IS5K5s
         WINEfm+3j8naAu1BDaM2uc1fGxE4hPH+85YzKm9Vl0HvcR+9H0/UrjOz9q18mH0f196y
         Ti+/Nn4PikZKK3HJF3xBiRd6pODr3wESjRBH/sN8LNTbFDZE5t1Xza31PouWU5HT4z+A
         BCFTzxgiuG6mhXVT0km2NOm58Z+WVrmhgiZMGy2bddifwdDYpIC92W95TnPXLGZy+w7m
         xggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bs8QcdQy1djDK+VwdSiBURhhZ88rl9ZJFN4yb8iwpTk=;
        b=rzLN+EAQWjN8vR6NkD7vpIWsVfup0rD4yuTsz3ZYJgUP1IQa6UMLjEljTyhw5Mkbnw
         9gPPpgKIUfh0Qnd4gaq5cr1pTDZlp/u3QhKK3lyhcja7ixgxREDctDThubRkgU7D22AX
         3Ky6JDBegCuq/AWle3Z6ld7LCwXZmCzBenrW8nyQfkw996tNWJXhyIDeEwk2jMewvHZz
         l7NgQUX/8cNfdI9PmaKjJTDX1p/q9MT7uRl+YoiRiIFdom9VX1aUSHrGfsmrcvU2l1Do
         gIGO80N65/rtq0R/5diLe0vX7Uv3D1TVaW/yxJi5Y1sXtbUtE+Uju85/+PNjDzsZ3hbR
         GHwg==
X-Gm-Message-State: AJIora8DZz/Sk3RY3V0+EMzC9tCvYlNGuzCxoXwdsKYZhJi5HuhP0D1m
        /IGBun/M1MXiyEZLZFa/ATZJyQ==
X-Google-Smtp-Source: AGRyM1vAAXRUW/u9eNMC5CQ2DdLm7LWjiipCc6GIG3Ei2jlPeO67YClCuNTtwAwSpvGfp3/lv9hZ7A==
X-Received: by 2002:a2e:bf20:0:b0:25a:45a6:7587 with SMTP id c32-20020a2ebf20000000b0025a45a67587mr6997088ljr.377.1657443641951;
        Sun, 10 Jul 2022 02:00:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u16-20020a056512095000b004896b58f2fasm822881lft.270.2022.07.10.02.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 02:00:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 01/11] arm64: dts: qcom: sdm845: rename DPU device node
Date:   Sun, 10 Jul 2022 12:00:30 +0300
Message-Id: <20220710090040.35193-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rename DPU device node to display-controller@ae01000 to follow the
DPU schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 32ad5972a642..7c66f490e822 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4265,7 +4265,7 @@ mdss: mdss@ae00000 {
 			#size-cells = <2>;
 			ranges;
 
-			mdss_mdp: mdp@ae01000 {
+			mdss_mdp: display-controller@ae01000 {
 				compatible = "qcom,sdm845-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
 				      <0 0x0aeb0000 0 0x2008>;
-- 
2.35.1

