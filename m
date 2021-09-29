Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A08D841BDB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Sep 2021 05:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244122AbhI2DpP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 23:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244063AbhI2DpE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 23:45:04 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81568C061777
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 20:43:22 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id ce20-20020a17090aff1400b0019f13f6a749so2969197pjb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 20:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xq2NpHe6ad7cANQsELmFsUViShl/aGN1rmvD/DyXUH8=;
        b=LW2pGsbB5Y1jeLWAHAJoqfVzVLuFZHpQMqraDf4KywmgxHbM4aU4Unq3+KlTvi7F05
         o30P5YFTH/1/bmXEFN5RuXCD9YfPT8lq1j0F2fHs8LRhszrw49SA3/c259MZjaUsa9V7
         E4afw3BXqd0YxlEb++eR+m6Cjc/KHH4115qajxRtWx+do3seR+VZbYem0ah4PPhQJjfg
         LSWP9a3rPPaDeqG1elW/2uQa4h+nEowl97YKgZw2KsFUnjSJBUvx7FaJIG68x6jDdMdr
         Sdl0xePKkwh41w0kHlVR2ctMZgdgfuyJr2VR7KjGCO3NHGQ9yPv//iKYRoqGhZdoqj1j
         2AoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xq2NpHe6ad7cANQsELmFsUViShl/aGN1rmvD/DyXUH8=;
        b=PbFngbFOaLykVuZ7YTdihs2MIW/YfkdBxH+eWzFLdGWimOxI32oawQpJb4DZ/v3oLH
         PxCFaL0qqnT2R66jFI4yxG+2ZZtaHoW43dgbcxg2K4BUkedyiic77OkLhJmbH1XoIH2T
         30XcLPYm9a104cLQ9zq05FQdhtDXokWB3p7js3scEko2NHKmmGufARnS4Dh5yQxCOlEu
         zPk5TFVEm1d+LklkWXGoXPrmbCDuVj7K0PRIwNShEn1/hdTSjHgmxIlX01ftsgVj/hKP
         HCJOQJrrRoQIrrtNLJsl50cJLIA/PxlVjCth0nM3Z8+nPD0f5XX02RCxssz41gtJDXT5
         aqlg==
X-Gm-Message-State: AOAM531A88i16E5ZtDBrEchC47ib4YGdsSGQCtogiJz8gWlTwG/lf69H
        M3cRpRAsvAcFywWy/zO3G6LtPg==
X-Google-Smtp-Source: ABdhPJw8885kvnEY9UOdwpXr8PgeVGll+IZ6ScxU8x3GlT19uRgBYRyOIPb3DMNa6mMroToiMLpIbQ==
X-Received: by 2002:a17:902:650c:b0:13d:baac:1da5 with SMTP id b12-20020a170902650c00b0013dbaac1da5mr8316566plk.20.1632887002101;
        Tue, 28 Sep 2021 20:43:22 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id b7sm533032pfb.20.2021.09.28.20.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 20:43:21 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 07/10] arm64: dts: qcom: msm8998-clamshell: Add missing vdda supplies
Date:   Wed, 29 Sep 2021 11:42:50 +0800
Message-Id: <20210929034253.24570-8-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210929034253.24570-1-shawn.guo@linaro.org>
References: <20210929034253.24570-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

'vdda-phy-supply' and 'vdda-pll-supply' are required properties.  Add
them to fix the dtbs_check warnings below.

phy@1da7000: 'vdda-phy-supply' is a required property
        arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dt.yaml
        arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml
        arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dt.yaml

phy@1da7000: 'vdda-pll-supply' is a required property
        arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dt.yaml
        arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml
        arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dt.yaml

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
index 125d7923d713..3f60575a351c 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
@@ -313,6 +313,8 @@
 
 &ufsphy {
 	status = "okay";
+	vdda-phy-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l2a_1p2>;
 };
 
 &usb3 {
-- 
2.17.1

