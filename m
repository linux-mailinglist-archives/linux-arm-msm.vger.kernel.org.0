Return-Path: <linux-arm-msm+bounces-94738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBz7GO1IpGmMcgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 15:10:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE291D024B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 15:10:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7432930179FA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 14:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848DF31AF1B;
	Sun,  1 Mar 2026 14:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GhPF3pR/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1744D1A9F8C
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Mar 2026 14:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772374246; cv=none; b=CECl/tcLY9wTAVUFLIjcr1LPPQyk1LubsaLTl2qEHNIwA+jWKT/I98tB8yDyLVzx+IW4xXx6IIUPawbuvNxeLRKeRi/srPi8Tx5cUphvlYMW58P2lDvbolMkR4YoPC5c6U/LYp4M6PCf3GrIwgo+zGakHqSyBR7EWST2/19MJxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772374246; c=relaxed/simple;
	bh=OjOk8RraPxUBfWoZKGHeITFedK8/5Hi/f7N8V+do3ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SZUpD88zVpH14P0DC1RG8MTQTcpEISqW4rIvOTNTyCiuZPlre7e0k0uPBQNg6HjEp9FcnFxjSKXFx9My1QcL4tWQS1za/YBp6kZVXxn6KYeQ4UDPmIN0G5skJTLc+YUQSpvqcRwELbZQiWJC1qcYqekCf/uzXZ2SFiuQEbZ8jyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GhPF3pR/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4806fd9033bso7079155e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 06:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772374243; x=1772979043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TVGLTQN8MHuJLb/cmqvoQTI+Y7O1OTfTNxTJJccPmrI=;
        b=GhPF3pR/NcmE3cJd9K/y2ac6w4QpRXD8mhradSoYq7nBXn4q/XKRpcZorOtyrOXH2F
         PrRvYI5K6sGbPouZ6xSmqFxnuTaqtpTcJ1GSlnjvZZN3pPAqXuMJryytmBUcfF22j+rb
         oqO3tEwpyRRcrUC7LFuirbarnK8tdE7lJOl3+9bEAlpeJbJ2vL7KlH8rCJgnz7lZlJyK
         eDs810NRcFgmVay/SGVWJl+dhm3SDk6Pwnkqc5ZpL/PwvPuo4I/1JGhGfwie5zj6lI7l
         VMvmIIWkSpPlq9ilA6m8glRDWR/UIFBiUHP0AfjWKKmShU7xo410Nei4v+tMMKb6nNZz
         5VXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772374243; x=1772979043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TVGLTQN8MHuJLb/cmqvoQTI+Y7O1OTfTNxTJJccPmrI=;
        b=QbmO+vptBFy8dlrbFslvn2ssvLMxPD2ufEfJC+kbNLqikgOiyItGMDL7e3fryz1Mrw
         iVcyxUXjPNn050iK0CfuU5eNq1ohOoGmiMvzRdxaqNnq7ELxgMIPZVauCpItNiRXeGCe
         RJvYoMRYPNPHFSCsa0VxU2g9eC+STQDO/phv3yxr/Vn7cWuwXQzwHWelzoXxGVat7Q7C
         pAdC3RBM0+gyKXiLwMK705I1EbVlleEvL0eCxPSJmPXlC0ovruzJqM4ZFo7Wx+kGa6OC
         bLleMjhLw4UIHAJmmV6QPikkL7qrTZofw/sp49arKzsDMKSGIMJub4h7VD9BHCPta4Vz
         +gow==
X-Forwarded-Encrypted: i=1; AJvYcCWHu6YMS+LAWBEN9JAOEGfpAoE4VV4k+obn6JeMurUHoNtOY7qfJZWrbA+IfT19XtqXhNawtqnjmlFQGJOn@vger.kernel.org
X-Gm-Message-State: AOJu0YyqwCa4JwSXUQ5LYC+Feb99xjXQBE2hxz645cEWgSAPXvNyTKK6
	TFWC0aKSxKVnuFg+KA0JN6m0EWtmwi/MUB8b/r5zP6UUCY15vTDCQQkQ
X-Gm-Gg: ATEYQzyQgEnqYesspiBD4Rp5p8aa4GHKI6Jo4miryNAFMUxuh4iIw2ETNC8HpyPLWpv
	uftnIaS9jaNXfcDyC4zQYaUfAClF+DNgaMVVPHa+SzBmy4tmkNoPJLmdmKRIM9crfFQgvhjitT5
	7QEleCnMo2hUHsQbisy9fErTGxMb7Du7Le8+/Og6T1W6b2nJJx0+Ojf/pScHMju1seFKWFRpzgz
	Z61ix1Bmddoq6RO/W1d6RWXWQ5Zdwv2G02WUrem+Bpk7+2+ZVLO+bG4uV0vpWbVaB4hE3j1sZHv
	IkjA06m3ZVbtUevP5EbwXtnjSPUmse3L3QqE4KPpnYYomQlPNuwdu8I8dMWLQzEkZLxJNZ/Gpys
	3P76P4unHBv8ImyAX5PtwjrqtznFgEDwQp4Q6NugmQ7mkdx+scNjJW1q3MS56MZX0cFObZHP9ei
	A3VP5MipK8MHemVQstMHw=
X-Received: by 2002:a05:600c:4e8a:b0:483:887:6e32 with SMTP id 5b1f17b1804b1-483c9bd9eaemr93243805e9.8.1772374243073;
        Sun, 01 Mar 2026 06:10:43 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:8f4c:42a4:aebb:ef65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb77abdsm107413555e9.2.2026.03.01.06.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 06:10:42 -0800 (PST)
Date: Sun, 1 Mar 2026 16:10:39 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
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
Message-ID: <20260301141039.muzcrt6cynilvpei@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <aaIysVxy-WxbiJz9@shell.armlinux.org.uk>
 <20260227165556.5cf9e844@kernel.org>
 <20260228083111.5df8550c@kernel.org>
 <20260301001453.lpd2rawy7bqxyivp@skbuf>
 <aaRCN7zbX6FjUtQ_@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaRCN7zbX6FjUtQ_@shell.armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94738-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0DE291D024B
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 01:42:15PM +0000, Russell King (Oracle) wrote:
> On Sun, Mar 01, 2026 at 02:14:53AM +0200, Vladimir Oltean wrote:
> > On Sat, Feb 28, 2026 at 08:31:11AM -0800, Jakub Kicinski wrote:
> > > On Fri, 27 Feb 2026 16:55:56 -0800 Jakub Kicinski wrote:
> > > > On Sat, 28 Feb 2026 00:11:29 +0000 Russell King (Oracle) wrote:
> > > > > The AI review for patch 7 says:
> > > > > 
> > > > >   This commit fixes a bug but lacks a Fixes: tag. The commit modifies
> > > > >   behavior introduced in 360000820ae2 ("phy: qcom-sgmii-eth: add
> > > > >   .set_mode() and .validate() methods") by making phy_power_on() call
> > > > >   qcom_dwmac_sgmii_phy_calibrate() to restore the previous setup, and by
> > > > >   making qcom_dwmac_sgmii_phy_set_mode() check if the PHY is powered on
> > > > >   before attempting calibration.
> > > > > 
> > > > >   Should this commit include:
> > > > > 
> > > > >   Fixes: 360000820ae2 ("phy: qcom-sgmii-eth: add .set_mode() and .validate() methods")
> > > > > 
> > > > > which is _wrong_, this isn't a bug fix.  
> > > > 
> > > > Yes, that's what I thought but then I saw the other thread..
> > > 
> > > Trying to apply this now but stmmac parts don't apply on Linus's tree,
> > > and Vinod wants a tag :( What do we do? 
> > > 
> > > Could you, perhaps, send us a PR with this on top of Linus's tree 
> > > (a resolution of the inevitable conflict with net-next would be helpful
> > > too).
> > > 
> > > Or do we give up on the tag?
> > 
> > Actually, I think it's mainly me who wants a stable tag. I'm working on
> > a series for phy-next which will conflict with this hunk from Russell's
> > patch 1:
> 
> Is this because of the issues I raised with the quality of generic PHY
> API implementation by drivers?

I don't think the issue you are referring to is so much a "quality" one
as it is a "lack of requirements" one, but to answer - not necessarily.
Eventually I'll get to Ethernet Generic PHY interop too, but I saw as
first actionable step to clearly delineate what is PHY provider API from
what is PHY consumer API, in an attempt to stop PHY consumers from
poking inside struct phy.

To improve the interop situation, apart from patching drivers, I plan to
introduce a new CONFIG_GENERIC_PHY_EXPERIMENTAL (meaning: enable for
development, don't enable for production, but drivers required to work
with EXPERIMENTAL turned on) which would make a few changes:
- make the .validate() function pointer be a required dependency for
  .set_mode().
- call .validate() before calling .set_mode(), and reject the call if
  the mode and submode don't pass validation
- swap the power state before calling .set_mode(), and restore it
  afterwards

Some of these changes do need that consumer/provider API separation I
was talking about. For example, consumers should not look at the power
count of the PHY (some of them currently do; not to mention they do this
without proper locking). They should only concern themselves with
whether *they* powered the PHY up themselves.

