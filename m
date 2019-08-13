Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6ADE88ABEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2019 02:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbfHMAWe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Aug 2019 20:22:34 -0400
Received: from onstation.org ([52.200.56.107]:33548 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726500AbfHMAWe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Aug 2019 20:22:34 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 9E0EE3E95F;
        Tue, 13 Aug 2019 00:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1565655753;
        bh=sb0WR/Lam+MQeGrs+dKxlciD9ML3MyK8geyLpKKaC1Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VW81jMPwL4Fy7OcT/tg3E7kK7C8W1WdYNvi0AaKyHGxJ+iY8b52lc48Q85E60r67/
         I+VadjPwDyGglbpklKzAZxirfF8ixd0F4j+ox+kwdTRF1XEBU83/Q2L6U8rbtGThQr
         MpJGf3QslLSm2OfKEFNFg+Ph2o+EUt6NXJBRGIYY=
Date:   Mon, 12 Aug 2019 20:22:32 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>,
        linux-arm-kernel@lists.infradead.org,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/7] drm/msm/mdp4: Drop unused GPIO include
Message-ID: <20190813002232.GA7391@onstation.org>
References: <20190629125933.679-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190629125933.679-1-linus.walleij@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jun 29, 2019 at 02:59:27PM +0200, Linus Walleij wrote:
> This file is not using any symbols from <linux/gpio.h> so just
> drop this include.
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

For the series:

Reviewed-by: Brian Masney <masneyb@onstation.org>
