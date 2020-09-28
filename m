Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6D827A804
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 09:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgI1HBS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 03:01:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:43276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726440AbgI1HBS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 03:01:18 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 89AF523119;
        Mon, 28 Sep 2020 07:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601276478;
        bh=yHTdIKsXesYbs8KqXwTP+zn7aoguUYPySkWcMSV8c58=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dsCzZczCKNzzoZm15gsW8+GzdX/Cq3TSNUOtgTsHtjLDLbHFR5ushTouAMEmpUAiO
         Z0xlnmBJkR/QVvS95zHlJ+svDsYcBiAr/i3HWrYkwO8Hst4k5PdOI3Hrr8XNeTCzlc
         CeV/7Dn1LTdGTcBS1FwsyXewRq7EPv1x0BDOx9FE=
Date:   Mon, 28 Sep 2020 09:01:26 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Paras Sharma <parashar@codeaurora.org>
Cc:     Jiri Slaby <jslaby@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
        akashast@codeaurora.org
Subject: Re: [PATCH V5] serial: qcom_geni_serial: To correct QUP Version
 detection logic
Message-ID: <20200928070126.GA391632@kroah.com>
References: <1601276378-4325-1-git-send-email-parashar@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1601276378-4325-1-git-send-email-parashar@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 28, 2020 at 12:29:38PM +0530, Paras Sharma wrote:
> For QUP IP versions 2.5 and above the oversampling rate is
> halved from 32 to 16.
> Commit ce734600545f ("tty: serial: qcom_geni_serial: Update
> the oversampling rate") is pushed to handle this scenario.But
> the existing logic is failing to classify QUP Version 3.0 into
> the correct group ( 2.5 and above).
> 
> As result Serial Engine clocks are not configured properly for
> baud rate and garbage data is sampled to FIFOs from the line.
> 
> So, fix the logic to detect QUP with versions 2.5 and above.
> 
> Fixes: ce734600545f ("tty: serial: qcom_geni_serial: Update the oversampling rate")
> Signed-off-by: Paras Sharma <parashar@codeaurora.org>
> ---
> Changes in V5:
> Moved QUP_SE_VERSION_2_5 to common header file qcom-geni-se.h
> 
> Changes in V4:
> Created a new #define QUP_SE_VERSION_2_5 for Qup serial engine having version 2.5
> 
> Changes in V3:
> Replaced the condition for detecting Qup version(2.5 or greater) with value 0x20050000
> 
> Changes in V2:
> Changed subject line and logic for checking Qup version
> 
>  drivers/tty/serial/qcom_geni_serial.c | 3 ++-
>  include/linux/qcom-geni-se.h          | 3 +++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index f0b1b47..198ecdd7 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -106,6 +106,7 @@
>  /* We always configure 4 bytes per FIFO word */
>  #define BYTES_PER_FIFO_WORD		4
>  
> +
>  struct qcom_geni_private_data {
>  	/* NOTE: earlycon port will have NULL here */
>  	struct uart_driver *drv;

Unneeded change :(


