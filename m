Return-Path: <linux-arm-msm+bounces-48349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D45A39E0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 14:56:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFE433A172D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 13:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B75B267387;
	Tue, 18 Feb 2025 13:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eh77LHYh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681F138DF9;
	Tue, 18 Feb 2025 13:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739886732; cv=none; b=fQS/AizV5ekdKnX6OCdOubG4OYgLCmreolql1ic8WlWFTG5eopOece0iSLxN0UOJUjoUkCczjcw1o9Ha+DeqWKQUwicWemGWAFXgiATKMzHQ65yv5/Oct8eix8b6pAkiyyL2iEHMKvEpInus/Ak9ArWHtbllk0HMw9OhoxvahP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739886732; c=relaxed/simple;
	bh=6os8B4XbcvZxjfjyCSazf2jcK8wpCRHlXqzF/FXZmYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FdDZbMqjCAE1AoC2LAoA/m7VjR+5IlphQYMwsYPRFYRd3hfhxcm7YPGF1oiv1U0ctXUwaDYXzza/+iffb8DEyryLxMDZ6r9dvaKCZZI3c3ILGhQ5RvNR1FIgN+TcDOLX0jPyIjqiByNxlQXVj37HqgqYbFRrG2UOhs1Fk6Mgadk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eh77LHYh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61A7C4CEE7;
	Tue, 18 Feb 2025 13:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739886731;
	bh=6os8B4XbcvZxjfjyCSazf2jcK8wpCRHlXqzF/FXZmYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eh77LHYh56PLxmjWomqLix3Gly0tjESwTi3B8tKNuKNMczXX8PFMlXUW6hJ6w+WoJ
	 GuSB3UBkh41GWieXtuPzcbt0qffqiRCfIrTpnVRmdfPS22iZE6I2r8wpC4gPp+DfOD
	 Jwaosf6I+SHvH1zp6yGVJP6E47HCsauQcdJWavGVvVVwZczE5SRgW6zInPZrx/ZsUY
	 wQHqxinOne0bmMGiE7/nzfwL/dh7K7/EHNhks681vW/2Nl8Z6zxzvXr3jegxsth0o4
	 Mb5qOATzsJdaSmg0YB2/+G3uhQ2ZedZc6p/ecNvvP0Nu0M69EwT8PeEm33rdBUyXy2
	 KQ0eB5ljU2Mmg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tkO1L-000000003WT-3L5a;
	Tue, 18 Feb 2025 14:52:19 +0100
Date: Tue, 18 Feb 2025 14:52:19 +0100
From: Johan Hovold <johan@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Abel Vesa <abel.vesa@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 2/2] usb: typec: Add support for Parade PS8830 Type-C
 Retimer
Message-ID: <Z7SQk2UmuXo3jfBQ@hovoldconsulting.com>
References: <20250206-x1e80100-ps8830-v6-0-60b1e49cfa8d@linaro.org>
 <20250206-x1e80100-ps8830-v6-2-60b1e49cfa8d@linaro.org>
 <Z68EUTlHcm6TxjlY@hovoldconsulting.com>
 <Z7Q8xwcfeE3tcBLL@hovoldconsulting.com>
 <Z7RSYqQx72v-sPSt@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7RSYqQx72v-sPSt@linaro.org>

On Tue, Feb 18, 2025 at 10:26:58AM +0100, Stephan Gerhold wrote:
> On Tue, Feb 18, 2025 at 08:54:47AM +0100, Johan Hovold wrote:
> > On Fri, Feb 14, 2025 at 09:52:33AM +0100, Johan Hovold wrote:
> > > On Thu, Feb 06, 2025 at 11:28:28AM +0200, Abel Vesa wrote:
> > > > The Parade PS8830 is a USB4, DisplayPort and Thunderbolt 4 retimer,
> > > > controlled over I2C. It usually sits between a USB/DisplayPort PHY
> > > > and the Type-C connector, and provides orientation and altmode handling.
> > [...]
> > > > +	/* skip resetting if already configured */
> > > > +	if (regmap_test_bits(retimer->regmap, REG_USB_PORT_CONN_STATUS_0,
> > > > +			     CONN_STATUS_0_CONNECTION_PRESENT) == 1)
> > > > +		return gpiod_direction_output(retimer->reset_gpio, 0);
> > > 
> > > I'm still a little concerned about this. Won't you end up with i2c
> > > timeout errors in the logs if the device is held in reset before probe?
> > 
> > You should be able to use i2c_smbus_read_byte() to avoid logging errors
> > when the boot firmware has *not* enabled the device.
> 
> FWIW, regmap_test_bits() doesn't seem to print any errors either, so I
> don't think switching to i2c_smbus_read_byte() is necessary.

Thanks for checking.

> Since I was curious, I tried booting the X1E80100 with
>  1. One PS8830 instance left as-is
>  2. One PS8830 instance changed to invalid I2C address
>  3. One PS8830 instance changed to have reset pin asserted via pinctrl
> 
> There are no errors whatsoever, even for the one with invalid I2C
> address. In other words, the slightly more concerning part is that the
> driver doesn't check that any of the regmap reads/writes actually
> succeed.

Indeed.
 
> The diff I used for testing is below. (1) prints "skipping reset", (2)
> and (3) print "continuing reset".

And thanks for confirming.

I've found a few more issues that should be addressed so I'm preparing
follow-up series.

Johan

