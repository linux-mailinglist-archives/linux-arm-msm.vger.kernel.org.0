Return-Path: <linux-arm-msm+bounces-25755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFE892CA2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 07:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2949BB20C93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 05:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AECEF23776;
	Wed, 10 Jul 2024 05:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FvEL3BFd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B841CA87;
	Wed, 10 Jul 2024 05:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720589728; cv=none; b=UkaU6ZS+PfvLZu5t3iUfA3OP5DO//7/M5E9B2Op4raXFax0rZLnzPn51hu8sB6sWomQz/aEdRrRyURo8dqN7YtSa/iIQTA3Hx/i6GMeSk+8ez2RAythoS1JlyLSbJuOfofus8PqgPLJayqdJbBg+IhyRf5cCfjyQ3e5hvcBU+qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720589728; c=relaxed/simple;
	bh=WDWPVUbSRnIeyuU8ZbS7Y1vRv/cIIU76QodPkaiYZgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EV9flr0/5jO333Q1yFQ8+7FqzcNCncgP6lfp3OWvxPNnOq9VS9+9XF0Z8XaQ0LU/CpDnacKaFpTzfDThu9+mqcUIxzcBajTMC1bKdkTRt90M2ijrar0Lzn1qPVmkazZ/lutfIivhgdaPeeVmExU3zB3Z25Sr6XlUGtGyEb2dqDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FvEL3BFd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7B9C32781;
	Wed, 10 Jul 2024 05:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720589727;
	bh=WDWPVUbSRnIeyuU8ZbS7Y1vRv/cIIU76QodPkaiYZgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FvEL3BFdTytBBRTkgeOiUtO5KKMn6/VlPWCmetTCqwXk18EsJnfTMTmTuqz1WmFXS
	 eZb7L1m5Aqc6jVNUgLkyNc4ypJeP6ycCYFzToTb6K2wFuat4Xhpc0W0pmDSrkO9GJK
	 RuOoXYDOJK3QSNQRIdeSZF/NDvkbenVG5UQWserY=
Date: Wed, 10 Jul 2024 07:35:24 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Johan Hovold <johan@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH] serial: qcom-geni: Show '@' characters if we have a FIFO
 underrun
Message-ID: <2024071001-justice-catfight-37f0@gregkh>
References: <20240709162841.1.I93bf39f29d1887c46c74fbf8d4b937f6497cdfaa@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240709162841.1.I93bf39f29d1887c46c74fbf8d4b937f6497cdfaa@changeid>

On Tue, Jul 09, 2024 at 04:28:45PM -0700, Douglas Anderson wrote:
> As of commit 2ac33975abda ("serial: qcom-geni: do not kill the machine
> on fifo underrun") a FIFO underrun will no longer hard lockup the
> machine. Instead, a FIFO underrun will cause the UART to output a
> bunch of '\0' characters. The '\0' characters don't seem to show up on
> most terminal programs and this hides the fact that we had an
> underrun. An underrun is aq sign of problems in the driver and
> should be obvious / debugged.
> 
> Change the driver to put '@' characters in the case of an underrun
> which should make it much more obvious.
> 
> Adding this extra initialization doesn't add any real overhead. In
> fact, this patch reduces code size because the code was calling
> memset() to init 4 bytes of data. Disassembling the new code shows
> that early in the function w22 is setup to hold the '@@@@' constant:
>   mov     w22, #0x40404040
> 
> Each time through the loop w22 is simply stored:
>   str     w22, [sp, #4]
> 
> Cc: Johan Hovold <johan@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/tty/serial/qcom_geni_serial.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 69a632fefc41..332eaa2faa2b 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -872,10 +872,10 @@ static void qcom_geni_serial_send_chunk_fifo(struct uart_port *uport,
>  {
>  	struct qcom_geni_serial_port *port = to_dev_port(uport);
>  	unsigned int tx_bytes, remaining = chunk;
> -	u8 buf[BYTES_PER_FIFO_WORD];
>  
>  	while (remaining) {
> -		memset(buf, 0, sizeof(buf));
> +		u8 buf[BYTES_PER_FIFO_WORD] = { '@', '@', '@', '@' };

Why is '@' a valid character for an underrun?  Why would any characters
be ok?  Where is this now documented?

And shouldn't you use a memset to get the BYTES_PER_FIFO_WORD amount of
'@' here?

thanks,

greg k-h

