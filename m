Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D48306AAFC1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Mar 2023 14:00:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbjCENAL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Mar 2023 08:00:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjCENAE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Mar 2023 08:00:04 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6658312F22
        for <linux-arm-msm@vger.kernel.org>; Sun,  5 Mar 2023 05:00:02 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id g3so28074328eda.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Mar 2023 05:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678021202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yiK10KWF2ZpkL5HJKdztpzvErfAXAIjX9EfdmgWAzY=;
        b=frB4mJ0EU88OBESzfklxQvk4bmp4iN+cF2Ws0ro0vID43rvFrTCQMxGEiMfM2FladX
         GDFK67TCsQjZw/b22mQ6XY+c4xabkcZHl5AJ5YzAXv0MiWIBDow+tB+rJGm8s4H+4ltF
         5wn0X90CC7t0ZwnbzNFSXgJsXTgg8BElmOKdz5H7tUBWsurKVLuphScR+xSe169b5Ftz
         oWaN8LmE/IFnda3cZbUJG7D6j55o6MxCiJOfFCiP5k+OvF/C6CmfS3dIoE6d6Zqxu9i1
         60lY26/j4jj8KTg7ULxr02hvHmV9cdLdXsaHwpCDO1N4AbVpXauQVF8VDLniPv5nl5x5
         JLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678021202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6yiK10KWF2ZpkL5HJKdztpzvErfAXAIjX9EfdmgWAzY=;
        b=PrE2U1wZGB3v+9PI47Qg8mxeLte/beq9p4tt9Qj1afCJAFFMkZXmEOVwbMS2LimSKo
         loWlMLN5KRgLQA7UNT6NDvRwu7Urg3VH98Baec1PonmAWFHFzOySbW+UhHbRN5KX+Vv7
         FUBtapC1qkiaJftKNzyVAS9hxvdZeLCUsrcYrDZ7Q3HD+PUTxvPYgj240U15l+hNdenh
         VRM0K1979bj2LY6jgphu/gwEFsn/O0X9syTi7vkmhWBCkXJWqSBXg39IGEFGniOedMLG
         Lfsdngs+fbw2938VGaoy7R60u1ttQZkZz5lOrynk3aY1lQQ7NVwm7o2c5vy+EEdj1PrZ
         iFBw==
X-Gm-Message-State: AO0yUKVJuG7eDU7aBy8Vf9eRlwN6L0PSCBtUoz5uJpMRFCjm2PEuz8Md
        tDDq8dNq9wewZWhBsk0EA/lJOg==
X-Google-Smtp-Source: AK7set/VXdRACBp/EAPdZL0yAzMV0SVLlsuU5J7jb/0sir5CBK7Y72tXcycDCkAKubfI47lFvpoibA==
X-Received: by 2002:a17:906:3002:b0:8b2:fb3d:9f22 with SMTP id 2-20020a170906300200b008b2fb3d9f22mr7247928ejz.33.1678021201916;
        Sun, 05 Mar 2023 05:00:01 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:71e7:13d:1c29:505f])
        by smtp.gmail.com with ESMTPSA id l15-20020a170906078f00b008ea8effe947sm3193158ejc.225.2023.03.05.05.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 05:00:01 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 06/11] arm64: dts: qcom: ipq6018-cp01-c1: drop SPI cs-select
Date:   Sun,  5 Mar 2023 13:59:49 +0100
Message-Id: <20230305125954.209559-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230305125954.209559-1-krzysztof.kozlowski@linaro.org>
References: <20230305125954.209559-1-krzysztof.kozlowski@linaro.org>
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

The SPI controller nodes do not use/allow cs-select property:

  ipq6018-cp01-c1.dtb: spi@78b5000: Unevaluated properties are not allowed ('cs-select' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
index 2aee8594b280..f5f4827c0e17 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
+++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
@@ -35,7 +35,6 @@ &blsp1_i2c3 {
 };
 
 &blsp1_spi1 {
-	cs-select = <0>;
 	pinctrl-0 = <&spi_0_pins>;
 	pinctrl-names = "default";
 	status = "okay";
-- 
2.34.1

