Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44C16547CCA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jun 2022 00:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232864AbiFLWd2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Jun 2022 18:33:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236954AbiFLWdH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Jun 2022 18:33:07 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8433A18349
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jun 2022 15:33:06 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id c2so4989634edf.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jun 2022 15:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xeg/CWXwufYPnO1IckeUmIQXWPBQszQhORbMRh6VifA=;
        b=KwrtxY1NJNAILAPprQdH3rFVhSDcxpKKwcAsg8Cp7Btk14fkExFnpLdSq5jk5tTs2s
         jqXC/XlpNARQngm3Ip3/okxHNcilpsl5B+WFX5E/ZEpM7zP6gyT+AiyuGI0zBEmrMOYz
         D0+6i4eVwfEJiQftCrSCVbBcACLrNWCmv34fEcvmnIhrTr69cQ+RgPDoLKTDr+5w5Mwo
         c5Cqu0Rod9ppE0Ed5ro3lUauRhKV24f3PAGXH29lOzCiCOYqq3RDQFnLznAuaEPltojY
         yRM/y2gE99DQBN9MKlgY6siSDuAERB7rbAMYnkhdWYk539+2U/JROVbeP1sxxlxdEZ5Z
         EE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xeg/CWXwufYPnO1IckeUmIQXWPBQszQhORbMRh6VifA=;
        b=GOCqaLnlozNNA7HXBYHCGMO2Do/4QOFAn+uQfMRwz+qFE4B7NgW0mfDlK/0twvig2C
         zB4A60LNRvNOxWtjO6ARgEAeoTXAEqPfd4798TiAD96J+dybnVd+2pjZdbWVFmuFBmOb
         i84tKXXDeYxn5X9fDhuAPCnzEm0hph/jLrasxYdG7wwV07tcjydB5GnYplqSWjgKdU6c
         8gSmIcj+hoXqb0CKz4wrO2GtpxVj0f0M4JUENv4s5Tvo3SrxrKPAOCEV1Tp3sEEZYg88
         CNthCT3oTo2nJ8CxRvi3nufw5jRbY9tBhtFjHA8u/9Qs4wX97BTBaRCQP9qyeedHKFya
         /vzQ==
X-Gm-Message-State: AOAM53062muVXcZa/+mzg4IreL769ZymMcJ6UPHugCHKiCyJDJe/pwIf
        V6sbHzXqJDMPiBlbwt1klSxcmQ==
X-Google-Smtp-Source: ABdhPJy+r195FGwpnbyCJKtxjKGCF41VWNK3g3mt45H1DfBq0VVEB6nAkM+V/VyB6N7MmwJfP7cg8g==
X-Received: by 2002:a05:6402:25c3:b0:434:dfbd:913e with SMTP id x3-20020a05640225c300b00434dfbd913emr6801233edb.27.1655073185154;
        Sun, 12 Jun 2022 15:33:05 -0700 (PDT)
Received: from bismarck.berto.se (p4fca22cf.dip0.t-ipconnect.de. [79.202.34.207])
        by smtp.googlemail.com with ESMTPSA id e3-20020a056402104300b0042b5cf75d6esm3766559edu.97.2022.06.12.15.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 15:33:04 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Wei Xu <xuwei5@hisilicon.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/6] arm64: dts: rockchip: Add missing space around regulator-name property
Date:   Mon, 13 Jun 2022 00:31:57 +0200
Message-Id: <20220612223201.2740248-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220612223201.2740248-1-niklas.soderlund+renesas@ragnatech.se>
References: <20220612223201.2740248-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the missing space around the regulator-name property before the typo
spreads to other files.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts b/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts
index 3ebe15e03cf4dea5..05c50e584e2e62d9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts
@@ -134,7 +134,7 @@ vcc_sys: vcc-sys-regulator {
 
 	vccio_sd: vcc-io-sd-regulator {
 		compatible = "regulator-fixed";
-		regulator-name= "vccio_sd";
+		regulator-name = "vccio_sd";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
-- 
2.36.1

