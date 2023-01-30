Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5987B680A13
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jan 2023 10:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235997AbjA3JzU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Jan 2023 04:55:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235975AbjA3JzS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Jan 2023 04:55:18 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC6B5B46E
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 01:54:58 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id bk16so10443162wrb.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 01:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MZaoaIErfl+Ibsf2HntXs0zWkX+Zl30gfhp931UY5o=;
        b=FviGhrXXGXBAfqLXE66FLL9x16MHdrzCGXj5PqJqHRXjdisEbVyUW+qP2FIp8LkhZL
         WfaWiuzDRFLM2FY96Yt9+IEnMA62dztSJhQq/crCn+0k/xmmJYMVGuicjULY46rj1vtW
         IG7kNSWfBoBMtJjteRio3Jdc41snKulTpbhQM0i1UwuMeqR4jjMO8CsjhvkYYn7IoVuR
         ZaYtjaSrxgm05KM/cmBEqc737uscThmKn+1H3Pek4ufp7nJyHgKITsmXn4U5C/kPwZra
         HIAHtmslDQvBA9X19UQx9G3/GuEb3yGe2BVgc8kjwc/ht3Qppqbl0brmV1gvvHfUhttW
         9Rrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1MZaoaIErfl+Ibsf2HntXs0zWkX+Zl30gfhp931UY5o=;
        b=SHmdE21qjxFkJGGGP441P1hB6BdPBy9IC77uVG4vXvARL8YRnQMdA3JQc8ovTIO/9W
         ifL/ptEe9kGcxi3/fU34mT3gtt0/3WFKNW3SIztOZJ5CovlVrzY8WTv+WfpamdEkoGUj
         hpGgXk6ShZTVf8rDDQdVzkkfoNrKga7At1esIKaybVBMcG5gw2UvyayEXobKAhyXLc/s
         3lPyL/tXObFP1sN/hMTGuKN74iVlrH7SCAjcJTAMNZcJXDULrpCacsEg2fzbOv1wx3aH
         G0qWuWKOaEv/TrF1mQMxWUuOM7LJEN4aHWGzHAMRgVJGANKn7FYEGs7HUILxBUnq3ql0
         2Rig==
X-Gm-Message-State: AO0yUKV2fAEOWr+0VzVkhra7FjrgzvQx02VY0V5J38dg/vKrXzASb0M4
        ntz0rJaD9VLewijaQDFvihxRyssZGMwe7DpvUT8=
X-Google-Smtp-Source: AK7set8YiVitTe+rcE6N5DQX1XM0308j2gIeVVpn5re94wpYZj7BmhWh5gouIxLnTREtYbqjAHDgkQ==
X-Received: by 2002:a5d:5229:0:b0:2bf:b54b:6ed9 with SMTP id i9-20020a5d5229000000b002bfb54b6ed9mr18780365wra.15.1675072477110;
        Mon, 30 Jan 2023 01:54:37 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id k4-20020a5d4284000000b00241fde8fe04sm11453537wrq.7.2023.01.30.01.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 01:54:36 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 30 Jan 2023 10:54:33 +0100
Subject: [PATCH 2/7] dt-bindings: soc: qcom: qcom,pmic-glink: document
 SM8450 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v1-2-0b0acfad301e@linaro.org>
References: <20230130-topic-sm8450-upstream-pmic-glink-v1-0-0b0acfad301e@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v1-0-0b0acfad301e@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the SM8450 compatible used to describe the pmic glink
on this platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index a79dd0ed9275..2dc11686c33e 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,sc8180x-pmic-glink
           - qcom,sc8280xp-pmic-glink
           - qcom,sm8350-pmic-glink
+          - qcom,sm8450-pmic-glink
       - const: qcom,pmic-glink
 
   '#address-cells':

-- 
2.34.1

