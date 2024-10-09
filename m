Return-Path: <linux-arm-msm+bounces-33696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3BD996C7D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 15:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 180341C21762
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 13:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5133B199949;
	Wed,  9 Oct 2024 13:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UptuULJ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189D7199921;
	Wed,  9 Oct 2024 13:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728481425; cv=none; b=fx0tdFuH13aUomMOL8bUuTmL/TS35KBW7o6qYUJdvpIWxl9ZauUDmhMf0GccO6DyNXNiYZhAavSrWd79XLiX+HbdUNEfn2/mt56UH+T0YY9Oepg+yU0vdoE+WtH1bMBCleOvYuZ1ziNbc0d5wzi1BXlQaccCFLonqoJXuIZGfaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728481425; c=relaxed/simple;
	bh=SkGQGwz41me2KDx1e7eudI1y5Dfn9Ort4t3pk5/4X2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XpGoel95lXyIylj10ynHANlL98/rfxpoUW9MDKVG9CyWnWOzan8R5Lf31oiLotkldItF2Lb7QmcuqG0jc6l8cWwj3cxctnBqWtjBxsBpsOYdrKvKKwxtWXa9N6/1woQamB+gFcaUivyxz1WNT2vUnxZgxpkagZ7puuPisuAaQTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UptuULJ2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2611C4CEC5;
	Wed,  9 Oct 2024 13:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728481424;
	bh=SkGQGwz41me2KDx1e7eudI1y5Dfn9Ort4t3pk5/4X2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UptuULJ2OWWvYaBsfhT14SxtJBc3M4BwSr4+JlYqyyNmoobqO4kAomYNIfEM7khdc
	 tJ1ZDCpFWFzX+xWHnWJreAuZ2XKvmqcSQWaE8MKQTg4TYFPv+DR9bNNrjInaa/OYtu
	 KpARALZUXXjAnchtpsEN36xFPhIzN/ylGRppXGgmabk0MplICkWcNzW9sdHfiqk0af
	 KxhtBa454eASlcIspF6GgKIkj9T+NT5WVNXPcPEwqB3wqadGNdnCRlvxnS1QHIAYHw
	 ysISk4IOBa1vuPFnWVTbsiJfN2tBfvji5ySfbJ4gvcEnwPGghUTHWE7iAsX3iprOqA
	 nOutjUn+m4WRg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1syWyh-000000003ES-3FZF;
	Wed, 09 Oct 2024 15:43:47 +0200
Date: Wed, 9 Oct 2024 15:43:47 +0200
From: Johan Hovold <johan@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, stable@vger.kernel.org,
	Aniket Randive <quic_arandive@quicinc.com>
Subject: Re: [PATCH v2 1/7] serial: qcom-geni: fix premature receiver enable
Message-ID: <ZwaIk5MlqL3AL_qQ@hovoldconsulting.com>
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

On Tue, Oct 01, 2024 at 07:20:36PM +0530, Mukesh Kumar Savaliya wrote:
> Thanks Johan for the fixes.

Thanks for taking a look.

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

> > @@ -1152,7 +1152,6 @@ static int qcom_geni_serial_port_setup(struct uart_port *uport)
> >   			       false, true, true);
> >   	geni_se_init(&port->se, UART_RX_WM, port->rx_fifo_depth - 2);
> >   	geni_se_select_mode(&port->se, port->dev_data->mode);
> > -	qcom_geni_serial_start_rx(uport);

> Does it mean hibernation will break now ? Not sure if its tested with 
> hibernation. I can see this call was added to port_setup specifically 
> for hibernation but now after removing it, where is it getting fixed ?
> I think RX will not be initialized after hibernation.

Correct. As I alluded to in the commit message this "hibernation
support" is quite broken already, but I was trying to avoid spending
more time on this driver than I already have and just look the other way
for the time being.

Note that rx is enabled by the serial core resume code, but then this
hibernation hack added a call to the setup the port after resuming it,
which would disable rx again were it not for this random call to
start rx, which should never have been added here in the first place.

But as these platforms do not support hibernation in mainline, and the
code broken anyway, I'll just rip it all out for v3.

Johan

