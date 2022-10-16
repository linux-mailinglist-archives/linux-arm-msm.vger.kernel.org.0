Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB216002A0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Oct 2022 20:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbiJPSES (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Oct 2022 14:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbiJPSEQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Oct 2022 14:04:16 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87CCD31344
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 11:04:14 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id az22-20020a05600c601600b003c6b72797fdso8215182wmb.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 11:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUQWxA/bXjnsCwnVLrvcWlcPaVWJni5aHRkIh/uGrvo=;
        b=hci6ZTIS1brRYVoXZXPIxi3lnRCtaqnTCrzaU1c8V0cczKBLnGSK04dKK03tXf+0lP
         Fz9n0SOaqkEgeiWdMJEpJTkSQS9xSlLcBz7fbU4CUlQX+bUwrWnxmG6Glc1bnCQeN8WW
         FEl5ZN35dLJoEv7HBV7HU8KImkVFj6sgarsM//RfplDM+ywnZs4dJjjzglNxU901C791
         p7e1D7qvgJIFjzUpnTCoxlv1u49IA9ZNt9oc0E60LJ5ubcyXJXClNrAXbO/dDn1rYH72
         ioMdTWfyJvINMGeMg7D9kS+EtJVnDyIK7kCqMdd5OAhTjwkdQ/lt3ZkofqLYOLVyIRl7
         T/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CUQWxA/bXjnsCwnVLrvcWlcPaVWJni5aHRkIh/uGrvo=;
        b=k2d7V1QJsWUzPvXg7lGLXF7M4Xc339S3HhgNjnzbQ3n0DlX0pu9Kf0aD+N52tCYclp
         IvMlRQyW539lKwqrEQs7MTshHpOO+JSaVPz12kLCziHRkWg4xWiIb+TCf6HySkphd/ig
         iGOjLMo7P4YXTjLUnBkoLnr7kVewn2mMBsJ/YLhevyyd6Zj8nTI29BX7PWbFenhAmbeh
         dPXQfuXswRAt87w7iTYdp4hkoXhFyiXKDSS6wE9g1dU+F1lnU20i1eZ9aHc5teLB+jNl
         yG5Vz4yhuIrsa5wduFua/zr+1T6g97yQVXwdQcNzNjtx4xpPHWIz8nF2+ymAEkIDjF0f
         sMkw==
X-Gm-Message-State: ACrzQf3/2tVW5Hf3QZ/y64SgFm/IBDmHZVmEmCNskJrvlWwnMlbQHbjf
        AuxciG/ZUEAoyXZ/sxHE1nHKGg==
X-Google-Smtp-Source: AMsMyM4KNOKcTrknIq8Xtyt4e23JLOJttOgV1YXXgyoXsAGhKnBTPoJtDK/zoDzv6bmQEA2XLuKPqg==
X-Received: by 2002:a05:600c:1d28:b0:3c6:f57d:9783 with SMTP id l40-20020a05600c1d2800b003c6f57d9783mr2016764wms.121.1665943453139;
        Sun, 16 Oct 2022 11:04:13 -0700 (PDT)
Received: from localhost.localdomain (cpc76482-cwma10-2-0-cust629.7-3.cable.virginm.net. [86.14.22.118])
        by smtp.gmail.com with ESMTPSA id k5-20020a5d6d45000000b0022e57e66824sm7844181wri.99.2022.10.16.11.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 11:04:12 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org
Cc:     Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 4/5] arm64: dts: qcom: sdm845-xiaomi-beryllium: enable rradc
Date:   Sun, 16 Oct 2022 19:03:28 +0100
Message-Id: <20221016180330.1912214-5-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221016180330.1912214-1-caleb.connolly@linaro.org>
References: <20221016180330.1912214-1-caleb.connolly@linaro.org>
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

Enable the PMI8998 RRADC.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
index 82c27f90d300..6228c1899e3a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
@@ -336,6 +336,10 @@ resin {
 	};
 };
 
+&pmi8998_rradc {
+	status = "okay";
+};
+
 /* QUAT I2S Uses 1 I2S SD Line for audio on TAS2559/60 amplifiers */
 &q6afedai {
 	qi2s@22 {
-- 
2.38.0

