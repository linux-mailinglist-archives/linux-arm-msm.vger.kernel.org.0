Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DBE64B7790
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 21:50:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242649AbiBOURF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 15:17:05 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243473AbiBOURD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 15:17:03 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874EFEB335
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 12:15:45 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id j15so16183596lfe.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 12:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=289/KRcXVcnS1cCQf6Ylol+IbGt3fnLTiUWFx0ZifHU=;
        b=KzYHgYSUpFP3q5+s3QyhWqexkkOlfiRzO73vnK/LoLeOfoqJ/HIFz4agRS5YWTLk7v
         NevGSZ32B6WWyOlzDbtPoPQyMd5k3xXdD0TuC3jnt6aEKyh4YlGg5OUJLdTUAr0v7ibe
         wDb9MxZSi3JFxu04HmNfkBK5F1SinPs06sLGVI9JwoFHv/YRugMrHJkKfGnq3eFYXIdM
         5zVej9lK0lgq+LT70nixO/ZSL5I/X4aeOMwPiHc18BE6sDmo1X2qSOoazT3jRegwyF6h
         XE/Qxkm32qDxlP8TIIW1rGGQ0u+gkh9UC7DjKZ6itiHuLbiI4EW9zqlyHaUkdcukGmi4
         1T1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=289/KRcXVcnS1cCQf6Ylol+IbGt3fnLTiUWFx0ZifHU=;
        b=4cDjFPwnH8/Hvk0jAVfQO/I1FCmo2NeHm8XlThlnPbLQuFjFhfIt4Vbj7xkZTIxpvN
         AE/eC5tqeUmEv+8QdEVJ1YqKQQWiw3dQKu5Alz2FmCzG5Z0Wu+ZgHcdxXsTmGKucTDH1
         BGTmmX6LvGZv5g/XoQzuGWdaSUmWMkiWu2jgURL3hzOIZufPF8PJT4xnBgEzIM3Xvlii
         NPS6Wm/UlMxKh2uT6FxLRENrepLTYDEkHhwtkHzTbCwI1pWqLJEvo2WCd/ZiEAC0+k6n
         0i0Wk0man+9ql2YbjG1AfBY9MZvpc590t1tH0fq7T+lmjHg2PzICLOudSwcIlaxs7/vF
         lAzw==
X-Gm-Message-State: AOAM532w2SE/UJHeZoSpXlptoFKMCus/WtzxkY/gxcTZUc3QLMkgZgOM
        qHzXL3Guhwms5NMeT0+qmEh0uw==
X-Google-Smtp-Source: ABdhPJyIEQrGOXrpemV0qqsQDBWBeeEye1u1Iumt5gTShQ0bbEzhs5uLX3H/tZ8L4yUaMOsDm1Mjsg==
X-Received: by 2002:a05:6512:3087:: with SMTP id z7mr566466lfd.446.1644956143839;
        Tue, 15 Feb 2022 12:15:43 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k16sm4548419ljg.111.2022.02.15.12.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 12:15:43 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: qcom: msm8996: add cxo and sleep-clk to gcc node
Date:   Tue, 15 Feb 2022 23:15:38 +0300
Message-Id: <20220215201539.3970459-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215201539.3970459-1-dmitry.baryshkov@linaro.org>
References: <20220215201539.3970459-1-dmitry.baryshkov@linaro.org>
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

Supply proper cxo (RPM_SMD_BB_CLK1) and sleep_clk to the gcc clock
controller node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 91bc974aeb0a..7a46f0f67cbb 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -679,8 +679,10 @@ gcc: clock-controller@300000 {
 			#power-domain-cells = <1>;
 			reg = <0x00300000 0x90000>;
 
-			clocks = <&rpmcc RPM_SMD_LN_BB_CLK>;
-			clock-names = "cxo2";
+			clocks = <&rpmcc RPM_SMD_BB_CLK1>,
+				 <&rpmcc RPM_SMD_LN_BB_CLK>,
+				 <&sleep_clk>;
+			clock-names = "cxo", "cxo2", "sleep_clk";
 		};
 
 		tsens0: thermal-sensor@4a9000 {
-- 
2.34.1

