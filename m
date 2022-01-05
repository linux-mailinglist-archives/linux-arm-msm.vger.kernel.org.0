Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13A7C485872
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jan 2022 19:34:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243030AbiAESe0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jan 2022 13:34:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243021AbiAESeY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jan 2022 13:34:24 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F9EC061212
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jan 2022 10:34:23 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id q8so4267085wra.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jan 2022 10:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+lqRhrkooB1DRVf4+Ugj5CfxzFlazGWH1jNE3D3s2OI=;
        b=m63AUIcP/hsHWSNy4ffYkMVz4F4XPKbOSnUAtPfhTPYKxz2CWKcL+NaYAolE8zBPjG
         Fr/0zi7WXIGgT3q3AacedKNriA8Xc06cBYJ6Db1wL/Y+uGXmCR2p5RzRvYhMPDRsg4fC
         nPMYW0LZdRAuTp0Oy+Hl1x5tYleyBkuKM+Gd3TuIoWLVKE2Vf1e0JSh9CjHQR9SIzo0x
         dIw1lTyesCUKED/kPmw7xBD54q35SAIO0PGEuUWESduc18u4+VPZNWBKVYryMmVnPRkt
         mQHrRoC5pr4jNy9b4Md25tVo5Yq5jAaZOSVdJHxWN2azJiWNvdEU8draZERY4AyiRox8
         hvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+lqRhrkooB1DRVf4+Ugj5CfxzFlazGWH1jNE3D3s2OI=;
        b=rGCx6IuW5a0vYHk4CO3++kAh0rhzElyjIPe56G64ZRstn07vmy9r/6ej/Bovnhn0wx
         Ogk7ha+2fJwwBWZYt+jNvH2jiFG1Na75d0jq4/ygUqpKhb1anD0zOIirVxP5X2IZmhzM
         rwcQ8ubBkpaptEiqmbhvewNyd1l+170AKvxQuZVzgpCdT3juJAGnSCh7TyKULiz2I+BP
         CiGnGJDG5jP31rE/DNdYW8FBCBrwLT3C7K2NIx9Ghv/ur5lW0YUCow2bd0YPsigpEG9L
         3+hitVTFfshFxIZCH8t88++zxbz/x433faHcKPiSx16wqTJYb+ehhj+tW/NfPNbIRvrq
         o9TA==
X-Gm-Message-State: AOAM5300Fimh2g+B22qH/uVLIEGm1rMes306EdDhuvXyBkrnCK1k984+
        vGO9jz8Tz1zo5/6+IUcslSoqNw==
X-Google-Smtp-Source: ABdhPJz0N3u0K3ODf2ENu2o1jEqFhMpLXF2rMl6y8dWXUQjJhWNHaKquJILWYcgj37lywdEaVbmcmw==
X-Received: by 2002:adf:df89:: with SMTP id z9mr3502651wrl.505.1641407662295;
        Wed, 05 Jan 2022 10:34:22 -0800 (PST)
Received: from localhost.localdomain ([81.178.195.252])
        by smtp.gmail.com with ESMTPSA id o1sm3272215wmc.38.2022.01.05.10.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 10:34:21 -0800 (PST)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     sumit.semwal@linaro.org, amit.pundir@linaro.org,
        john.stultz@linaro.org
Subject: [PATCH v2 4/7] arm64: dts: qcom: pmi8998: add rradc node
Date:   Wed,  5 Jan 2022 18:33:50 +0000
Message-Id: <20220105183353.2505744-5-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220105183353.2505744-1-caleb.connolly@linaro.org>
References: <20220105183353.2505744-1-caleb.connolly@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a DT node for the Round Robin ADC found in the PMI8998 PMIC.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmi8998.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
index 0fef5f113f05..da10668c361d 100644
--- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
@@ -18,6 +18,14 @@ pmi8998_gpio: gpios@c000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		pmi8998_rradc: rradc@4500 {
+			compatible = "qcom,pmi8998-rradc";
+			reg = <0x4500>;
+			#io-channel-cells = <1>;
+
+			status = "disabled";
+		};
 	};
 
 	pmi8998_lsid1: pmic@3 {
-- 
2.34.1

