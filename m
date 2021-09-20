Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E88D411084
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Sep 2021 09:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbhITHxb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 03:53:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:57586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235359AbhITHwr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 03:52:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 66B8960FF2;
        Mon, 20 Sep 2021 07:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1632124280;
        bh=zjM/MTscwltcL8YCPcuFkxfuK+EJqGaD1Adm0/N+pVk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J6IrkpNH65oVZIUchWF2GQ3UYDTZyp7+n+xPusCB8Y0eMGeW+AHOgawO6RWvtOpnA
         m31r41ki8xRawaz9hDN/L/i535w+l9mkPJlm6DLQT36M912LI+Y/vyQX6CCCakxnSa
         fYSzB1x4uDWRM5/6AG5yUlGD7jk81iRwhAPa1hBc=
Date:   Mon, 20 Sep 2021 09:51:18 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jeya R <jeyr@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: Re: [PATCH] misc: fastrpc: Update number of max fastrpc sessions
Message-ID: <YUg9dmThHg9s8XAy@kroah.com>
References: <1632123274-32054-1-git-send-email-jeyr@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1632123274-32054-1-git-send-email-jeyr@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 20, 2021 at 01:04:34PM +0530, Jeya R wrote:
> For latest chipsets, upto 13 fastrpc sessions can be
> supported. This includes 12 compute sessions and 1 cpz
> session. Not updating this might result to out of bounds
> memory access issues if more than 9 context bank nodes
> are added to the DT file.
> 
> Signed-off-by: Jeya R <jeyr@codeaurora.org>
> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index beda610..bd7811e 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -24,7 +24,7 @@
>  #define SDSP_DOMAIN_ID (2)
>  #define CDSP_DOMAIN_ID (3)
>  #define FASTRPC_DEV_MAX		4 /* adsp, mdsp, slpi, cdsp*/
> -#define FASTRPC_MAX_SESSIONS	9 /*8 compute, 1 cpz*/
> +#define FASTRPC_MAX_SESSIONS	13 /*12 compute, 1 cpz*/
>  #define FASTRPC_ALIGN		128
>  #define FASTRPC_MAX_FDLIST	16
>  #define FASTRPC_MAX_CRCLIST	64
> -- 
> 2.7.4
> 

What happens if you run this on "older" chipsets?

And is this an issue now, or can this wait to 5.16-rc1?

thanks,

greg k-h
