Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61A4A544BCC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jun 2022 14:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245386AbiFIMYJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jun 2022 08:24:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243041AbiFIMYH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jun 2022 08:24:07 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D951513CF8
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jun 2022 05:24:03 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id be31so37740477lfb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jun 2022 05:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SUn1WOp+JZSnlJIDDrxH+O9fgRsQXrcw9L2S+Zca6OM=;
        b=EtrvkCBe0NgzfUAPrPX2jYHqaxd/nG9HcYiVXsFU+ROL/t8759M9ti0tkbthJGhTpQ
         HLie4OUOUEFIAcYrpJkr/uIWCtaS5fAFy5r8kYfNsx7HeHi2PIoa0c5sa4nSrXc9PthH
         KP5FvRtOq+0Is+pyI4ZLIqxActQUQ3VAh8RzP3oYkFYmhPkicqRkpAKYqBNBM9paCEAZ
         UeGXRs/kZFFVf02ZI6fDc5QOoagK030Y3J5D7U+M4siq/10TKQahS63WQQ0dk+s0eYqX
         xKocU+YtXkTBMux7h14v/cjRX13BKBP8dJ7fR5V6ZdX/yoUxt5cm2OIud1h786P/UPMY
         3CdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SUn1WOp+JZSnlJIDDrxH+O9fgRsQXrcw9L2S+Zca6OM=;
        b=eo4cxItmRV6lXE+cFVfpeDiTppiUMEeu1dHcHqNsFdt5dV1U/b3jNVmB535ql8KQUM
         agl19MYZuowbjekab54Xo5kidtfa2TNoL1PdIyWpSCfqj2AdTtVBn9G2fgtonoID8KCD
         WhfYmIF7Z4irisH15tEOhiuPTqzv4Gm9M5axdxRTP7aGV2QcceqvGTO1xZFhC5m901Yz
         4a6ssjI4WAeqXkU9W+GVTTNXvoUEdSP/MZQezYGPXC9dgCDB89ES+07OQAjDLBINqlhf
         G4J8mAJrGs7wVd6ogqoi5W2b0HJJfJTHWdBkdvXluN0u6214VOpoQKswi0GyLiECGCME
         oEQA==
X-Gm-Message-State: AOAM533I0zVdYduCbXJJR2Z3T26FAmXPzcUehtjkZzF4CSuzXEsF4GeD
        gaEPRsw2ha/10U85yeEPC8AyWg==
X-Google-Smtp-Source: ABdhPJwCXoEf6TkZjW0q7EHMhRCvA2o+dBUu8Cm/IqQaJmBV3E7VjgKjZV1hohNlh5iKc8A/ZUwXZA==
X-Received: by 2002:a05:6512:130c:b0:477:e2ea:396e with SMTP id x12-20020a056512130c00b00477e2ea396emr68244331lfu.489.1654777443367;
        Thu, 09 Jun 2022 05:24:03 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f11-20020a056512360b00b0047daa133decsm32421lfs.166.2022.06.09.05.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 05:24:03 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 13/14] ARM: dts: qcom: apq8064: drop phy-names from HDMI device node
Date:   Thu,  9 Jun 2022 15:23:49 +0300
Message-Id: <20220609122350.3157529-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The HDMI driver doesn't use the phy-names to identify the PHY. Different
Qualcomm platforms have used different names for the PHY. So, we are
deprecating phy-names propertty of the HDMI device and dropping them
from existing DTs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 34c0ba7fa358..391ad85559bd 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1420,7 +1420,6 @@ hdmi: hdmi-tx@4a00000 {
 				      "slave_iface";
 
 			phys = <&hdmi_phy>;
-			phy-names = "hdmi-phy";
 
 			ports {
 				#address-cells = <1>;
-- 
2.35.1

