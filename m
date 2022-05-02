Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0071C517972
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 23:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233208AbiEBV4A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 17:56:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234471AbiEBVzv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 17:55:51 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A06D5590
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 14:52:21 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id m11so16495121oib.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 14:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m7cFEgSG093ymIwJOUazHZ2tzJugEpErbHWE8WXYuz8=;
        b=D+e6zSMU/lo2ulKiC5s6i8eyAliSd+WLo/190SJbLKVH/F/nZJhxsSN/HieZA4aDQ+
         uJkEFkJ8pqxTzyW80fPGmJu0b3MpFmlmY9e59KtNXx1lomYvRKlHzVIky8vaeeVXMW+N
         ++/5Xt5vQUeDV76zYzDWRzy5Z5Rso4xdAnkp6+cfW795M/nbDR2ZNujrLdzzws9Pzjtc
         c0iAl+Ya6zL1o7HMJpWfo836T8n0RrmdA7hAT4Cy3jpr5PiQGbzEPCp4mE01jLYPnVzJ
         BiUHfoaHmqJmVZro0eBKS6cOilbZSd28X9YfjZuwMsv1d2GZsqc68DXvkJ9cGYK2SRk8
         QR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m7cFEgSG093ymIwJOUazHZ2tzJugEpErbHWE8WXYuz8=;
        b=EFG7bcgWwIDvK3qtaBJYdx1WslspYzGkvRjXgJGEObKi76cc4M5iwtHWQRlHZpNDYm
         seQwaRaP+9PJhKIjfaGfQBxLuQ8mRNVyMEp5v9Iz2W5GoBEtwMAwKfXSyqxPE1Po+375
         sbYtYdY5BooSVvQUBeI7ikg/BmnrEONCk1RoGB2oyEMg8/AaDCpV2HOCuxEUIoQxoErg
         dt4U/TIHftexMbaonhJAl+3V2cy8lvjdlkHCVUCJcdnIwechpaUM6CiYi/XzPWZBOiPR
         Y62lXxphueDQwiW2YESzgCj0tnuvxLaV2KN/TxQrNGVze160IZhTtJZx4gg+Quvbmu2C
         T1Ow==
X-Gm-Message-State: AOAM531cKv/SRYVY8s5nXL4RxwS0zdWhvf2vz1HvGeqTwRudzU0yhNGw
        9nxEkoIWZgEslAgD4JAca8+QYg==
X-Google-Smtp-Source: ABdhPJxgluWPoCVRCyVACraXiPxfGEtFANGj5JdQZtfNBmkUMZbAXHgiKECl6IaE5DGpzz74JlFmyg==
X-Received: by 2002:a05:6808:124a:b0:2da:3588:6d35 with SMTP id o10-20020a056808124a00b002da35886d35mr550709oiv.269.1651528341028;
        Mon, 02 May 2022 14:52:21 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k16-20020a544710000000b00325cda1ff8asm2720406oik.9.2022.05.02.14.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 14:52:20 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: arm: msm: Add sc8180x and sc8280xp LLCC compatibles
Date:   Mon,  2 May 2022 14:54:05 -0700
Message-Id: <20220502215406.612967-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502215406.612967-1-bjorn.andersson@linaro.org>
References: <20220502215406.612967-1-bjorn.andersson@linaro.org>
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

Add compatibles for the SC8180X and SC8280XP platforms to the existing
LLCC binding.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Picked up Krzysztof's ack

 Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
index 30fcbe2ad8a3..5ea506412b4e 100644
--- a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
@@ -23,6 +23,8 @@ properties:
     enum:
       - qcom,sc7180-llcc
       - qcom,sc7280-llcc
+      - qcom,sc8180x-llcc
+      - qcom,sc8280xp-llcc
       - qcom,sdm845-llcc
       - qcom,sm6350-llcc
       - qcom,sm8150-llcc
-- 
2.35.1

