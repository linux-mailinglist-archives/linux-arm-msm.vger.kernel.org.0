Return-Path: <linux-arm-msm+bounces-2419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 630977FD4D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 12:03:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18BC0282786
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 11:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66FA31BDE1;
	Wed, 29 Nov 2023 11:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYOly5dI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6136D1735;
	Wed, 29 Nov 2023 03:03:19 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40b54261442so3080915e9.1;
        Wed, 29 Nov 2023 03:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701255798; x=1701860598; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QMxehpC8EcuIJbWBwswqF2Dwh3OOypWDdlXDrbz4QBI=;
        b=ZYOly5dITMyhdDJw6OKwXl1f1bC/wMorfz0vUf+7sOvzhIaJ8hqueQt/k66AAKtk/x
         67yqO7bOZOQPJvYwSDRJjlsepLGRV51oFdTCwtWxlZykTj4Y3wo3WCEkXM0xKboAGbP6
         uAnF0R9HdDj8YId2VCjO6byAtNRmnez4N3OpaTtyxTvwdcUqEoz+KeydeOJXzAr630/K
         tiT7+VXQqO0cN1i5w/U4HeZfY7pwXTkr3h8yzpB3YLyILh8HDhEWw1OS4Ky6lOjmpGf9
         4eulIRU/O1tRNYyP4xQdTLSpwGrlAUKcdpIGYcgo1O/rBjBhbto04pSVp63nN5ntAvj5
         nUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701255798; x=1701860598;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QMxehpC8EcuIJbWBwswqF2Dwh3OOypWDdlXDrbz4QBI=;
        b=IVWOS9jrXNi9RXxI9lSCVv9Z3Wdk2k6aUiWMz+3N/H4afD9XvDwBsch/Ie5tl2ax0x
         x88x8LISfH8JrelERYRHw3CGe2Mi3XPpmug7lx86CtSH/P73oldhOLwrmHgF0RTaDcEJ
         orvpvvxClqJMAbqAXjCOLiwXN2OamlJJGsmFc1vrYfUede0lLNy+MSCjqKI3RW2Y+kw9
         PeI3PaKsNz6y0usQxOPiVQt8+Ru+6bFEq+UC6hsfTjJPt+7831cbsP1dl1UHNBFD2qBd
         OYj30EW6GKj8xTYpOMHazH1fXDcjIBrWdhTGqoiUbd/INLUi2SivxpnbEm9e/QZXNLDB
         To5Q==
X-Gm-Message-State: AOJu0YwXQqUL1rfLhFIA+Fo1qy7Jtn70NN7BpbdK+CqNSxN2B0lK9iUR
	4xVR+L/voMn4aZyt3/3FtO9n4lJng5I=
X-Google-Smtp-Source: AGHT+IHXmUsA5GkX9ZFmTSFKPgouXi5Igc81oQtBTJedALRexDwQXJ3mzReej+Jx9VCOszaSKN+fmw==
X-Received: by 2002:a05:600c:5118:b0:3f6:9634:c8d6 with SMTP id o24-20020a05600c511800b003f69634c8d6mr13234227wms.18.1701255797411;
        Wed, 29 Nov 2023 03:03:17 -0800 (PST)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id q17-20020a05600c46d100b0040836519dd9sm1816416wmo.25.2023.11.29.03.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 03:03:17 -0800 (PST)
Message-ID: <65671a75.050a0220.53874.4dd1@mx.google.com>
X-Google-Original-Message-ID: <ZWcaclzv1RMqDxAe@Ansuel-xps.>
Date: Wed, 29 Nov 2023 12:03:14 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [net-next PATCH 02/14] net: phy: at803x: move disable WOL for
 8031 from probe to config
References: <20231129021219.20914-1-ansuelsmth@gmail.com>
 <20231129021219.20914-3-ansuelsmth@gmail.com>
 <ZWcDUJY8rM6uApO1@shell.armlinux.org.uk>
 <65670622.050a0220.4c0d0.3ee9@mx.google.com>
 <ZWcWN4kRRPBA9ZG6@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZWcWN4kRRPBA9ZG6@shell.armlinux.org.uk>

On Wed, Nov 29, 2023 at 10:45:11AM +0000, Russell King (Oracle) wrote:
> On Wed, Nov 29, 2023 at 10:36:31AM +0100, Christian Marangi wrote:
> > On Wed, Nov 29, 2023 at 09:24:32AM +0000, Russell King (Oracle) wrote:
> > > On Wed, Nov 29, 2023 at 03:12:07AM +0100, Christian Marangi wrote:
> > > > Probe should be used only for DT parsing and allocate required priv, it
> > > > shouldn't touch regs, there is config_init for that.
> > > 
> > > I'm not sure where you get that idea from. PHY driver probe() functions
> > > are permitted to access registers to do any setup that they wish to.
> > > 
> > > config_init() is to configure the PHY for use with the network
> > > interface.
> > > 
> > > I think this patch is just noise rather than a cleanup.
> > >
> > 
> > I got it from here [1]
> > 
> > Also on every other driver probe was always used for allocation and
> > parsing so why deviates from this pattern here?
> 
> Untrue.
> 
> bcm54140_enable_monitoring() is called from bcm54140_probe_once()
> which in turn is called from bcm54140_probe().
> 
> dp83869_probe() calls dp83869_config_init(), rightly or wrongly.
> 
> lxt973_probe() fixes up the BMCR.
> 
> mv3310_probe() configures power-down modes, modifying registers.
> 
> mt7988_phy_probe() calls mt7988_phy_fix_leds_polarities() which
> modifies registers.
> 
> lan8814_probe() calls lan8814_ptp_init() which does a whole load of
> register writes.
> 
> lan88xx_probe() configures LEDs via register writes.
> 
> yt8521_probe() configures clocks via register modification.
> 
> I'm afraid this means your comment is demonstrably false.
>

Don't want to start a discussion and thanks a lot for pointing this
out. This is really to talk about this and not contradict you.

Yes it's not true, and I was wrong but still I watch other driver
outside PHY and normally probe should not do that kind of stuff.
(even the comments describing the use in phy.h doesn't say that it
should be used for configuring the PHY only once on discovery)

Watching some of the thing, I feel all of this is done in probe as it's
not called again on software reset (as it will call config_init again).

This looks like there is a missing feature here and maybe a chance to
improve this?

Wonder if adding an additional OP would be beneficial to this?
Was thinking to something like

.config_once ?

And add some comments that it's called only on PHY discovery?
It would be put right after the probe call in phy_core.

> > Also I think it was wrong from the start as on reset I think WoL is
> > not disabled again. (probe is not called)
> 
> On hardware reset, the 1588 register will re-enable the WoL pin, but
> that needs a hardware reset of the PHY to happen after probe() is
> called.
> 
> However, phy_probe() will only assert the reset signal _if_ an error
> occured during probing, not if probing was successful. So, a successful
> probe of this driver will not cause a hardware reset.
> 
> Also, hardware reset is optional. Do you know whether the platforms
> that use the separate WoL pin which this 1588 register controls also
> wire the reset signal such that it can be controlled by Linux?
> Probably not.
> 
> So, this register write will not be cleared by a hardware reset after
> a successful probe.
>

I just checked Datasheet, on HW reset it's enabled again and on SW reset
value is retained. So yes it must stay in probe as it will cause side
effect if WoL get enabled after... Really hope the config_once thing is
OK since it will make things much cleaner.

-- 
	Ansuel

