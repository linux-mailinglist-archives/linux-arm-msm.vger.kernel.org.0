Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B05DF15FCED
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2020 06:36:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgBOFgK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Feb 2020 00:36:10 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35753 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725822AbgBOFgK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Feb 2020 00:36:10 -0500
Received: by mail-pg1-f193.google.com with SMTP id v23so2721105pgk.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2020 21:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=umSLSqFdcTUcW15IlOni/Tuec1i7imfq7Q7J9RYYX4g=;
        b=cIxrqNRp65WCtK+fiYn9g3PVPZKXWCeUB0uFKNIzbK215QX3Al36Ke7lSPKliczQPG
         zRn7Bi6DqLKPjlqWNiNyIv1hfnOjroG9dJAo7zBVoxdcOscAu96nnIAHZ0M1KbXjm0Sl
         ZR04ZlFB/h9Rx1G6+2XpmHZ6qc00E2hKTf9RBjGMhvM/S7iYiuAY2TTttm/rFAuLs3bq
         Tl4EPCrQfsVTe0Oz0o9vN+XxWzhv+LiQ+CYz/xTgBuLMVClebtR7iuNxNAyHBtWlm0Wp
         bHYgpgS19tzczImghBSGzs7yS4YbFHy+7+42F6gNr1Xyalax7P6gX0gNY6JBKTkCYKiJ
         SqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=umSLSqFdcTUcW15IlOni/Tuec1i7imfq7Q7J9RYYX4g=;
        b=sa2nPj5D7s/ybrrDDrPwC+EfG5bwd3qUs54R1gZjEHlkZYMV7V2pgVPTMiievIy/H7
         3D8LiJYepnnAlKNWzpz5opS+NJB1UQupQSe9OoAULvE+FT2DzDnWB3T3DulbHJYwnWvJ
         VPY2+O/90tB6jgQ3LzwV8XKLiHHl2ftBAknwhmg8CrxN0rYlcUGrMXGUmujf2shPB9iR
         8KYD1SHYZde2h0BU9KUlP0sdP/m8/V7Bz2X4An3ISktcC4M5ZpZge4Iwicp/YWeKzGYL
         IuVGt4hEHSa92kMxKIbmIpMboICZB2QxxmOYFRTfgk4/f7XBpxfNsA8mPvIJhvoRODjp
         rhlA==
X-Gm-Message-State: APjAAAUYsNGgUGQJRtpCsgzZRAFD2zmN3uWlctoDQZiRz7LPqCS3D4ja
        Mg2xkJ70W6mZLbC9qAVFXi8tJQ==
X-Google-Smtp-Source: APXvYqzk4mzSWnD3eisseNOAoKEFSWYJ3iXu/MnMV3x1ieUnd9jyOy7C/UGmCSr9X/1fRkBJKg6m3w==
X-Received: by 2002:a62:6842:: with SMTP id d63mr6945184pfc.113.1581744969478;
        Fri, 14 Feb 2020 21:36:09 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q12sm8411743pfh.158.2020.02.14.21.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2020 21:36:08 -0800 (PST)
Date:   Fri, 14 Feb 2020 21:35:17 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
        Eric Anholt <eric@anholt.net>,
        Stefan Wahren <wahrenst@gmx.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Patrice Chotard <patrice.chotard@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Andy Gross <agross@kernel.org>, linux-gpio@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-oxnas@groups.io,
        linux-rockchip@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: Use new GPIO_LINE_DIRECTION
Message-ID: <20200215053517.GN955802@ripper>
References: <20191112141819.GA22076@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112141819.GA22076@localhost.localdomain>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 12 Nov 06:18 PST 2019, Matti Vaittinen wrote:
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 763da0be10d6..8844ca1261d5 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -485,8 +485,8 @@ static int msm_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
>  
>  	val = msm_readl_ctl(pctrl, g);
>  
> -	/* 0 = output, 1 = input */
> -	return val & BIT(g->oe_bit) ? 0 : 1;
> +	return val & BIT(g->oe_bit) ? GPIO_LINE_DIRECTION_OUT :
> +				      GPIO_LINE_DIRECTION_IN;

For pinctrl-msm:
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

>  }

Regards,
Bjorn
