Return-Path: <linux-arm-msm+bounces-65488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D8DB08E7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 15:47:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0E39585F05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 13:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F612EF660;
	Thu, 17 Jul 2025 13:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="mFNf5HUx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031A72EF288;
	Thu, 17 Jul 2025 13:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752760015; cv=none; b=VW6YtwxleQiBhtoGK+uHRywK6Lb+ya4zVIU6QNcLQ4uFh7U+RHbh/zNHvAEoP3jpBqaXmJbfC/KwRTMlpf1yWBLrpChcO2HTTeLNohzZwPO14acYkbg1JG2mD1NQDqjz0+L60M2uldcqXhSQwXKfeAufoWCPOwoH6IrWFRZIMLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752760015; c=relaxed/simple;
	bh=lYuKipqVydFEQPEcQM8C2GhLl+XomuY6ILVfb7TfIGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cnv59xstrTfuOqsfoa9GsgT+JIyODocOA6FrGYdSo1A/oE5gyUffgdK9mf6eBsdO9qqBT5efcRzyxM4R2CO6ZCwxtQwnWBoUc9zilHfyABDVvQmGVUX7GoVsyb4V/eazLKwJ4gTUfgYHPE93kug0CV/WsING4Ah0ceKqN0SLZSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=mFNf5HUx; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=GOeiusU0AzU7wXtvsmxOC5NhQINrtZu+SE41tmlBH3Y=; b=mFNf5HUxzMBuf03WguApmHlMO0
	XS1TSMEBe0NSZJIuJSAOg/aYvqc95GBI6ZEltdFDNMyDsh5bP1Fi/wBR5lJMB1v9xHV65Qb7Gl+aR
	4GbS+lo7CvaK9Rzl6pK8AhPjfJvWw5A9IpePUBxKjl7L5n8mFnm+DgV9Q7r0wixgG1Ds=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ucOwd-001tSb-Qs; Thu, 17 Jul 2025 15:46:43 +0200
Date: Thu, 17 Jul 2025 15:46:43 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Luo Jie <quic_luoj@quicinc.com>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 1/3] net: phy: qcom: Add PHY counter support
Message-ID: <c34607d0-fb25-471d-a28d-8e759e148a0b@lunn.ch>
References: <20250715-qcom_phy_counter-v3-0-8b0e460a527b@quicinc.com>
 <20250715-qcom_phy_counter-v3-1-8b0e460a527b@quicinc.com>
 <e4b01f45-c282-4cc9-8b31-0869bdd1aae1@lunn.ch>
 <23ab18e6-517a-48da-926a-acfcaa76a4e7@quicinc.com>
 <87cace03-dd5e-4624-9615-15f3babd1848@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cace03-dd5e-4624-9615-15f3babd1848@redhat.com>

On Thu, Jul 17, 2025 at 03:23:16PM +0200, Paolo Abeni wrote:
> On 7/16/25 12:15 PM, Luo Jie wrote:
> > On 7/16/2025 12:11 AM, Andrew Lunn wrote:
> >>> +int qcom_phy_update_stats(struct phy_device *phydev,
> >>> +			  struct qcom_phy_hw_stats *hw_stats)
> >>> +{
> >>> +	int ret;
> >>> +	u32 cnt;
> >>> +
> >>> +	/* PHY 32-bit counter for RX packets. */
> >>> +	ret = phy_read_mmd(phydev, MDIO_MMD_AN, QCA808X_MMD7_CNT_RX_PKT_15_0);
> >>> +	if (ret < 0)
> >>> +		return ret;
> >>> +
> >>> +	cnt = ret;
> >>> +
> >>> +	ret = phy_read_mmd(phydev, MDIO_MMD_AN, QCA808X_MMD7_CNT_RX_PKT_31_16);
> >>> +	if (ret < 0)
> >>> +		return ret;
> >>
> >> Does reading QCA808X_MMD7_CNT_RX_PKT_15_0 cause
> >> QCA808X_MMD7_CNT_RX_PKT_31_16 to latch?
> > 
> > Checked with the hardware design team: The high 16-bit counter register
> > does not latch when reading the low 16 bits.
> > 
> >>
> >> Sometimes you need to read the high part, the low part, and then
> >> reread the high part to ensure it has not incremented. But this is
> >> only needed if the hardware does not latch.
> >>
> >> 	Andrew
> > 
> > Since the counter is configured to clear after reading, the clear action
> > takes priority over latching the count. This means that when reading the
> > low 16 bits, the high 16-bit counter value cannot increment, any new
> > packet events occurring during the read will be recorded after the
> > 16-bit counter is cleared.
> 
> Out of sheer ignorance and language bias on my side, based on the above
> I would have assumed that the registers do latch ;)

I interpret it differently. The register is set to clear on read. So
you read and clear the least significant word. Even if that word
starts incriminating, you have 65535 increments before it will
overflow into the next word. So you can read the most significant word
before such an overflow happens. It does not latch, you just have a
time window when it is safe.

What i actually find odd is that clear on read works on words, not the
full counter. I assume that is documented in the datasheet, and
tested, because i've never seen hardware do that before.

	Andrew

