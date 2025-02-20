Return-Path: <linux-arm-msm+bounces-48700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6F1A3DDF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 16:13:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B286170CBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 15:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC0671F9EC0;
	Thu, 20 Feb 2025 15:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="DnksjA+d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EAD1D5CFB;
	Thu, 20 Feb 2025 15:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740064160; cv=none; b=P3PQEBBPNudjKG8VjtVRqWu7XOnOW2XyP2JZgHOEHXJ9nkzpUNjjBBazoWh6ctHU+lYz6nSPmj3mOonfJ5HKeUqab18uEVOno+6Y5KD6Lml3K2gZe3Be6oJMC3cAcwEyV4JW9zDaiKUIh+UrxcpS/5MNQsKHIY1Roci0ecEHTQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740064160; c=relaxed/simple;
	bh=4HVFBZ3ScN/QSjdZXp6sXmsZW7Bu9EBEeurJD/jlSSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=reOJd0eJfOoo08G7vI8pGVFwGRFyBvOxrWajMg/XinumBM5LAK1HzRnMeOTTEFhyPN7uVh5GyXIsvapqq4sUK6uhXg8K/RTRpJPNwkf8T8F5bNe1iJnTagSZSZm44DhV8EbmZuxVnp4r375Hg9TSsxtydWa1lpm3ilP/KEVJi3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=DnksjA+d; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=mFZ38N7Vlv4BtDPOh81JtXHedK6qtqkznkqkTXgibGk=; b=DnksjA+dHlu2CQzYmccNjSfwUM
	/IUPQRJZRt7tJw3wrXZDVQOwzjDiLvqRAICMfWKYJEgufONxqxDsyWiD+inGcM0AX3KGPD1QHvc8i
	4wA4r7RKMVd6v/YjmIZYe15ckjJHbRvmMxOutO5TauhetvJPybC7KP1ii6DEcodLQIxY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tl8Ak-00FzzQ-S2; Thu, 20 Feb 2025 16:09:06 +0100
Date: Thu, 20 Feb 2025 16:09:06 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jie Luo <quic_luoj@quicinc.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lei Wei <quic_leiwei@quicinc.com>,
	Suruchi Agarwal <quic_suruchia@quicinc.com>,
	Pavithra R <quic_pavir@quicinc.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
	quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
	srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org,
	john@phrozen.org
Subject: Re: [PATCH net-next v3 04/14] net: ethernet: qualcomm: Initialize
 PPE buffer management for IPQ9574
Message-ID: <33529292-00cd-4a0f-87e4-b8127ca722a4@lunn.ch>
References: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
 <20250209-qcom_ipq_ppe-v3-4-453ea18d3271@quicinc.com>
 <a79027ed-012c-4771-982c-b80b55ab0c8a@lunn.ch>
 <c592c262-5928-476f-ac2a-615c44d67277@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c592c262-5928-476f-ac2a-615c44d67277@quicinc.com>

On Thu, Feb 20, 2025 at 10:38:03PM +0800, Jie Luo wrote:
> 
> 
> On 2/11/2025 9:22 PM, Andrew Lunn wrote:
> > > +	/* Configure BM flow control related threshold. */
> > > +	PPE_BM_PORT_FC_SET_WEIGHT(bm_fc_val, port_cfg.weight);
> > > +	PPE_BM_PORT_FC_SET_RESUME_OFFSET(bm_fc_val, port_cfg.resume_offset);
> > > +	PPE_BM_PORT_FC_SET_RESUME_THRESHOLD(bm_fc_val, port_cfg.resume_ceil);
> > > +	PPE_BM_PORT_FC_SET_DYNAMIC(bm_fc_val, port_cfg.dynamic);
> > > +	PPE_BM_PORT_FC_SET_REACT_LIMIT(bm_fc_val, port_cfg.in_fly_buf);
> > > +	PPE_BM_PORT_FC_SET_PRE_ALLOC(bm_fc_val, port_cfg.pre_alloc);
> > 
> > ...
> > 
> > > +#define PPE_BM_PORT_FC_CFG_TBL_ADDR		0x601000
> > > +#define PPE_BM_PORT_FC_CFG_TBL_ENTRIES		15
> > > +#define PPE_BM_PORT_FC_CFG_TBL_INC		0x10
> > > +#define PPE_BM_PORT_FC_W0_REACT_LIMIT		GENMASK(8, 0)
> > > +#define PPE_BM_PORT_FC_W0_RESUME_THRESHOLD	GENMASK(17, 9)
> > > +#define PPE_BM_PORT_FC_W0_RESUME_OFFSET		GENMASK(28, 18)
> > > +#define PPE_BM_PORT_FC_W0_CEILING_LOW		GENMASK(31, 29)
> > > +#define PPE_BM_PORT_FC_W1_CEILING_HIGH		GENMASK(7, 0)
> > > +#define PPE_BM_PORT_FC_W1_WEIGHT		GENMASK(10, 8)
> > > +#define PPE_BM_PORT_FC_W1_DYNAMIC		BIT(11)
> > > +#define PPE_BM_PORT_FC_W1_PRE_ALLOC		GENMASK(22, 12)
> > > +
> > > +#define PPE_BM_PORT_FC_SET_REACT_LIMIT(tbl_cfg, value)	\
> > > +	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_BM_PORT_FC_W0_REACT_LIMIT)
> > > +#define PPE_BM_PORT_FC_SET_RESUME_THRESHOLD(tbl_cfg, value)	\
> > > +	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_BM_PORT_FC_W0_RESUME_THRESHOLD)
> > 
> > Where is u32p_replace_bits()?
> 
> u32p_replace_bits is defined by the macro __MAKE_OP(32) in the header
> file "include/linux/bitfield.h".

Given it is pretty well hidden, and not documented, it makes me think
you should not be using it. The macros you are expected to use from
that file are all well documented.

> > This cast does not look good.
> 
> Yes, we can remove the cast.

To some extent, this is a symptom. Why is the cast there in the first
place? Cast suggest bad design, not thinking about types, thinking it
is actual O.K. to cast between types. Please look at all the casts you
have. Is it because of bad design? If so, please fix your types to
eliminate the casts.

> > And this does not look like anything any
> > other driver does. I suspect you are not using FIELD_PREP() etc when
> > you should.
> > 
> > https://elixir.bootlin.com/linux/v6.14-rc2/source/include/linux/bitfield.h
> > 
> > 	Andrew
> 
> The PPE_BM_XXX macros defined here write to either of two different
> 32bit words in the register table, and the actual word used (0 or 1)
> is hidden within the macro. For example, the below macro.
> 
> #define PPE_BM_PORT_FC_SET_CEILING_HIGH(tbl_cfg, value)	\
> 	u32p_replace_bits((u32 *)(tbl_cfg) + 0x1, value,
> 	PPE_BM_PORT_FC_W1_CEILING_HIGH)
> 
> We could have used FIELD_PREP as well for this purpose. However using
> u32p_replace_bits() seemed more convenient and cleaner in this case,
> since with FIELD_PREP, we would have needed an assignment statement to
> be defined in the macro implementation. We also noticed many other
> drivers using u32_replace_bits(). Hope this is ok.

Please extend the set of FIELD_{GET,PREP} macros to cover your use
case. Document them to the level of the existing macros. Submit the
patch to:

Yury Norov <yury.norov@gmail.com> (maintainer:BITMAP API)
Rasmus Villemoes <linux@rasmusvillemoes.dk> (reviewer:BITMAP API)
etc

and see what they say about this.

	Andrew

