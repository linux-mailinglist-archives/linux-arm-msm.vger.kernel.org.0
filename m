Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66EF925A54D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 08:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgIBGEl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 02:04:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:32994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725774AbgIBGEj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 02:04:39 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 262D020758;
        Wed,  2 Sep 2020 06:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599026678;
        bh=g/2VIEsAnNCGwuFSRBmMfPgFPQ8GBcaaWeh2wrNOjTw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j9iBVWGuPfp5nJ4T0mZuvjpw1blz/pYyRcNz1vV99SC0yk1Vdp2UP7C18515KjpTW
         tOrbuJCV4ZC8WznMoC04LCvNouLaYPX6sQBpBtgE1yK93CdwzTSzYbbu3k+BcokMcE
         6xF0r1OwfcmyqYsYVBbcxs/4tjj7/9e6DI+flOpk=
Date:   Wed, 2 Sep 2020 08:04:35 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Paras Sharma <parashar@codeaurora.org>
Cc:     Jiri Slaby <jslaby@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
        akashast@codeaurora.org
Subject: Re: [PATCH] serial: qcom_geni_serial: To correct QUP Version
 detection logic
Message-ID: <20200902060435.GA141898@kroah.com>
References: <1599026211-12800-1-git-send-email-parashar@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1599026211-12800-1-git-send-email-parashar@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 02, 2020 at 11:26:51AM +0530, Paras Sharma wrote:
> The current implementation reduces the sampling rate by half
> if qup HW version is  greater is than 2.5 by checking if the
> geni SE major version is greater than 2 and geni SE minor version
> is greater than 5.
> 
> This implementation fails when the version is 3 or greater.
> 
> Hence new implementation checks if version is greater than or equal
> to 0x20050000 which would work for any future version.
> 
> Signed-off-by: Paras Sharma <parashar@codeaurora.org>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Is this a v2 patch?  What changed from the first one?

> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index f0b1b47..e18b431 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1000,7 +1000,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>  	sampling_rate = UART_OVERSAMPLING;
>  	/* Sampling rate is halved for IP versions >= 2.5 */
>  	ver = geni_se_get_qup_hw_version(&port->se);
> -	if (GENI_SE_VERSION_MAJOR(ver) >= 2 && GENI_SE_VERSION_MINOR(ver) >= 5)
> +	if (ver >= 0x20050000)

That's an odd "magic value", can't you use the existing macros to define
this somehow so it makes sense?

thanks,

greg k-h
