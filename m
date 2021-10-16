Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA43F4301DD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 12:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240115AbhJPKWp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 06:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239718AbhJPKWo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 06:22:44 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A760C061570;
        Sat, 16 Oct 2021 03:20:36 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aferraris)
        with ESMTPSA id 991501F44913
From:   Arnaud Ferraris <arnaud.ferraris@collabora.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Martin Kepplinger <martink@posteo.de>,
        Heiko Stuebner <heiko@sntech.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lucas Stach <dev@lynxeye.de>, Angus Ainslie <angus@akkea.ca>,
        Guido Gunther <agx@sigxcpu.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Johan Jonker <jbx6244@gmail.com>,
        Eddie Cai <eddie.cai.linux@gmail.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Brian Norris <briannorris@chromium.org>,
        Dan Johansen <strit@manjaro.org>,
        Simon South <simon@simonsouth.net>,
        Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH 0/4] arm64: dts: add 'chassis-type' property
Date:   Sat, 16 Oct 2021 12:20:21 +0200
Message-Id: <20211016102025.23346-1-arnaud.ferraris@collabora.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

A new root node property named 'chassis-type' has recently been approved
added to the device tree specification[1]. This will allow userspace to
easily detect the device form factor on DT-based devices, and act
accordingly.

This patchset fills in this property for existing ARM64 consumer
devices (laptops, phones, tablets...).

[1] https://github.com/devicetree-org/devicetree-specification/blob/main/source/chapter3-devicenodes.rst#root-node

--
Arnaud Ferraris (4):
      arm64: dts: allwinner: add 'chassis-type' property
      arm64: dts: freescale: add 'chassis-type' property
      arm64: dts: qcom: add 'chassis-type' property
      arm64: dts: rockchip: add 'chassis-type' property

 arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts                 | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi               | 2 ++
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts                  | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts                  | 1 +
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi                     | 1 +
 arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts                  | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts                 | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi               | 2 ++
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts                  | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts                  | 1 +
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi                     | 1 +
 arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts                  | 1 +
 arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dts | 1 +
 arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts                  | 1 +
 arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts                        | 1 +
 arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts                        | 1 +
 arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts                  | 1 +
 arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts                  | 1 +
 arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts                  | 1 +
 arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts                  | 1 +
 arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts                 | 1 +
 arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts                 | 2 ++
 arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dts       | 1 +
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts                     | 2 ++
 arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts                   | 1 +
 arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dts       | 1 +
 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dts         | 1 +
 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts       | 1 +
 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dts     | 1 +
 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dts      | 1 +
 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dts     | 1 +
 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dts            | 1 +
 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dts          | 1 +
 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dts          | 1 +
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts                    | 1 +
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts                   | 1 +
 arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dts              | 1 +
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts                       | 1 +
 arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dts                       | 1 +
 arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts                  | 1 +
 arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts             | 1 +
 arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dts                 | 1 +
 arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dts        | 1 +
 arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dts        | 1 +
 arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dts       | 1 +
 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts          | 1 +
 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dts        | 1 +
 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dts          | 1 +
 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dts          | 1 +
 arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts                   | 1 +
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts                 | 1 +
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts                    | 1 +
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts                  | 1 +
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts                  | 1 +
 arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts          | 1 +
 arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts           | 1 +
 arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts             | 1 +
 arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dts        | 1 +
 arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dts        | 1 +
 arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dts            | 1 +
 arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dts            | 1 +
 arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dts                       | 1 +
 arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts                     | 1 +
 arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet.dtsi                  | 1 +
 arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts                  | 1 +
 59 files changed, 62 insertions(+)


