Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FCA922BEBE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 09:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbgGXHNe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 03:13:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:50776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726543AbgGXHNe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 03:13:34 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1543720748;
        Fri, 24 Jul 2020 07:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595574813;
        bh=fUeIibLbxVfYamditippdQ64erDPYhNSY56DGcKqco8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UJdUpdVHMv4UuMUJUwPQnL5XE/7udNcWNkHE2t4+1hgtIAZR2f9l0p3uu/5az95dw
         XUkqJM5+fB8xx72eO+o8wVGKEn/oF68u4JgDpiAHIdY0+naVBAiEIjjXdgIYDgDFIz
         Spo29x7iM0brgeiBL8tjVfD9rNrCrzVXcOG7P8sk=
Date:   Fri, 24 Jul 2020 09:13:35 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Paras Sharma <parashar@codeaurora.org>
Cc:     Jiri Slaby <jslaby@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
        akashast@codeaurora.org
Subject: Re: [PATCH] tty: serial: qcom_geni_serial: To correct logic for QUP
 HW version
Message-ID: <20200724071335.GA3948185@kroah.com>
References: <1595571242-9967-1-git-send-email-parashar@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595571242-9967-1-git-send-email-parashar@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 24, 2020 at 11:44:02AM +0530, Paras Sharma wrote:
> To correct the logic to detect whether the QUP HW version is greater
>  than 2.5.

The subject line and here does not make any sense.  Can you reword this
as what the problem is and why you need to change this?

> 
> Signed-off-by: Paras Sharma <parashar@codeaurora.org>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 1ed3d35..5b0efb49 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -954,7 +954,8 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>  	sampling_rate = UART_OVERSAMPLING;
>  	/* Sampling rate is halved for IP versions >= 2.5 */
>  	ver = geni_se_get_qup_hw_version(&port->se);
> -	if (GENI_SE_VERSION_MAJOR(ver) >= 2 && GENI_SE_VERSION_MINOR(ver) >= 5)
> +	if ((GENI_SE_VERSION_MAJOR(ver) >= 2 && GENI_SE_VERSION_MINOR(ver) >= 5)
> +		|| GENI_SE_VERSION_MAJOR(ver) >= 3)

Odd coding style :(

Please fix all of the above up and resubmit a v2.

thanks,

greg k-h
