Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75B2454F793
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 14:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382271AbiFQM3e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 08:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382272AbiFQM3c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 08:29:32 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FD2C60DB7
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 05:29:29 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id d18so4581691ljc.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 05:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bGeccNDCBeLsb8V2UEPm2YdO4aA4EMY5TjAXSJDABD0=;
        b=e9w62j0uWtKr7FsHGlHFnDLN7QfktdUKyYKHKqm45BUP9sG8t9cDFKdxXtUmblJwYs
         kBLTEy46y24UQ9QS13QANcc9xsIuLG5deZj8he85aFa8PvsJvblQzjwliOp6ZNDUM/KH
         VRukBFksleSWvRbig+RWHjmWrCKrwXitJbLel66n0hD/FfOjKIlKyMlbxHYE1VHVyZw8
         pRL8JNVrbEwu4ZiEA88kLpadF08Dbhc6efarSu9UnjB4H0elpINxI0qagyAbQ9/TYrJ4
         V4hcmopoSMdclftwieT133ZmBS42JimOzWQC/GoYAhIs6+KNoCGYCaZhoTYIDLQJXWUd
         pNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bGeccNDCBeLsb8V2UEPm2YdO4aA4EMY5TjAXSJDABD0=;
        b=e5rvBzaq1z2Te3KjtZDpYM1TK5aTLAVqCG8VKt5OwdUEIVPa9fW+8dgGqLokKezmTm
         /VocX3Hl6w1sI2K3Ne4zM+xLhFTiLjRJTAyGtDC2vPwoVOPRszF4vDk1iqO9EoEX5Sl2
         ViFlFS9n69UFwZ0w9z9+LPulclRxQ92NM+nG8kdhCvSdyJ5XNAJn2jZh7SZE8Nj8CcfO
         IZrmrwb/wRb+lnrUmLZjAPRlJbHhh5FY/bheK45N+25j2CGqI5atNRzlhXck5PkUOx+O
         JHDTw5Ixri61a6eBya2K67BOdx9aj22oLGpw6Ie+B04JsVOOpBegGGIQr6a7tETTu4hN
         NNHA==
X-Gm-Message-State: AJIora+//2AioWYGFNA6kO7/pzUEqyOjisiITSmdm9hMgLn98RsnBS+s
        fgk560OxzM3qQqq9tREI36GC/w==
X-Google-Smtp-Source: AGRyM1vdjRy+BCqpyZ3tLDjOl2VIOGzlWV1J901EdHDM6CIzlHMOP0RhSBVH0wsgmnzO4sa72wYh6A==
X-Received: by 2002:a2e:8749:0:b0:255:81b8:163e with SMTP id q9-20020a2e8749000000b0025581b8163emr4834846ljj.463.1655468968270;
        Fri, 17 Jun 2022 05:29:28 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b8-20020a2e8948000000b0025568a2a018sm539471ljk.129.2022.06.17.05.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 05:29:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 6/6] arm64: dts: qcom: msm8996: add clocks to the MMCC device node
Date:   Fri, 17 Jun 2022 15:29:22 +0300
Message-Id: <20220617122922.769562-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617122922.769562-1-dmitry.baryshkov@linaro.org>
References: <20220617122922.769562-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As we are converting this platform to use DT clock bindings, add clocks
and clock-names properties to the MMCC device tree node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index dffb87a5ee74..0c7b7cd9f23e 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -751,6 +751,22 @@ mmcc: clock-controller@8c0000 {
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			reg = <0x008c0000 0x40000>;
+			clocks = <&xo_board>,
+				 <&gcc GCC_MMSS_NOC_CFG_AHB_CLK>,
+				 <&gcc GPLL0>,
+				 <&dsi0_phy 1>,
+				 <&dsi0_phy 0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "xo",
+				      "gcc_mmss_noc_cfg_ahb_clk",
+				      "gpll0",
+				      "dsi0pll",
+				      "dsi0pllbyte",
+				      "dsi1pll",
+				      "dsi1pllbyte",
+				      "hdmipll";
 			assigned-clocks = <&mmcc MMPLL9_PLL>,
 					  <&mmcc MMPLL1_PLL>,
 					  <&mmcc MMPLL3_PLL>,
-- 
2.35.1

