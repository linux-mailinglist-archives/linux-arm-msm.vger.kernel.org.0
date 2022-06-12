Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0F81547CC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jun 2022 00:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237269AbiFLWdK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Jun 2022 18:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237129AbiFLWdH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Jun 2022 18:33:07 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB2D114D36
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jun 2022 15:33:05 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id bg6so7934064ejb.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jun 2022 15:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GLJQeEH3p5fiLEdDryGdSBZutsbru9ZsnpEkB8AS6xk=;
        b=ACM313W/AffvNt+bytbIN21PiIxxWyv7QLe842MBuX/acrhynlILn5Mc1sjNaEsVcH
         uDQz//0wYgHcZZo2KJ4a7d5OFTpkuI3iJhv8R90LNT47Bd07Anqxx753OE2icYM3Ikaz
         V4Il7uezteXLTrAG0TDuThbaEjDRLnydMiid7CRhUUbFJXciiestl4/ZyZrNivqvHq34
         8EmCaV9LJCpDii68hBDpeB1JPRsX1AwSZkk2nH05XGVQzTZyeyjwn/DwkMwk6dzYbx6n
         AzYNFlf361RiKxVqGoHhkZHIrduZ67nxwtYZHQtCdaaZFmA3s7NOQhzPkDZgz8jIvnyf
         aiKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GLJQeEH3p5fiLEdDryGdSBZutsbru9ZsnpEkB8AS6xk=;
        b=4bcpo01yK3/yfPL9XUJgB82Gz0dtFZw+zuaF77O4Jirpj5KSE5X180yXZCWa+v0Trb
         HR63pq31U6mVvz1+s4pf7tKavAgBTKt+fq+VWP3L9UkPIL13J73L9Rm95AfseDJsjCGT
         LIpAxpvfTWXhoGqROmCtEUWvAMda2ej5htCAEIRzy1gFH1zYPOBuQ/5QQdB5zBqYNjdB
         PjlKnFHRyuneJqsn8LPuI/Xw6odL8jDvwpH8/TSCblxKTMulXEtr0xkOAwRUdV5CiSpf
         3/dIp1YpN4D2YH9dqK2p8xWz9V8K/H6p+4T/O7rFRmU8fo8TgFFfNUlKC9zCNdWIjBbt
         UXnQ==
X-Gm-Message-State: AOAM5321EP8FcUj70IrgWFWIXwT1IQ4/1j4MpTSPegSs6pNduBmE0DRP
        psndZWbqDS+l1LIvoDrYP92vIg==
X-Google-Smtp-Source: ABdhPJwUqJaNwWQdvBdBwV2ZDKqaf2kjTt7sfxVF4lZSmguLeVk+4kYZBzm05N4NuXuwtQe8yofPWA==
X-Received: by 2002:a17:907:8a17:b0:711:e3fe:7767 with SMTP id sc23-20020a1709078a1700b00711e3fe7767mr24623468ejc.380.1655073184059;
        Sun, 12 Jun 2022 15:33:04 -0700 (PDT)
Received: from bismarck.berto.se (p4fca22cf.dip0.t-ipconnect.de. [79.202.34.207])
        by smtp.googlemail.com with ESMTPSA id e3-20020a056402104300b0042b5cf75d6esm3766559edu.97.2022.06.12.15.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 15:33:03 -0700 (PDT)
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
Subject: [PATCH 1/6] arm64: dts: broadcom: Add missing space around status property
Date:   Mon, 13 Jun 2022 00:31:56 +0200
Message-Id: <20220612223201.2740248-2-niklas.soderlund+renesas@ragnatech.se>
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

Add the missing space around the status property before the typo spreads
to other files.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
index 09d4aa8ae1d6ee89..8f8c25e51194de83 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
@@ -567,7 +567,7 @@ enet: ethernet@340000{
 			reg-names = "amac_base";
 			dma-coherent;
 			interrupts = <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>;
-			status= "disabled";
+			status = "disabled";
 		};
 
 		nand: nand@360000 {
-- 
2.36.1

