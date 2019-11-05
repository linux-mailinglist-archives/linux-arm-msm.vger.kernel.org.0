Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8245F040E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 18:27:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730959AbfKER13 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 12:27:29 -0500
Received: from smtp2.axis.com ([195.60.68.18]:60119 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730895AbfKER13 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 12:27:29 -0500
X-Greylist: delayed 429 seconds by postgrey-1.27 at vger.kernel.org; Tue, 05 Nov 2019 12:27:27 EST
IronPort-SDR: F0oPtGUTmrMxkUzDVCVrZr5h34rmDSMXw6pi1MHjjcupDP4CkTU2+3tJPGZLl1JJ9ecwhWzveC
 BMO1xkLjJFp7T9CrU0hOck0ednRvpCS/YQLSbKjG02276SPboa0R9WDfKlw+Un695jXNFs1G9R
 OfjS9zAmL5jq0NsQ9DXJKTbZEvCCSDrYYgSBpo05VOTnMdSOOudHPefQXhoi3eHQTMokOu0jFq
 iKUOA5UCo7bRocKaqM9vOD9Ki8G6gvd5csLagUmJkRxI52GPyu3J7dZX/qods0VdOqA/L2Vapy
 o9E=
X-IronPort-AV: E=Sophos;i="5.68,271,1569276000"; 
   d="scan'208";a="2106277"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Date:   Tue, 5 Nov 2019 18:20:16 +0100
From:   Jesper Nilsson <jesper.nilsson@axis.com>
To:     Andrew Murray <andrew.murray@arm.com>
Cc:     Tsahee Zidenberg <tsahee@annapurnalabs.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jesper Nilsson <jespern@axis.com>,
        Lars Persson <larper@axis.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@axis.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 3/7] arm: dts: Use IRQ flags for legacy PCI IRQ
 interrupts
Message-ID: <20191105172016.iq4mx7qa4c5sregk@axis.com>
References: <20191104163834.8932-1-andrew.murray@arm.com>
 <20191104163834.8932-4-andrew.murray@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104163834.8932-4-andrew.murray@arm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 04, 2019 at 04:38:17PM +0000, Andrew Murray wrote:
> Replace magic numbers used to describe legacy PCI IRQ interrupts
> with #define.

Looks good,

Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>

> Signed-off-by: Andrew Murray <andrew.murray@arm.com>
> ---
>  arch/arm/boot/dts/alpine.dtsi              |  6 ++--
>  arch/arm/boot/dts/artpec6.dtsi             | 10 +++---
>  arch/arm/boot/dts/gemini-dlink-dir-685.dts | 34 ++++++++++----------
>  arch/arm/boot/dts/gemini-sl93512r.dts      | 34 ++++++++++----------
>  arch/arm/boot/dts/gemini-sq201.dts         | 34 ++++++++++----------
>  arch/arm/boot/dts/gemini-wbd111.dts        | 34 ++++++++++----------
>  arch/arm/boot/dts/gemini-wbd222.dts        | 34 ++++++++++----------
>  arch/arm/boot/dts/imx6qdl.dtsi             | 10 +++---
>  arch/arm/boot/dts/imx6sx.dtsi              | 10 +++---
>  arch/arm/boot/dts/integratorap.dts         | 36 ++++++++++++----------
>  arch/arm/boot/dts/keystone-k2e.dtsi        | 11 ++++---
>  arch/arm/boot/dts/keystone.dtsi            | 10 +++---
>  arch/arm/boot/dts/qcom-apq8064.dtsi        | 10 +++---
>  arch/arm/boot/dts/qcom-ipq4019.dtsi        | 10 +++---
>  arch/arm/boot/dts/versatile-pb.dts         | 36 ++++++++++++----------
>  15 files changed, 162 insertions(+), 157 deletions(-)

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
