Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E11629703F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 15:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S464522AbgJWNUC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 09:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S464456AbgJWNTk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 09:19:40 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D51B5C0613CE
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2020 06:19:39 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id x16so1545646ljh.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2020 06:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8zrW3F4EtDxIXqxN4rkTzSpTYyKGY7/NdRqYOW9zNVQ=;
        b=najjhWzJOGwlVwchFVVSyXcA5bTEsXvJ1MPlZBGtaKzm59NlBIzWj4Rjiyn718eTbJ
         7Ve97wVO9+QachB6aDhu6nL1klAKC8KH/RhrPvPc661tYf5ax4Rn6MZUap6XSYCICbYy
         3ZiOAlyb0pVB4L47+ctSNn4I2C+Yw+WR37P0Gg8O+Of/jYdM47BWS9A0v2qLP3w6kWa/
         h9c+dQcjzjXxu/+PGBsfKYXR7EAESmCbBgTyNG2l4+FCohoLYuULBPvUJ0JxgBMDvG6C
         fAhnTXoiQJbiJex0wj+5srxVJ37uQyBrn8o/Gh+znaheq4XQO4T6yTcMIRLPwqCastc7
         p3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8zrW3F4EtDxIXqxN4rkTzSpTYyKGY7/NdRqYOW9zNVQ=;
        b=PCg2gRGuVlBceIcl7dA0nS1p5uVgpGg3kjD2r6kPc/xt605qYyjwSl8pUOZj11Pgi2
         BxVtfIX+qOhJ6TBt70dGBfrdBCz+872wguW7VoQ7VNjDcsv81+93u0xZ2nRtqkyXSttA
         ii8jbPBV716x9Y4AP6jfyHAhbDCMCX2K231YxaezITIHuDQdbQUtXk9rjTty04Vd/+Od
         3HvRacCpUpTu9pl7JNEHa+eFAs65MxBtWHdWTnysqQXXEDKCCx8zWhXhKdJyvOR1Chtz
         nDw5fRtAfsUjF9T58H3ugcsJOCvAVnoMb76Duqg6bOynmWdwZvXIM4DuQT9sfvh+GtTf
         6u7g==
X-Gm-Message-State: AOAM5324sJFKFgDkfS9aPSSmnOEALsONamgYaiWziC6z8T4WjHqu7497
        yPbl4iM+LELi3EJWZwkA5pPSIA==
X-Google-Smtp-Source: ABdhPJweGn0vIWzZdBnWSNSe8t6OIeR2SfamvlV4fVavaL9pzD/rRJi5LVMnFomo/CwmABiwSagkUg==
X-Received: by 2002:a2e:8416:: with SMTP id z22mr950001ljg.72.1603459178362;
        Fri, 23 Oct 2020 06:19:38 -0700 (PDT)
Received: from eriador.lan ([188.162.64.195])
        by smtp.gmail.com with ESMTPSA id o22sm161564ljg.122.2020.10.23.06.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 06:19:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] arm64: dts: qcom: sm8150: add mmcx regulator
Date:   Fri, 23 Oct 2020 16:19:23 +0300
Message-Id: <20201023131925.334864-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023131925.334864-1-dmitry.baryshkov@linaro.org>
References: <20201023131925.334864-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add regulator controlling MMCX power domain to be used by display clock
controller on SM8150.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index f0a872e02686..4c3d694b7dab 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -172,6 +172,13 @@ tcsr_mutex: hwlock {
 		#hwlock-cells = <1>;
 	};
 
+	mmcx_reg: mmcx-reg {
+		compatible = "regulator-fixed-domain";
+		power-domains = <&rpmhpd SM8150_MMCX>;
+		required-opps = <&rpmhpd_opp_low_svs>;
+		regulator-name = "MMCX";
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		/* We expect the bootloader to fill in the size */
-- 
2.28.0

