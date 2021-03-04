Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A51AC32CE55
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 09:24:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236587AbhCDIWx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 03:22:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:48326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236598AbhCDIWj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 03:22:39 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 445CB64EFC;
        Thu,  4 Mar 2021 08:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1614846118;
        bh=JIowZjUTs3zpzt/Q6z+hF0rMu5R6S6QkSQPMlnIXqTk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zrEvIQuTKEjY46XUCF+Uf4j2V7QWwIIZZiqeuha8Fhu8rOnYdoSTmH+6EFv0wBQ05
         LJoLNxbO6diJ4y9+zTAI9YfpTJR9uI/Yxy9osWgDJohTLIWAjVpBzjLLriaFl0q6Jq
         VitDmebThadnntx+9Kv9s471hxIB15+Kh0J4uKmw=
Date:   Thu, 4 Mar 2021 09:21:56 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Felipe Balbi <balbi@kernel.org>, Ray Chi <raychi@google.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: Flip condition guarding power_supply_put()
Message-ID: <YECYpPY0ZxEr0A60@kroah.com>
References: <20210303192614.759729-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210303192614.759729-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 03, 2021 at 11:26:14AM -0800, Bjorn Andersson wrote:
> The condition guarding the power_supply_put() calls in error and
> removal paths are backwards, resulting in a guaranteed NULL pointer
> dereference if no power supply was acquired.
> 
> Fixes: 59fa3def35de ("usb: dwc3: add a power supply for current control")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/usb/dwc3/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Already fixed:
	d05a12f0478c ("usb: dwc3: Fix dereferencing of null dwc->usb_psy")

thanks,

greg k-h
