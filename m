Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D5486518FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Dec 2022 03:47:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232896AbiLTCr1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Dec 2022 21:47:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232876AbiLTCrZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Dec 2022 21:47:25 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3C0A13CC4
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 18:47:24 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id p36so16542943lfa.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 18:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QYEvrA5jk7OGUR/7PWOk8acQl/of6Esek0ztRJgkInE=;
        b=DBF5hfRnRWbzJZj7Skl6531SOmLzQ9pkqf6PdkUqhsLWXkMLF4a9PgzVIBh0oK6l4+
         Q5/o4Zg7PfQHziw4pbepSM8V5HSIsekbGcR7pP7OyvBao4+uqEfIi5MTlXiDgck9kipr
         b+mMmUa1tM5bpC02GhEet6b9BBieZRfnEIurtM7NOYxBJV0/A1tPWsDV0eLXfL/zLUsd
         03UkvnP4GFoPdQm6Te6hJTPF5ngzC/Ad+ZaCz4Ia0pt/8ces0RskWln3TqiPtxMWGTAn
         pX5cj1eWuDcaqmV3XKgn/SdrjbfcSO1uVPt575/PkRaY5Ie4IamuOPbntZP+g4wbIHVP
         kjhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYEvrA5jk7OGUR/7PWOk8acQl/of6Esek0ztRJgkInE=;
        b=fAKglvjBS19K+qfuyxAnXtfdKEPEjbR8QDbDSti101ASW4j/uXAIN1VpxzV4k+L5yy
         FzcqU458zR4qVRmf5ntnBkydinvVRgLBkeg+Do/nHZcL4jzuiM/M1/Ig8PNvW5H+5Ga4
         hX/8m5dm7434DqYquYnLyXqtEgV1CeHQzEJ33W01FGCmnetsFTO/6YUgO31Ugyl7vgFj
         2cheZVenQbHPU96RryaVUd2FlR4og7ElEULRTdxL4yq4kXoPxPGCM6rkvQk0oGk0DvkC
         5dwJ+GlKmV0ULCriD5W7OmgkgdmNG4IvATtqRVzMtvCXp0ItGuQDisBQvpp5ipFKfGGR
         tFtg==
X-Gm-Message-State: ANoB5plWsD8B8slou7kH5glBk3KcZ9hOGX6O0pE1M5wix5D/hKzY6q4q
        z/UJwMU0hbvOkWTLyHThduMKHg==
X-Google-Smtp-Source: AA0mqf4atIUcH6TgxMS2eqkWR1dEvE/hZ3enEfgaAdoXiUsuxyL1zBP+sISEO0gmd7gtiT1qBIMs3Q==
X-Received: by 2002:a05:6512:5cd:b0:4b5:918a:51fa with SMTP id o13-20020a05651205cd00b004b5918a51famr11992305lfo.55.1671504443383;
        Mon, 19 Dec 2022 18:47:23 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e13-20020a05651236cd00b004b5a85e369asm1274866lfs.252.2022.12.19.18.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 18:47:22 -0800 (PST)
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
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 01/15] dt-bindings: thermal: tsens: add msm8956 compat
Date:   Tue, 20 Dec 2022 04:47:07 +0200
Message-Id: <20221220024721.947147-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221220024721.947147-1-dmitry.baryshkov@linaro.org>
References: <20221220024721.947147-1-dmitry.baryshkov@linaro.org>
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
2.35.1

