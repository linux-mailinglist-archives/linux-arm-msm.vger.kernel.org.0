Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85BCF3BA4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2019 19:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387732AbfFJRFj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jun 2019 13:05:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:40586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387700AbfFJRFi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jun 2019 13:05:38 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3FD2320859;
        Mon, 10 Jun 2019 17:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560186337;
        bh=0e6VWkn4pFkRWeDtcNEBzkCkDCOUxaKPtfD9spYSbxw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cMNq70Z1quBlDjxaurESKu0EdVtwczelGR2fmVJAVi8yaqz1wW9AL/fVDp8/DdZKF
         PBFCaY5S+eJ4z7WDDcP9wMlEswKfyO0TLToCfTQItpghsAuLkHcyyQTj4coIY4wdjg
         EPmOLtJzOSJfD3bzRqi5jV9IoQ6uvhtzVvDpG/Xc=
Date:   Mon, 10 Jun 2019 19:05:35 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     agross@kernel.org, david.brown@linaro.org, jslaby@suse.com,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, khasim.mohammed@linaro.org,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH v2] tty: serial: msm_serial: avoid system lockup condition
Message-ID: <20190610170535.GA1337@kroah.com>
References: <20190610075554.24979-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190610075554.24979-1-jorge.ramirez-ortiz@linaro.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 10, 2019 at 09:55:54AM +0200, Jorge Ramirez-Ortiz wrote:
> The function msm_wait_for_xmitr can be taken with interrupts
> disabled. In order to avoid a potential system lockup - demonstrated
> under stress testing conditions on SoC QCS404/5 - make sure we wait
> for a bounded amount of time.
> 
> Tested on SoC QCS404.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  drivers/tty/serial/msm_serial.c | 4 ++++
>  1 file changed, 4 insertions(+)

What changed from v1?  Always put that below the --- line.

v3 please.

thanks,

greg k-h
