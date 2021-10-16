Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9688A430273
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 13:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234297AbhJPLfw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 07:35:52 -0400
Received: from honk.sigxcpu.org ([24.134.29.49]:50430 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234872AbhJPLfu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 07:35:50 -0400
X-Greylist: delayed 553 seconds by postgrey-1.27 at vger.kernel.org; Sat, 16 Oct 2021 07:35:50 EDT
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 8B1DCFB03;
        Sat, 16 Oct 2021 13:24:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id QhldK_UIkFkN; Sat, 16 Oct 2021 13:24:24 +0200 (CEST)
Date:   Sat, 16 Oct 2021 13:24:22 +0200
From:   Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To:     Arnaud Ferraris <arnaud.ferraris@collabora.com>
Cc:     linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Martin Kepplinger <martink@posteo.de>,
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
        Tomasz Figa <tfiga@chromium.org>,
        Johan Jonker <jbx6244@gmail.com>,
        Eddie Cai <eddie.cai.linux@gmail.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Brian Norris <briannorris@chromium.org>,
        Dan Johansen <strit@manjaro.org>,
        Simon South <simon@simonsouth.net>,
        Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH 2/4] arm64: dts: freescale: add 'chassis-type' property
Message-ID: <YWq2ZvHSFq6obOgV@qwark.sigxcpu.org>
References: <20211016102025.23346-1-arnaud.ferraris@collabora.com>
 <20211016102025.23346-3-arnaud.ferraris@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211016102025.23346-3-arnaud.ferraris@collabora.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,
On Sat, Oct 16, 2021 at 12:20:23PM +0200, Arnaud Ferraris wrote:
> A new 'chassis-type' root node property has recently been approved for
> the device-tree specification, in order to provide a simple way for
> userspace to detect the device form factor and adjust their behavior
> accordingly.
> 
> This patch fills in this property for end-user devices (such as laptops,
> smartphones and tablets) based on NXP ARM64 processors.
> 
> Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi    | 1 +
>  arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> index 3f7524400a63..4523f21bb5ac 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> @@ -14,6 +14,7 @@
>  / {
>  	model = "Purism Librem 5";
>  	compatible = "purism,librem5", "fsl,imx8mq";
> +	chassis-type = "handset";
>  
>  	backlight_dsi: backlight-dsi {
>  		compatible = "led-backlight";
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts b/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
> index 4f2db6197b39..fa721a13de20 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
> @@ -12,6 +12,7 @@
>  / {
>  	model = "MNT Reform 2";
>  	compatible = "mntre,reform2", "boundary,imx8mq-nitrogen8m-som", "fsl,imx8mq";
> +	chassis-type = "laptop";
>  
>  	pcie1_refclk: clock-pcie1-refclk {
>  		compatible = "fixed-clock";

Reviewed-by: Guido Günther <agx@sigxcpu.org>

> -- 
> 2.33.0
> 
