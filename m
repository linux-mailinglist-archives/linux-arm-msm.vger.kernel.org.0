Return-Path: <linux-arm-msm+bounces-94729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGCDDkEspGnZZgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 13:08:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C96461CF86E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 13:08:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 36461300B9CD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 12:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BF982D7812;
	Sun,  1 Mar 2026 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mE+KhqJd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BF1317178
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Mar 2026 12:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772366911; cv=none; b=ktFyFg6Dh7fxjzN0h/I75CikoB0INBjLWkwxkv1+lLse6qH9YeaLV4GgnrBgeS1sF9OFPWN3bXfWuUYXB1g7lauWk4LiNlLjBqYLXspLuMM5y0yJpzTBWftNF9kXuhgNGZBNvIGPOfZKOFeeudCSQjYN0AU+sXDRsmADVvfAPi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772366911; c=relaxed/simple;
	bh=8k2C0jPmWIaM9el8miNXWEkBgsxEkaRz5GqnZvFuqYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBRyqZPxjY+330vnc8qc+zItlKOX16NdGizOiCr9oK82Oq4ixrCtzFnQKvy4pfS4HaHqO9ugbW6h7ZzUfnN6KISWPgDey7yGR1qsVz1Hhrrckr6Amiozrx9JFcuDwUoe9JDhMIZ4dCKhvtkHvNG2eiL4J5f1Ho8jGPeadrYRS/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mE+KhqJd; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-483708b697cso4094535e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 04:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772366908; x=1772971708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UwOed2BoBm+IaxGS8G+Dca7DMJY6cOw/pE55KOFYvnI=;
        b=mE+KhqJdPGNgDpt0ltwFT/Nf/ALulrK1ZMPmVUKC7EvN0NOV315og+2LlBt+5lr0cE
         wlThYNEAQmjtQwvW+d3eyihuF6jLndaaoFSuII2de7OKYU+7KNf9Sj/OnntDXuk4Bq9k
         NAeVwqcpF8IsEHRNQGkreLaWd14NM94a61Yb2m2CvXtWgHoP/4dIL3NZLdVD1n7xMs8l
         xkHdA6mY/AVimfYT43m5r4Ruesn9nqpabmiTp46wB9qJyqHNW/1Y37/kJU1BPTlNadXN
         9rBJqdRPUGU+k1mqQYY8+QWXNWfOfbOyzWAIk2kHBGFCQNw4g6nMqcQ55HkqKAfNuHc/
         mQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772366908; x=1772971708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwOed2BoBm+IaxGS8G+Dca7DMJY6cOw/pE55KOFYvnI=;
        b=t10v8dI68WOIshIOdxJVm7H1ZQyuKauUUjTVhvcMzW8uvjMwB2tmaECDGAMwW0BkMc
         ZNInnV6mpBYgPy5n7OvgdTHz6nNR/gVH4ycOGv3sjpyZvDXQvhlqggLM2E4xiC2ODAcd
         9Vw7BdUUft9l/8ptr2FDwQkYNmjCXNxvxvyZxHiBDeyU4eSmt5OHcZy1rMv9EgsPUd0q
         KZ0OQuoBlFC+YdtJGKO2WQg3hotxY93hvejOnravt8+CBsETTUwjRP78W5k7cm9KRsjM
         bvOp0pdd0DJmXsiuAWbPYskZOvxCh9hXtfOfXCUgEMqmBukZr0OoeiCN4xn6qvXpJE3F
         hJdA==
X-Forwarded-Encrypted: i=1; AJvYcCXHVn/9Q7jOYMDVSQiGOndNspa84EQjVVX38a/DYm1fYtFQeFCxdIp3UWYMC/cK+v2LHAb1qb5d1YFVaoi3@vger.kernel.org
X-Gm-Message-State: AOJu0YyMvL3wh8nwshP0qPn3AfgFwfEdMijeNdV3NSFjJaMSTdQNlkrf
	CGVCAlJwffdrpnsgfq/sMlyYx1cEOX6qSD9O5kG8hkJv+OGHDnXbarXQ
X-Gm-Gg: ATEYQzxuGhhoGy66ai6rCqr5hQZF4eKvs0knSPWfFIJclIVr1P37ZyMoTL6k6+Byccw
	5wiH/rRxVrwJHgXL+eyDRvifwkyN+oBz3DPy+1HjgF/4glWMBFCmI7SCLlSe+3xYxt2WX1CN8sf
	gBKxiz5KDi/ShYiDdtAhBdC2wwK6wDZJlpU/PTfCwNw2dvAgJYXzG7yy+f/Ps5DfLUozgCaVWR3
	9lmOvhgptFIG7gIec0WB+ofPUutLcYpnT7kGp3ZObn3L8TdMQOHDIW0n8xgp8/3l6S0e7J3ctpK
	Pw7LhLNMmJqWihVHhcvBsJ8GBhbgwlt06ozbB6e8Ba7Z01YQXLe6fU4k+s6Mq5xAPs5z5DCZVNP
	Yhc1/Y+zS4MqWhxTVc7YLwk5p+gz8XVCnXwR6bh1fhkZ2TWZpR1Eg+oSaMjSlQESltPeC+n1XCD
	TzPGoPGg1M+IhfNrVfPec=
X-Received: by 2002:a05:600c:828c:b0:47e:e20e:bbbc with SMTP id 5b1f17b1804b1-483c9ba6db4mr86494875e9.1.1772366907868;
        Sun, 01 Mar 2026 04:08:27 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:8f4c:42a4:aebb:ef65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm363973255e9.9.2026.03.01.04.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 04:08:27 -0800 (PST)
Date: Sun, 1 Mar 2026 14:08:24 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RESEND2 net-next 0/8] net: stmmac: qcom-ethqos: further
 serdes reorganisation
Message-ID: <20260301120824.ot53bhv7z7kn5lfd@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <aaIysVxy-WxbiJz9@shell.armlinux.org.uk>
 <20260227165556.5cf9e844@kernel.org>
 <20260228083111.5df8550c@kernel.org>
 <20260301001453.lpd2rawy7bqxyivp@skbuf>
 <20260228163229.1024f263@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228163229.1024f263@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94729-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olteanv@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C96461CF86E
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 04:32:29PM -0800, Jakub Kicinski wrote:
> > I'm working on a series for phy-next which will conflict with this 
> > hunk from Russell's patch 1:
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> > index 5b1c82459c12..4ea3dce7719f 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> > @@ -7,6 +7,7 @@
> >  #include <linux/ethtool.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > +#include <linux/phy.h>
> >  #include <linux/phy/phy.h> // this gets renamed to <linux/phy/phy-provider.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> 
> That's not too bad.. if that's the extent of the conflict (which is
> probably hard to predict at rc2?) we could let linux-next handle it. 

Yeah, I can't predict the future beyond that.

> Of course assuming Vinod is okay with us merging Russell's entire
> series.
> 
> > If there's no other way to provide a stable tag other than on v7.0-rc1
> > (like for example a snapshot of current net-next/main), which I didn't
> > know wouldn't be possible, then I think going with the route of fewer/
> > more trivial merge conflicts makes sense.
> 
> To be clear, it's only about having a common ancestor, I wasn't actually
> planning on making y'all a tag. I'd just apply the series on top of
> v7.0-rc1 and merge them in. Then anyone can tag the relevant commit 
> in net-next or use as a base for their own work.
> 
> I haven't looked how bad the conflict would be if Russell's work was
> rebased on Linus's tree. If the delta is not too bad, and we can just
> resolve the merge conflict when pulling it into net-next. That's
> probably the cleanest.

I don't think applying the current series on top of v7.0-rc1 would be a
good idea. It depends upon this series in a very non-trivial way,
basically building upon it:
https://patchwork.kernel.org/project/netdevbpf/list/?series=1056390&state=*

For example, that previous series introduces ethqos_mac_finish_serdes()
- absent in v7.0-rc1 - and this series modifies it (in current net-next/main,
it is calling phy_set_speed(), and after this series, it is calling
phy_set_mode_ext()).

By comparison, the merge conflict with me renaming <linux/phy/phy.h>
would be smaller.

> I don't recall us ever making a "dirty tag" on net-next which would
> propagate few 100s of netdev patches into someone else's tree :S
> IDK how Linus would react. It's the least good option IMO.

Just for my curiosity, what difference would it make to him?

