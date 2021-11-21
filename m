Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21D95458178
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Nov 2021 03:21:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232500AbhKUCYM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 21:24:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:38692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231827AbhKUCYM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 21:24:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69B466008E;
        Sun, 21 Nov 2021 02:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637461266;
        bh=UCzrbM2fD+0HR8OTJ7bvKM6jrnWGIk1QV2RUx+6+AcA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FfnIEeglJ9iE1+Wx5hFdSxZpOkvthyDqWEDkBw4C1Vd6ZtaZf+8fR4cr43d08z7dA
         qcRRdvOY8CW8F17K4HbW6cJjr16Txh7jeyBnYADlO1yuTRhW0R/weewwrnJ68hFKG7
         jPeEveZVC6QAPjyRgxVmvfgUyx1q35NqXxgHciXYmvpu9L06qqEQ+XoDO8oJihks9W
         +8rtWRYyyz7ni5kVSl8g1CbBxxaN8lGlCMnJaZ+z3kikfg30k036wL3o35OFuP6WK0
         /65KBwUqpvJcx5cC5FCxVyLAhw3OHPbBdaFRj+Gn+30cLlYG2Ln2ElZ3A8vAAvechV
         IWP+EDosvx0XA==
Date:   Sun, 21 Nov 2021 10:20:57 +0800
From:   Shawn Guo <shawnguo@kernel.org>
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
Subject: Re: [PATCH 2/4] arm64: dts: freescale: add 'chassis-type' property
Message-ID: <20211121022056.GD31998@dragon>
References: <20211016102025.23346-1-arnaud.ferraris@collabora.com>
 <20211016102025.23346-3-arnaud.ferraris@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211016102025.23346-3-arnaud.ferraris@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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

Applied, thanks.
