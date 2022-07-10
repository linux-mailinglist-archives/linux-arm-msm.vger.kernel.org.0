Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C312756CE2C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Jul 2022 11:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbiGJJAt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jul 2022 05:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbiGJJAq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jul 2022 05:00:46 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 495F012AB0
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 02:00:45 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id u13so4280155lfn.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 02:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iAQx/uD//KZplcIf17mKmrkwaSgdfWCTgLFjJOi8JBA=;
        b=rOjMZ43DqoxJgFj3QPiMHbZR9iTkTBjzhTPtTgr8fzHTouwAvwktMoUdvYXZNGZa+6
         ZSGmyuFkAoDUINlKhQaIfm1+oOAGUCodgVNjnz3W7QctgogCpIB6rcMMDLY24xb0JjdO
         /RCxluPQupBeX8K/7kX7FPGbiiHieY5PkjlDktMIHqyb1Q+cx1kmgaEMA1QiAeFBIi54
         yUD0YjhXrfYkTeV1tObWK3ZPtnN8cUKJEPP+90E3nF+zZ3gVsG+ViIZWG878phsADem9
         rsgwg2yqvPird2j+ydB8iS94eqosnrOSEF4alCR55Pd32RoieQsjecpNj0TzK+m0iAiV
         //kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iAQx/uD//KZplcIf17mKmrkwaSgdfWCTgLFjJOi8JBA=;
        b=VnWn/ZL6hWtozz9xgIsR2v/Wxbmf47BEkkBaIX9jhHZnwMkdOgMBvE5laPDAZcBY+Z
         q/EROEDnsBsfs7uN0Y1Fjb3rop5gnYN/qU/XSg/KBoiuSUd9+3tL07DZuJCuvli8rpPH
         u+p6r8MHyRvr3MmNG24Rkj/v1RYE0iQ3UsYJddvscFkqBKBUqvGHLEvXzm04v0Gr6PvA
         HFsHKLr+ut3m8dDV/72HkExRcaEcR0C53jRDE6ktSFI4Cr5Q1s1o9AfzUEI5yi773oy9
         g9e3LEG4Um7z5KBZmLwyH5Q5/30e2P/9yvR3vI8w4xoLVo6p4FtqmogQP5okUcgZISa3
         7skw==
X-Gm-Message-State: AJIora94Fp3DVI/vVcwsh+CpVZ9dHSrrMrT8JpnLmtLqlzef1+OxL47j
        UdASV2sCQ8gKvGBh9a3+phEcr3tmJtonGg==
X-Google-Smtp-Source: AGRyM1uPGPmg6YRGI5I8EVD1Xyyv+ctzqdaU2D7fon7kgwpGTp3SHUsZa4iW2yqenvkC1QIPdnLMDw==
X-Received: by 2002:a05:6512:108c:b0:489:d110:a8a4 with SMTP id j12-20020a056512108c00b00489d110a8a4mr2866086lfg.648.1657443643626;
        Sun, 10 Jul 2022 02:00:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u16-20020a056512095000b004896b58f2fasm822881lft.270.2022.07.10.02.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 02:00:43 -0700 (PDT)
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
Subject: [PATCH v2 03/11] arm64: dts: qcom: sm8250: rename DPU device node
Date:   Sun, 10 Jul 2022 12:00:32 +0300
Message-Id: <20220710090040.35193-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
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

Rename DPU device node to display-controller@ae01000 to follow the
DPU schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 43c2d04b226f..48c60df59080 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3444,7 +3444,7 @@ mdss: mdss@ae00000 {
 			#size-cells = <2>;
 			ranges;
 
-			mdss_mdp: mdp@ae01000 {
+			mdss_mdp: display-controller@ae01000 {
 				compatible = "qcom,sm8250-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
 				      <0 0x0aeb0000 0 0x2008>;
-- 
2.35.1

