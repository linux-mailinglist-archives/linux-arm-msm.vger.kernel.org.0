Return-Path: <linux-arm-msm+bounces-31126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA5596F542
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 15:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E8A61C21895
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 13:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D527A1CCB52;
	Fri,  6 Sep 2024 13:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Epd3SEJr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41CD1CB152;
	Fri,  6 Sep 2024 13:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725628973; cv=none; b=khT4RwTA6iKQVQO3DGz1evaUd9DktNDrcLSDLMZSuCVcWsosipYqLB7E+guiuSgnliKkFPBhfMOxw4q6zUZs1ri0AEt2imBgJw/yEKmZZOvuHAJVQOcR5Hqw5LlLBX809YxiTW7sqXP3ueB6jc1tl9+/aWyATjKDBrvG0lSiTA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725628973; c=relaxed/simple;
	bh=JDmBHPj1HrviHpsBth47Mh3SpMcphfBrini6DQfLS5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SxmKcsrv36XJPBuIIFQvTMDNX/74Z+0EaduPWBjnT9n4Up51ulJv3cxIDFQKGoPTzGp0ZiGQYJtVAZ2EgtfraY6XKh3Ch/+uNrI/Z//nV+tRlre5i9QlDB8EmnoC/7c+6g4COyWTqqc55CLdwDKkuLGGgEOzAKeTwUfjsQtzI0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Epd3SEJr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18811C4CEC5;
	Fri,  6 Sep 2024 13:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725628973;
	bh=JDmBHPj1HrviHpsBth47Mh3SpMcphfBrini6DQfLS5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Epd3SEJrAmPTNU7JgpsG4qMf3SvOOVKQCYIzJd2v8fHp/7Pv427Q2IKQIwBnEXcsn
	 GXBw8OpUrglc2cQ9xakivYLs0TbfopWWzeVo43yaR2UIiplTZorW7q6HhOOBF9qQDg
	 9l5c4OYFqRV24EK/lj9rZ9D+psCqSkdOgCTRy7Qlxbua37EWAzRH9vMvlBIfDUqhw+
	 /3hCOgPdFqxS0lizq6chMeWGIqB9tHaDroLYMGlTaj5M5Mr5WsFx/jwKea1fqzbWYl
	 R3O7vlM/SYp79aeHUpBzX+uCv4s0z8EKQvzF5+xkZeRkBywKAN+f/84om1bfSEsx/R
	 B1j6G7cwUNU8Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1smYvg-000000006Gj-45eo;
	Fri, 06 Sep 2024 15:23:13 +0200
Date: Fri, 6 Sep 2024 15:23:12 +0200
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
Subject: Re: [PATCH 1/8] serial: qcom-geni: fix fifo polling timeout
Message-ID: <ZtsCQL_-SzmSo6ik@hovoldconsulting.com>
References: <20240902152451.862-1-johan+linaro@kernel.org>
 <20240902152451.862-2-johan+linaro@kernel.org>
 <CAD=FV=WDx69BqK2MmhOMfKdEUtExo1wWFMY_n3edQhSF7RoWzg@mail.gmail.com>
 <ZtlwTQNZTdyzBChw@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtlwTQNZTdyzBChw@hovoldconsulting.com>

On Thu, Sep 05, 2024 at 10:48:13AM +0200, Johan Hovold wrote:
> On Wed, Sep 04, 2024 at 02:50:57PM -0700, Doug Anderson wrote:

> > How about this: we just change "uport->fifosize" to account for the 3
> > extra words? So it can be:
> > 
> > ((port->tx_fifo_depth + 3) * port->tx_fifo_width) / BITS_PER_BYTE;
> > 
> > ...then the cache will be correct and everything will work out. What
> > do you think?
> 
> I don't think uart_fifo_timeout traditionally accounts for the shift
> register and we wait up to *twice* the time it takes to clear to fifo
> anyway (in wait_until_sent). The intermediate register I found here
> could perhaps be considered part of the fifo however.
> 
> I'll give this some more thought.

I decided to keep the fifo size as-is (e.g. as it is exported to user
space) and only account for the shift and intermediate registers in the
driver. I'm using the fifo size reported by the hardware to determine
the timeout in v2.

Johan

