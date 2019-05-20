Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4350229F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2019 04:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730059AbfETCeM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 May 2019 22:34:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:37904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726102AbfETCeM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 May 2019 22:34:12 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EA50020675;
        Mon, 20 May 2019 02:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558319651;
        bh=ju+3KOQugsflVCr4eHF7IRJuhvpcf8WSl+CMXgavYLk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jrxS4/h37zf79nS70kW2xHZzvBgXySi9WZikYoXk80RNIoziudZdyfx/IjHE5rdh8
         gPP8eToB0AJRjIWv8lMM11zSIudBpnl+JPymfn5JO0IPs4XYvm4T0bzuiHqnh/cupF
         gzLEMHOGoRvwpzposYs8pRBMqAppE1wBNQy49+Aw=
Date:   Mon, 20 May 2019 10:33:16 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Leo Yan <leo.yan@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mike Leach <mike.leach@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Chris Healy <cphealy@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 02/11] ARM: dts: imx7s: Update coresight DT bindings
Message-ID: <20190520023315.GI15856@dragon>
References: <20190508021902.10358-1-leo.yan@linaro.org>
 <20190508021902.10358-3-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190508021902.10358-3-leo.yan@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 08, 2019 at 10:18:53AM +0800, Leo Yan wrote:
> CoreSight DT bindings have been updated, thus the old compatible strings
> are obsolete and the drivers will report warning if DTS uses these
> obsolete strings.
> 
> This patch switches to the new bindings for CoreSight dynamic funnel and
> static replicator, so can dismiss warning during initialisation.
> 
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

Applied, thanks.
