Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E331663D814
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 15:30:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbiK3OaS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 09:30:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbiK3OaP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 09:30:15 -0500
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D0EC52888;
        Wed, 30 Nov 2022 06:30:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669817506; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=MBcgFbrxBMjCUsYG5JPRrKKOle/H+6CLvHLsKhUx7pGZLSo7InNJY1XoZh2orec8LiN/fuMmkzcItQOuWc/Oggq4K+ooy2GsQTgCZopz0ITgJ7F4AJjYcXkOgFtZGIDyF/Tn6FBiWEp7A4+dyD+Hdg3v0fIBLNLvbvcpb9fPBq8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1669817506; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=QF5pLbXUIUVP28HpDZnKqlToc38teR4R32c+jesH+QM=; 
        b=TUNQ8cHrgqns0eHBc3DfXD+rwLkdzqPFztq0Ens1q4Zt1GNyinG8t3QVugkQj7nYzeGT5iZRg3ZGY9NBCMcqf6mfCOBhZ5qZhBxo3uw9/X9o3OXvbuXEXBncGS8d0munLxduoEP5BKia9DYBqh3wBR+nZ9st98uToRtnBgFSTSY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=arinc9.com;
        spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
        dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669817506;
        s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
        h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
        bh=QF5pLbXUIUVP28HpDZnKqlToc38teR4R32c+jesH+QM=;
        b=HfKAf4+Fel3coxytPwxCdcvr10bO6It6KMz9XQGSx8zBhVPLMBNwvphkDbv4PRBH
        46P1LoZCIUxZawUHkV429aO6CGMJEcZ9QLB02hIwx4g/Dp5bRfd5jX7+E5Rxcd0iWFW
        XVs2bsC3ntk6QlmzoL111TFrzu1K8SiYvYhUQudo=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
        with SMTPS id 1669817503309623.081549759161; Wed, 30 Nov 2022 06:11:43 -0800 (PST)
From:   =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To:     Vladimir Oltean <vladimir.oltean@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        soc@kernel.org, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Stefan Agner <stefan@agner.ch>,
        Heiko Stuebner <heiko@sntech.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Tim Harvey <tharvey@gateworks.com>,
        Peng Fan <peng.fan@nxp.com>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        Frank Wunderlich <frank-w@public-files.de>,
        Michael Riesch <michael.riesch@wolfvision.net>,
        Oleksij Rempel <linux@rempel-privat.de>
Cc:     netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/5] remove label = "cpu" from DSA dt-binding
Date:   Wed, 30 Nov 2022 17:10:35 +0300
Message-Id: <20221130141040.32447-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello folks,

With this patch series, we're completely getting rid of 'label = "cpu";'
which is not used by the DSA dt-binding at all.

Information for taking the patches for maintainers:
Patch 1: netdev maintainers (based off netdev/net-next.git main)
Patch 2-3: SoC maintainers (based off soc/soc.git soc/dt)
Patch 4: MIPS maintainers (based off mips/linux.git mips-next)
Patch 5: PowerPC maintainers (based off powerpc/linux.git next-test)

I've been meaning to submit this for a few months. Find the relevant
conversation here:
https://lore.kernel.org/netdev/20220913155408.GA3802998-robh@kernel.org/

Here's how I did it, for the interested (or suggestions):

Find the platforms which have got 'label = "cpu";' defined.
grep -rnw . -e 'label = "cpu";'

Remove the line where 'label = "cpu";' is included.
sed -i /'label = "cpu";'/,+d arch/arm/boot/dts/*
sed -i /'label = "cpu";'/,+d arch/arm64/boot/dts/freescale/*
sed -i /'label = "cpu";'/,+d arch/arm64/boot/dts/marvell/*
sed -i /'label = "cpu";'/,+d arch/arm64/boot/dts/mediatek/*
sed -i /'label = "cpu";'/,+d arch/arm64/boot/dts/rockchip/*
sed -i /'label = "cpu";'/,+d arch/mips/boot/dts/qca/*
sed -i /'label = "cpu";'/,+d arch/mips/boot/dts/ralink/*
sed -i /'label = "cpu";'/,+d arch/powerpc/boot/dts/turris1x.dts
sed -i /'label = "cpu";'/,+d Documentation/devicetree/bindings/net/qca,ar71xx.yaml

Restore the symlink files which typechange after running sed.

Arınç ÜNAL (5):
  dt-bindings: net: qca,ar71xx: remove label = "cpu" from examples
  arm: dts: remove label = "cpu" from DSA dt-binding
  arm64: dts: remove label = "cpu" from DSA dt-binding
  mips: dts: remove label = "cpu" from DSA dt-binding
  powerpc: dts: remove label = "cpu" from DSA dt-binding


