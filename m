Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1F665CFA5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jan 2023 10:36:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239028AbjADJfz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 04:35:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239133AbjADJfa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 04:35:30 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 151361A06A
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jan 2023 01:35:06 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id c65-20020a1c3544000000b003cfffd00fc0so29058229wma.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jan 2023 01:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AC7xaypPibvzJOcPS3LFlREzrhHc51KAqqlF1uf2uTY=;
        b=RqfqrSVMzAP4FRzTVwiYotoUV2tcAdVdT3kqRjhs2eM4/qdPPjE/HWskuR1OGh3Msm
         avlDUFm6UBX858yTiIeQHnyW+gUJdsYYs5oZTHVrdqpqdG1N6Vldlwfpwe6R+IFVpMh6
         foN60ZwdLZRFsEnMSCYezjPhrvxI59YHR9+Y0Mcwsay2cKqoYMrG+Mq/L8XlEqw3pg9m
         iPoVAXnr+KcSR0RBYk/TOnxn1a92zjL+zBZphM+2e+zvGapIbww9z840wuMzqUjuPGqU
         73xmgpe7Bu/qQahR6dXokspV1rxwDBJpNbz3L5tJS/WYmQA7mhb95dOtwxfZ52teAO1n
         hsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AC7xaypPibvzJOcPS3LFlREzrhHc51KAqqlF1uf2uTY=;
        b=2aVqO0bluqa6dL5077s83vyx7IZRNJcfiuSc9yY4/NMVdkDiaVMbNrJtILGfGH9foH
         LminqcAHlg4YJp4v2z4ajJUL1StHR2enVVtOGKFd9dYN9BweD3EIWw9MtqpVGh929h+N
         x5zUHgwSJimkId0xth+KbUyQrm8z+Pj3iZFeQl5a4IxvzK8ajAnxw1hwhzEeGjRCW5RR
         JBkhUIFviyY5wdTD9kktUPSzdVCcODRlqwz7f5H/QC+UyakfmYYLPs2zKgPoYtbiLoqy
         cp7/yF7VdEgef7qv1FGtJnZJmfosMWfs72Ri89MQQkOIswRQfhBLUcbXQYOXohMx9YI/
         Fw+w==
X-Gm-Message-State: AFqh2kpyBu3BTPEHFZnmOyVkOVtH7/a5oNpTy1N4EYL7oXNXfMp0mvrU
        p+dL0Xq/5pHocBHVKNNZQK7gBw==
X-Google-Smtp-Source: AMrXdXuoxbroV7S+KgNn1FMLN1SJImfJXx0lKl29Z8pNoGV/09KnkQtJXlAtWeIvnHhtzsafq08gKA==
X-Received: by 2002:a05:600c:3644:b0:3d2:39dc:4ab9 with SMTP id y4-20020a05600c364400b003d239dc4ab9mr36679647wmq.13.1672824905529;
        Wed, 04 Jan 2023 01:35:05 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id b22-20020a05600c4e1600b003c6d21a19a0sm45561452wmq.29.2023.01.04.01.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 01:35:05 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 2/4] dt-bindings: clock: Add RPMHCC for SM8550
Date:   Wed,  4 Jan 2023 11:34:48 +0200
Message-Id: <20230104093450.3150578-3-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230104093450.3150578-1-abel.vesa@linaro.org>
References: <20230104093450.3150578-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add bindings and update documentation for clock rpmh driver on SM8550.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index cf25ba0419e2..6d7d699aaff9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -31,6 +31,7 @@ properties:
       - qcom,sm8250-rpmh-clk
       - qcom,sm8350-rpmh-clk
       - qcom,sm8450-rpmh-clk
+      - qcom,sm8550-rpmh-clk
 
   clocks:
     maxItems: 1
-- 
2.34.1

