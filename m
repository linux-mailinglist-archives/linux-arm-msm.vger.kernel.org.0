Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF3E0661DE4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 05:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236539AbjAIEeh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 23:34:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236744AbjAIEd6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 23:33:58 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6797D1261B
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 20:24:09 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id f34so11137272lfv.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 20:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iSgnTZAj4xXXYKclHjwMhiYJRK3FfRHoMz8ZytL1a14=;
        b=iQ4F3dQeMcPvFYIZvDEtCAqg3hbibyyn3r/6DEDT6WOz/fT2RCEyIeq36w2DlvzUo7
         yhvrbKzFdxNCEUIXkTmMWBaV65AZq41aAjjqMuGNc4wrzth6ymGp33b5rCAvcDu0lA8z
         3mrkBVN/NKBsXgLfnyU7GU63CJUbnitpaNZH930O6hDMavX6y1eE5GLeJopWyBJN22p6
         zqIFnqlDnFKGDFEM2BRdTdfvpL04qH2C2ZRyhz+Xk8n8ArxjPjMLcgZMt8Lm40izi3Ec
         RkMVQTynIX9JJpvskzEB1M6txieXJNXOObVN2mXEEYm4H1xsRpJzJV5Yur1fO1T23m8T
         XQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSgnTZAj4xXXYKclHjwMhiYJRK3FfRHoMz8ZytL1a14=;
        b=esWf5llQaFQKbK4RSC3/Lgho6weXa5BsqF0dcoz5eWtXUPl4elBnU4TPzruxDBw3/v
         6KEP8oMIYyQZ9PQxNPxiP6nDWXtWOBgSgXrZvO1OHdOT0EzEd+/28LHNRviirHG4tINN
         Zb76xek7iBrxXOrG4kne46uptiSLMmfSPwCqfNu2XNaKh0zKMKxx9XVYloPK95vhhnYK
         pFBCDNrt0CMDnCw185J6SP1by1HpiTS7NsoIGTSFo32RhjlFyUtgWi96lfcuPFc6qD6u
         ueSXPjy5/yPDksJjpoJILYMbMrvyagY/J18Cbvwipk1UZzOZy8C4oI/vZZXvCbYGW0PB
         axJg==
X-Gm-Message-State: AFqh2kpQqhJ/YAoilGS/Vw4Nb2iHUmUPzHuQDx2Bjdz8hLLo9nixNcl6
        bNvG/krQhzEzNLXqfjEy7q6w350mf2C6ARAi
X-Google-Smtp-Source: AMrXdXvIlyMmZYK11rKI1hpaJt/X3zKraAdNs4CRIFPBhskthGh20FwpWBq0MnBFaLW7fCXHK/1o+Q==
X-Received: by 2002:a05:6512:c1b:b0:4cb:3e50:f5e3 with SMTP id z27-20020a0565120c1b00b004cb3e50f5e3mr8159877lfu.61.1673238247766;
        Sun, 08 Jan 2023 20:24:07 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id z1-20020a056512370100b004b584204b85sm1397141lfr.161.2023.01.08.20.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 20:24:07 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: msm8996-oneplus-common: drop vdda-supply from DSI PHY
Date:   Mon,  9 Jan 2023 06:24:06 +0200
Message-Id: <20230109042406.312047-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

14nm DSI PHY has the only supply, vcca. Drop the extra vdda-supply.

Fixes: 5a134c940cd3 ("arm64: dts: qcom: msm8996: add support for oneplus3(t)")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
index 20f5c103c63b..2994337c6046 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
@@ -179,7 +179,6 @@ &dsi0_out {
 };
 
 &dsi0_phy {
-	vdda-supply = <&vreg_l2a_1p25>;
 	vcca-supply = <&vreg_l28a_0p925>;
 	status = "okay";
 };
-- 
2.39.0

