Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3DB84304D3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 21:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241564AbhJPTua (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 15:50:30 -0400
Received: from gloria.sntech.de ([185.11.138.130]:47178 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234499AbhJPTua (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 15:50:30 -0400
Received: from p508fce7c.dip0.t-ipconnect.de ([80.143.206.124] helo=phil.fritz.box)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1mbpes-0008HL-7N; Sat, 16 Oct 2021 21:47:54 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Arnaud Ferraris <arnaud.ferraris@collabora.com>,
        linux-kernel@vger.kernel.org
Cc:     Heiko Stuebner <heiko@sntech.de>, Johan Jonker <jbx6244@gmail.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andy Gross <agross@kernel.org>,
        Guido Gunther <agx@sigxcpu.org>, Chen-Yu Tsai <wens@csie.org>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Dan Johansen <strit@manjaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-sunxi@lists.linux.dev,
        Lucas Stach <dev@lynxeye.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Brian Norris <briannorris@chromium.org>,
        Maxime Ripard <mripard@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Matthias Brugger <mbrugger@suse.com>,
        Angus Ainslie <angus@akkea.ca>,
        Martin Kepplinger <martink@posteo.de>,
        Shawn Guo <shawnguo@kernel.org>, linux-arm-msm@vger.kernel.org,
        Simon South <simon@simonsouth.net>,
        Eddie Cai <eddie.cai.linux@gmail.com>
Subject: Re: (subset) [PATCH 0/4] arm64: dts: add 'chassis-type' property
Date:   Sat, 16 Oct 2021 21:47:49 +0200
Message-Id: <163441361289.438137.290850544419428228.b4-ty@sntech.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211016102025.23346-1-arnaud.ferraris@collabora.com>
References: <20211016102025.23346-1-arnaud.ferraris@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 16 Oct 2021 12:20:21 +0200, Arnaud Ferraris wrote:
> A new root node property named 'chassis-type' has recently been approved
> added to the device tree specification[1]. This will allow userspace to
> easily detect the device form factor on DT-based devices, and act
> accordingly.
> 
> This patchset fills in this property for existing ARM64 consumer
> devices (laptops, phones, tablets...).
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: rockchip: add 'chassis-type' property
      commit: 263b39bce2fbcd3531163300cb9663a4a9517dde

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
