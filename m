Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D15957F566
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jul 2022 16:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231814AbiGXOEf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jul 2022 10:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbiGXOEc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jul 2022 10:04:32 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D06312747
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jul 2022 07:04:31 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id o12so10338621ljc.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jul 2022 07:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TMAnf+EGgmUpjbvOUJCY6VfEl67ycFCn6aKjkzHtu64=;
        b=JbkVxxRv5J1hnELOOT67MG2BhN9fVtaCGLTmRqRmg6+bxj6quwhC/7iNK5eZuP6U2k
         l5t4bhLmGs/7/VsO1aUe5u4NJ+vcMfO4tz5r/eQEwqbzs6o6E2XeoxPBXfa4Vm1oBQlh
         YK+CXX2ry+EGg1YRNnN7NAlGz8Jn/g/pdC9ng1Oh2dB+RK77deXHfOjy6HZJN2GyYeRU
         x5of9YeJaUKRZSfm/MLcFP+RUKEjSAbuQMsgGPRUMKPq87AQ+8t/K1PK8o4lrziJ0LEo
         rRKpeIvsLZTguFUXVY5hqh3SNTkB+MtOjyF0u+7y6I86OQgo/valcG27Wuz4U3Xp1ATa
         1KZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TMAnf+EGgmUpjbvOUJCY6VfEl67ycFCn6aKjkzHtu64=;
        b=XH/M5baPigsSIKlrljvKYwsXKwUx3lO1G8QPk/2tUb0rRrBrtpjlJcTRHAAK3tQPS8
         aqhkKgR8MaAPoImmS8oCfH3mepC334wzApkWxqM6XlbCTSABR0mQPnWQ+d6xT7eA63FX
         2Tb/88tLiZpazqeKzBWo1sUbRUp+3eBHDZInQhfctpZwq2nIdkoXQFkFlA4IdRHF/TjZ
         vFvDpxOcMA566PgfLK81i7yLItc4Mo/8FVn+7Vh2D51oM6qKhZQ8HrpG8omTZ4C0Hf0Z
         jCO+gSzm4Jy1q1VD8rXQYxSknYuuX8P9MqrgGSn2kSrO1Rq3TA78pWMzBIMf8W7gboPm
         xnwg==
X-Gm-Message-State: AJIora+VCDU5WVznsq2HM/rOBoEmx0lst8FnqGj8ub2vFlkZyAlj6zGe
        X48BVsJjsOsRzfr1+MapT0BLbg==
X-Google-Smtp-Source: AGRyM1t+84hjXgSu4poB9GAB58EJvbG7rZcyIreXIf3+bAoqBcTooIDVjgoOoYT4BaS8x8XvXBqVhw==
X-Received: by 2002:a2e:3209:0:b0:25d:644e:b9d4 with SMTP id y9-20020a2e3209000000b0025d644eb9d4mr2606210ljy.13.1658671469540;
        Sun, 24 Jul 2022 07:04:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s13-20020a056512202d00b00489dedf1dcfsm2192622lfs.289.2022.07.24.07.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 07:04:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: [PATCH 7/7] arm64: dts: qcom: msm8996pro: expand Adreno OPP table
Date:   Sun, 24 Jul 2022 17:04:21 +0300
Message-Id: <20220724140421.1933004-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220724140421.1933004-1-dmitry.baryshkov@linaro.org>
References: <20220724140421.1933004-1-dmitry.baryshkov@linaro.org>
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

There are minor differeces between msm8996 and msm8996pro in terms of
GPU frequencies support. For example msm8996pro supports 652.8 MHz
frequency for the Adreno. Reclect these differences in msm8996pro.dtsi.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996pro.dtsi | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996pro.dtsi b/arch/arm64/boot/dts/qcom/msm8996pro.dtsi
index 63e1b4ec7a36..a679a9c0cf99 100644
--- a/arch/arm64/boot/dts/qcom/msm8996pro.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996pro.dtsi
@@ -264,3 +264,28 @@ opp-2342400000 {
 		};
 	};
 };
+
+&gpu_opp_table {
+	/*
+	 * Unlike CPU opp tables, the GPU driver does not shift speed bins.
+	 *
+	 * 652.8 Mhz is available on speed bin 0 only.
+	 * 624 Mhz and 560 Mhz are available on speed bins 0 and 1.
+	 * All the rest are available on all bins of the hardware (like on
+	 * plain 8996).
+	 */
+
+	opp-652800000 {
+		opp-hz = /bits/ 64 <652800000>;
+		opp-supported-hw = <0x01>;
+	};
+	opp-624000000 {
+		opp-hz = /bits/ 64 <624000000>;
+		opp-supported-hw = <0x03>;
+	};
+	opp-560000000 {
+		opp-hz = /bits/ 64 <560000000>;
+		opp-supported-hw = <0x03>;
+	};
+	/* The rest is inherited from msm8996 */
+};
-- 
2.35.1

