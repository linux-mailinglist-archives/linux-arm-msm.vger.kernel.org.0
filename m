Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A47A665AB38
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Jan 2023 20:40:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbjAATkk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Jan 2023 14:40:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjAATkj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Jan 2023 14:40:39 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F131081
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 Jan 2023 11:40:38 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id cf42so38888185lfb.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Jan 2023 11:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXCQltnJB15hT96I0u7uf01iijzutH3MEcPaoII8eTE=;
        b=Ct5jfdz5MA5xLYIpl52SbjC880+gtIUEqf8+2J0yF0gDVQcqoWzR1FNXG+0vrvSMJJ
         fpAzpHKQqBkdS6bY8CD0vyGol765WG1aec6ixHXXd5f90JEuTf58tKYngNnubR0+zRod
         Fz9grsqpzp8cGxwJNtGnEW/KF99v7wkdFxuhN6YpWchpKv1519q7eQrcc+bWkzxAfrXT
         p7K3aDhaQ5Z400KXHCDEUN4hctzarzqtETlU47A7LbBZhgZk67GYg75wzfn0dacYkR0C
         mStD2IaN5xs185aaLHE3BwJnNIDGDnicPoLKpC0nLsJKKxg7husQG1BZTWpVeyzfI7xv
         0RrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXCQltnJB15hT96I0u7uf01iijzutH3MEcPaoII8eTE=;
        b=6STWqkMDqKMhvC0JKzx8DptNcNooKAOqsf1PmuV7ghFZyZwCelPuEM5qqNpx4y+Ip7
         aOoDg6hqc0PL9eYYuJA8+6hhf40I4YnEfTjJHYm/x5tOMLP8voQ09xRTF/KprnuNKy3+
         BMSv6lXtcgJUEz+QCVFSWNtJ0OPtTQVzJfNY8vWJotMfdZbUt/4sVT66VstrMRLtvcS3
         WGUDxhW/lV/FLhVmBaxH2N02UI+PaTXUo+NEpaWTWPZI/jR1a6JqaFf9SdAzuxCuN3aJ
         HuP8AcXiNeM718qAXi26UOEAlOaeoVoZj/j5ieD4t757OodiJADTPO0iRSehPS/LptvC
         P/Bw==
X-Gm-Message-State: AFqh2kobnD7XxHeCaaNqO2J+GGpBPY0ZTX+ut9QhuNd166ArZMDzFoW4
        C3y4KnqjbnOtFSrJHaEWkaNeLQ==
X-Google-Smtp-Source: AMrXdXtOvfOzeIaN4atNRZ5P61H9NDS9DyAzMD9hf7RuuxMz19RWC3Z70ZcvfVW2OCKqF5LtdRpYWw==
X-Received: by 2002:a05:6512:3052:b0:4bc:af5:b8d9 with SMTP id b18-20020a056512305200b004bc0af5b8d9mr15025144lfb.6.1672602036820;
        Sun, 01 Jan 2023 11:40:36 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w11-20020a056512098b00b004a100c21eaesm4228013lft.97.2023.01.01.11.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 11:40:35 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 01/20] dt-bindings: thermal: tsens: add msm8956 compat
Date:   Sun,  1 Jan 2023 21:40:15 +0200
Message-Id: <20230101194034.831222-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230101194034.831222-1-dmitry.baryshkov@linaro.org>
References: <20230101194034.831222-1-dmitry.baryshkov@linaro.org>
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

When adding support for msm8976 it was thought that msm8956 would reuse
the same compat. However checking the vendor kernel revealed that these
two platforms use different slope values for calculating the calibration
data.

Add new compatible for the tsens on msm8956 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 0231f187b097..f3660af0b3bf 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -37,6 +37,7 @@ properties:
       - description: v1 of TSENS
         items:
           - enum:
+              - qcom,msm8956-tsens
               - qcom,msm8976-tsens
               - qcom,qcs404-tsens
           - const: qcom,tsens-v1
-- 
2.39.0

