Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74C5F2D0D3A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Dec 2020 10:42:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgLGJmu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Dec 2020 04:42:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:57816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726237AbgLGJmt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Dec 2020 04:42:49 -0500
Date:   Mon, 7 Dec 2020 10:43:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1607334129;
        bh=N36WJO4ls+mR/cWcgWvhDx0wdoQ4tATXeyYu8yA2r9E=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=VQWcOTtpJy4jwqP1aoa4kokShC0h6QJy9vZwavk9ogQr2IJzSEB+PN4VyTCpy4rHL
         0zRK0IOe+EQdBqnyHUjvyvfRJ84L73DSAda3rXItsOwpjUBWbBe8aueaXtkJMYsp7T
         jQkEBUDmvMamZWCcaQujQiUKqYGbg5cWUzSJrmYk=
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mka@chromium.org, dianders@chromium.org,
        linux-kernel@vger.kernel.org, saravanak@google.com
Subject: Re: [PATCH  3/3] Serial: Separate out earlycon support
Message-ID: <X835NxSOLM7+17T6@kroah.com>
References: <1607330847-15522-1-git-send-email-akashast@codeaurora.org>
 <1607330847-15522-4-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1607330847-15522-4-git-send-email-akashast@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 07, 2020 at 02:17:27PM +0530, Akash Asthana wrote:
> Separate out earlycon support from serial driver and remove it's
> dependency on QUP wrapper driver.
> 
> This enable us to manage earlycon independently and we can re-use the
> same earlycon driver for android project which currently uses
> downstream version of QUP drivers.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
>  drivers/tty/serial/Kconfig              |   9 +
>  drivers/tty/serial/Makefile             |   1 +
>  drivers/tty/serial/qcom_geni_earlycon.c | 649 ++++++++++++++++++++++++++++++++
>  drivers/tty/serial/qcom_geni_serial.c   |  97 -----
>  4 files changed, 659 insertions(+), 97 deletions(-)
>  create mode 100644 drivers/tty/serial/qcom_geni_earlycon.c

Nit, your subject line shoudl say somewhere that this is the qcom
earlycon driver/support, not "earlycon in general".

thanks,

greg k-h
