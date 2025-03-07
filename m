Return-Path: <linux-arm-msm+bounces-50621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C59A56138
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 07:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0A2F1892DA0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 06:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C152219F13F;
	Fri,  7 Mar 2025 06:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cFNel6mM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAAC1632D9;
	Fri,  7 Mar 2025 06:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741330435; cv=none; b=pt3UUNSO1uH9WiYfFdTExUgpVpfY66Z3v2la/AHSuwBqzc/0NDMf29Ec0i7pMFL7gx1ijUY1LryzhI5CUzC/zJizblYMLwm2ptZDHbtU7VbALOoHdDQXvzYWs9s1l/2KeVzN6AcWFSQdtFZoXRuHIwQ0EsN1S802yJfs4nrWpKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741330435; c=relaxed/simple;
	bh=Ku3RLQwAueSNEXS50bP0tNHE6uDMFZZH4gic+V2x5Pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gGz8wCn6dD1oASkFKmMX7E8N9o5MYc05P/zhq7lEyYKlwS+v8hnXiiaIgv/LiBWcgSc1J+nhCJBfO5zDDxamnxq425xSWIYqmirrB73dEMExBc1kQdE/0/Qfvr96ixsQ9ehco2rma4+vlFbErO45vwq6N2bilGdXZxfP8Rp4VbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cFNel6mM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48561C4CED1;
	Fri,  7 Mar 2025 06:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741330435;
	bh=Ku3RLQwAueSNEXS50bP0tNHE6uDMFZZH4gic+V2x5Pc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cFNel6mMP4L4i8G86t9ImyWXdgHWblwMx98UtX32Ipxze8hr8714olbFhXRLDkfmi
	 U6GZ3D47ONWY6c/eB8iWMQORlBpiBj90+qZCuYBUxG9KXyh+UmipqaDrv4M8usHPb6
	 gf+bOqQEeUWoalgd7tdGu8f9O9O0XpE94rXZXhMM=
Date: Fri, 7 Mar 2025 07:52:39 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Viken Dadhaniya <quic_vdadhani@quicinc.com>, jirislaby@kernel.org,
	johan+linaro@kernel.org, dianders@chromium.org,
	konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Subject: Re: [PATCH v1] serial: qcom-geni: Remove alias dependency from qcom
 serial driver
Message-ID: <2025030758-efficient-pledge-ba4c@gregkh>
References: <20250304071423.4033565-1-quic_vdadhani@quicinc.com>
 <tn6czifetdf2mg5gl3mhfpwcb6q7dkn5r4kgqln6evm4qdsjvi@ehpl3qj3axvw>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tn6czifetdf2mg5gl3mhfpwcb6q7dkn5r4kgqln6evm4qdsjvi@ehpl3qj3axvw>

On Tue, Mar 04, 2025 at 11:45:53AM -0600, Bjorn Andersson wrote:
> On Tue, Mar 04, 2025 at 12:44:23PM +0530, Viken Dadhaniya wrote:
> > Remove the dependency on aliases in the device tree configuration for the
> > qcom serial driver. Currently, the absence of an alias results in an
> > invalid line number, causing the driver probe to fail for geni serial.
> > 
> > To prevent probe failures, implement logic to dynamically assign line
> > numbers if an alias is not present in the device tree for non-console
> > ports.
> > 
> 
> Please read and follow https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> 
> Start with your problem description, then a description of your proposed
> solution.
> 
> > Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> > ---
> >  drivers/tty/serial/qcom_geni_serial.c | 26 +++++++++++++++++++++++---
> >  1 file changed, 23 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> > index a80ce7aaf309..2457f39dfc84 100644
> > --- a/drivers/tty/serial/qcom_geni_serial.c
> > +++ b/drivers/tty/serial/qcom_geni_serial.c
> > @@ -98,6 +98,8 @@
> >  
> >  #define DMA_RX_BUF_SIZE		2048
> >  
> > +static DEFINE_IDR(port_idr);
> 
> You're just looking for a index allocator, so DEFINE_IDA() is probably
> what you want to use.
> 
> 
> That said, theoretically I think we could get 24 GENI serial instances
> in a system. Making this a huge waste of memory and CPU cycles.
> 
> An empty idr takes 88 bytes, if you then allocate 1 entry it grows with
> at least one xa_array node which is 576 bytes.
> 
> > +
> >  struct qcom_geni_device_data {
> >  	bool console;
> >  	enum geni_se_xfer_mode mode;
> > @@ -253,10 +255,25 @@ static struct qcom_geni_serial_port *get_port_from_line(int line, bool console)
> >  	struct qcom_geni_serial_port *port;
> >  	int nr_ports = console ? GENI_UART_CONS_PORTS : GENI_UART_PORTS;
> >  
> > -	if (line < 0 || line >= nr_ports)
> > -		return ERR_PTR(-ENXIO);
> > +	if (console) {
> > +		if (line < 0 || line >= nr_ports)
> > +			return ERR_PTR(-ENXIO);
> > +
> > +		port = &qcom_geni_console_port;
> > +	} else {
> > +		int max_alias_num = of_alias_get_highest_id("serial");
> > +
> > +		if (line < 0 || line >= nr_ports)
> > +			line = idr_alloc(&port_idr, (void *)port, max_alias_num + 1, nr_ports,
> > +					 GFP_KERNEL);
> > +		else
> > +			line = idr_alloc(&port_idr, (void *)port, line, nr_ports, GFP_KERNEL);
> > +
> > +		if (line < 0)
> > +			return ERR_PTR(-ENXIO);
> >  
> > -	port = console ? &qcom_geni_console_port : &qcom_geni_uart_ports[line];
> > +		port = &qcom_geni_uart_ports[line];
> 
> Plus qcom_geni_uart_ports[] is GENI_UART_PORTS long. So you will
> actually only have a maximum of 3 ports.
> 
> 
> I like the change, but please replace port_idr with a u32 and use
> linux/bitmap.h to implement the port allocation scheme.

No, stick with an ida as that is what that is for and has the proper
locking built in, no need to "hand code" something as simple as a
numbering allocator with a bitmap.

thanks,

greg k-h

