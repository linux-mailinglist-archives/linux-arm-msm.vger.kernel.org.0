Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6FD757D05D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jul 2022 17:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233519AbiGUPyK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jul 2022 11:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233518AbiGUPyE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jul 2022 11:54:04 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D90A954044
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 08:54:03 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id u13so3466425lfn.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 08:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DCamHWaVIvJnSAY59lbpTvfNe1ETZkCgZU+I1W34zEI=;
        b=Mvo7n/p9sctKZpZUBVx+UQvMv+qbS3vf16I5EeA/DfAHBnKXjEzQkCVQI2KGnsAPHX
         X6E1t+hBjN1+tsHJibGSv/x7wHNT+Of4MmfX/Hqm9oVESo5mqrV0RecBQv50uWGA3bHf
         2InemaQym+wRV+pVEQrinDya6Jf1dmUntcbL3Si64iGS8GLJ1ZGbIuuyAkuXVCKLv7Je
         sgv25X4ucUwZH7I21CX6bkgjmmmI+i3eC1WVu6Jiv9iFx8X90PYuS1AW7ibf97iYbC3V
         sEqk9x5vvRAbyKVw9iZEKzdTjYJygWdSo/hUS1TsjxGcrOPwB5HvJ/kmVov1EIzG6cAE
         BDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DCamHWaVIvJnSAY59lbpTvfNe1ETZkCgZU+I1W34zEI=;
        b=s2rvFdPIy1hsDtplObWNVqHyWWu9H3FptKKndOiSVGee6s5P81JenfocM8YztcEOkz
         gDi+ut7QqXwjTXOVG7TNhDPuMbS2+t0Egop2gWuWp0WL5AH6/db3sKL5rj8oD/hhozML
         W/C2EkUC3IJ2A25OHu832RMo5VL9aQi5VkmycB4GjpCtcdimbvX84ezIlZCrKBdslBHb
         ez82Zia0aeqOTTms/gFryXmW9tNeh++puxe66U8VeG+fffdl9MFU8uQHB1884A20r8jO
         v4oyhWWj2HAL7qVJGQxr94mb3MVbSLEdkHXMgPufDfwr4aSgOSc33iRWlfGoo1euuDMS
         /WVg==
X-Gm-Message-State: AJIora+9pT+0LmvH7JEccarKLMGJcyVPMmaeiRrDk1LFkf7GzQdzcAX8
        QGSIbqY/1kZCaWOrhs5htzrIew==
X-Google-Smtp-Source: AGRyM1vh1wqbTwIyZ5T0h/U3sZcdue6RAZ5t/N+B0NgFHIxs4M/CwuyyxXOiRPOAzTTtWA+NAXfmRg==
X-Received: by 2002:a05:6512:1153:b0:48a:201d:5f77 with SMTP id m19-20020a056512115300b0048a201d5f77mr16405551lfg.280.1658418842159;
        Thu, 21 Jul 2022 08:54:02 -0700 (PDT)
Received: from krzk-bin.. (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id s14-20020a056512214e00b0048110fd06c4sm516432lfr.53.2022.07.21.08.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 08:54:01 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/3] ARM: qcom: include defconfig in MAINTAINERS
Date:   Thu, 21 Jul 2022 17:53:55 +0200
Message-Id: <20220721155356.248319-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220721155356.248319-1-krzysztof.kozlowski@linaro.org>
References: <20220721155356.248319-1-krzysztof.kozlowski@linaro.org>
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

The ARM Qualcomm entry should cover also its defconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9ca4dfecc047..5623fc9667af 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2582,6 +2582,7 @@ F:	Documentation/devicetree/bindings/*/qcom*
 F:	Documentation/devicetree/bindings/soc/qcom/
 F:	arch/arm/boot/dts/qcom-*.dts
 F:	arch/arm/boot/dts/qcom-*.dtsi
+F:	arch/arm/configs/qcom_defconfig
 F:	arch/arm/mach-qcom/
 F:	arch/arm64/boot/dts/qcom/
 F:	drivers/*/*/qcom*
-- 
2.34.1

