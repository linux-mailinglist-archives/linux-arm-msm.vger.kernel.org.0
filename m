Return-Path: <linux-arm-msm+bounces-48327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C69A39530
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 09:25:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 847183B48B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 08:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA2022B8DB;
	Tue, 18 Feb 2025 08:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8/27QDN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3BC22B8AA;
	Tue, 18 Feb 2025 08:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739866627; cv=none; b=j2kc/HZgStDjPy/wlcuWENQOeGDQo4InqA/bEJaIRlxR+Py0B/rLi3v1HpBYnIi+8kxZ88NJ4FHkg1KyOXajVTnhDybQrkamutBj+D1bQgyHBvqNPmzfj0A6A/3k/5YuwPZUPGfvUNKqN49U82ZpqzHWcUDusc2DrXI4ThJ2dDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739866627; c=relaxed/simple;
	bh=unAtoMZ/6LB+ku15iDriUMC7ier19fz8oDz6eJJnpjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F8wS1WHb3meBewYeI7ufU0pjVwM5Z8FU251HuWgsQheBbAp75ixSB++7KHjI9OtPWkXb37puWqpC4op9qG+uF22CxYzjs5TIjLFIViYyDvu0tPzNMQGRPsagHoPD7M5t04UePkSWQWIpaE3UWmFyLfrMlCLKyBKFhYVdHD4JyYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8/27QDN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97349C4CEE2;
	Tue, 18 Feb 2025 08:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739866626;
	bh=unAtoMZ/6LB+ku15iDriUMC7ier19fz8oDz6eJJnpjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W8/27QDN9jps1nyShhUPWS3f5RCyhj0k3K7aVVPA4GxyepEwMBiyAwv/VBChpTdhA
	 /wE5ZLeiJpqRVyoMvLLdG0IT1IJitAcKhTjPght7fqvhd2w9Zdbu1zIqSz6ui40/xM
	 RHpJHSr4qGf5xRsxmYJHahQoeiKXQ0hgHzZS2wCRcX28q1xt1CTQizsn7jU3tFnr0B
	 wXg5KMM7PAwuT8aJ6PZwzcQ6ty1RUQX2RSvW0tCip2d3axeAeypUufgF0XyAo7T1qf
	 HWPi47RJIcozlOD4W/Lv3zqNF3I2zI0/0tWwxecdXQnRmMPcg3xx4xrv3Ua3b0XySp
	 VT8QUDvfqaByg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tkIn2-000000001v6-4ALR;
	Tue, 18 Feb 2025 09:17:13 +0100
Date: Tue, 18 Feb 2025 09:17:12 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Message-ID: <Z7RCCF58RTsyr-eN@hovoldconsulting.com>
References: <20250206-x1e80100-ps8830-v6-0-60b1e49cfa8d@linaro.org>
 <20250206-x1e80100-ps8830-v6-2-60b1e49cfa8d@linaro.org>
 <Z68EUTlHcm6TxjlY@hovoldconsulting.com>
 <Z7Q8xwcfeE3tcBLL@hovoldconsulting.com>
 <2025021807-equipment-ignition-017f@gregkh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025021807-equipment-ignition-017f@gregkh>

On Tue, Feb 18, 2025 at 09:00:27AM +0100, Greg Kroah-Hartman wrote:
> On Tue, Feb 18, 2025 at 08:54:47AM +0100, Johan Hovold wrote:
> > On Fri, Feb 14, 2025 at 09:52:33AM +0100, Johan Hovold wrote:
> > > On Thu, Feb 06, 2025 at 11:28:28AM +0200, Abel Vesa wrote:
> > > > The Parade PS8830 is a USB4, DisplayPort and Thunderbolt 4 retimer,
> > > > controlled over I2C. It usually sits between a USB/DisplayPort PHY
> > > > and the Type-C connector, and provides orientation and altmode handling.
> > 
> > Turns out Greg had picked this one up 20 minutes before I sent my
> > comments. I did see Heikki's ack the day before and realised time was
> > short but was not able to drop everything and review the last revision
> > due to meetings that afternoon.
> > 
> > Well, well, I guess you can say I only have myself to blame for not
> > reviewing within a week of the last revision being posted.
> 
> I can revert it if you want me to, or an incremental fix, your call.

Thanks, but I think Abel should be able to test the
not-enabled-by-boot-firmware case and if needed amend the binding these
next few weeks.

I'll just send an incremental fix for the error handling for now.

And sorry about the rant, just needed to vent some frustration with the
never ending stream of interruptions and unscheduled work...

Johan

