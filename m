Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17F06690A6B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 14:38:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjBINip (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 08:38:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbjBINip (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 08:38:45 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F9673A9E
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 05:38:44 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id qw12so6454671ejc.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 05:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00j4AQtDp3exXyYDIs2Yr8FW3T8oaLqnbNrY+Ba7dm0=;
        b=YgfHLZ0nxB4fnNrnVqPyn0cjdW01VV3ntd8kOMFGnXs4ZomPH5Ib1fPCzIzMeSDrc+
         liCzck42JmI8Agl4SPuD0aFns4u6Hev8ok8SXkRbL1+yShqD0ViraQyw7R9LVXxoJd2w
         e/YACNmWMZZ7q6mgHg/4YeNwAc+elKzBSZVbhBZ7dnd62F0nCTj4X8LQWEHkJsGiYpmH
         OZKb4ONTFpC/C8xxx/Yl7PFt1/GD8y8NM1veiHamk3Wqa3yHY1OHVTcRKtYr0X6VkbTl
         hZ/cm64TdxfSpzbwFnmA6BJVYiSUyF5800ixi+BuqXM6Lb9A/3SyM6EEOfqGB2YdoajU
         RCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00j4AQtDp3exXyYDIs2Yr8FW3T8oaLqnbNrY+Ba7dm0=;
        b=qT0xZqKV87uclm1SNtYf3tPzxlC9kJY1R2uUm7EscttTAdI7HrYnwSysGB2SaAzeVJ
         s8Mi1ixpf9+ZrPPDpr4wRsl4IVUcpiFddOAbdDrGaFNr6Io0lwRZHX/lHtFix+ht2QHK
         k33RMY29UgbxTXBPKeH6ztejLXIJDUGojPiV4tTM0TeNWo9IlsfKJMXI4v3b9ooJg5eG
         zlnKhCyuhqX1jcZR/84qbDYL5OgDfq1Zs1rfE38E4zsXQTBa1XvBK5Rkce5opn1sfcEv
         qQ5r6eggnepP8rN+WkP2gi0pQ2XYW3HWHj3fqdVpAqZue1wr+G6dT086WEN/7jk0Evuj
         +JdA==
X-Gm-Message-State: AO0yUKXu8zaEfUrXhqJ0xYnbefqHOfiIIuolUjmUk+zZpKh2xO1E2vgc
        g5YVBnalSvZdfC536/31gSe3Zg==
X-Google-Smtp-Source: AK7set9UTkWIJM92EQBven9Sq6OQzBr7KHfac1vI9Jxlu85/gUxZb1RJU15seSNGm2qCKr2bzm6lSw==
X-Received: by 2002:a17:906:4748:b0:84d:47e3:fe49 with SMTP id j8-20020a170906474800b0084d47e3fe49mr12341580ejs.39.1675949922813;
        Thu, 09 Feb 2023 05:38:42 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id cd17-20020a170906b35100b0088f8ee84b76sm885553ejb.105.2023.02.09.05.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 05:38:42 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/6] dt-bindings: display/msm/gmu: add Adreno 660 support
Date:   Thu,  9 Feb 2023 15:38:34 +0200
Message-Id: <20230209133839.762631-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
References: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
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

Add Adreno A660 to the A635 clause to define all version-specific
properties. There is no need to add it to the top-level clause, since
top-level compatible uses pattern to define compatible strings.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index ab14e81cb050..d5ce0dff4220 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -122,6 +122,7 @@ allOf:
           contains:
             enum:
               - qcom,adreno-gmu-635.0
+              - qcom,adreno-gmu-660.1
     then:
       properties:
         reg:
-- 
2.39.1

