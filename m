Return-Path: <linux-arm-msm+bounces-110057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GHMMf/uF2q2WAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 09:30:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4157F5EDB70
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 09:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C0317305B9A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 07:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BDF832E6BC;
	Thu, 28 May 2026 07:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="St1G+sTO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB266329367;
	Thu, 28 May 2026 07:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779953375; cv=none; b=lFwacXfLJB95FJ8LQ2FGvd8ErtN19A4JOxzF++P2i4CI1JIUWQLo98XXKZy96DYcWGpTanwMeYdXSyqgL0TLWdsD/ln8Y7aNNE4P3clah1fuda30If8HsWAQUz0Zvu2xlGCGIL7TCDMZrMu7YhwiQdCztqrP/7SSdoVs8a0Q0cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779953375; c=relaxed/simple;
	bh=KmQ0XZxaTbyjFg1yUK8sp1y/ixUIIL+GpWAPLfS2Zhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uC7DPIuZHvkBV1pQD6+QYlxk9prq5IrTwjPBJEQRHHFpoWpfNo9EV3+pEjbvqElGDXt28Ia5V8jqDDPfTfa30tpgbocYxBJigB5sSLEvrq5yVZzxjS3KCuDh1yQssl6ama8HFPRyxsnvtClf+WkT9PCSSTrgX9ANbSm/N1msWIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=St1G+sTO; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FFAC1F000E9;
	Thu, 28 May 2026 07:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779953373;
	bh=GHZyGYHMyKQickmK4QoVlrCkLUsmhXtTTTSKdOBNJ+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=St1G+sTO11fgzCtIXUhSD0db6Xw+ncHlXGKslvPo7C3Yfz/E5HzqXPKy6fEN7YdoJ
	 9q7aeiGPAMEPWauyA20dOx1smou/wf+wdcHV+XcorhNMXDoTlEn+SIaeK6hSzZTP1H
	 YtmFhhFm8o81UhV277I1QnFKSQPdr/mYQ5rkRBgA=
Date: Thu, 28 May 2026 09:28:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v1] serial: qcom_geni: Fix RX DMA stall when
 SE_DMA_RX_LEN_IN is zero
Message-ID: <2026052832-roving-armless-423d@gregkh>
References: <20260528-serial-rx-0-byte-fix-v1-1-dc4e876c7368@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528-serial-rx-0-byte-fix-v1-1-dc4e876c7368@oss.qualcomm.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110057-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4157F5EDB70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 12:35:43PM +0530, Viken Dadhaniya wrote:
> In qcom_geni_serial_handle_rx_dma(), geni_se_rx_dma_unprep() clears
> port->rx_dma_addr before SE_DMA_RX_LEN_IN is read. If the register is zero,
> for example when the RX stale counter fires on an idle line, the handler
> returns without calling geni_se_rx_dma_prep().
> 
> The next RX DMA interrupt then hits the !port->rx_dma_addr guard and
> returns immediately, so the RX DMA buffer is never rearmed and later input
> is lost.
> 
> Keep the handler on the rearm path when rx_in is zero. Warn about the
> unexpected zero-length DMA completion, skip received-data handling, and
> always call geni_se_rx_dma_prep().
> 
> Fixes: 2aaa43c70778 ("tty: serial: qcom-geni-serial: add support for serial engine DMA")
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index d81b539cff7f..7ead87b4eb65 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -905,12 +905,9 @@ static void qcom_geni_serial_handle_rx_dma(struct uart_port *uport, bool drop)
>  	port->rx_dma_addr = 0;
>  
>  	rx_in = readl(uport->membase + SE_DMA_RX_LEN_IN);
> -	if (!rx_in) {
> -		dev_warn(uport->dev, "serial engine reports 0 RX bytes in!\n");
> -		return;
> -	}
> -
> -	if (!drop)
> +	if (!rx_in)
> +		dev_warn_ratelimited(uport->dev, "serial engine reports 0 RX bytes in!\n");
> +	else if (!drop)
>  		handle_rx_uart(uport, rx_in);
>  
>  	ret = geni_se_rx_dma_prep(&port->se, port->rx_buf,
> 
> ---
> base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
> change-id: 20260528-serial-rx-0-byte-fix-ec9d08cfe78e
> 
> Best regards,
> --  
> Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

