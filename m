Return-Path: <linux-arm-msm+bounces-48326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9191A39444
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 09:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06F3D3A9CCF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 08:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E1A02135AF;
	Tue, 18 Feb 2025 08:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QBPxIjEc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA322116E1;
	Tue, 18 Feb 2025 08:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739865631; cv=none; b=Jy9bDcl/w/jREkEw4LC7Q/Q0MeMSdJefrDh2337X8xRCzZK4TJHcUxoqqYh19OXumqEi/53b7SX4maewB3DKyxyD3V26cvMrbFGOfIiBPxjlgS6yXwd1qugAaqv4/hVncxtXgwOo+mTSbS6dClAyFuM5qs8StKFjUIgGe2OhVRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739865631; c=relaxed/simple;
	bh=I0anOcqDiwGFt5l5mdb8VFHWp2/hmtNYihzDNh8vqno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lhopy2MR/qsaMXiMkTZYjkF8Bcttjxy79Dv2YdStZRsCPYQlBpQ/X3fd8liQR2Zu3RUkx8UwxkcUKtsds6dpPNbI8DS3J4VbT0cEfTwuIx9mw4r5rOnYNcpovQxRa7o/LxPQ5pPZHgKu6NIsBJjDLvaejat7JnfhcszCnX8Nsy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QBPxIjEc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91ACC4CEE2;
	Tue, 18 Feb 2025 08:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739865630;
	bh=I0anOcqDiwGFt5l5mdb8VFHWp2/hmtNYihzDNh8vqno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QBPxIjEcSlpIhsKX+E+R//HjzDtL6p90hNkOiPLPpXiu88Tbbi2Cuz2BEKoj85Pin
	 74y3WLPGRuwmBz10Kyk+r6XISwVkHP/lrmIWbCWqd0rJHJUk2YfFKfQ+Q9SLvPC5rV
	 hz3EZncYapJBVcHir4zYpJUbAFYohOWsS0dB/GEo=
Date: Tue, 18 Feb 2025 09:00:27 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
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
Message-ID: <2025021807-equipment-ignition-017f@gregkh>
References: <20250206-x1e80100-ps8830-v6-0-60b1e49cfa8d@linaro.org>
 <20250206-x1e80100-ps8830-v6-2-60b1e49cfa8d@linaro.org>
 <Z68EUTlHcm6TxjlY@hovoldconsulting.com>
 <Z7Q8xwcfeE3tcBLL@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7Q8xwcfeE3tcBLL@hovoldconsulting.com>

On Tue, Feb 18, 2025 at 08:54:47AM +0100, Johan Hovold wrote:
> On Fri, Feb 14, 2025 at 09:52:33AM +0100, Johan Hovold wrote:
> > On Thu, Feb 06, 2025 at 11:28:28AM +0200, Abel Vesa wrote:
> > > The Parade PS8830 is a USB4, DisplayPort and Thunderbolt 4 retimer,
> > > controlled over I2C. It usually sits between a USB/DisplayPort PHY
> > > and the Type-C connector, and provides orientation and altmode handling.
> 
> Turns out Greg had picked this one up 20 minutes before I sent my
> comments. I did see Heikki's ack the day before and realised time was
> short but was not able to drop everything and review the last revision
> due to meetings that afternoon.
> 
> Well, well, I guess you can say I only have myself to blame for not
> reviewing within a week of the last revision being posted.

I can revert it if you want me to, or an incremental fix, your call.

thanks,

greg k-h

