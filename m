Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6952152586C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 01:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359582AbiELXg6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 19:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359577AbiELXgy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 19:36:54 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC852580F9
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 16:36:52 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id c24so2230924lfv.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 16:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x2qQH918JYdrczWJIIm8XRXT3abBOAyM4GeAzsiuGrc=;
        b=imgXlkwZphoRfEqY61B9arSGf+5S1bk8yxCfn8aW+WCvAiHMbcRdL/HTR67jooTHpv
         rlAFiCo4+TNI21fUjWYOtZfkzogkS02oS+2HutSM9Wd21kr4heZbyBFAJ+m28xSsbtKc
         QwIJ0Bf4VKKlRxvVDq6TT+BBzLfZi8MICxrfPZBD+K5NBhOT+ZYOj8oLtpjCyBEhSRZz
         KkKTLUPO+kLTFVbcp7ZqhtJEE8dewNuOhoEuzZ6uTOcjuCOdARIBom0bO7qi0+WfX1h3
         vLPB8fN0ApvR/UVgwZM8MxJO8zah4w1TF5T3VhtgzoPXCaWORmQWBoTmarjeAyF2F8mc
         HN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x2qQH918JYdrczWJIIm8XRXT3abBOAyM4GeAzsiuGrc=;
        b=H+O1U1B9LU/6+vq1CQQQH0USia2h8SxH+RjrMaoAC9GxiQIuVl2mZzdqux91SdhKv6
         ivTp5TDh71SByzCI3Ct3RIhjuohB0B8bGejFKzNHrCZlVkRQ9bRDjZlPPcpeHXvsBWbn
         i3V6PkFVRjrCIEBysHU+MPmEKyMxY2cGGT5BYTC6VdFP0OCtCnBbn7Ee+VYE2UonmkZ+
         7lODEpsnu3I0cCdErcSa3cRjUsDqvjOez3/DcmKsHWWgWx/R7jy2VUDRfV392qNM/kOO
         d3j0/Fym/RhJfu7GphYA8goRrDLt6QytU5Li4n9SctMzskCoDll+zgCaQsBixoz2VrVc
         j1lA==
X-Gm-Message-State: AOAM531nw6VJOU3bxEqZmgYiMWxo0zN1KeWgLRKYnHcecmBJeQptDwoW
        qm9uq+9sx3Lwu0QmFrAcUmEyoQ==
X-Google-Smtp-Source: ABdhPJwQmW0wytK6CIsH6M30YJ8vzgMgIGQyJDw6fDiVF6pGuAn0bMDE2gbxsjPKZlzZjlb1hqkmsQ==
X-Received: by 2002:a05:6512:68c:b0:473:da9a:66c3 with SMTP id t12-20020a056512068c00b00473da9a66c3mr1430381lfe.531.1652398611128;
        Thu, 12 May 2022 16:36:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p13-20020a19f00d000000b0047255d211c1sm127937lfc.240.2022.05.12.16.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 16:36:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v2 4/8] arm64: dts: qcom: sdm630: fix the qusb2phy ref clock
Date:   Fri, 13 May 2022 02:36:43 +0300
Message-Id: <20220512233647.2672813-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512233647.2672813-1-dmitry.baryshkov@linaro.org>
References: <20220512233647.2672813-1-dmitry.baryshkov@linaro.org>
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

According to the downstram DT file, the qusb2phy ref clock should be
GCC_RX0_USB2_CLKREF_CLK, not GCC_RX1_USB2_CLKREF_CLK.

Fixes: c65a4ed2ea8b ("arm64: dts: qcom: sdm630: Add USB configuration")
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index e8bb170e8b2f..cca56f2fad96 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1262,7 +1262,7 @@ qusb2phy: phy@c012000 {
 			#phy-cells = <0>;
 
 			clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
-				<&gcc GCC_RX1_USB2_CLKREF_CLK>;
+				<&gcc GCC_RX0_USB2_CLKREF_CLK>;
 			clock-names = "cfg_ahb", "ref";
 
 			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
-- 
2.35.1

