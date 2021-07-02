Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAD923B9BC6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jul 2021 07:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232659AbhGBFHL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Jul 2021 01:07:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:34656 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232274AbhGBFHL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Jul 2021 01:07:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 959E061413;
        Fri,  2 Jul 2021 05:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1625202279;
        bh=1yg95ioeHjez5VraA0fl/R1SuuD+emoJpNu8wRXEWC8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oa2kh+UkcExnKYHVV/CXrlKcbiKIBFQYJPSNod8xVomFYoAHDX3+c9HGZ5QZYTBEu
         lBBo+zBuuhrRAp1LuPr5ocUw2qZ3NtcMjUy4FQonDk+39LM2lY/5Q3nLrZ++/QR10e
         BHFuoQjhw1RJbU9AlUOHoAnoTtmrnb+6zwm0gmGk=
Date:   Fri, 2 Jul 2021 07:04:36 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     robh+dt@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        balbi@kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jackp@codeaurora.org,
        fntoth@gmail.com
Subject: Re: [PATCH v11 0/5] Re-introduce TX FIFO resize for larger EP
 bursting
Message-ID: <YN6eZIuIUjjpP/56@kroah.com>
References: <1625043642-29822-1-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1625043642-29822-1-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 30, 2021 at 02:00:37AM -0700, Wesley Cheng wrote:
> Changes in V11:
>  - Added a DWC3 controller revision check to use a different calculation, based
>    on Ferry's testing.
>  - Removed descriptor loop in configfs, and utilize the fact that the ep->claimed
>    parameter is still valid as ep_autoconf_reset() isn't called at the time of
>    check_config()
>  - Fix compilation errors if CONFIG_OF is not defined
>  - Removed patch to add stubs for of_add_property()

Still breaks the build :(
