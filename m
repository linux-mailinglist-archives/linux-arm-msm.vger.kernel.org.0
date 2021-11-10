Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03E0244BF94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 12:01:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231666AbhKJLEF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 06:04:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231799AbhKJLDr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 06:03:47 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61C4CC061767
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 03:00:43 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id t5-20020a17090a4e4500b001a0a284fcc2so1527142pjl.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 03:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pbwxx26uDNHirCinQNPTtkR73Falpq6kV84mw3b4gxU=;
        b=CiBhkcMOkMYi3No6OK/yH20y8kyu27LK4Ih7rmhd657Sa0Dfp7lv1T9XO+wQxYk2s1
         HTDtlRGuvb4dR8jPsNqMiuCNQt4hZidfWUZT8Yfs47T0jZ+M1Mk+AK0SsWNV1OhxU2+4
         olIVs+kkWgORbpcI8/NtYUtPgugb79UD0HMCKxg4Qbbxgvg/LbxGtiP8Pfx2cMi32AS1
         0/TozZdkF+aYkIUtf+TEbaJzC6ZbzeoWCo9GAYCtcbyRQKqmW1VCLzqONwjLqVI7oOnk
         /mC3xM7dwa33rdplml64ouhLUujDZqRyDZ5OFgL29m/ctb6L2P3fVa0AN+0d2t+oKvkJ
         6afA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pbwxx26uDNHirCinQNPTtkR73Falpq6kV84mw3b4gxU=;
        b=wPM3YwYD4g9ZDdoyBTFS2WzdD1THtoJG0ww8MdW6KuwATB4mdmBY8X4YN8TLFjO5Bp
         Cb7CCGVcm7B9G9lwUfRGkWlHyfRMJym+n5L/vy2JZFNfG7VbyMrOop0jrxCwtA/OJpL9
         bfD+wsFaxhPRVsWeJ9w0/KTTZ+RqQryJFT/GDJesaFaBEtMWH2pq6DWLKfw1VqlabBKE
         HARzgp4KnBfML6vIsoSawtyLBunii45mpn8x/XZGxUfRgUmA0sqoWdM8U9tB61ZeR32m
         o4cbZldwcfpe3JPsWZ38zNlaGhr9N3+vXijF9KWinHxrazaSM71J6lrtXHcoxTPlxHid
         gZ/g==
X-Gm-Message-State: AOAM533Oh8GGX0CBZWy9qu4FT7FnvTQPtEVU2WCr3hqcMfKdwBPuDa1+
        hFD/mX1DF3LgwhqYK2DvgzPrU/FUlVPxPw==
X-Google-Smtp-Source: ABdhPJx4fMgUFVQjw1MR6UEwOKaZ33xFJl3hfs2RwNICZF+dUyxrI5MshS62cr+NF5LOrPy31w92dQ==
X-Received: by 2002:a17:902:f2c2:b0:141:9ce8:930f with SMTP id h2-20020a170902f2c200b001419ce8930fmr14718759plc.68.1636542042702;
        Wed, 10 Nov 2021 03:00:42 -0800 (PST)
Received: from localhost.name ([122.161.52.143])
        by smtp.gmail.com with ESMTPSA id e11sm5585282pjl.20.2021.11.10.03.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 03:00:42 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, stephan@gerhold.net,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v5 12/22] arm64/dts: qcom: Use new compatibles for crypto nodes
Date:   Wed, 10 Nov 2021 16:29:12 +0530
Message-Id: <20211110105922.217895-13-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since we are using soc specific qce crypto IP compatibles
in the bindings now, use the same in the device tree files
which include the crypto nodes.

Cc: Thara Gopinath <thara.gopinath@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 933b56103a46..f477d026c949 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -204,7 +204,7 @@ cryptobam: dma-controller@704000 {
 		};
 
 		crypto: crypto@73a000 {
-			compatible = "qcom,crypto-v5.1";
+			compatible = "qcom,ipq6018-qce";
 			reg = <0x0 0x0073a000 0x0 0x6000>;
 			clocks = <&gcc GCC_CRYPTO_AHB_CLK>,
 				<&gcc GCC_CRYPTO_AXI_CLK>,
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 526087586ba4..8e7cbadff25a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2329,7 +2329,7 @@ cryptobam: dma-controller@1dc4000 {
 		};
 
 		crypto: crypto@1dfa000 {
-			compatible = "qcom,crypto-v5.4";
+			compatible = "qcom,sdm845-qce";
 			reg = <0 0x01dfa000 0 0x6000>;
 			clocks = <&gcc GCC_CE1_AHB_CLK>,
 				 <&gcc GCC_CE1_AXI_CLK>,
-- 
2.31.1

