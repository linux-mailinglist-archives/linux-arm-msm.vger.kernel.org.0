Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC0552589D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 01:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359596AbiELXoA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 19:44:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359609AbiELXn4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 19:43:56 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46439289BF3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 16:43:53 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 4so8348017ljw.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 16:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=azPGR+vZJiRZ8wrc365ZR8Nim5+sjCT0QCeZdqg0Fso=;
        b=Krssdi/cJ/vl4WsnC9x7+mJoAvRtsJxwIVRwuuVNdcHbSpPqB7vA8IicvVTJsaEYaz
         zJU8maXa1XylOQTKlmpydCnpOa6FBUy+HSKgQEq1LfD7/zhXiRBBIrmKx9NWMVxIz6kv
         iEEyrVY5dtRcmDm7Ais1ANolb4pxosDABRH0qbqyTW5edzjRNjYUcJSKyuBcM03B8hQ4
         vZec+1/hqLF0RC8QpW0u21/8PWlBBnPdGy8jyJ3qvA9haOpb1I8u5dVMYEa0PVCgznni
         u0AENlqp1uJtV+9BBLPQ2yH+yoGwXnjYrl7j6QlVJ2AOf+Zy5kqMS423RqYXMTXIJKRN
         KPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=azPGR+vZJiRZ8wrc365ZR8Nim5+sjCT0QCeZdqg0Fso=;
        b=bGDo0gwjll6doqnf+1p24IXh+FE6lgzH6i9pS9nGq5aU/9JHJu8TuZB6W5gYMwU0W6
         f+tK8fN+AhXGJozB7MU5zQPyccNdyDCrXdl0QrwWLcc9NJ98vG5ALvjIMK5U7A6vM7MO
         KiPT57tk7CX/OROSDfF/2VYdZLRQYGfpuNKAGroEmF3Vkh2TYe9dsUUbrU/GRw/GRaXT
         0vwMpVGKP+kMsguWp8HGK0IuCBNWtmf87ONhgeWSISl80s5Ri6I7sRfdvu9BJsLvcstN
         ET9U1Bzwt6RlXI3eVM38/YgqYp+PgJmAW2UjCkHwqT31wRlJ4200Ccom8ze1zlP7b1TI
         cjnw==
X-Gm-Message-State: AOAM532TGhoOC5T4ZJdDM90Tn2vBywn/o4H0zh0WcSasaN1WnRtlqBBa
        MoHUAcAfwiW72+iCI5ffyJPq9naVxSafoQ==
X-Google-Smtp-Source: ABdhPJxhAcyWTev4oCZeYV7ClkoMhUVLnW9hYePIzUlD0ExpZwieH7SBXOFl3hnMg/oh75LKsJ2L2A==
X-Received: by 2002:a2e:851a:0:b0:24f:11ad:b28f with SMTP id j26-20020a2e851a000000b0024f11adb28fmr1492120lji.204.1652399031593;
        Thu, 12 May 2022 16:43:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u10-20020ac248aa000000b0047255d211b8sm129976lfg.231.2022.05.12.16.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 16:43:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RESEND v2 2/8] arm64: dts: qcom: sdm630: disable dsi1/dsi1_phy by default
Date:   Fri, 13 May 2022 02:43:43 +0300
Message-Id: <20220512234349.2673724-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512234349.2673724-1-dmitry.baryshkov@linaro.org>
References: <20220512234349.2673724-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Follow the typical practice and keep DSI0/DSI0 PHY disabled by default.
They should be enabled in the board DT files. No existing boards use
them at this moment.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 240293592ef9..8697d40e9b74 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1559,6 +1559,8 @@ dsi0: dsi@c994000 {
 				phys = <&dsi0_phy>;
 				phy-names = "dsi";
 
+				status = "disabled";
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -1592,6 +1594,7 @@ dsi0_phy: dsi-phy@c994400 {
 
 				clocks = <&mmcc MDSS_AHB_CLK>, <&xo_board>;
 				clock-names = "iface", "ref";
+				status = "disabled";
 			};
 		};
 
-- 
2.35.1

