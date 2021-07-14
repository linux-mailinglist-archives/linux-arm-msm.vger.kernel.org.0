Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B77333C81D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 11:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238271AbhGNJnq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 05:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238189AbhGNJnq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 05:43:46 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41AA7C06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jul 2021 02:40:55 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id i16-20020a17090acf90b02901736d9d2218so1360420pju.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jul 2021 02:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cW9MbUGhnflJOg7qUfCW6yFis9tISP8pj6NiCGf6Q5c=;
        b=sNyLWsfoHNWvPALyeoI73vrDEXV6/t27tl+isP8iE7Ts66LFh8q2HDcME0aaG9Rvor
         hWiT6/z1M7qC6Sygm8TdWyoueOl74PoVS9dnMV1FCtcCD7HYiwLeLoc3GxXEltabGMLb
         m04VNmzlgP7oEMKxUCWG/ZfIKgKrKshECOhCOrYslHRyLFIjPI3cHv8DQmrK1WkbnaH4
         QbH/TzVWkQRdu8o3KNGyxRFUSl06A3VmyR0ika/vhZCChx9cSONrBXyoliyEauoXx7yF
         FEubBeoHy21TTr4fZLfZ8S2s53MigKHohnFpa0dBTFXyafKSoGA0LRV7qKluNFaveH56
         IsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cW9MbUGhnflJOg7qUfCW6yFis9tISP8pj6NiCGf6Q5c=;
        b=UwyGQ4FzuU2z9pXuRt4AxkqbmTyAzfU5Vq/9+XepgzUIPVzRSnl3OuqWdPBlgfnxBE
         4/cBYG+lLxCIkY3MaFYHvkfh9w5v2169UtLqQ/Wir6+feKgjci26jiiiOjPqpuJai06g
         QDIvekek+RituHCZgQi38GcRfeZlcZia4dPVfiD/hftT4rXaSo8BPTVa4w5ke4L4bGED
         zvQkxjnff0RhULvfH/yRvh3y6VkjzcH7H7gu5LroNBTZ7BGR03OVErmnNHHVTw7kmCKM
         6mYGI5eTxHeJXom66yd65PAHw6p3fks9cWVfwOFuxFRikAYpYweATyS55PwTRA8mJkFT
         2Xkg==
X-Gm-Message-State: AOAM532s+DYHdzxl2RtQUgEUiyEmRoqf49VZpUjvWeivcutRo6jg2VuD
        vGS968kLsPEKIe+t/8WcfITNfw==
X-Google-Smtp-Source: ABdhPJwzYGIZU9WhVI9p+L6k0atU5gveREQBJTiC0raIT0x1o56e17krK8CGjBlFvwdWSp5hXJ0m9w==
X-Received: by 2002:a17:902:9308:b029:129:7c79:e53d with SMTP id bc8-20020a1709029308b02901297c79e53dmr7124380plb.50.1626255654772;
        Wed, 14 Jul 2021 02:40:54 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id k25sm2018464pfa.213.2021.07.14.02.40.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Jul 2021 02:40:54 -0700 (PDT)
Date:   Wed, 14 Jul 2021 17:40:46 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: pm8941-pwrkey - respect reboot_mode for warm reset
Message-ID: <20210714094045.GD11342@dragon>
References: <20210629030509.2893-1-shawn.guo@linaro.org>
 <1824770.6rn2EVs8mz@g550jk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1824770.6rn2EVs8mz@g550jk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Luca,

On Sun, Jul 11, 2021 at 11:57:25AM +0200, Luca Weiss wrote:
> Hi Shawn,
> 
> On Dienstag, 29. Juni 2021 05:05:09 CEST Shawn Guo wrote:
> > On some devices, e.g. Sony Xperia M4 Aqua, warm reset is used to reboot
> > device into bootloader and recovery mode.  Instead of always doing hard
> > reset, add a check on reboot_mode for possible warm reset.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > ---
> >  drivers/input/misc/pm8941-pwrkey.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/input/misc/pm8941-pwrkey.c
> > b/drivers/input/misc/pm8941-pwrkey.c index cf8104454e74..9b14d6eb1918
> > 100644
> > --- a/drivers/input/misc/pm8941-pwrkey.c
> > +++ b/drivers/input/misc/pm8941-pwrkey.c
> > @@ -27,6 +27,7 @@
> >  #define PON_PS_HOLD_RST_CTL2		0x5b
> >  #define  PON_PS_HOLD_ENABLE		BIT(7)
> >  #define  PON_PS_HOLD_TYPE_MASK		0x0f
> > +#define  PON_PS_HOLD_TYPE_WARM_RESET	1
> >  #define  PON_PS_HOLD_TYPE_SHUTDOWN	4
> >  #define  PON_PS_HOLD_TYPE_HARD_RESET	7
> > 
> > @@ -93,7 +94,10 @@ static int pm8941_reboot_notify(struct notifier_block
> > *nb, break;
> >  	case SYS_RESTART:
> >  	default:
> > -		reset_type = PON_PS_HOLD_TYPE_HARD_RESET;
> > +		if (reboot_mode == REBOOT_WARM)
> 
> This doesn't compile with CONFIG_INPUT_PM8941_PWRKEY=m
> 
>  ERROR: modpost: "reboot_mode" [drivers/input/misc/pm8941-pwrkey.ko] undefined!

Thanks for the report!  I will add a patch to export the symbol.

> 
> Also just to clarify, this is supposed to trigger when rebooting with 
> LINUX_REBOOT_CMD_RESTART2 and adding an argument that way, right?

With either of the following two methods, 'reboot_mode' will be turned
into REBOOT_WARM.

- Boot kernel with 'reboot=warm' on cmdline

- Set warm mode via sysfs entry
  $ echo warm > /sys/kernel/reboot/mode

Shawn
