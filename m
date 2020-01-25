Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24CA01494E7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2020 11:48:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730276AbgAYKq1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Jan 2020 05:46:27 -0500
Received: from onstation.org ([52.200.56.107]:46808 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729190AbgAYKq0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Jan 2020 05:46:26 -0500
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id C7F323EA42;
        Sat, 25 Jan 2020 10:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1579949186;
        bh=20OLpT9AQImoBtwxHWnQUH6B+FTQGj1F0WZXTR5Jw4U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K3SyMX5cFR0sr1VBUvV0khHYzaXHHW/So/Kx2ccr2Yv2fYzu7jfEfFzybpz850Oov
         N5vmlOnIY3GOaFALeSK5M2fqmHFVBybX8GzsQhb5lsaQiq5c/jSRoAH0xGLFwEABuN
         3ktfx6GbKoZhHN46ngr80N0fqG38WVmUDdSV49Ko=
Date:   Sat, 25 Jan 2020 05:46:25 -0500
From:   Brian Masney <masneyb@onstation.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: qcom_defconfig: Enable QRTR
Message-ID: <20200125104625.GB5646@onstation.org>
References: <20191104210943.101393-1-luca@z3ntu.xyz>
 <20191104210943.101393-2-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104210943.101393-2-luca@z3ntu.xyz>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Luca,

On Mon, Nov 04, 2019 at 10:09:41PM +0100, Luca Weiss wrote:
> This option is useful on msm8974, so enable it.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm/configs/qcom_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
> index 94d5e1a8c61a..a71201fdc8c9 100644
> --- a/arch/arm/configs/qcom_defconfig
> +++ b/arch/arm/configs/qcom_defconfig
> @@ -45,6 +45,8 @@ CONFIG_IP_ROUTE_VERBOSE=y
>  CONFIG_IP_PNP=y
>  CONFIG_IP_PNP_DHCP=y
>  # CONFIG_IPV6 is not set
> +CONFIG_QRTR=y
> +CONFIG_QRTR_SMD=y

Both of these should be modules. I verified on the Nexus 5 that booting
the modem works in this configuration.

Thanks for your work on the modem!

Brian

>  CONFIG_CFG80211=m
>  CONFIG_MAC80211=m
>  CONFIG_RFKILL=y
> -- 
> 2.23.0
> 
