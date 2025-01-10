Return-Path: <linux-arm-msm+bounces-44728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 561A3A08E89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 11:53:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5740C165244
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 10:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE4B20551F;
	Fri, 10 Jan 2025 10:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p0n9mN3T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF3F1CF5CE;
	Fri, 10 Jan 2025 10:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736506380; cv=none; b=m2OAfne5CddAH9V6K1FSxQ/Lwy/wMRyJk4zWRUFU17T6mFy0jw6rtC3RssOkG1xdHZ/Z5ipsFBkJT8ZUVtBdnHF3ivTH78TXFZDJsyeQoPvKmXmyT52GgeXDi9CxlbKbWmUtkcT0XeCT5qmHobMDCSzfHiw/Mhp5TWOc/WlIcXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736506380; c=relaxed/simple;
	bh=Le7iqxPX0SAj4enuHruL9yUr5Hz6fjMftvdwLgFI6Mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppNphJpGRiQc+WIo82RSHn91t+P+9MHOhaSOXwMW55oGru6mQUQ25q1kMJCUDXwbGoIBkimpIINjjuKNkv6qctHR1QYyrqJfnXIJyyb3XOyzOST115t2j6raMOFFUwsgJBIU8OmfQqdEMA3HlXmYmRu/ZaYhbBJYr4lmW0MVj00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p0n9mN3T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14527C4CED6;
	Fri, 10 Jan 2025 10:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736506379;
	bh=Le7iqxPX0SAj4enuHruL9yUr5Hz6fjMftvdwLgFI6Mk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p0n9mN3TTuuhQEyKH9D+BYKZwweCbKmnAV3BQiC1R3SAMPjPu5DJl/QuMrUs7fSky
	 /O5ydpAGd083kUXB5XLlWwu3+HbBj+CAGvWpUU4yysxvoHWaMVkU/axJSQhGsvvGeQ
	 4EDZ0kn5vZ2DXJRNga8hR8CXSxIJmzlIYy5ymcMxjpWibkDA5W4u796usN0Q/T0rtI
	 lYfsvmhHO4u6NumDuRWb1DZaS7xMbxP6ilQxlWNzICm2dJfLi1HFi9rREs/JtWhM3K
	 lBDt1oidd3nrQ6ukFN4AQaryDJnYGFpx1CW07e9fxTVqd7ovG806RpFfZqLVLSpTo0
	 xmgGVGviWPOUQ==
Date: Fri, 10 Jan 2025 10:52:52 +0000
From: Simon Horman <horms@kernel.org>
To: Lei Wei <quic_leiwei@quicinc.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, quic_kkumarcs@quicinc.com,
	quic_suruchia@quicinc.com, quic_pavir@quicinc.com,
	quic_linchen@quicinc.com, quic_luoj@quicinc.com,
	srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org,
	vsmuthu@qti.qualcomm.com, john@phrozen.org
Subject: Re: [PATCH net-next v4 3/5] net: pcs: qcom-ipq9574: Add PCS
 instantiation and phylink operations
Message-ID: <20250110105252.GY7706@kernel.org>
References: <20250108-ipq_pcs_net-next-v4-0-0de14cd2902b@quicinc.com>
 <20250108-ipq_pcs_net-next-v4-3-0de14cd2902b@quicinc.com>
 <20250108100358.GG2772@kernel.org>
 <8ac3167c-c8aa-4ddb-948f-758714df7495@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ac3167c-c8aa-4ddb-948f-758714df7495@quicinc.com>

On Thu, Jan 09, 2025 at 09:11:05PM +0800, Lei Wei wrote:
> 
> 
> On 1/8/2025 6:03 PM, Simon Horman wrote:
> > On Wed, Jan 08, 2025 at 10:50:26AM +0800, Lei Wei wrote:
> > > This patch adds the following PCS functionality for the PCS driver
> > > for IPQ9574 SoC:
> > > 
> > > a.) Parses PCS MII DT nodes and instantiate each MII PCS instance.
> > > b.) Exports PCS instance get and put APIs. The network driver calls
> > > the PCS get API to get and associate the PCS instance with the port
> > > MAC.
> > > c.) PCS phylink operations for SGMII/QSGMII interface modes.
> > > 
> > > Signed-off-by: Lei Wei <quic_leiwei@quicinc.com>
> > 
> > ...
> > 
> > > +static int ipq_pcs_enable(struct phylink_pcs *pcs)
> > > +{
> > > +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
> > > +	struct ipq_pcs *qpcs = qpcs_mii->qpcs;
> > > +	int index = qpcs_mii->index;
> > > +	int ret;
> > > +
> > > +	ret = clk_prepare_enable(qpcs_mii->rx_clk);
> > > +	if (ret) {
> > > +		dev_err(qpcs->dev, "Failed to enable MII %d RX clock\n", index);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = clk_prepare_enable(qpcs_mii->tx_clk);
> > > +	if (ret) {
> > > +		dev_err(qpcs->dev, "Failed to enable MII %d TX clock\n", index);
> > > +		return ret;
> > 
> > Hi Lei Wei,
> > 
> > I think you need something like the following to avoid leaking qpcs_mii->rx_clk.
> > 
> > 		goto err_disable_unprepare_rx_clk;
> > 	}
> > 
> > 	return 0;
> > 
> > err_disable_unprepare_rx_clk:
> > 	clk_disable_unprepare(qpcs_mii->rx_clk);
> > 	return ret;
> > }
> > 
> > Flagged by Smatch.
> > 
> 
> We had a conversation with Russell King in v2 that even if the phylink pcs
> enable sequence encounters an error, it does not unwind the steps it has
> already done. So we removed the call to unprepare in case of error here,
> since an error here is essentially fatal in this path with no unwind
> possibility.
> 
> https://lore.kernel.org/all/38d7191f-e4bf-4457-9898-bb2b186ec3c7@quicinc.com/
> 
> However to satisfy this smatch warning/error, we may need to revert back to
> the adding the unprepare call in case of error. Request Russel to comment as
> well if this is fine.

Thanks, I had missed that.

I don't think there is a need to update the code just to make Smatch happy.
Only if there is a real problem. Which, with the discussion at the link
above in mind, does not seem to be the case here.

> Is it possible to share the log/command-options of the smatch failure so
> that we can reproduce this? Thanks.

Sure, I hope this answers your question.

Smatch can be found here https://github.com/error27/smatch/

And I invoked it like this:
$ PATH=".../smatch/bin:$PATH" .../smatch/smatch_scripts/kchecker drivers/net/pcs/pcs-qcom-ipq9574.o

Which yields the following warning:
drivers/net/pcs/pcs-qcom-ipq9574.c:283 ipq_pcs_enable() warn: 'qpcs_mii->rx_clk' from clk_prepare_enable() not released on lines: 280.




