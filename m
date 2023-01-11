Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34B5E666477
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 21:05:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239217AbjAKUFj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 15:05:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238657AbjAKUFN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 15:05:13 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4197944364
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 12:01:40 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id v25so25161788lfe.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 12:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrcNxK9Y+DcgHqm/UsDl3fgR8jlK0PF2lYfm+cSn93I=;
        b=Vh8j+egJ7ToeOFqmKvwRDxL2WQrbG7EysITmLHKEw9TO528IxMMhPROAd8yM9XKI4N
         Md5qk073k6PTrxBdCeWvEz5vmPK7kMLa2j2ZJhRYiKsBZGt4HPhtoGP5kN2XSj6tSr4j
         a/39OYw7LbezjVTHT0WfavsM2bRU9KBBPfIZ85pOo98A55QO4XiBzmjFUONMGMqxMnC3
         nxHd0OIP/IdPelG7mOHz60n2lnhQzmbtInGcgYBPHkD9LNJWzYDuCPDdpY2MWim77xzf
         HbgDFBDeHoMC3NzFava0cLR/fBIg7YWt/G1/P2r7vOsotWsRv1aqIEK/V6d81k368Ulp
         GCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rrcNxK9Y+DcgHqm/UsDl3fgR8jlK0PF2lYfm+cSn93I=;
        b=WpSnwU4u8MbBE+GXm7DU0jO+tf0K3U30cbxzRzM87kxTbbxXviWHloB3BBFewpeb0g
         TcWAjW6a+Wv4wD8bLg/AqZxMiv7x2K5HgAU3duvGoXSFV2ChVkmVurHGcp10NDNQfVll
         SAgZ5Is65Kl42YOwsQtoyCFobmYIvv8+zjfwgnRm+wzlB51BVF7PODa5nSRCgjaeKHEl
         9RWgHiuAwEGCSVHPpf1nUe4MaJDOQhd26ud84gof9D8npjzMOIejkb9mL0oGNXUBiDkm
         xcdd4jplbBIFBHTZhzFMOo4DGDakcxjs8aiP4q889VmdBbEyI2PXH19t7DzQy0hkfHg1
         6X6A==
X-Gm-Message-State: AFqh2kpbkm1q3q5xsKwg6Hyk+LCHAFsEWkNUiXLcG4MYopayL7+8OX5l
        Cg2c5jGlLNuU6paarIuSaMt34g==
X-Google-Smtp-Source: AMrXdXsaDClN0vuBlujdqZnxkRnsmvEbNO55rqMUGIL2WCYe6/6TZ5jBxS7cGLnAgFBYvf2AN7WMKg==
X-Received: by 2002:a05:6512:c01:b0:4cb:3449:1354 with SMTP id z1-20020a0565120c0100b004cb34491354mr12232812lfu.22.1673467298572;
        Wed, 11 Jan 2023 12:01:38 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v20-20020a05651203b400b004b4e6dab30esm2881437lfp.222.2023.01.11.12.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 12:01:38 -0800 (PST)
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
Subject: [PATCH v2 14/14] arm64: dts: qcom: msm8996: support using GPLL0 as kryocc input
Date:   Wed, 11 Jan 2023 23:01:28 +0300
Message-Id: <20230111200128.2593359-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
References: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
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

In some cases the driver might need using GPLL0 to drive CPU clocks.
Bring it in through the sys_apcs_aux clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 8a35a785b4f7..37ebd8a3b2c8 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2946,8 +2946,8 @@ kryocc: clock-controller@6400000 {
 			compatible = "qcom,msm8996-apcc";
 			reg = <0x06400000 0x90000>;
 
-			clock-names = "xo";
-			clocks = <&rpmcc RPM_SMD_BB_CLK1>;
+			clock-names = "xo", "sys_apcs_aux";
+			clocks = <&rpmcc RPM_SMD_BB_CLK1>, <&apcs_glb>;
 
 			#clock-cells = <1>;
 		};
-- 
2.30.2

