Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1346B9383
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 13:18:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232057AbjCNMRp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 08:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232083AbjCNMPg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 08:15:36 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A14EA2192
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 05:14:39 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id f18so19753091lfa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 05:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678796047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lGx1EMDayEFQk6t13uD2RfqUM6dmmVIVZCz4JA+bL8w=;
        b=IN4D0dhP51J73AC928u7PSOGfbeunpdQGStVAt9h5TmeX5jLgf3jc1Qa/gy/fZK6Rf
         U3mpgQfwm38HPzsY9Kf4DkAURMJxWEP/ntbQh2a1JcyLFhj6Vm3wJvkuEoM2pVWQCaIn
         +zva7ik68sjGdrQknoMnLiCOfAsKWxN4VCup2pvRffF15G715iSxAn9py66tK0GdPipw
         2fo3Z0mzmvz7i1IBbTIg3MqJBGWhEYNlXspOnfr2nWwMOmidvMMkIeD8mlhIxvmBrSfL
         FAkd11d79Xw5O2GhunZCHWU3W82Xd127MAi/dVNmABpO/BWeTNQKleva78Sce9RdcCiw
         xT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678796048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lGx1EMDayEFQk6t13uD2RfqUM6dmmVIVZCz4JA+bL8w=;
        b=mdN85N+OOYbbShEV7nypf3xYqB6Mrgfa4CdayIaCKU0g7ObqZmrPZOkX8+uIBkN1Fc
         2TaE2S1bvQUyOeTArSyvM3ALtWrgl+03bhz6fywoqz6LRjuBN4icQfJnRVibTcnXlQup
         Hcur2j8LzdiRaP7p5BbvKpzNC51cZDPVjMX51ZU3PquN+TXH96KEuNDURpU4/7TYjJRA
         aw0RsAXpg0JvvngxT/b5Ukqjyc377q3Hzsxj6u52bA85k/0B6Kvuss4jmpW86FzxIRdB
         9n3i4g/0E/LXVP/xfx+EsjQcP2fLPlB/nxQ5r35MUWvbDEKjzqexkTX/sRQ3F0XNtLM4
         H4aw==
X-Gm-Message-State: AO0yUKX8m9MS124qS90PFnv1oWk6ZwFj5XIcFUQOlhYjIMXAJz6XDfMn
        wLT2UAQjL8ScCkAstk/3qYmc7Q==
X-Google-Smtp-Source: AK7set/x21eFLtkIzcXtSctCs+9iV+u8JWi6kLextIoc2FBRYXSouawHkM4p5diiyGBhkZyYNGsHoQ==
X-Received: by 2002:ac2:52b2:0:b0:4de:290:1c08 with SMTP id r18-20020ac252b2000000b004de02901c08mr648482lfm.33.1678796047832;
        Tue, 14 Mar 2023 05:14:07 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id s4-20020a19ad44000000b004dda87ecae3sm379058lfd.246.2023.03.14.05.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 05:14:07 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 14 Mar 2023 13:13:39 +0100
Subject: [PATCH v4 01/10] dt-bindings: display/msm: dsi-controller-main:
 Fix deprecated QCM2290 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v4-1-54b4898189cb@linaro.org>
References: <20230307-topic-dsi_qcm-v4-0-54b4898189cb@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v4-0-54b4898189cb@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678796043; l=1083;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Eh63V3hQJ0V0iEgOzc+LSRnQ4e7sliZ5heAo7YfywsQ=;
 b=XMDG9U0mfUCsKS5AsCiZDdtg2eJBZV+LlYeluv9OhuVeZDwOILnyipcH8rhQ5vpe7w7s5pJr6Okm
 8HksazrxAkfaybhRRFNJiYHqx9O4IjbB8/c2u2Uvs5KlBv01G+6r
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The qcom, prefix was missed previously. Fix it.

Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index e75a3efe4dac..2494817c1bd6 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -33,7 +33,7 @@ properties:
           - const: qcom,mdss-dsi-ctrl
       - items:
           - enum:
-              - dsi-ctrl-6g-qcm2290
+              - qcom,dsi-ctrl-6g-qcm2290
           - const: qcom,mdss-dsi-ctrl
         deprecated: true
 

-- 
2.39.2

