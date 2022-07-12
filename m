Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4EB5571E67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 17:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234102AbiGLPJo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 11:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234216AbiGLPJX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 11:09:23 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E413C84FC
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 08:02:47 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id n18so12704175lfq.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 08:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2x572kTW28ZwxF7SkDqo2Pgfax0p5nEhs9ONN4/XetI=;
        b=NJcUzTsW/rgRWNJv6DpgSLU5PfGN+COwlu5P96/PzhjUDdgDZkMnNt7x/lrKNGB8f1
         8OQoE6TUK7ES1zAE5CV7WUkZEOaYulKmVQvoVHqYx1I9YC8eKuSo74agcgvAcnZAZ5aQ
         4Bl36tGhXIEftgJeAZ9fOJeSKgAMj/FBGtN+W92Kq8A317zJ7RYl3BllyhwJIbUj/c1j
         7r/yK91lruwvutybzG78kT1FTrlOf1bhodo0lkoR82bxUMgo4mNL3xEUUurh/ixIcI37
         Kf8+hmFzpIhn0u1UL/lCLCRqm0lpk0EQBBTOIMGGUx3gfu9sfdMNocuzpORlheRQoArS
         wzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2x572kTW28ZwxF7SkDqo2Pgfax0p5nEhs9ONN4/XetI=;
        b=KkvhzYdP2bJLQjMYST7lD7IAHM6of2h6mkjG9RVmJ8379I3g+wgqwEU4bPZO8NlC+s
         5fYun95uleKVLCHxqF55W1Tip2z5D16vwjKqQmh4OnYzeruni7rUIlfmLGxr0OU+1Z/B
         1bL/1v2L4xjEZOGrS09ubZ5D7+kIzFznxLuoEc29A6Hh6Lz2HdmjdE4w5SrsHTbkwdiW
         w5XhMNN+/6HqOORbuZ5kQNLKK5WJW1mZaTUij8CmJE/CUJTcsz/9KRdOqBMFiEPoB62O
         ua4aciVfaw/7tfTupSM/YORFnbuhPWMROoH8UzN1wWIaJffYNYCWFFb1KPRbg1zaxjfZ
         DDtw==
X-Gm-Message-State: AJIora/oPVhw33+1KOST+Ptn2OgYESaQOS8uAdgosjpI0291ReIOWV6t
        YJkYsmda8f/Gic+6hNsfknZnig==
X-Google-Smtp-Source: AGRyM1uUEj+eeYb4U3ObAn66JKn20ypxBhVjRI4rxAngP6eKkBgtlO4pCmKfBusLGphT3iUfCBtdbw==
X-Received: by 2002:a05:6512:3e0a:b0:489:e50b:1dc9 with SMTP id i10-20020a0565123e0a00b00489e50b1dc9mr5811875lfv.321.1657638165794;
        Tue, 12 Jul 2022 08:02:45 -0700 (PDT)
Received: from krzk-bin.. (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id 4-20020ac25f44000000b0047f9614203esm2224649lfz.173.2022.07.12.08.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 08:02:45 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 2/3] arm64: dts: qcom: msm8998: add MSM8998 SDCC specific compatible
Date:   Tue, 12 Jul 2022 17:02:18 +0200
Message-Id: <20220712150219.20539-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220712150219.20539-1-krzysztof.kozlowski@linaro.org>
References: <20220712150219.20539-1-krzysztof.kozlowski@linaro.org>
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

Add a MSM8998-specific SDCC compatible, because using only a generic
qcom,sdhci-msm-v4 fallback is deprecated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>

---

Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 85bbd4f7306d..e263a59d84b0 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -2076,7 +2076,7 @@ qusb2phy: phy@c012000 {
 		};
 
 		sdhc2: mmc@c0a4900 {
-			compatible = "qcom,sdhci-msm-v4";
+			compatible = "qcom,msm8998-sdhci", "qcom,sdhci-msm-v4";
 			reg = <0x0c0a4900 0x314>, <0x0c0a4000 0x800>;
 			reg-names = "hc_mem", "core_mem";
 
-- 
2.34.1

