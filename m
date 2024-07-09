Return-Path: <linux-arm-msm+bounces-25581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BCE92B443
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 11:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 183B0B22CC0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 09:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2773155314;
	Tue,  9 Jul 2024 09:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EkV4N6ev"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85A713C687;
	Tue,  9 Jul 2024 09:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720518253; cv=none; b=cUe+U57qf0i5GSyBU3kB/1Fq3CyjccxIVF9R3WsVk8xmxZQ2YNZYUBANHxuu+/qpMXJkQGWa2l9/8YbIzBkvYru5HVhf+kffLjxamQI40DFjBxyVEY+NkCcZz+EsOKP/Qz14H0cEl6vY6yNdhYkDMNwNAUK/g3NH1FooTTaa+r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720518253; c=relaxed/simple;
	bh=W4zHrXb6RE7BG7mvWfCC+xXE7F1la9heZuzvlglOIMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fOBm9cW8sCmMigbS0xEwphnUgeq3D3tYgCCqWo3JfziPfHeiZOzTBHkK9Ox03dNunOWvxlHNRlYUadXPRyKIIKMI4wLapgR3Y2o4fvDuM2RwoAqdScuqzNIpXzL5sEUAZsDfXYHWFgJMA8xIuqaKtnv0hat3obRoVrMhqYmtftM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EkV4N6ev; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C987C3277B;
	Tue,  9 Jul 2024 09:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720518253;
	bh=W4zHrXb6RE7BG7mvWfCC+xXE7F1la9heZuzvlglOIMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EkV4N6evEM2MaTmygcwVAjEbuYUtoSbKb0drER2v90WlqzNfK3kAfDdQiHy7LpzFn
	 nKVUrhhV9zTylgTUgBAsX/+xyYTgI5oyPf85WyWI19ww/vl/bR9xiBdYGE/m8FuHvM
	 3MAmHvSsV/n0U1yBcY7v+R/eTuPDlU8LsTODdch9MrF/jtkXisFGWygfxTmEevLIuk
	 YoHQjopjkZw0gOaWLrvWyPy2ahKUZ7jS7pFIFd1q4yqP/RFE5hjixhcbOS/bKLv4hj
	 D+nrcRpfZESNndZ+myPSJhWtdqKGK0Bltp/0hVkY0xurb0wR8UmvzD/Cao3pqy0afs
	 bGEV3juapMv9g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sR7OU-000000005d0-3CVX;
	Tue, 09 Jul 2024 11:44:19 +0200
Date: Tue, 9 Jul 2024 11:44:18 +0200
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
Message-ID: <Zo0Gco1igkL185US@hovoldconsulting.com>
References: <20240704101805.30612-1-johan+linaro@kernel.org>
 <20240704101805.30612-4-johan+linaro@kernel.org>
 <CAD=FV=VHOTQKNNbkWX17o57weP_wTm__MCSGPhFHQ+uG1CD+Bw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=VHOTQKNNbkWX17o57weP_wTm__MCSGPhFHQ+uG1CD+Bw@mail.gmail.com>

On Mon, Jul 08, 2024 at 04:59:59PM -0700, Doug Anderson wrote:
> On Thu, Jul 4, 2024 at 3:19 AM Johan Hovold <johan+linaro@kernel.org> wrote:
> >
> > The Qualcomm GENI serial driver did not handle buffer flushing and used
> > to print discarded characters when the circular buffer was cleared.
> > Since commit 1788cf6a91d9 ("tty: serial: switch from circ_buf to kfifo")
> > this instead resulted in a hard lockup due to
> > qcom_geni_serial_send_chunk_fifo() spinning indefinitely in the
> > interrupt handler.
> >
> > The underlying bugs have now been fixed, but make sure to output NUL
> > characters instead of killing the machine if a similar driver bug is
> > ever reintroduced.
> >
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> >  drivers/tty/serial/qcom_geni_serial.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> > index b2bbd2d79dbb..69a632fefc41 100644
> > --- a/drivers/tty/serial/qcom_geni_serial.c
> > +++ b/drivers/tty/serial/qcom_geni_serial.c
> > @@ -878,7 +878,7 @@ static void qcom_geni_serial_send_chunk_fifo(struct uart_port *uport,
> >                 memset(buf, 0, sizeof(buf));
> >                 tx_bytes = min(remaining, BYTES_PER_FIFO_WORD);
> >
> > -               tx_bytes = uart_fifo_out(uport, buf, tx_bytes);
> > +               uart_fifo_out(uport, buf, tx_bytes);
> 
> FWIW I would have rather we output something much more obviously wrong
> in this case instead of a NUL byte. Maybe we should fill it with "@"
> characters or something? As you said: the driver shouldn't get into
> this error condition so it shouldn't matter, but if we have a bug in
> the future I'd rather it be an obvious bug instead of a subtle bug.

Yeah, I've been running with a patch like that locally in my tests, and
went a bit back and forth whether I should post it. My reasoning for not
doing so was that the bugs have been fixed so we don't need to spend
cycles on memsetting the buffer to anything but NUL (I used 'X' in my
testing).

I guess that can be avoided by only padding the buffer if we ever hit an
underrun, but I still thinks it's questionable to spend the effort as
this is not something that should be needed. In any case, I didn't want
to spend time on it to fix the 6.10 regressions.

Killing the machine is perhaps an effective way to get attention to an
issue, but I'd much rather have an occasional NUL character in the log
*if* this ever becomes an issue at all again.

> I'm happy to post a patch or provide a Reviewed-by if you want to post
> a patch. Let me know.

If you feel strongly about this, I can either fill the buffer with
something else than NUL or add error handling for any such future
hypothetical bugs. What do you prefer?

Johan

