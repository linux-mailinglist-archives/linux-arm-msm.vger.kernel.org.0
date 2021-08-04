Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 479003E02E2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Aug 2021 16:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238662AbhHDOOX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Aug 2021 10:14:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:37558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238560AbhHDOOX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Aug 2021 10:14:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9CCE660E09;
        Wed,  4 Aug 2021 14:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628086450;
        bh=xAqC6seky5MiIrVf7pJwzmv1dqVzP/V4Nv7xWuyRHB0=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=ghq+e625BvgkjatsRssojXchEuhgeMuvrUq37qEwhhgio0zsNx0roQhLaYk41ZEn1
         O13QzEBgtUMricL5Tn7KHCYWBTFCOkkvpJ4uyqkhSbNeyqISCFg//l70bsts1HxNRn
         Zk+2+HspS8u02ZBM3OrcqGLsCU0MBhouuRgkLpPJKAGtjsMR7BFgB9D77Hp7Zwbhr2
         G1PvAX5Q4Pw806/Ywb3cebwZFHREOIa6Ll3A/5bh1H18goioAmMLfcWQMN7zLwkC+p
         5lhGVgS+hmVLQ+Dapm1Nx2HZlemdb3YbyJz/sHUQrh9lKIfHC0+K10ZEnJL8ByiiQt
         75sE4nvlqg1BA==
References: <3d86f45004fe2fcbae0a2cd197df81a1fd076a1e.1628085910.git.baruch@tkos.co.il>
 <0e99e3d453547ad2a8f4541090a03f3c80b80332.1628085910.git.baruch@tkos.co.il>
User-agent: mu4e 1.6.1; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/6] usb: dwc3: reference clock period configuration
Date:   Wed, 04 Aug 2021 17:11:58 +0300
In-reply-to: <0e99e3d453547ad2a8f4541090a03f3c80b80332.1628085910.git.baruch@tkos.co.il>
Message-ID: <87lf5h5mc2.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi,

Baruch Siach <baruch@tkos.co.il> writes:
> @@ -1371,6 +1398,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>  				    &dwc->hsphy_interface);
>  	device_property_read_u32(dev, "snps,quirk-frame-length-adjustment",
>  				 &dwc->fladj);
> +	device_property_read_u32(dev, "snps,ref-clock-period",
> +				 &dwc->ref_clk_per);

I wonder if it would make more sense to pass an actual clock reference
here. If valid, then reconfigure the period to the value returned by
clk_get_rate(). It would avoid yet another DT binding. If we make the
clock optional, then we won't affect any other platforms. The clock
itself could be a regular fixed clock node.

-- 
balbi
