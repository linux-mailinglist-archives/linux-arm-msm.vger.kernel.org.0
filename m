Return-Path: <linux-arm-msm+bounces-23635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C74B912CEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 20:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CDCA1F233D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 18:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A155179204;
	Fri, 21 Jun 2024 18:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JD1fpuHM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CD32E417
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 18:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718993092; cv=none; b=papRTuVa/PLjOQrhcxSTm+qcI0zce0DgXLvUADmYVs8sDsSI15exOnd5JhuWXsOXQ/85n+gPAqHwNtU/9XnlGm5ElrpZ7sre3FrqeH7CiSPDjLhll5n1NXwzuAH7iwp/vMjdpDqkSIqWQQMzGKIBC6SU5EZhGSWwYh73yAd5uZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718993092; c=relaxed/simple;
	bh=zcg7PMw2+sFn9Qhk21DKHJTKPGv7tCKSJiQaWBwhaWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EjbgIsvlVXWiFmlPCwbwXpscYNIUjQrhqJC4PeV8nNBWr639FrCpoa1C8QvkQICXr+2FV9yaN9psNm5bc3B2cJDX+00EOGuPptYND3jIr5h9y46xkIrizN/OFRVfl9B0XhFjP9Lmn/2gbRnBUu7jfI0pkCKq7/wXcNyxzeXd7Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JD1fpuHM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718993088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V8nqRTAoVGOXxJJfyF4qzkCCRC+CK1bQkjWb0hfNjRc=;
	b=JD1fpuHMDZVhxsH63iBIWdCzao/hms3/ETjnGCkCKxOEe4ijBSFt83rb8jHsXZWo/Xrn/Q
	YUjbO5gYw3ssnyN404NCKZwj2u/93RCLCA0k2STsCpU2xYkSJrmNlT081w+UyC52+aI4OC
	buP1a0twQMWp4ksYsosUGFIVsELtrt0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-mJw9mav4NRid2ori_2UTDQ-1; Fri, 21 Jun 2024 14:04:47 -0400
X-MC-Unique: mJw9mav4NRid2ori_2UTDQ-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-440647edfeaso26584791cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 11:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718993086; x=1719597886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8nqRTAoVGOXxJJfyF4qzkCCRC+CK1bQkjWb0hfNjRc=;
        b=oLs6penNHynqfkTunTeb5sgpygDUB76Sy1ayG5LR57hfbCm8UBHEkIuexv6PRIUyv0
         IjRhtmqv8lX2WPOkojFwB7sGbstDoxQu/YQUGT6cJqIx+nvC7+JDPcuMmMMaT6M+gPhA
         3xujbykd9RZtBMBbjbFtqi9C314yUK3VmI/IEdRYcVB0ujK0bXyTBpZ4ed8vhOxiyDOD
         HzuizLXpNwXgHzNmHH835/bGwTOawd7o+rob2CJFziR1VPHxGCt+YLF3JB0CFJMSz2aB
         SqUocPRHupflzXItDGF1WJxJqo2ejgeJv/+zZMBh9nCSKHBC/UNg4+3to25VMl9JxHsu
         C+Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWug+VfN6/NZRGkTgsdJePV8fixLhvHw2v59+opDuEsu551opFFQBO54vlXM/u0aY0+uRU5fXM7ITnOM+DFw4pxJVzWBvQfn0Slay1o1g==
X-Gm-Message-State: AOJu0Yyl2ux5p/frv5GKeyIBgZsmcp4Y6zt49jVQxjoG7kuXHeWq5Dbf
	ddcOYHI6EwivxpFQKxM43tgxxtxD2lCO2+FTTyKDdD02eg/y5ZwenUQP9PObrMz/+EbFVNxuHHV
	aCgLSr2u17WixcevOgjaV8hRVuBPCj3LdfuNuy9vgxOQR4BE5eQfctbbH5dCmNrc=
X-Received: by 2002:a05:622a:1342:b0:43e:3d8b:b6b9 with SMTP id d75a77b69052e-444a7a4635fmr92854811cf.44.1718993086464;
        Fri, 21 Jun 2024 11:04:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJYcrTfuWlubeaxHUWAGUC9XfxejCL0fcoKM+mxJ0zr+uD9bnM2UGYpm8YYp2RVsBQQrd1GA==
X-Received: by 2002:a05:622a:1342:b0:43e:3d8b:b6b9 with SMTP id d75a77b69052e-444a7a4635fmr92854511cf.44.1718993085894;
        Fri, 21 Jun 2024 11:04:45 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::13])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-444c2c5ea11sm13380121cf.81.2024.06.21.11.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 11:04:45 -0700 (PDT)
Date: Fri, 21 Jun 2024 13:04:43 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Vinod Koul <vkoul@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next 1/8] net: phy: add support for overclocked SGMII
Message-ID: <osdpdpp44qkfx3varu4iulec3d3azwj7y7rccma7yopui3d7da@2km3uhan7umg>
References: <20240619184550.34524-1-brgl@bgdev.pl>
 <20240619184550.34524-2-brgl@bgdev.pl>
 <bedd74cb-ee1e-4f8d-86ee-021e5964f6e5@lunn.ch>
 <CAMRc=MeCcrvid=+KG-6Pe5_-u21PBJDdNCChVrib8zT+FUfPJw@mail.gmail.com>
 <160b9abd-3972-449d-906d-71d12b2a0aeb@lunn.ch>
 <ZnNIib8GEpvAOlGd@shell.armlinux.org.uk>
 <4ts2ab5vwf7gnwqd557z62ozjdbl3kf7d64qfc6rjhuokav3th@brhzlsrpggk6>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ts2ab5vwf7gnwqd557z62ozjdbl3kf7d64qfc6rjhuokav3th@brhzlsrpggk6>

On Thu, Jun 20, 2024 at 02:42:41PM GMT, Andrew Halaney wrote:
> On Wed, Jun 19, 2024 at 10:07:21PM GMT, Russell King (Oracle) wrote:
> > On Wed, Jun 19, 2024 at 09:51:12PM +0200, Andrew Lunn wrote:
> > > phylib supports out of band signalling, which is enough to make this
> > > work, so long as two peers will actually establish a link because they
> > > are sufficiently tolerant of what the other end is doing. Sometimes
> > > they need a hint. Russell King has been working on this mess, and i'm
> > > sure he will be along soon.
> > 
> > ... and I'm rolling my eyes, wondering whether I will get time to
> > finish the code that I started any time soon. I'll note that the more
> > hacky code we end up merging, the harder it will become to solve this
> > problem (and we already have several differing behaviours merged with
> > 2500base-X already.)
> > 
> > > What i expect will happen is you keep calling this 2500BaseX, without
> > > in band signalling. You can look back in the netdev mailling list for
> > > more details and those that have been here before you. It is always
> > > good to search the history, otherwise you are just going to repeat it.
> > 
> > That's where things start getting sticky, because at the moment,
> > phylink expects 2500base-X to be like 1000base-X, and be a media
> > interface mode rather than a MAC-to-PHY interface mode. This is partly
> > what my patches will address if I can get around to finishing them -
> > but at this point I really do not know when that will be.
> > 
> > I still have the high priority work problem that I'm actively involved
> > with. I may have three weeks holiday at the start of July (and I really
> > need it right now!) Then, there's possibly quite a lot of down time in
> > August because I'm having early cataract ops which will substantially
> > change my eye sight. There's two possible outcomes from that. The best
> > case is that in just over two weeks after the first op, I'll be able to
> > read the screen without glasses. The worst case is that I have to wait
> > a further two to three weeks to see my optometrist (assuming he has
> > availability), and then wait for replacement lenses to be made up,
> > fitted and the new glasses sent.
> > 
> > So, I'm only finding the occasional time to be able to look at
> > mainline stuff, and I don't see that changing very much until maybe
> > September.
> > 
> > At this point, I think we may as well give up and let people do
> > whatever they want to do with 2500base-X (which is basically what we're
> > already doing), and when they have compatibility problems... well...
> > really not much we can do about that, and it will be way too late to
> > try and sort the mess out.
> 
> I hope your holiday and operation go well Russell.
> 
> Pardon my ignorance, but I know of quite a few things you have in flight
> and because of that I'm not entirely sure what specific patches you're
> referring to above. Have those hit the list? I know you're cleaning
> up stmmac's phylink/pcs usage, but I'm thinking that this is outside of
> that series. Thanks in advance for helping me understand all that's in
> progress around this mess of a topic!

Nevermind my question, I was talking a little about this today with respect to a
Renesas board as well (can't escape it it seems) and in going through
our convos I found: https://lore.kernel.org/netdev/ZlNi11AsdDpKM6AM@shell.armlinux.org.uk/

    """
    I do have some work-in-progress patches that attempt to sort this out
    in phylink and identify incompatible situations.

    See http://git.armlinux.org.uk/cgit/linux-arm.git/log/?h=net-queue

    commits (I think)...

    net: phylink: clean up phylink_resolve()

    to:

    net: phylink: switch to MLO_AN_PHY when PCS uses outband

    and since I'm converting stmmac's hacky PCS that bypasses phylink to
    a real phylink_pcs, the ethqos code as it stands presents a blocker
    because of this issue. So, I'm intending to post a series in the next
    few days (after the bank holiday) and will definitely need to be
    tested on ethqos hardware.
    """

Thanks,
Andrew


