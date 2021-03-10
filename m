Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 070E4333524
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 06:26:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232344AbhCJF0P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 00:26:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232239AbhCJFZn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 00:25:43 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD410C061763
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Mar 2021 21:25:43 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id kr3-20020a17090b4903b02900c096fc01deso6832884pjb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Mar 2021 21:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GVkcidVr+dQRgdeYwXPMC77EhnCPIwmcpaqf5tpCWzk=;
        b=LqDaiMgDgkwNzNyIeZZmwTTGVXbbH5JaioyrYI/naE53D3WpY6nmbab8SzY4dq4uPp
         b5IQlKv3apOMbwrUxEFs6G3m1MrYfvz00XcuWlnHyTaLlcLqfUKW80aZ3/Kn8gzyU9cr
         7GnbIi5Kp2E4QFnPdpJCF1LcVyEWsuTFcAQGr3S/BkkqH8KTbX0ScYLe14JcsfmE+4JU
         3g34fxCIiQiW+AinOXiDvsm6LpBIT9RTcIDCRL5W0wjw2KNl8f6B4cczyhKLu7mjT/4N
         MLGps+LYImgxbX0xraB2bKiQ7hJ4Ygp7Kal9HjC3cZJTxnTLj/oj6rKQOkarmNV+PFzz
         n/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GVkcidVr+dQRgdeYwXPMC77EhnCPIwmcpaqf5tpCWzk=;
        b=Hio5ix3G5Wfa7njhi4zk4pqPde96JnvqXa7opCKGpw4tWWZX5DCi/XA9GrRwdLOTS1
         ciuYdaoHpSgeGqYb2R7hsybwyliPYlBTOvZa+F1ysBOsMnVGFqT3qZ02LGged3tXEYUB
         9xP6SiMHg9a9oI1vBVARGzw3XcfrbyrwQQV+mNg6sLDr8U2d9+/5S8luDmvek4qTwI0c
         IdWjwezvrJa9vMZRmFMUSPJXhgLdHp8hg/3o7VotCT1d8C8w9TEETfx0CJWd5m43XRPh
         i04UaoJk/TSVdB4HUYfcqy+K3r+G3T7QQ3rOR8eN2A2ura3biu8tmuArXXKX3Ey43tJ9
         mY7A==
X-Gm-Message-State: AOAM532MKwCk85ml38UZ8Lq6oOjDQU+zNQqB1pdQJdDKW+30niSsxD4B
        h5FYVchA+3KXEgtzxa3I2yBCqAiIEHmHv/WzeIg=
X-Google-Smtp-Source: ABdhPJxn4p8YhJigLSPvS6brmz6OvH+OGNaXEqaBdO7Q+jiGGtTl9R1ad5aaz8S2St3RBL/WvDK4+Q==
X-Received: by 2002:a17:90b:2304:: with SMTP id mt4mr1777287pjb.179.1615353943198;
        Tue, 09 Mar 2021 21:25:43 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:9f4:a436:21bd:7573:25c0:73a0])
        by smtp.gmail.com with ESMTPSA id g7sm13915224pgb.10.2021.03.09.21.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 21:25:42 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com
Subject: [PATCH 3/8] arm64/dts: qcom: sdm845: Use RPMH_CE_CLK macro directly
Date:   Wed, 10 Mar 2021 10:54:58 +0530
Message-Id: <20210310052503.3618486-4-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310052503.3618486-1-bhupesh.sharma@linaro.org>
References: <20210310052503.3618486-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In commit 3e482859f1ef ("dts: qcom: sdm845: Add dt entries
to support crypto engine."), we decided to use the value indicated
by constant RPMH_CE_CLK rather than using it directly.

Now that the same RPMH clock value will also be used for other
SoCs (in addition to sdm845), let's use the constant
RPMH_CE_CLK to make sure that this dtsi is compatible with the
other qcom ones.

Cc: Thara Gopinath <thara.gopinath@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: David S. Miller <davem@davemloft.net>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: bhupesh.linux@gmail.com
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 454f794af547..54ba95dcb35a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2304,7 +2304,7 @@ cryptobam: dma@1dc4000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0 0x01dc4000 0 0x24000>;
 			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rpmhcc 15>;
+			clocks = <&rpmhcc RPMH_CE_CLK>;
 			clock-names = "bam_clk";
 			#dma-cells = <1>;
 			qcom,ee = <0>;
@@ -2320,7 +2320,7 @@ crypto: crypto@1dfa000 {
 			reg = <0 0x01dfa000 0 0x6000>;
 			clocks = <&gcc GCC_CE1_AHB_CLK>,
 				 <&gcc GCC_CE1_AHB_CLK>,
-				 <&rpmhcc 15>;
+				 <&rpmhcc RPMH_CE_CLK>;
 			clock-names = "iface", "bus", "core";
 			dmas = <&cryptobam 6>, <&cryptobam 7>;
 			dma-names = "rx", "tx";
-- 
2.29.2

