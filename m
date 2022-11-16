Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C76262B74A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 11:11:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233106AbiKPKLv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 05:11:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232911AbiKPKLs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 05:11:48 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF8A32935B
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:11:46 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id h9so29106255wrt.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MWwgXwpGXH5XYvc8N8GrQQ7u8RORdttRwjGHHNF6/jM=;
        b=ronOanEJ5I8pno9bKXqmyTsx0rJCBidFbR+Bgu9L262hTWSmsymEn/gocxa0i525mu
         2xSD8/prB6gMsh7s74aYHV8U+dl6fkX2rpT1rbZLaEHlWdCr37AC7K0MRAZ8AtweMVkF
         bPf9WF71NtMs72P5RWLnuz7Eq1tnisrIg3K8YR3278llBtfYmF50YwJezkh+T6PN1ZzW
         u+jnKt4BX9ibuq+dmpM49eiTbaEeRrpcSEe0ZRVdUQ+SdCZoumUTkk6Mt0JeCv91DEsq
         cKqxOaEaQWTxXUMEqscaHPcM/E/CGyjSi9o5ycLsRai03PrZA+nlc47rA0ZsBUHsh7ZY
         NA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWwgXwpGXH5XYvc8N8GrQQ7u8RORdttRwjGHHNF6/jM=;
        b=6vLl58p76q+LHPIdN5E8t/TclnErcs5nBoTRnySGNnsbXRRcLqwf4OZkizl+AwGBuc
         NNgnuOpCusra/uyidyGrKptzP3+t7+/n2mffffPs31mAWCgY6AF3IIxjZ7/WeZyaTnvt
         WF1/M9dbhi2p5vJ9W9vgPEZB9YpbRz2kOKHZljzpc1qgirpOiI1zVaoieZcQIm7OS4ez
         oG1LgFktM8qecZEofTEADfjcA8yeW0iNoKIFtUGg58uzD8on6McrZMfYGeBiz7Q7z+wX
         /0JOJhEzfyzDmADrADMYc8ANgjNh8dwOBFalEzNQXb9kdcpRP1KrIs4M2Yz0z4XKAnZS
         nEWg==
X-Gm-Message-State: ANoB5pnK1/2KISZ+++++tYB03OVPQ+3dGVBZf0uhpwuMSWZ/GoeNuZ68
        wk92BnDWOAsGTXP00vCHH4+DPnYhBxkt2A==
X-Google-Smtp-Source: AA0mqf7+Cazc0CjAZ4VGqek/GdWkAQT+c5m9fPe9tQtsg3u0ohJVelHFoqQo9fASRuEQ7If9dvbxrQ==
X-Received: by 2002:a5d:58c3:0:b0:238:8896:7876 with SMTP id o3-20020a5d58c3000000b0023888967876mr13445030wrf.645.1668593505307;
        Wed, 16 Nov 2022 02:11:45 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id h12-20020a05600c350c00b003c6bd91caa5sm1741752wmq.17.2022.11.16.02.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:11:44 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 16 Nov 2022 11:11:32 +0100
Subject: [PATCH 3/7] dt-bindings: mfd: qcom,spmi-pmic: document pmr735d
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-narmstrong-sm8550-upstream-spmi-v1-3-6338a2b4b241@linaro.org>
References: <20221114-narmstrong-sm8550-upstream-spmi-v1-0-6338a2b4b241@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-spmi-v1-0-6338a2b4b241@linaro.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-gpio@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document compatible for the pmr735d SPMI PMIC.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 10a71a130987..5d4400ec8f28 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -81,6 +81,7 @@ properties:
           - qcom,pmp8074
           - qcom,pmr735a
           - qcom,pmr735b
+          - qcom,pmr735d
           - qcom,pms405
           - qcom,pmx55
           - qcom,pmx65

-- 
b4 0.10.1
