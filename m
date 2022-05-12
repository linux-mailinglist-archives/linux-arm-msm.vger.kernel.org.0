Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3874525868
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 01:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359581AbiELXgz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 19:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359530AbiELXgx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 19:36:53 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 149665674A
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 16:36:52 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id bu29so11804888lfb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 16:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i1goeg2wYzcHMfXO9CDFGJF9XLqANUBaSoksUz5XNRc=;
        b=X3LHZVoKx/IHv7Ini1Y3dYLp8M7uyC0RZiERWt3pMoULdXqVrVHZggMQMIPfrPtF8V
         /IGe+F1554dHMvA4Ofm87+iFxPr0aiiYA2jSn5qp3oGvtrAc7F/Hs8bJE+bVbNia/U85
         pII+jH+Vr4nEsO+l0Z+j3ygVX97CVFOeNDl1kcoc0SA7TcjZf4b0GNyROQNkYoVLwXn1
         PzDDWkvwYjkVxrdJHsy9U7EoWvc9ehA1NrkzlepJOGHN2/dla7NVig3LEB1bO2ubAxYz
         i/0iu6pswFhG/ZevKdlUtJVl8Im1rW0mo0mgA1vuKUWge7U2DU+IFD6uM9r15WsephHA
         1UQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i1goeg2wYzcHMfXO9CDFGJF9XLqANUBaSoksUz5XNRc=;
        b=Hq0+CgIF7bCnO9lHWheyMWvcqT7CwcbvmULcrkCBkhg3sblhPIuETBB4nUuglBdrEo
         ol3DSZstPXZZMUa2yWslXXUy6e8oQ/7luL9LATPyPrG7+0Nagd/5Z8SBbDRKghkb5UK0
         G9fjG0TTCHgSIv6xUlyc030SjOypn6ac/tEzxyiRB7WGk4zlq8wDslhU6vYd/smkWvA5
         DZ3PzajAnUNSf0G3kWKTAe2B7pgwEGzt6AXWzw8udOryKwzORC1RFeXr+8E0JDakkuW/
         cWItoxqrrNmvp0w/9qloW24ELPeVNeVLRaS8LHWubuEnaQyI6ezLR7C7om/W8/dAFM03
         RQOQ==
X-Gm-Message-State: AOAM532KAnTBAdVURs7J8mNfjBrzkT9e2O+6kiOV/7G3knBkJNz8WHwj
        UsDCi73qnLvhXRTdXsbFku0iOA==
X-Google-Smtp-Source: ABdhPJyzdJYvPj0AkVnv7w7nwDsyWQeF24SHe/E4f8AaPGTqUAz7rhU1DRRUEWq3JfYUPpVIUs3HcQ==
X-Received: by 2002:a05:6512:2399:b0:473:a82d:cfde with SMTP id c25-20020a056512239900b00473a82dcfdemr1413328lfv.375.1652398610434;
        Thu, 12 May 2022 16:36:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p13-20020a19f00d000000b0047255d211c1sm127937lfc.240.2022.05.12.16.36.49
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
Subject: [PATCH v2 3/8] arm64: dts: qcom: sdm630: disable GPU by default
Date:   Fri, 13 May 2022 02:36:42 +0300
Message-Id: <20220512233647.2672813-4-dmitry.baryshkov@linaro.org>
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

The SoC's device tree file disables gpucc and adreno's SMMU by default.
So let's disable the GPU too. Moreover it looks like SMMU might be not
usable without additional patches (which means that GPU is unusable
too). No board uses GPU at this moment.

Fixes: 5cf69dcbec8b ("arm64: dts: qcom: sdm630: Add Adreno 508 GPU configuration")
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 8697d40e9b74..e8bb170e8b2f 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1050,6 +1050,8 @@ adreno_gpu: gpu@5000000 {
 
 			operating-points-v2 = <&gpu_sdm630_opp_table>;
 
+			status = "disabled";
+
 			gpu_sdm630_opp_table: opp-table {
 				compatible  = "operating-points-v2";
 				opp-775000000 {
-- 
2.35.1

