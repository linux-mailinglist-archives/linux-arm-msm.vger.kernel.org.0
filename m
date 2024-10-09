Return-Path: <linux-arm-msm+bounces-33703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1885A996D81
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 16:20:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F8EF1C20E74
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 14:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD5819DF9E;
	Wed,  9 Oct 2024 14:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SnRUwg6O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E3418BBAE;
	Wed,  9 Oct 2024 14:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728483626; cv=none; b=is5vAhGUvpi+3DDXeIG4wR8rUI2u6Ryxr8Hfckb6mS2N882sbeEMPiov7p/0D52JAbP0kLxotWwjOu6eW8AkBdVtsqEP6+ewhwZHSDJgREhpdhZQ49kmeqPgD93tW24Yj2jDBzzqlH4NbyUer76km8N3L0ycrHvH3cY49P/LqIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728483626; c=relaxed/simple;
	bh=CPs7xb8M4miYJkVVcyu7vU+DrbxBnA28RC1rvErx2Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxcvEn45yX9ZojfezTAoIZAmLO93lFmSNjOJi7M99zTCPtYxxUlwMHY3iT/0vhZ6F9tR2cCzOG1hArwMOegp1WzqzBHYJmqJdwiQRyOSwh/IgTC3Eio5vbQslMHVavisw3iFrzervWbDEBbeIGgBYMNQEp8PHy8oeJoz1I9CpQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SnRUwg6O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B055AC4CEC3;
	Wed,  9 Oct 2024 14:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728483626;
	bh=CPs7xb8M4miYJkVVcyu7vU+DrbxBnA28RC1rvErx2Yo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SnRUwg6OYLw8XhkgMkayc1m16o4Tmj2UWLpP+NGVdL9MNSlxLCTbLIsUCH+6gCi5o
	 2ArGFutZvqYcOR3SrjfEDkTRx4ovscAzoZeiOTPr8vU1M34T8Ut4eUKXGSSLcnmtyq
	 JLfL/Cx9bqQqRhknkc2b1n9OyDoDZzMaYEb9RXJ5hi3n7N8uNx4ALzIYs6xKfB47md
	 D2l8j8elmsZUwCi1BnkCRGvi8B8IAKiSHYRP/XBqRIHeWjMLSOERmWD7DUtFqCus8P
	 eNCxYSQPUyrmycFHJnaSXuczaVfSY31LvrlfbqbdSZ7cXazF5XcrbBzh7uf6xmrY2E
	 Vw7kEIZ/r22og==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1syXYE-000000003nX-1TnR;
	Wed, 09 Oct 2024 16:20:30 +0200
Date: Wed, 9 Oct 2024 16:20:30 +0200
From: Johan Hovold <johan@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 5/7] serial: qcom-geni: fix rx cancel dma status bit
Message-ID: <ZwaRLoz-D5ZAshxl@hovoldconsulting.com>
References: <20241001125033.10625-1-johan+linaro@kernel.org>
 <20241001125033.10625-6-johan+linaro@kernel.org>
 <CAD=FV=V9FfwKREBfBbCRiqH3y2K=oTfQPj1Nx1paxrVwFD-efg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=V9FfwKREBfBbCRiqH3y2K=oTfQPj1Nx1paxrVwFD-efg@mail.gmail.com>

On Thu, Oct 03, 2024 at 12:55:39PM -0700, Doug Anderson wrote:
> On Tue, Oct 1, 2024 at 5:51 AM Johan Hovold <johan+linaro@kernel.org> wrote:

> >  #define RX_DMA_PARITY_ERR              BIT(5)
> >  #define RX_DMA_BREAK                   GENMASK(8, 7)
> >  #define RX_GENI_GP_IRQ                 GENMASK(10, 5)
> > -#define RX_GENI_CANCEL_IRQ             BIT(11)
> >  #define RX_GENI_GP_IRQ_EXT             GENMASK(13, 12)
> > +#define RX_GENI_CANCEL_IRQ             BIT(14)
> 
> This looks right, but do you want to fix all the rest of the wrong
> bits in this list while you're at it? Things look OK up to the
> "RX_FLUSH_DONE" and then they're wrong. Specifically:
> 
> * My datasheet doesn't have RX_DMA_PARITY_ERR. Unless maybe it's one
> of the "GP" IRQs?

As you noticed, this one appears to be correct.

> * My datassheet doesn't have RX_DMA_BREAK. Unless maybe it's one of
> the "GP" IRQs (though why would it be two bits big?)

And same here, apparently one is break on and the other break off.

> * RX_GENI_GP_IRQ is 12:5, not 10:5
> 
> * My datasheet has RX_GENI_CMD_FAILURE as BIT(15).

I'll just leave the rest as is for now.

Johan

