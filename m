Return-Path: <linux-arm-msm+bounces-25629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA3192BA01
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 14:55:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C0FF1F228F0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 12:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD1115A874;
	Tue,  9 Jul 2024 12:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kl4XmHic"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F3E14884D;
	Tue,  9 Jul 2024 12:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720529698; cv=none; b=JxIsLWMT1xHk3KmlT6y/ATBE0vipzmdFaa3ErS0JVsChE0/2ftyFz554blqzo850bDziuUbLgk/d9XU1i7sD8LgJ5a+b1c2rnDz3xnW3XVTRSNyEHEMtq9cg84SjG85cvDKD42IND92rAwpPt/tNZO8y3BN57AxAa2uNm2lGYEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720529698; c=relaxed/simple;
	bh=ojwoScKbA6jM3k3wAvAPA697WZdlKuoGgCa0YUZCL/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kdl2iua8b7SIRuWVsqEiSU6R4id23y3A5D7px+Uqj+kLz2M8M/8nOb4BqOkBeZs7kfSW4GnV4oG/g2qfD1QTH+pqfBZ6FKOMAp4s8I8ELa39HP83vAs/SN+gCBhksyO+Q3lOTXA6pW29tcCtymz0rNXKSD2wOtHdjeUdfXI9Ypk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kl4XmHic; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A042CC3277B;
	Tue,  9 Jul 2024 12:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720529698;
	bh=ojwoScKbA6jM3k3wAvAPA697WZdlKuoGgCa0YUZCL/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kl4XmHic631h2HbHMXgXeiuoY0DoGPozip1bX9XU+luvZi6lLea0RIcaLuptuj1+u
	 AIRbeGJTCId+l+I4M4AghWCktwBA45QaBXBuKWpE/BimZ9FCdU6efh45kd/hu5St+C
	 X5yJC7N4gPqYUm9Z1S11hyaOvMjdqrESXAu9uDSSwCv+trLIQb88Wl0IMRYmNblfhQ
	 raCWA/5KStcU8zUERl0uRcCXcJmts7jYPMpyYFpLeFV0NTAKHlqC2FPehcqKlXsnbg
	 U+rV2Rq3ISOoah5Oda9pW9XkiQL4w+L7WblCrClOCQh4nZUJXilvdkLwyZFtPlVoLC
	 pCWxbMPH09dMA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sRAN5-000000003fh-12PE;
	Tue, 09 Jul 2024 14:55:03 +0200
Date: Tue, 9 Jul 2024 14:55:03 +0200
From: Johan Hovold <johan@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] serial: qcom-geni: do not kill the machine on
 fifo underrun
Message-ID: <Zo0zJ8icZO9VFG8h@hovoldconsulting.com>
References: <20240704101805.30612-1-johan+linaro@kernel.org>
 <20240704101805.30612-4-johan+linaro@kernel.org>
 <CAD=FV=VHOTQKNNbkWX17o57weP_wTm__MCSGPhFHQ+uG1CD+Bw@mail.gmail.com>
 <Zo0Gco1igkL185US@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zo0Gco1igkL185US@hovoldconsulting.com>

On Tue, Jul 09, 2024 at 11:44:18AM +0200, Johan Hovold wrote:
> On Mon, Jul 08, 2024 at 04:59:59PM -0700, Doug Anderson wrote:
> > On Thu, Jul 4, 2024 at 3:19 AM Johan Hovold <johan+linaro@kernel.org> wrote:

> > > @@ -878,7 +878,7 @@ static void qcom_geni_serial_send_chunk_fifo(struct uart_port *uport,
> > >                 memset(buf, 0, sizeof(buf));
> > >                 tx_bytes = min(remaining, BYTES_PER_FIFO_WORD);
> > >
> > > -               tx_bytes = uart_fifo_out(uport, buf, tx_bytes);
> > > +               uart_fifo_out(uport, buf, tx_bytes);
> > 
> > FWIW I would have rather we output something much more obviously wrong
> > in this case instead of a NUL byte. Maybe we should fill it with "@"
> > characters or something? As you said: the driver shouldn't get into
> > this error condition so it shouldn't matter, but if we have a bug in
> > the future I'd rather it be an obvious bug instead of a subtle bug.
> 
> Yeah, I've been running with a patch like that locally in my tests, and
> went a bit back and forth whether I should post it. My reasoning for not
> doing so was that the bugs have been fixed so we don't need to spend
> cycles on memsetting the buffer to anything but NUL (I used 'X' in my
> testing).
> 
> I guess that can be avoided by only padding the buffer if we ever hit an
> underrun, but I still thinks it's questionable to spend the effort as
> this is not something that should be needed. In any case, I didn't want
> to spend time on it to fix the 6.10 regressions.
> 
> Killing the machine is perhaps an effective way to get attention to an
> issue, but I'd much rather have an occasional NUL character in the log
> *if* this ever becomes an issue at all again.
> 
> > I'm happy to post a patch or provide a Reviewed-by if you want to post
> > a patch. Let me know.
> 
> If you feel strongly about this, I can either fill the buffer with
> something else than NUL or add error handling for any such future
> hypothetical bugs. What do you prefer?

Actually we just need to clear the buffer on entry, which would do away
with the unnecessary memset() that is there today. This should also give
you a printable indication that something is wrong in case a similar bug
is ever reintroduced (e.g. the last four characters would be repeated
until the transfer is complete instead of a fixed char like '@').

Perhaps that's good enough as a compromise?

Johan

