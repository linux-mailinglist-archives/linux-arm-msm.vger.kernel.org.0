Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 498251358E2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2020 13:09:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728720AbgAIMJM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jan 2020 07:09:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:56326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728653AbgAIMJM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jan 2020 07:09:12 -0500
Received: from localhost (unknown [171.76.123.219])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C25382067D;
        Thu,  9 Jan 2020 12:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578571751;
        bh=sGzGC6Q4Ug/nqvIAsgJRv6Hhir62ZVZTwW6WvkOtzPw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bU4yl5C81fcuSd0rXFhCOebc+DS4Hfkx5YnGicFukPBQiDU+bVtoIG7NPl+GrejpV
         1omSgAVs5YeBmEkE6L2KOfZUQMEtt7ELUTYAPXGc5e+XkIa8eOCBeeaH6TDSPXMutK
         efW87KsGW2NRPpMtTLeN1F53RkinzHFC71QYmLFY=
Date:   Thu, 9 Jan 2020 17:39:05 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Todd Kjos <tkjos@google.com>,
        Alistair Delva <adelva@google.com>
Subject: Re: [PATCH v5 0/4] usb: xhci: Add support for Renesas USB controllers
Message-ID: <20200109120905.GV2818@vkoul-mobl>
References: <20191106083843.1718437-1-vkoul@kernel.org>
 <CANcMJZDqX6-+naGEbBiyM+1cZS6jfMoP9bm5Uk4ZuP_mw5aNWw@mail.gmail.com>
 <20200108040707.GU2818@vkoul-mobl>
 <20200108062436.GA2276347@kroah.com>
 <b0dc038b-cc25-1d37-9339-689bb5b61ff7@linux.intel.com>
 <20200108182907.GB2549996@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108182907.GB2549996@kroah.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08-01-20, 19:29, Greg Kroah-Hartman wrote:
> On Wed, Jan 08, 2020 at 06:00:48PM +0200, Mathias Nyman wrote:
 
> > 
> > Reviewing this always got bumped down on my todo list as other urgent issues
> > came up.
> > 
> > I think the concern about adding this amount of renesas specific code to
> > xhci-pci.c is valid. This series adds over 900 lines of Renesas FW loading
> > code to a 600 line xhci-pci.c
> 
> Yeah, that's not good, should be simple to split it into a separate file
> that's only build if that hardware is selected.

Okay let me redo the patches splitting it up. If you have any thoughts
about how that should be done, do let me know.

Thanks
-- 
~Vinod
