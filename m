Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 810E4670E05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 00:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbjAQXto (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 18:49:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbjAQXt0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 18:49:26 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D975A5B451
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 14:58:33 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id hw16so67198091ejc.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 14:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6amdNKqinFfhfi1mNmOJSn5KWtX3X0DX8vGk8UB37c=;
        b=d0BXHUIuVCoqOi/PBIiA3eMORaRoUkOSaODpzmmxeRjvhp7TyekOWt7QTNSpCMfyca
         8Xn8ykyv4TSolW9WxPNF5P6PCbGgHmHaZJwqwiyRuoCsp5n+oVRTDv3BmOoiPiZ8fMAN
         WzQms9lV4kKP4NJckWECB3qoVQwuEVKNI6cFiRRQk0PscTc+0wcDOnK8SNY1If+mlkKR
         wYXPlk5Iba5t+EZ5LsvYiGjBjfojXxD+MUuI/GwoALzHBkz2VlZSh3NOZ4yhOwFuxaVQ
         okUbKeCZEHWN9vVveBsxfhqCfAGzaJ5SikAd6DYK8n8W3jjKofAHZM1hw2JxuZaf/EJC
         GvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W6amdNKqinFfhfi1mNmOJSn5KWtX3X0DX8vGk8UB37c=;
        b=SnXp+PypUAXdTgNezMYvsCMM87S0OHmfjcPeI8eLKCi/7IZja0RYbq0iNKMoi2IT8W
         a3L4a3DIRmw/R9sBefeGawwNdaqm4KogqdD3bfeWxV92j+xNwB2YSE8B+Fz0kJbHXxZe
         3qh0YlxriVn6amrEEX2wyT6u5EZ9+VGtoVto0v9oUV7xfYMBzovzY5f0U+1GWWeAYnD1
         Qk1CCSlBw8ryrMydbWv9DEFeznPYH8zCuiFcR1KO5uMzQt03mKczIyCUwHGmIM5PdRhJ
         cLKDjW+gk53IDRsuioWT4NwTV+ThI/VTUrHTk5dCvH3VmtdW+jKKpf0Um3l7P8jH5Dhz
         8Djw==
X-Gm-Message-State: AFqh2kpL86IziTKf+GgSetpVC0RQx7rzfD7MBDWrW+lHklfT7U5XRYVb
        xbA4bUgzXGt/LkLc4zZaabOTlA==
X-Google-Smtp-Source: AMrXdXu427FOFPvQUYYtbmfUuGWis2pp1aT4IMUfIJP0/TMSpR7uftVkJYv7VVyxkymaVgE2863HiA==
X-Received: by 2002:a17:907:6021:b0:843:a9fe:f115 with SMTP id fs33-20020a170907602100b00843a9fef115mr4394307ejc.32.1673996312453;
        Tue, 17 Jan 2023 14:58:32 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t1-20020a1709061be100b0086f40238403sm3919762ejg.223.2023.01.17.14.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 14:58:32 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 6/7] arm64: dts: qcom: msm8996: add CBF device entry
Date:   Wed, 18 Jan 2023 00:58:23 +0200
Message-Id: <20230117225824.1552604-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117225824.1552604-1-dmitry.baryshkov@linaro.org>
References: <20230117225824.1552604-1-dmitry.baryshkov@linaro.org>
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

Add device tree node for the CBF clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 150d13c0f4b8..7d8e31b84959 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3562,6 +3562,13 @@ saw3: syscon@9a10000 {
 			reg = <0x09a10000 0x1000>;
 		};
 
+		cbf: clock-controller@9a11000 {
+			compatible = "qcom,msm8996-cbf";
+			reg = <0x09a11000 0x10000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&apcs_glb>;
+			#clock-cells = <0>;
+		};
+
 		intc: interrupt-controller@9bc0000 {
 			compatible = "qcom,msm8996-gic-v3", "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.39.0

