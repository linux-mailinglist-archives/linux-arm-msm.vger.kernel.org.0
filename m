Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 809A14FCB7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2019 18:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbfFWQgw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 Jun 2019 12:36:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:50012 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726399AbfFWQgw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 Jun 2019 12:36:52 -0400
Received: from localhost (unknown [106.201.35.23])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EC0EE206BA;
        Sun, 23 Jun 2019 16:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561307811;
        bh=bgRO7bREz2maqiR8ifkc3/2uY/Cw6hgv+ekC+zp5BUQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L43njXquan/oLhDPeB4YacVyIXbcPYNsqx1NqEpiLD9ayL0nXbOkGMDMPwPQ0t5lt
         JF2JD1SSggQkJycI3FsciabqRuih33k5Pp+ONI1y11fE3KRkwIm/leHZZc8oQB4Fx1
         MXptBbdxfVq5dsHKkthHI7u8bqabI9geamVtlHPA=
Date:   Sun, 23 Jun 2019 22:03:42 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Christian Lamparter <chunkeey@gmail.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Christian Lamparter <chunkeey@googlemail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] usb: xhci: add firmware loader for uPD720201 and
 uPD720202 w/o ROM
Message-ID: <20190623163342.GR2962@vkoul-mobl>
References: <20190621085913.8722-1-vkoul@kernel.org>
 <20190621085913.8722-2-vkoul@kernel.org>
 <1897697.zOhlaAKarQ@debian64>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1897697.zOhlaAKarQ@debian64>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21-06-19, 21:59, Christian Lamparter wrote:
> On Friday, June 21, 2019 10:59:09 AM CEST Vinod Koul wrote:
> > +	/*
> > +	 * The Firmware's Data Format is describe in
> > +	 * "6.3 Data Format" R19UH0078EJ0500 Rev.5.00 page 124
> > +	 */
> > +
> > +	/* "Each row is 8 bytes". => firmware size must be a multiple of 8. */
> > +	if (length % 8 != 0)
> > +		dev_warn(&dev->dev, "firmware size is not a multiple of 8.");
> 
> It doesn't look like this holds true for the newer K2026090.mem which
> arguably fixes a lot of bugs over K2013080.mem. I think we should remove
> this check and message.

The documentation still says so, that is why I changed error return and
this to warning. Yeah lets remove to not confuse folks :)

-- 
~Vinod
