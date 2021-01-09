Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C41242EFCA3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 02:13:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbhAIBNg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 20:13:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbhAIBNg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 20:13:36 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A581FC061573
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jan 2021 17:12:55 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id o10so16366369lfl.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jan 2021 17:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l6IfDL+FdSZVW/krD2mf0b3nGqhKOFzpy//5bHWZryk=;
        b=tESxkqAUvsgKqmXTQZzNMHnwaX5Lj+jjvH0clyYu/QPy38XcviXc4XpKiR8EKQ2MWI
         A6CUgJ0NYGqC69LzDim2W0DJ2XOW3ArIRMg6Y+3StFKfC9IJPadqyAcdOexEZqpSzJ20
         cKPDxZS59HUnkqr4ohCDZPPs3rPEBWA+JbEmbGasznuFHT5nqk4eWOP/D3lDYNyi5FPm
         YL7PsokSQj42JSla+Ikk5IhoxhHye140yzcnkORQCD94tDsdR1pSipDT9NiEn0Hikzy8
         lA38zNFxmANADLj62ToyuqI2wUQG45GMqi26xwxGt6sFSjGLlQl2yWAvKW23v4Fd7g5d
         N+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l6IfDL+FdSZVW/krD2mf0b3nGqhKOFzpy//5bHWZryk=;
        b=E7QhgJIkD3kdUR7lc/rXWyrXX3mIryTipLaNAj7P/KVXCjJ/Vze39B2p0oUSgfeMYZ
         +l8YR+SiIlmPBl9QZuPAKJeNzZnoXCk92JCWBiyOGwwGj9Yzhcxk/bs8F82W2y3zTM6L
         PQWjTwhRVGAhU9R8lMaOueqJc7KFj2hThqvgi9XrUpyHylsRcWWvTMTn8sMQ3/rI9KG1
         G9lTXABtwSgI3ic+Wxg7obe1QajBXp1vad9EByWYtlX8U5V65fZYJImb5EU6Zk6WnByH
         Dn4YRX5lHBWRWywHk0eKXnR0y18XnkmNlGlBUrKK8YGuL4vK601h8lPRbRt9wfxn9yBe
         U50Q==
X-Gm-Message-State: AOAM532+y5d34aXU5KVVGWclB57ulsuFQU2+Yw5iQditLT+mROR8dY4q
        IUu6sUtbE5y0ACeCV7k57KpYAPe3/j88tg==
X-Google-Smtp-Source: ABdhPJyzvy/mISijXhP6fEFz5Fq7Hu6orcgI7zHRjYA2B/nnsKcA2ATZjQSc0BfDOIt1PSh5mc+SBg==
X-Received: by 2002:a19:4856:: with SMTP id v83mr2520004lfa.583.1610154774227;
        Fri, 08 Jan 2021 17:12:54 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.99])
        by smtp.gmail.com with ESMTPSA id r14sm2378270ljn.118.2021.01.08.17.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 17:12:53 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8250: correct sdhc_2 xo clk
Date:   Sat,  9 Jan 2021 04:12:52 +0300
Message-Id: <20210109011252.3436533-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

sdhc_2 uses 19200000 Hz clock rather than wrongly specified xo_board
(39400000 Hz). Specify correct clock to fix DLL setup for SDR104 mode.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: c4cf0300be84 ("arm64: dts: qcom: sm8250: Add support for SDC2")
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 951056056b41..3cb65b85f4a6 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2125,7 +2125,7 @@ sdhc_2: sdhci@8804000 {
 
 			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
 				 <&gcc GCC_SDCC2_APPS_CLK>,
-				 <&xo_board>;
+				 <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "iface", "core", "xo";
 			iommus = <&apps_smmu 0x4a0 0x0>;
 			qcom,dll-config = <0x0007642c>;
-- 
2.29.2

