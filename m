Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A18FB4F7B96
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Apr 2022 11:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbiDGJ3d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Apr 2022 05:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243769AbiDGJ3c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Apr 2022 05:29:32 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3284635A8D
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Apr 2022 02:27:32 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id d7so5649331edn.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Apr 2022 02:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j31mE7QsLjfJV84r2B169BqJYqRMBSDJ1cFRKWHP/6k=;
        b=WePfAiCFcr45urrnMjw6CBo3C3FGjLMd7wUWuDOtFy+JmApVkUxLcJopH3jVq1tvPU
         L+QA9RawpAAHKg179DzDjtRi1hw16O4mmSPU/YWIhEJEJlLuUCVcdk2ijsECcTRT5Mjy
         JdWyxo7ufbDQmWHZIF1SXaX6EBnpg9DpcBBu3sLDxjPlmzbjAtSlWsfj1uK0ezAhGTxr
         PEcjLrZNGzCMNdgoD4EiI888RuHKOxhj657eozFO75JHek93zwKeff2xP6COOxDOvwlt
         RZyOHwyxJjr/DF/RELot5vBBWxZfIKz1KaNeOAsi0zDP/qH9OrvWj32s0/B+qbzpZtdD
         Sfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j31mE7QsLjfJV84r2B169BqJYqRMBSDJ1cFRKWHP/6k=;
        b=f1inbTwEVTVKuANR8gr87XucXT7IpYTd3fu9sr0QLdLWjOLu77zs8+kI1IN6mUNL4s
         XpyWv8GSqq/7p1yZqkDlpXVjg5I8TmfvJbLZcOX8lxAvp2c5Qlmvm3XMcIUgMhIK9FFA
         oO5M7l+dnLYUy1hT4fs2b0acGjVfMoPM/olMDot0Nug0pQsENR7N9U8ydBibfbU2LHMZ
         AkCb5NJddbap4a1HzM4K9rF0DeQSow58Tufjzvi6nnkGYrrCOjVLcU4PavWxrMkWZLCW
         ziKyQmoGHOt0vdlSoCGa7tTx2+b8v+wCQ5Wo2jkcSQSyGy01Cv2/MA77NN1i+qxFJTFp
         GKQg==
X-Gm-Message-State: AOAM532BiDxBRZKqnC72uN1d/rixgTLfSBtM1LgkC+HXlQMjeoUgr1r3
        9MqHmMs01RbdZmGMVmdyj44Qgw==
X-Google-Smtp-Source: ABdhPJy0nv2OT3O9Um0ycKjLoBKL176k7jpKbyWweSqC9inEPdwEWEoevR7Hk6LATIkokMcmXlRrnA==
X-Received: by 2002:a05:6402:b23:b0:41d:7a:2392 with SMTP id bo3-20020a0564020b2300b0041d007a2392mr3704154edb.188.1649323650853;
        Thu, 07 Apr 2022 02:27:30 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id s14-20020aa7cb0e000000b00410bf015567sm8649435edt.92.2022.04.07.02.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 02:27:30 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH v3 2/3] arm64: dts: qcom: msm8996: correct UFS compatible
Date:   Thu,  7 Apr 2022 11:27:24 +0200
Message-Id: <20220407092725.232463-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220407092725.232463-1-krzysztof.kozlowski@linaro.org>
References: <20220407092725.232463-1-krzysztof.kozlowski@linaro.org>
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

The Qualcomm UFS bindings require to use specific (qcom,msm8996-ufshc)
and generic (jedec,ufs-2.0) compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index f0f81c23c16f..fa491f2271ff 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1730,7 +1730,8 @@ pcie2: pcie@610000 {
 		};
 
 		ufshc: ufshc@624000 {
-			compatible = "qcom,ufshc";
+			compatible = "qcom,msm8996-ufshc", "qcom,ufshc",
+				     "jedec,ufs-2.0";
 			reg = <0x00624000 0x2500>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
 
-- 
2.32.0

