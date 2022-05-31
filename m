Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE256539107
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 May 2022 14:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245736AbiEaMrl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 May 2022 08:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243527AbiEaMrk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 May 2022 08:47:40 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1BFD5D5C3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 May 2022 05:47:37 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id br17so21287240lfb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 May 2022 05:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r3/jevdsJSGVl1zPrKNV30Bc3ZiH/kytNoUeRC1cAXA=;
        b=bWeYY9xDhw4LSY+wJKq6IW22lA25aembLAAZ1jfzd9z/S5T6WXwzIOSGArZpy+vOJA
         BRIr443Mz8RxaoZtbq9WR8mMgD47whTt3RqSqVyiSYINH8a4EONkpokC1800PjnANbIE
         tSOfH3v56CyZ+1WHYucF8EsJxRMD4NZxEtLnqER082bcPH0BFd7Nusz55Y+VyoDQsjFe
         c3Tjs5s4Yx3YPUPwfTHj/ADT1ffYS/Pvvb7KCIOfCqXJ8K6nVezv8vnqkLTircFvwM+Q
         4DAR6rb3wvM419QwHEnHSN6tfsDy+89R/QxeuWjI3ko34zt4Ri12AsCT1F85MYL+OF61
         tBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r3/jevdsJSGVl1zPrKNV30Bc3ZiH/kytNoUeRC1cAXA=;
        b=LQHHL4Hkhw5wb+A8g4WoE4ZM19BdebuL52SBQt4/OkeHxdSO3bS8i/Qr/OCqDEw8Tk
         EkEJPFtLvfbuHeppWPzzdpRzsS8R1DXa2JAjrBu9eGarKSINc/hcA330GCykECmST9r9
         uWs0ij6wzoZaVN4EoCosHpppR1L3J0Y/xntUXfMxbU8Nsrg4woue4DSGyNmB4/muHrxY
         NVf8ULgl9o2crN7xSndFuG0qCEEsA9vASB6+R7QDQvyWaQgjLm9rBue9DzkTpjr/k1K5
         lKhHjimT8IRKur7Yq5dqzuKZb+UyvZFzC+/uUWBQYc5fSc1gr2/iUPO+fnHByOZaLzbh
         wrYw==
X-Gm-Message-State: AOAM530SoeM5aeI9h828ydnuyjqHqQoV07Bqw6stb1YF1YjLO17nWzVX
        7HEHN71rIsSgEeiOVBrLxF10+g==
X-Google-Smtp-Source: ABdhPJyy9JFGnf2TlnHouAv/1tGCvkY9vnz8IoifhlpyHrM50TMAGs6Fl69JLE4RQyoO+NCNGY54Zg==
X-Received: by 2002:ac2:5444:0:b0:477:a839:b4d with SMTP id d4-20020ac25444000000b00477a8390b4dmr42573771lfn.333.1654001256310;
        Tue, 31 May 2022 05:47:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s16-20020a056512215000b00478f3fe716asm365082lfr.200.2022.05.31.05.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 05:47:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        freedreno@lists.freedesktop.org
Subject: [PATCH] arm64: dts: qcom: sdm845: use dispcc AHB clock for mdss node
Date:   Tue, 31 May 2022 15:47:35 +0300
Message-Id: <20220531124735.1165582-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

It was noticed that on sdm845 after an MDSS suspend/resume cycle the
driver can not read HW_REV registers properly (they will return 0
instead). Chaning the "iface" clock from <&gcc GCC_DISP_AHB_CLK> to
<&dispcc DISP_CC_MDSS_AHB_CLK> fixes the issue.

Fixes: 08c2a076d18f ("arm64: dts: qcom: sdm845: Add dpu to sdm845 dts file")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index b31bf62e8680..ad21cf465c98 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4238,7 +4238,7 @@ mdss: mdss@ae00000 {
 
 			power-domains = <&dispcc MDSS_GDSC>;
 
-			clocks = <&gcc GCC_DISP_AHB_CLK>,
+			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
 				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
 			clock-names = "iface", "core";
 
-- 
2.35.1

