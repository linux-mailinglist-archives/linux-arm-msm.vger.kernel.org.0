Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81B3A526F6E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 09:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbiENCzp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 22:55:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230382AbiENCzj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 22:55:39 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA4A383970
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 18:18:26 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id z2so19185572ejj.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 18:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6xHwMp2GjMLCtRgHvLeJhsJBgeLi1U+fn/JxefeSa5g=;
        b=t4Z4degRkSMSLcDe19rXju8Y5ZvZX7w1l8wj49AjpcEcFduJog/L23Yi3eIUIKFYte
         1MxeRHF4IjkdGVp+ZpU8FV3jlQ33+/vDrzbxbND0xiP85awMxYAuq3ZXgXPjQs3Yk3lK
         nC1/yQnvMi8nZyhlFnZtwIahS8BvyGy0U6f8gxlO5DCBAPX9frWfOcEJLaw1uAkl9Jgm
         WW7QJzqpHpwJ/prENp1ShJIiGpAr6FYvwJWCbINWemrhtsbZR4YjQE6Jw130IeC+9U/l
         gIZ77UoZhac52CiEYITDg/BRuvszD1uBmuOA6t/lJfVU6DH9Z/JGLhyILI4KpYsz+7ke
         vufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6xHwMp2GjMLCtRgHvLeJhsJBgeLi1U+fn/JxefeSa5g=;
        b=UZRD7RqbNBfdF3V6XG2qhXqBclnilrBE6mSdNhvgKNsiB71QTJT0lziXFE2s5F2Jnn
         5tDjzV7uNprLaYWVlR2K/E5wHk+6Nmiq8Au3zje76RZhFqTeqDF0fflX2y+c4hQCbimA
         9yKnGY/5tEHqvvNaDmWR7hOnBhPF5pgxWcAdclhuXkYPZ5gK6fOwBi2T2uFm4Tq6BPqe
         RzQ96nBZaDGuJUQ7hbTP5LtfpLUANHOLFg4IEn4FCUAEYW5/NDjHsTELznhlBSgm2iM/
         xaqRkUjK4T/z19Lgam8uMGP1KWnm4+DjCTPflbshhjsGfsNFenLiu+FkFTqS3g2H4+oJ
         xBVg==
X-Gm-Message-State: AOAM533eunNkENP3qbCHuQb7YRL+oBA2LZ2lrbOiSHN7dERJiLG90+p/
        qXE1kgLMKokGz9UqUxAupTCJb7w8U1jpBA==
X-Google-Smtp-Source: ABdhPJwVLJhERxZo8wGuRJdOjpgH3e90ALydSoTimxLZOZu5WM0xcBikJZDpuqrdMiWoKr9ge5ItnQ==
X-Received: by 2002:a05:6512:39c1:b0:471:b37e:fe5a with SMTP id k1-20020a05651239c100b00471b37efe5amr4868072lfu.527.1652486593551;
        Fri, 13 May 2022 17:03:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id r10-20020a19ac4a000000b0047255d211c3sm529231lfc.242.2022.05.13.17.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 17:03:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: sda660-inforce-ifc6560: enable cdsp and modem
Date:   Sat, 14 May 2022 03:03:10 +0300
Message-Id: <20220514000310.3070578-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220514000310.3070578-1-dmitry.baryshkov@linaro.org>
References: <20220514000310.3070578-1-dmitry.baryshkov@linaro.org>
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

Enable CDSP and modem devices on the Inforce IFC6560 board.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
index dc6e4de02b42..c2f98863c27c 100644
--- a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
+++ b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
@@ -102,6 +102,11 @@ &adsp_pil {
 	firmware-name = "qcom/ifc6560/adsp.mbn";
 };
 
+&cdsp_pil {
+	status = "okay";
+	firmware-name = "qcom/ifc6560/cdsp.mbn";
+};
+
 &blsp_i2c6 {
 	status = "okay";
 
@@ -194,6 +199,11 @@ &mmss_smmu {
 	status = "okay";
 };
 
+&mss_pil {
+	status = "okay";
+	firmware-name = "qcom/ifc6560/mba.mbn", "qcom/ifc6560/modem.mbn";
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
-- 
2.35.1

