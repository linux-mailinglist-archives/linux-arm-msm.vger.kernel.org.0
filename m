Return-Path: <linux-arm-msm+bounces-33705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D078C996D8D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 16:23:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8824F1F21F82
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 14:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977AA199FDD;
	Wed,  9 Oct 2024 14:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+JAntiq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7A319049B;
	Wed,  9 Oct 2024 14:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728483778; cv=none; b=taXRBf4ken/HqJmQXP0xvkN4BJqiWEmvWrGSOMRgkmMEN0xzuzUBMUcPLfGD1anSJJ5k5ic24TFR5FXidcYU5fOPYUuvS/BcjJr1AFvK+Vp/KhtdjxjloaWGDt8w3y5dGylsQlRTU6zz64G+HN2EwOMsB33mi2Dz5o3kELBZ46Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728483778; c=relaxed/simple;
	bh=wtEsNUmQl3YVDb/bJFbMxGfYT682EXAnciOU7xyHN4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ad88etabzg8GOcy0X1OyqkwOg3YyTgBN3NtC34zHVZxTvoFf1+i0uu8M460Py3sIW/WJOWHW+AM8n1tEBrvH2FnotchA+VcygtTHjd7wVNfPTZHHjnX9SP/iiVBL5zLpeZQhdNLxzjxUKKta6WN5kO4QHVK5RrcRn04dW7yYn3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+JAntiq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E785FC4CEC3;
	Wed,  9 Oct 2024 14:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728483778;
	bh=wtEsNUmQl3YVDb/bJFbMxGfYT682EXAnciOU7xyHN4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l+JAntiq4+YA7crhGkv7KxbR9LIAPtwGlt3ut7OVEZ7YpkOiCBHtvRiBh53IkzVUd
	 DJh2HJK0gSn10cQGk3RCnDCeFQTjFIH9th+e3TjJaDFqWC3w+VYizY2Xlku82aA3CB
	 7P3/9qtdpkl5CVpH57qOBxehqQCL/SwkOqSLFxISffdcXMAsCR7gkMEqP+XEYF3VSy
	 jb40qqnyVc1whbzZtVblPbxJB3Joiqf/lTLx/TwV6URQiaE3diRMBoQUAjhGoUtKoo
	 KMObAvikFPBDBkzu9bNGXsrIjXUXaIONknzXKqbMWUGIn+JpHbW0CLxOSQgW0uRK5L
	 d1nVaMTKjFo/w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1syXaf-000000003pu-21Uh;
	Wed, 09 Oct 2024 16:23:01 +0200
Date: Wed, 9 Oct 2024 16:23:01 +0200
From: Johan Hovold <johan@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 6/7] serial: qcom-geni: drop flip buffer WARN()
Message-ID: <ZwaRxZyAXGR5zRu_@hovoldconsulting.com>
References: <20241001125033.10625-1-johan+linaro@kernel.org>
 <20241001125033.10625-7-johan+linaro@kernel.org>
 <CAD=FV=W9fEQ-g_LWK18SfZq4ZmFN_QbrBCwKRx3BTc0i-UXEcA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=W9fEQ-g_LWK18SfZq4ZmFN_QbrBCwKRx3BTc0i-UXEcA@mail.gmail.com>

On Thu, Oct 03, 2024 at 01:06:43PM -0700, Doug Anderson wrote:
> On Tue, Oct 1, 2024 at 5:51 AM Johan Hovold <johan+linaro@kernel.org> wrote:

> > @@ -570,9 +570,8 @@ static void handle_rx_uart(struct uart_port *uport, u32 bytes, bool drop)
> >
> >         ret = tty_insert_flip_string(tport, port->rx_buf, bytes);
> >         if (ret != bytes) {
> > -               dev_err(uport->dev, "%s:Unable to push data ret %d_bytes %d\n",
> > -                               __func__, ret, bytes);
> > -               WARN_ON_ONCE(1);
> > +               dev_err_ratelimited(uport->dev, "failed to push data (%d < %u)\n",
> > +                               ret, bytes);
> 
> Not that it really matters, but since you're fixing the type of
> "bytes" to %u you probably should fix "ret" to %u too, which means
> changing the type of it? Officially tty_insert_flip_string returns the
> (unsigned) size_t.

Yeah, that was changed recently, but apparently not all callers were
updated. I'll just leave this as is for now too.
 
> As a nit, I'd also say that your error message shouldn't assert "<"
> unless you change your "if" test to "<". It seems safer to use != so
> IMO the printout should also say "!=".

Possibly, but if we ever hit that we have bigger problems.

> I'd hope you're not hitting this error a lot because it means you're
> dropping bytes, but getting rid of the WARN_ON and changing to
> ratelimited makes sense to me.

No, this was just something I noticed when reviewing the function.

Johan

