Return-Path: <linux-arm-msm+bounces-30863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5E396D293
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 10:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A66D3287C96
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 08:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11CE1194AEE;
	Thu,  5 Sep 2024 08:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4fGYAAk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FB61527B4;
	Thu,  5 Sep 2024 08:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725526645; cv=none; b=X3xl41KrnXVR69R5WnPn36uKy7QJl+WkEzT1j5LsxvyxV9FO7SRk6NdUerKoJURtLYQFkD+KXxEupLmLt/zKhw5AtibsFH27id0RPRnWzjnEQWqRRSxUbKgxLg6jAWY3YZ2zdvvZ4HTRaCmURpP+9WL7fbe4pvuXV1FkXZ1FszM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725526645; c=relaxed/simple;
	bh=D0mFP2caq38JlwbGu1PkcHf6qzffPArFGJdhnoX/Jtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zlc6445BfiZe7RiOHen+DV0wabPp3xRaq5QUQBWEummIY5MgZmVhNUMsuEfGyx7dv56YMJXgAn01gWeRMscfilHqo3YL4FL2V6NSV5f62uc0A0P6dWTHj2coFVLGK+MK+6+zWc9ZIcZiyCfSd+WNYPJUW5l2AAfBHeWxqCqbiyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4fGYAAk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69854C4CEC7;
	Thu,  5 Sep 2024 08:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725526644;
	bh=D0mFP2caq38JlwbGu1PkcHf6qzffPArFGJdhnoX/Jtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T4fGYAAkdUytSCRkxP8cpYoD4qbG+QlMXmcLspTf1aEc0tzJfF8Zb04oEAE+mxgQd
	 Wp0jBpUjikiMHHkCTewtg/4gSuYL72S5Lnt5A6fRxZRzuOKeltFYrwyFXzIf0Qpj9R
	 /KvUTXP3a/mYhLghKOAyI8Wlytjp1o6d2e+07uhpwq3OzaemTaouIYwVIaZh1otX1M
	 b7gsyfl3DTcDS6/ppH34EQtUs0hCoOOQ35s2MYxAkZ9tyzneh8Bb41Qg0wgvE0kBEh
	 VEijbvOya+9SFTuMnxNy852DvOUoJt4yTnJaGZE+IiilKWEbts/+euY6yGmnFcrT+1
	 9Ilfi7tRplqgQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sm8JB-0000000033S-3VT1;
	Thu, 05 Sep 2024 10:57:42 +0200
Date: Thu, 5 Sep 2024 10:57:41 +0200
From: Johan Hovold <johan@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	=?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>,
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 6/8] serial: qcom-geni: fix console corruption
Message-ID: <ZtlyhQ2HNk8unxNI@hovoldconsulting.com>
References: <20240902152451.862-1-johan+linaro@kernel.org>
 <20240902152451.862-7-johan+linaro@kernel.org>
 <CAD=FV=XnpPnSToWV3f2Z-DWm2-1rdgYmDZeicGGRQD-_YjS2Bw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=XnpPnSToWV3f2Z-DWm2-1rdgYmDZeicGGRQD-_YjS2Bw@mail.gmail.com>

On Wed, Sep 04, 2024 at 02:51:15PM -0700, Doug Anderson wrote:
> On Mon, Sep 2, 2024 at 8:26 AM Johan Hovold <johan+linaro@kernel.org> wrote:
> >
> > +static void qcom_geni_serial_drain_fifo(struct uart_port *uport)
> > +{
> > +       struct qcom_geni_serial_port *port = to_dev_port(uport);
> > +
> > +       if (!qcom_geni_serial_main_active(uport))
> > +               return;
> 
> It seems like all callers already do the check and only ever call you
> if the port is active. Do you really need to re-check?

I wanted to make the helper self-contained and work in both cases. But
since I ended up only using this helper only in the console code and
will need to move it anyway (under the console ifdef), perhaps I can
consider dropping it. But then again, it's just one register read.

> > @@ -308,6 +311,17 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
> >         return qcom_geni_serial_poll_bitfield(uport, offset, field, set ? field : 0);
> >  }
> >
> > +static void qcom_geni_serial_drain_fifo(struct uart_port *uport)
> > +{
> > +       struct qcom_geni_serial_port *port = to_dev_port(uport);
> > +
> > +       if (!qcom_geni_serial_main_active(uport))
> > +               return;
> > +
> > +       qcom_geni_serial_poll_bitfield(uport, SE_GENI_M_GP_LENGTH, GP_LENGTH,
> > +                       port->tx_queued);
> 
> nit: indent "port->tx_queued" to match open parenthesis?

No, I don't use open-parenthesis alignment unless that's the
(consistent) style of the code I'm changing (e.g. to avoid unnecessary
realignments when symbol names change and to make a point about
checkpatch --pedantic warnings not being part of the coding style).
 
> ...also: as the kernel test robot reported, w/ certain CONFIGs this is
> defined / not used.

Yes, I need to move the helper under the console ifdef. I was just
waiting to see if there was any further feedback before respinning.

> Aside from the nit / robot issue, this solution looks reasonable to
> me. It's been long enough that I've already paged out much of the past
> digging I did into this driver, but this seems like it should work.
> Feel free to add my Reviewed-by when the robot issue is fixed.

Thanks for reviewing.

Johan

