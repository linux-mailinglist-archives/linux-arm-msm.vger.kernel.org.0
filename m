Return-Path: <linux-arm-msm+bounces-35558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D7B9AC0AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 09:52:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B4B62841F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 07:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935AF1553AB;
	Wed, 23 Oct 2024 07:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L90gIJIJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61571146A79;
	Wed, 23 Oct 2024 07:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729669929; cv=none; b=r7MhXGF3HCz1q+HnL7Jdvrf8ksF3flPYCyCmEgD+Rm5j8LcWGaL1ruZJoIbxLd5JR6nHjC6x5jxdUvNIMPr893E9qIKMVbxW0YFO1NJHRglQG0sAXZbRdQeWMYV4KLQG/XNFvBtoBxYXRIRoPFZNHBUHszPzdJLB8ruW3TGmeQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729669929; c=relaxed/simple;
	bh=24me8MVMaiRszvNXgYRBz2KbXeQ/XF+dxepHOLzjfS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lyn9XCLPI/KsuCgymCK2dyn6LMfaXS96JD8lcXw743gdQC8ci00etQyqRrXS3tBUBsFhWeQZY4f9FB0Pqqdc8y/xiCU1HN4+O4bYqjrWDz1uuCFv0H0+Mi7/fIZlEEByGO77RB+1NhyAuHNSFVvdg97xa6u3Mtv/Hy4Q4TVY1LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L90gIJIJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7CB6C4CEC7;
	Wed, 23 Oct 2024 07:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729669929;
	bh=24me8MVMaiRszvNXgYRBz2KbXeQ/XF+dxepHOLzjfS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L90gIJIJqu5h3YgGqn1eCMj/01/kIelpStqNmWzGSwIGPB4fOrbu5sVnVTtM8sXfJ
	 1oRa33NnS6DxF9BwaAuE2MBTOBZ2ks3l1o/W+iXHLvw91vGXTdLx9xVutNPZZlBdZn
	 iFfoLRAYzKny42eGxWwbMtGiVoW3cyO7+w6pvXAWhomVXyiME8gja2BKmiWa1q6S3H
	 6nYXg1dz0Mbj4vQexSNvdcDqtC1MXUgNNEkfrOZ5GG7wTvltkQsACw0sAXsWpDvbXc
	 9Jvpii6h8jl3Yk2vLJjftLhiuvmatq+rLv0bOngm1DoQ2cT07mQnLJC3yJDrTytsmt
	 b+MwktIfrFjlQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t3WAF-000000002yU-3ZRz;
	Wed, 23 Oct 2024 09:52:20 +0200
Date: Wed, 23 Oct 2024 09:52:19 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: Add support for Parade PS8830 Type-C
 Retimer
Message-ID: <ZxirM9HJELXGWVqv@hovoldconsulting.com>
References: <20241004-x1e80100-ps8830-v2-0-5cd8008c8c40@linaro.org>
 <20241004-x1e80100-ps8830-v2-2-5cd8008c8c40@linaro.org>
 <Zw5oEyMj6cPGFDEI@hovoldconsulting.com>
 <Zxdp2vHzREJAFkwj@linaro.org>
 <Zxif6vmh8BE_C-_n@hovoldconsulting.com>
 <ZximeTNi7huc95te@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZximeTNi7huc95te@linaro.org>

On Wed, Oct 23, 2024 at 10:32:09AM +0300, Abel Vesa wrote:
> On 24-10-23 09:04:10, Johan Hovold wrote:
> > On Tue, Oct 22, 2024 at 12:01:14PM +0300, Abel Vesa wrote:
> > > On 24-10-15 15:03:15, Johan Hovold wrote:
> > > > On Fri, Oct 04, 2024 at 04:57:38PM +0300, Abel Vesa wrote:
> > 
> > > > > +	ret = ps8830_get_vregs(retimer);
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > > +
> > > > > +	retimer->xo_clk = devm_clk_get(dev, "xo");
> > > > > +	if (IS_ERR(retimer->xo_clk))
> > > > > +		return dev_err_probe(dev, PTR_ERR(retimer->xo_clk),
> > > > > +				     "failed to get xo clock\n");
> > > > > +
> > > > > +	retimer->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> > > > 
> > > > The reset line is active low and should be described as such in DT. So
> > > > here you want to request it as logically low if you want to deassert
> > > > reset.
> > > 
> > > This is being reworked in v3 as we need to support cases where the
> > > retimer has been left enabled and initialized by bootloader and we want
> > > to keep that state until unplug event for the cold-plug orientation
> > > to work properly.
> > > 
> > > On top of that, we don't want to deassert the reset here. We do that
> > > via gpiod_set_value() call below, after the clocks and regulators have
> > > been enabled.
> > 
> > Ok, but you should generally not drive an input high before powering on
> > the device as that can damage the IC (more below).
> 
> This is just not true, generally. Think of top level XTALs which feed in
> clocks (and can't be disabled) before ICs are enabled.

I'm talking about an I/O pin here, you must generally not drive those
high before powering on the IC.

And AFAIU the same applies to clocks even though the risk of damage
there is lower.

> > That is, in this case, you should not deassert reset before making sure
> > the supplies are enabled.
> 
> Wrong. Even the data sheet of this retimer shows in the timigs plot the
> reset as being asserted before the supplies are enabled.

Reset *asserted*, yes (i.e. pull to ground). Not *deasserted* (i.e.
drive high) as you are doing here.

> And generally speaking, the reset needs to be asserted before the
> supplies are up, so that the IC doesn't start doing any work until
> the SW decides it needs to.

Again, the problem is that you are *deasserting* reset before enabling
the supplies.

Johan

