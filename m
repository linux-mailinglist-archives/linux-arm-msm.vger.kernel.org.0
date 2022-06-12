Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 273F3547CE1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jun 2022 00:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238062AbiFLW7e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Jun 2022 18:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238000AbiFLW64 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Jun 2022 18:58:56 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C62BD3A71B;
        Sun, 12 Jun 2022 15:58:52 -0700 (PDT)
Received: from p57b77a67.dip0.t-ipconnect.de ([87.183.122.103] helo=phil.fritz.box)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1o0WXZ-0004F4-F7; Mon, 13 Jun 2022 00:58:41 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     devicetree@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Heiko Stuebner <heiko@sntech.de>, Nishanth Menon <nm@ti.com>,
        Ray Jui <rjui@broadcom.com>,
        Fabio Estevam <festevam@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>, linux-imx@nxp.com,
        Scott Branden <sbranden@broadcom.com>, kernel@pengutronix.de,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rockchip@lists.infradead.org,
        Tero Kristo <kristo@kernel.org>, linux-arm-msm@vger.kernel.org,
        Wei Xu <xuwei5@hisilicon.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: (subset) [PATCH 0/6] arm64: dts: Add missing space around properties
Date:   Mon, 13 Jun 2022 00:58:37 +0200
Message-Id: <165507470068.2008466.15707795117164470550.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220612223201.2740248-1-niklas.soderlund+renesas@ragnatech.se>
References: <20220612223201.2740248-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 13 Jun 2022 00:31:55 +0200, Niklas Söderlund wrote:
> While debugging an issue on a Renesas board I found a typo with missing
> spaces around properties that had been copied around [1]. This extends
> this fix for all arm64 files.
> 
> 1. https://lore.kernel.org/linux-renesas-soc/20220608175728.1012550-1-niklas.soderlund+renesas@ragnatech.se/
> 
> Niklas Söderlund (6):
>   arm64: dts: broadcom: Add missing space around status property
>   arm64: dts: rockchip: Add missing space around regulator-name property
>   arm64: dts: freescale: Add missing space around properties
>   arm64: dts: hisilicon: Add missing space around properties
>   arm64: dts: qcom: Add missing space around properties
>   arm64: dts: ti: Add missing space around properties
> 
> [...]

Applied, thanks!

[2/6] arm64: dts: rockchip: Add missing space around regulator-name property
      commit: d040e81bec407057b6dea9dadfe5e15b9845b010

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
