Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84EFC5B38C2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 15:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbiIINUU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 09:20:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbiIINUS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 09:20:18 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93B3867158
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 06:20:17 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id i26so2612879lfp.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 06:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=bIrN4HBc/AYGCl/WYc4FxOd962UU6pFyVULMpckCoQk=;
        b=pxzBrFpNtHosMV7i78DEHCwxMYggP3WVeivwnsk6B+ewCoMKvQMOweLZP523y15Mon
         HxZcSiqLY0Iej2R2PP0Xb7i0PQlzUNDZRm/GpdtfpcIuOSpkGqBLdSkk5gqRsiPq+6Pw
         8adgD13HpRC3HmkuSSF8LPzbIbXNWnptwWonW1KxZIip+BNDK6s19HGp/a4d1PMQLT20
         xpwm1LvOAHrcgfpFDko6iTqtv8zw9JdHGotT5bigGQOS4M6LnirutwfSadEo4qufJhcA
         IzRRxh8oK9ylNSbU78dDlgxeyeDRxcryqo7qXupomWlZ/1HQQWYiw6mSF2ZO4KBjgnIx
         7pyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=bIrN4HBc/AYGCl/WYc4FxOd962UU6pFyVULMpckCoQk=;
        b=kxKZCTD3dPWiImRPBGJPor8FpVt+wVJXbVMuaQflWNQwyAsKQn2BEWo40U2WmNtLX5
         ltvVIRVPWO7sjf1E4adk/q4JMuCHA/hGSn+FgvYHo800SxRx5HRUGn+2op5aS7fn9Jy8
         3fQXS3DxdB/WQ/uAPvzdmCTmRgL6ckZKrywr2YEmAGRPPsHIoEnBXZlDEDVu+oGAlFdj
         gZGAVpOpV7bTrel7PUYam8a9j9Q/TKPKyOFVviVrKawPHK4OVH6jvzeN9Kdi1jZ4se8H
         Spvi28+C4UD5CT/WvccIQCVMbXMGZYZ0SmSSopNRDI5zIygd+3kkcZ7fLeUVqQehOpKc
         atSg==
X-Gm-Message-State: ACgBeo0DFTbk1aYFjYsf/yKPT0WqaFuqnuq+2WfFiGNaLIB2m705TPgW
        M9fL2ulXaFzEp83vcPjSyJtpdw==
X-Google-Smtp-Source: AA6agR7N9g6t46znk386NL63YSGUp1+CABCFlUVyWPq2XvlE6HVpWv46O3t76Qeuqpn2kZECBBukSw==
X-Received: by 2002:a05:6512:4024:b0:497:4db:6ad0 with SMTP id br36-20020a056512402400b0049704db6ad0mr4674150lfb.637.1662729615738;
        Fri, 09 Sep 2022 06:20:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v10-20020a056512348a00b00498ff4ae746sm71729lfr.294.2022.09.09.06.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 06:20:15 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 5/6] ARM: dts: qcom: apq8064: add #clock-cells to the HDMI PHY node
Date:   Fri,  9 Sep 2022 16:20:09 +0300
Message-Id: <20220909132010.3814817-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220909132010.3814817-1-dmitry.baryshkov@linaro.org>
References: <20220909132010.3814817-1-dmitry.baryshkov@linaro.org>
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

Add #clock-cells property to the HDMI PHY device node to let other nodes
resolve the hdmipll clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 942aa2278355..decd18217523 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1498,6 +1498,7 @@ hdmi_phy: hdmi-phy@4a00400 {
 			clocks = <&mmcc HDMI_S_AHB_CLK>;
 			clock-names = "slave_iface";
 			#phy-cells = <0>;
+			#clock-cells = <0>;
 		};
 
 		mdp: mdp@5100000 {
-- 
2.35.1

