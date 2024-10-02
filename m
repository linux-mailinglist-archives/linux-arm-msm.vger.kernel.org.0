Return-Path: <linux-arm-msm+bounces-32910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD86C98CB0A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 04:07:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56C621F22DD2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 02:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 094031C2E;
	Wed,  2 Oct 2024 02:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JFYdmsac"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C90637;
	Wed,  2 Oct 2024 02:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727834823; cv=none; b=ltigP+LxyjWBQ7cz+mMS+D683aCDiCyf5L7AMHj/4vdcTmaKtRcPEAxCx3tO50f6euDFoMyeJXhtFs4S2KIoJs0CSA1mM6wgm5bo+TXkVM1UKczmwv3Lr8TiAwbz97dPq63Z47UYYjEnsb7UEzAIkonDM+jOMKtvrDiLSDrqQrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727834823; c=relaxed/simple;
	bh=fWahksiwWy8BWmjGXrDX1HY0fkbgJUXbBpvPlngMTD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4eRjg5nSq6LvjBl1OXJ5UiwJKGt++hwavpKhSCDjHgX9+JqzMG/YdmHq98V5T8ch62rbkx5qUILw7cvE+4AQ12qNJPdpdAk6KkWUa9AqgGTNPosIonnPp5YbfeTPULbtkXxV3WkD5ePM/VfIOZvMYwuAknYQ5A9FV+TzXL6a0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JFYdmsac; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CA0AC4CEC6;
	Wed,  2 Oct 2024 02:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727834823;
	bh=fWahksiwWy8BWmjGXrDX1HY0fkbgJUXbBpvPlngMTD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JFYdmsac1TQQAO7ep4Er+4M+d+Ledyr651v6gzJwFCU/TKn+4z9t+9kjhMKL8JZCh
	 ynU6UQR6Z//7Muf2k9MmyPVGwuByi6MyDIQucfEJzd9B0CC8Umk6vxj/MBzKB9IY9F
	 0rANbHp3lNo8bRaaF9Rkwx9uCLvmvF44MrwGZXuHfmm/T10Qxtb2IvhvFxb5Tf7oq4
	 gYgUX8spVoPC9wQhPO5yb6gQpxFXh7PoLbn5euvcINYGe1fU+qxgUpIB6JyqnNtAVO
	 VKNvK46ib9p67UYzziFSjoZUtf/8P+TkAfEQ6J7ZTUxcHhMJCzVO8wIA1xvZus7DZ4
	 SGsIpbCueX1MQ==
Date: Tue, 1 Oct 2024 21:07:00 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: Johan Hovold <johan+linaro@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	stable@vger.kernel.org, Aniket Randive <quic_arandive@quicinc.com>
Subject: Re: [PATCH v2 1/7] serial: qcom-geni: fix premature receiver enable
Message-ID: <ocfbiqmspqlulnxjs7lmmdyq65f2u5dogksqqkmhdq55m3gqyj@7ryn4vrjzemc>
References: <20241001125033.10625-1-johan+linaro@kernel.org>
 <20241001125033.10625-2-johan+linaro@kernel.org>
 <b7c9b01a-3bf7-44f2-be8d-24ef5f3fce74@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7c9b01a-3bf7-44f2-be8d-24ef5f3fce74@quicinc.com>

On Tue, Oct 01, 2024 at 07:20:36PM GMT, Mukesh Kumar Savaliya wrote:
> Thanks Johan for the fixes.
> 
> On 10/1/2024 6:20 PM, Johan Hovold wrote:
> > The receiver should not be enabled until the port is opened so drop the
> > bogus call to start rx from the setup code which is shared with the
> > console implementation.
> > 
> > This was added for some confused implementation of hibernation support,
> > but the receiver must not be started unconditionally as the port may not
> > have been open when hibernating the system.
> > 
> > Fixes: 35781d8356a2 ("tty: serial: qcom-geni-serial: Add support for Hibernation feature")
> > Cc:stable@vger.kernel.org	# 6.2
> > Cc: Aniket Randive<quic_arandive@quicinc.com>
> > Signed-off-by: Johan Hovold<johan+linaro@kernel.org>
> > ---
> >   drivers/tty/serial/qcom_geni_serial.c | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> > index 6f0db310cf69..9ea6bd09e665 100644
> > --- a/drivers/tty/serial/qcom_geni_serial.c
> > +++ b/drivers/tty/serial/qcom_geni_serial.c
> > @@ -1152,7 +1152,6 @@ static int qcom_geni_serial_port_setup(struct uart_port *uport)
> >   			       false, true, true);
> >   	geni_se_init(&port->se, UART_RX_WM, port->rx_fifo_depth - 2);
> >   	geni_se_select_mode(&port->se, port->dev_data->mode);
> > -	qcom_geni_serial_start_rx(uport);
> Does it mean hibernation will break now ? Not sure if its tested with
> hibernation. I can see this call was added to port_setup specifically for
> hibernation but now after removing it, where is it getting fixed ?

Can you explain how you're testing hibernation and on which platform
this is done? I'd like to add this to my set of tests, but last time I
tested I couldn't find a platform where we survived the restore
processes (it's been a while though).

> I think RX will not be initialized after hibernation.

qcom_geni_serial_port_setup() is invoked in multiple places, how come
we don't perform this hibernation-specific operation in
qcom_geni_serial_sys_hib_resume()? (And why is it called hib_resume when
the kernel nomenclature for what it does is "restore"?)

Regards,
Bjorn

> >   	port->setup = true;
> >   	return 0;
> > -- 2.45.2

