Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D878862044C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 00:58:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233189AbiKGX6C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 18:58:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233061AbiKGX5i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 18:57:38 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48DCB28E32
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 15:57:14 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id z14so18517993wrn.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 15:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sK8Xw71VxSDBcg9BXBial1P+bD4FgARgvZGq+HZQwgw=;
        b=pjQy5Tcc1JdDePdP7EFrFqWhW8m0ZGfoJEM6k8QlaUJWgxSKu8Su05DMtTUDdXhXy1
         YDUhFHZMJ0S8Zq/JyQqU3EgXS8KlNkmSV8+hgFfwo6/ktm/HwnHb7w2FIFW9WJeZPvAP
         OGXyF55VWrCWnD8/HlKQEGdrIEy2V4awyRgSFEBhGPZEkxTblMa6Fmy+GGnZ17lkZIcD
         f0Abxl9qOJW6RTf7pKws+W8TOtBhQNeVinwaeeXr8zgsjTBWx6425gLBbLwne6FWni6l
         AuqpaoZ164YfEg2bgpl4G9kv4FizOEJJZgCM8fgW/BDddtNu8EE2NMkF5Lcgd1/+RWpO
         hoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sK8Xw71VxSDBcg9BXBial1P+bD4FgARgvZGq+HZQwgw=;
        b=DqQQZhSjDKgOOkc+IaDP34n2+A/RrgZujNTCJ9iBLse1SR43mTb81plVy4rI1IzxDf
         FaTQxN11oy0hAovaYdNWKaRyo9R0KIiDhlJefdU0XfaaQToK1QZHbzwRrtL+Al1uXr9N
         vS4yUIBoYstM89KvqVR4xaWs8cd2l1iQTYVlgd76ZsUPDlgjuk5wpPE/BbLNDCiGFeYl
         cdaV/EWIjUBfPbmFNeLQW5gJR1ZFCkL7UylDCWL7iGjjlwm4bqUVm7fn6A0u8rt7FMo1
         oL7RS+b3U7/9H7e0cmCu9mh95li5lPhYYBu5vIs3gIKXaSeDp/9FRByyE0Fa/uwWifMw
         z6uA==
X-Gm-Message-State: ANoB5pkrN/kdyfy7jH7JeZV0ClZ/cpzNPBlJCb8BTIUgOAlfMbMdBb/Q
        LZcXLgiygJfM83qNeLNTWqkcfQ==
X-Google-Smtp-Source: AA0mqf4nA726Rvrtgcbc0qWrkRPAxId8fPe6q0qOXtNCoGsE7/0479kylU/kfYvxmtxfO2SziHIU6Q==
X-Received: by 2002:adf:a294:0:b0:23c:e3ca:3b43 with SMTP id s20-20020adfa294000000b0023ce3ca3b43mr9516695wra.164.1667865433836;
        Mon, 07 Nov 2022 15:57:13 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b18-20020a056000055200b00236545edc91sm8386161wrf.76.2022.11.07.15.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 15:57:13 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, quic_mkrishn@quicinc.com,
        linux-arm-msm@vger.kernel.org
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 16/18] arm64: dts: qcom: sdm660: Add compat qcom,mdss-dsi-ctrl-sdm660
Date:   Mon,  7 Nov 2022 23:56:52 +0000
Message-Id: <20221107235654.1769462-17-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,mdss-dsi-ctrl-sdm660 to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sdm660 against the yaml documentation.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index 10bf1c45cf6ec..eeaa3932a5233 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -154,7 +154,8 @@ mdp5_intf2_out: endpoint {
 
 &mdss {
 	dsi1: dsi@c996000 {
-		compatible = "qcom,mdss-dsi-ctrl";
+		compatible = "qcom,mdss-dsi-ctrl-sdm660",
+			     "qcom,mdss-dsi-ctrl";
 		reg = <0x0c996000 0x400>;
 		reg-names = "dsi_ctrl";
 
-- 
2.38.1

