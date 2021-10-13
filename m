Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43AA242BE41
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 12:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234186AbhJMLA1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 07:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233571AbhJMK7h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 06:59:37 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A76FC061786
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 03:56:42 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id s75so1959042pgs.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 03:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/pyODqkukGQl+Vrz63im0QcSLiwmTtjxEqIvcDs/jLA=;
        b=fxJ57WNBEvlRBn8ueXr+2xSkBYKkXRBbUZ8oEsti3BUMi7DFeBvCF9aLyAFXreheyb
         mRMoBWBGSjTdQwdpSs//QcHzHuYE8RYCZBOd+6a9lW1D/TWMFx2V0MB7mIyizklotPBC
         6I+DbCMR+v47jheHR9Sx7Pd/zWG15E52YNjcPWDlhyONe/3MzXJV2OmmJrmqx70tz16x
         z77PAaqs7t85yCPrkqIETSEH/Voi3vFjfFdY2XK/etiBPHFpHzYH59ZSM/gWoUnXyJGy
         C5FC1bt9ZJzA+LwlJ2jUzszIOXnU+ppG1unnMX0qw8iI2RXA2snCt8bE3icH8+elIQKy
         T9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/pyODqkukGQl+Vrz63im0QcSLiwmTtjxEqIvcDs/jLA=;
        b=WhcTV2eibUH4PjDXHAPmkZjk82laJh8SAb0jnste/qj7ub0NiTD8g5BnnTXl9lB4Bx
         2JmWnwwItCaq3PgpbmanU3Bori7bRFFriZU66apXYg74Hjmb4Il9ne/IhO71suchjYBq
         +I2sGsQEKJyXkUJtnvkwua73MLGqWWEFA9uIkiGp1S49WrjoGQ3Tv+ApXy8Ctd3wv8Z/
         rtQKGCQDRkeWyoqceGWP7A3vthPbvgiMZYsott5+lrpiBHWYi1eR/+u6KB1/0rJDLyfm
         lPlnjfDbf9GHy2rVU53/9j1zZTpBYk+0bb3p9U2HMGsC0sU7S5fjR9UulX3X+mABur0h
         IHew==
X-Gm-Message-State: AOAM531B1G8v0ro2pXiKHnck2ee9cwa95leBDFtxQVQNlvx2Z6aT4Zwp
        5rMBpoImNQ0ZdpkKs4lLguqYzQMQBYpkgw==
X-Google-Smtp-Source: ABdhPJw+kX3sb0c+dDL/I5BYwXxjahp6G5LXHY6eJF0+NW1a3wwi9tjyNYU+5+oYk6UCrPDQ2DRJOg==
X-Received: by 2002:a63:6a05:: with SMTP id f5mr27161340pgc.97.1634122601586;
        Wed, 13 Oct 2021 03:56:41 -0700 (PDT)
Received: from localhost.name ([122.161.48.68])
        by smtp.gmail.com with ESMTPSA id b13sm6155351pjl.15.2021.10.13.03.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 03:56:41 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thara Gopinath <thara.gopinath@linaro.org>
Subject: [PATCH v4 10/20] arm64/dts: qcom: sdm845: Use RPMH_CE_CLK macro directly
Date:   Wed, 13 Oct 2021 16:25:31 +0530
Message-Id: <20211013105541.68045-11-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
References: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In commit 3e482859f1ef ("dts: qcom: sdm845: Add dt entries
to support crypto engine."), we decided to use the value indicated
by constant RPMH_CE_CLK rather than using it directly.

Now that the same RPMH clock value might be used for other
SoCs (in addition to sdm845), let's use the constant
RPMH_CE_CLK to make sure that this dtsi is compatible with the
other qcom ones.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Reviewed-by: Thara Gopinath <thara.gopinath@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 72ec48c4e03c..a301ca7664c1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2316,7 +2316,7 @@ cryptobam: dma-controller@1dc4000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0 0x01dc4000 0 0x24000>;
 			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rpmhcc 15>;
+			clocks = <&rpmhcc RPMH_CE_CLK>;
 			clock-names = "bam_clk";
 			#dma-cells = <1>;
 			qcom,ee = <0>;
@@ -2332,7 +2332,7 @@ crypto: crypto@1dfa000 {
 			reg = <0 0x01dfa000 0 0x6000>;
 			clocks = <&gcc GCC_CE1_AHB_CLK>,
 				 <&gcc GCC_CE1_AHB_CLK>,
-				 <&rpmhcc 15>;
+				 <&rpmhcc RPMH_CE_CLK>;
 			clock-names = "iface", "bus", "core";
 			dmas = <&cryptobam 6>, <&cryptobam 7>;
 			dma-names = "rx", "tx";
-- 
2.31.1

