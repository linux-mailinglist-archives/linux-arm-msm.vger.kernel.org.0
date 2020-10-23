Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 657F529703C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 15:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S464450AbgJWNTr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 09:19:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S464487AbgJWNTo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 09:19:44 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F462C0613D4
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2020 06:19:42 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id l2so2073889lfk.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2020 06:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vs5mIrV/vf6dXVUTDjt/isM2L9GuwwyE1om4bgY/ZkU=;
        b=CpTp4wLudC7DAsrK1ThoOcKozcTO0vn/+OJRKPKooHTPqgO9ZFJmTTfAdC7YcLIeIz
         pDwIay79IUiwsxhjAFJg1a5VAo5gMpSVcDWkmiJrEaAAtO5DTgZpcEYfSCUkG33Vj5PG
         vUYgZxKYPsL0y3gf6Ee20myRXrgimuasFlBpqofZ/uEEllU3OXJB7dELxbZf7yUJMhEV
         /B57sdfKz8n6408WAfe5JxsAwEaz2gDQ3F3czB2nK3ssd/vozqMxIuVtJ32iVYkUjdSG
         jcluEtB63dJkJDOElwj6N7yy6srLXcof8S6OX7mqrEEi+DiGm0n0LwngI/s2Ld9NOWRZ
         Hg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vs5mIrV/vf6dXVUTDjt/isM2L9GuwwyE1om4bgY/ZkU=;
        b=dVGMbWBGGGglHNUJtjxCX7j5Rip3VTAT3L+1oIQ6+j8vwIaxrJ4/e8Cx8TNCNKTSxc
         mYtygQbWnaoNZaT4hc2Dy5Mm3ZoHghSbXwqMQuR+oUe0EVH6GBc2wp50Pb4cz4kiIvMT
         8WACTcjN6Ej07NXzH4HgSVXuLqdCx5hhSAN6AE2Mg84IuibUAAkaLQ5W3JOq5+jq4ylj
         rCr2WzCKnfKMLwTFZfCVYoX9D4vViRjjeCtX2pgRa9rOZ2s5BSr0TjjJx7yY25+XD3OO
         6LiG9Qb3nArYDGsdfG0dJs5W+wMVe8w7EA4nXslC5eyq/NpmShTOSvppA8wm89/JuPGi
         S2hg==
X-Gm-Message-State: AOAM53292k2z2uiwOouiSiMdVVYvPZQljwQjJRsSv9egJMgMHJjpZALF
        gC0Lz2v9fIDSBk985Ysl70woeg==
X-Google-Smtp-Source: ABdhPJw9ugMZCYpQu7QxG3hoZDbK0RbL4rhOr50EyBLVYx2Slttp8dcxQ4Sf5TIkPSMR6cZIH1hSwA==
X-Received: by 2002:ac2:5976:: with SMTP id h22mr708794lfp.507.1603459181044;
        Fri, 23 Oct 2020 06:19:41 -0700 (PDT)
Received: from eriador.lan ([188.162.64.195])
        by smtp.gmail.com with ESMTPSA id o22sm161564ljg.122.2020.10.23.06.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 06:19:40 -0700 (PDT)
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
Subject: [PATCH v2 4/5] arm64: dts: qcom: sm8250: add mmcx regulator
Date:   Fri, 23 Oct 2020 16:19:24 +0300
Message-Id: <20201023131925.334864-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023131925.334864-1-dmitry.baryshkov@linaro.org>
References: <20201023131925.334864-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add regulator controlling MMCX power domain to be used by display clock
controller on SM8250.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index d057d85a19fb..c1d4a63cd2de 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -214,6 +214,13 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x0>;
 	};
 
+	mmcx_reg: mmcx-reg {
+		compatible = "regulator-fixed-domain";
+		power-domains = <&rpmhpd SM8250_MMCX>;
+		required-opps = <&rpmhpd_opp_low_svs>;
+		regulator-name = "MMCX";
+	};
+
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.28.0

