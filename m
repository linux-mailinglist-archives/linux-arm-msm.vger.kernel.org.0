Return-Path: <linux-arm-msm+bounces-48037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A75DA35FBC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 15:03:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCB9F168D7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 14:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD68A263F57;
	Fri, 14 Feb 2025 14:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ffutnsRo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFCB7081C;
	Fri, 14 Feb 2025 14:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739541788; cv=none; b=KgGtfIvjxbMY+wDKDRIGL5i+rTEJlBCOJKViCGu9J+UENMFdw6FkZhDXMol9Ayr6kDkZbojZvfAnG6y2TU1A3de8iErP+B1ndw7igps6vo7rxgIn3EHiqtjFaIKtIw7zQwqqlU5WlfkebRrWoNwaX7vJF+Nt6TX/pkBzEkvXyK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739541788; c=relaxed/simple;
	bh=HPjrAGuqBs30Xqla0S08E7D+Vsk8nak+FoJqatHVKqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEbxC9LFJZAeVC2jywQgScFjENM+hOLdOT7QtFvgA6UapXlLwv8TvxYwVew1rSx1P9AF9MwxveQDWAVP0RCO3ym4PzT0J7s0iK8tb4z3F+ycq0p+IYI6Ckizug9Nlrz+87v1I5GHa1vwq5Fez6GISeCQ/O2ALfiPmMQzUS7VcXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ffutnsRo; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YPfqLp9fbZ/8JOO2RhhN9couacnmyf0ld4MXnUIvALM=; b=ffutnsRoSZY8FyHYndFd/8kLiJ
	I4KHxo35/Ek9TxhoUWtM8unvMnPGhWSEmkPTEcDT3jYClEQEnUPZhUgdZ2ziMHH55Gx8f8Cqx5dY+
	TMUNkVQeXvIecwSFy4vJcLw7LskEMPFSJgDfs890xo04TQ/QG3ANEnPgdKm5ofEn2wRI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tiwHO-00E5L7-4X; Fri, 14 Feb 2025 15:02:54 +0100
Date: Fri, 14 Feb 2025 15:02:54 +0100
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
Subject: Re: [PATCH net-next v3 13/14] net: ethernet: qualcomm: Add PPE
 debugfs support for PPE counters
Message-ID: <72171304-9a98-4734-85a3-d1302d053602@lunn.ch>
References: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
 <20250209-qcom_ipq_ppe-v3-13-453ea18d3271@quicinc.com>
 <5a53333b-e94c-4fb7-b23d-e1d38d2dad8e@lunn.ch>
 <a455a2f6-ca0b-43e0-b18c-53f73344981f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a455a2f6-ca0b-43e0-b18c-53f73344981f@quicinc.com>

> > > +/* The number of packets dropped because of no buffer available, no PPE
> > > + * buffer assigned to these packets.
> > > + */
> > > +static void ppe_port_rx_drop_counter_get(struct ppe_device *ppe_dev,
> > > +					 struct seq_file *seq)
> > > +{
> > > +	u32 reg, drop_cnt = 0;
> > > +	int ret, i, tag = 0;
> > > +
> > > +	PRINT_COUNTER_PREFIX("PRX_DROP_CNT", "SILENT_DROP:");
> > > +	for (i = 0; i < PPE_DROP_CNT_TBL_ENTRIES; i++) {
> > > +		reg = PPE_DROP_CNT_TBL_ADDR + i * PPE_DROP_CNT_TBL_INC;
> > > +		ret = ppe_pkt_cnt_get(ppe_dev, reg, PPE_PKT_CNT_SIZE_1WORD,
> > > +				      &drop_cnt, NULL);
> > > +		if (ret) {
> > > +			seq_printf(seq, "ERROR %d\n", ret);
> > > +			return;
> > > +		}
> > 
> > This is an error getting the value from the hardware? You should not
> > put that into the debugfs itself, you want the read() call to return
> > it.
> > 
> 
> Yes, this error code is returned by regmap read functions in
> ppe_pkt_cnt_get() when the hardware counter read fails. I will
> remove it from debugfs file and instead log the error to the
> console (dev_info).

and return it to user space via the read() call. These functions
normally return the number of bytes put into the buffer. But you can
also return a negative error code which gets passed back to user space
instead.

	Andrew

