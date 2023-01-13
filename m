Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8867D6696B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 13:13:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240768AbjAMMNw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 07:13:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240277AbjAMMNE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 07:13:04 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3FE5777C3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 04:07:27 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id b3so32842446lfv.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 04:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCnIJqO2b+9N0OecC4jMTKlWlXg44BUeDV2RJle/2cA=;
        b=rODXfaGgWChiGLfNjYILyLfGGUftDZsirf7jkRzBivbbExfvp4y757l8fjS4pm5BMf
         RYfZOQFuJRCmMMXw6il+J8vkTLqv3X1hDK9kPUy85bYcd9C6JKaVLSf6CtRy0hT7S0fO
         23e5gxlAEyWF1ZeZa1HuraRDtSbKbBraiwgSU6HmCfikQOR2FgP6poKjzt+y11aZh60C
         tQv5ARAJyHo1tVGgtzPdK/Gyg1O1wm+T87q3au/khy+hlq4VU8+alaQNSv+mR2S60Uyg
         4qVD+5lU+1lKsvF9STWBmESbZLd5LQXb1N6TW2E0sGd3ltthS6z+gCGMh81cTCsEcjai
         iHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PCnIJqO2b+9N0OecC4jMTKlWlXg44BUeDV2RJle/2cA=;
        b=EFAAPtqCG0eHvHB/4m0VXoDLViS18jKD5L87c4dhFOBnhpXzhPJ6lkLKZAYSOOI11e
         e+wzalqxURK5w41FmP2hSNMwBW8Qxe2HY4GcFu9v447RX6IICwZZ1hDBOSnTUTJMcAy5
         cvciTZ9zvaZv4d/RL2+yxZv+4tKb4sjUkw+xisoPB3z4bhYi+pIzt//8ByyKJs7cl3Ti
         d7z763h2b+2vaARM2k81RSP8UPhQIzN5vSDAvpdIc+dRry/w1b6YRiIkmUIDykidsCiu
         MChHh66JTjQEj7pgXGWbYf7dNF3QXAbSMM+Oy5A67w/1ZwHB0qbzfbsZF3zf4d7rxYuB
         8P8Q==
X-Gm-Message-State: AFqh2kpZtJ+h2ae2e6cefiPoHDcb6C0fDIzdSyoG7XjeKtXnqQ8fyS0N
        5P9QtbOSNIyEvhhKXPOvqYvRmw==
X-Google-Smtp-Source: AMrXdXs78wnzCaFL+toZiE7ddpm/BrF3KED/SoDQVCxnGEVvI2ustoLyqHgkXYx0wxDADRNG6eC/wg==
X-Received: by 2002:ac2:4ac3:0:b0:4b5:7e4c:dcea with SMTP id m3-20020ac24ac3000000b004b57e4cdceamr26490105lfp.51.1673611646131;
        Fri, 13 Jan 2023 04:07:26 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.170.82.205])
        by smtp.gmail.com with ESMTPSA id i7-20020ac25227000000b004ac6a444b26sm3806290lfl.141.2023.01.13.04.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 04:07:25 -0800 (PST)
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
Subject: [PATCH v3 14/14] arm64: dts: qcom: msm8996: support using GPLL0 as kryocc input
Date:   Fri, 13 Jan 2023 14:05:44 +0200
Message-Id: <20230113120544.59320-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
References: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
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
index fba429fd6919..39d2007e88ff 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2948,8 +2948,8 @@ kryocc: clock-controller@6400000 {
 			compatible = "qcom,msm8996-apcc";
 			reg = <0x06400000 0x90000>;
 
-			clock-names = "xo";
-			clocks = <&rpmcc RPM_SMD_BB_CLK1>;
+			clock-names = "xo", "sys_apcs_aux";
+			clocks = <&rpmcc RPM_SMD_BB_CLK1>, <&apcs_glb>;
 
 			#clock-cells = <1>;
 		};
-- 
2.39.0

