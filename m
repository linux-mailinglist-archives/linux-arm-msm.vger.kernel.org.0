Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7AF05AE7C0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Sep 2022 14:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239915AbiIFMUB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 08:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240309AbiIFMTe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 08:19:34 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC6307E332
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 05:17:14 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id z29so17015554lfb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 05:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Olx2xfEl0PLpI3+3+5Qjw680apGzpUP0gS3Mnyx3230=;
        b=jD2je3ofjQyfg/jOh+LKalUVOeBAAwrbkYEw21Sy5iOwMAdmX9y5mHP53gRvgVND6B
         EvGMCz2fygVPNQWXs8kWLOct/tEKZzBrabZxXRYqsYU6lAtic8byQZqKWL/c/mSjwmWb
         HJIekXpLhTd64mrGYRTulWsVj+73kjg6lVZ/s6U7k8B/ATZq1ydF9iml+OrPWHb83MGf
         /yT5LyvlmjZKTulVOpEzsXzzjQinCIfvydt+CIz95iR9zwB7Q9GtF5YwVDVrC65fC/Fq
         e41P1BghT2SnBLR0EyEaU/iYipZ5gdePZbdgyOtM1jMdgpYim/uRiewF9TKYib7rQJ0r
         mHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Olx2xfEl0PLpI3+3+5Qjw680apGzpUP0gS3Mnyx3230=;
        b=EKBwyiHUtrxYS/o0PrHHQMsy+ef0P7Z4AXtOeuzcKvUXbf7FQ0KRMfptiwKrmXj3zv
         cxE2wPSu2GKuZBGc89+bik52ryCUJv3O4YItpStW4iwrCWh6R0DIrQrcaZDGdGNC/bXh
         d7FDVs+uwaxB66wT1rJi7hovlij7xg7FnQqbP/fgx16XQCtfLnVP+jZde/2zY1ZHrS74
         WKqzptX2/WjpHAYel4+6ahFJixUmHDIGKHMO2mGc9IlOGAz8F5bd/iDFmEURUBUEPqAU
         4ruoB3f8/NP0J+Y5nUOn2++/ZLoewCYyNiPgRwwpO+4Z5Ig9Y//mEmDu++4w+YRhYf8Y
         xYWA==
X-Gm-Message-State: ACgBeo0+0aauj+SpWZfa6wc0f8KcGYa3+nUlPhh9bMUKK4QHvnSeK8i+
        +PHg10KusGUs2B+eCsDPcc4UsQ==
X-Google-Smtp-Source: AA6agR5TML3s8NoEL5itQJnrQzTJ3E7pKRUH2G3Fd4S7hT94Gg7+NWiCuPmzmzxU5jNAYCnta6P3sg==
X-Received: by 2002:a05:6512:3503:b0:496:517:5802 with SMTP id h3-20020a056512350300b0049605175802mr4379125lfs.83.1662466628883;
        Tue, 06 Sep 2022 05:17:08 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u17-20020a05651c131100b0025df5f38da8sm1882802lja.119.2022.09.06.05.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 05:17:08 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 08/12] arm64: dts: qcom: sm8250: use generic name for LPASS clock controller
Date:   Tue,  6 Sep 2022 14:16:51 +0200
Message-Id: <20220906121655.303693-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
References: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The node names should be generic according to Devicetree specification,
so use "clock-controller" instead of "cc".  The bindings so far did not
define this name (as child of APR service).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index da9f7a701bc7..da340159c0f1 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4799,7 +4799,7 @@ q6afedai: dais {
 							#sound-dai-cells = <1>;
 						};
 
-						q6afecc: cc {
+						q6afecc: clock-controller {
 							compatible = "qcom,q6afe-clocks";
 							#clock-cells = <2>;
 						};
-- 
2.34.1

