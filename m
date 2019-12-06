Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64D8B114BA0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2019 05:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbfLFEVU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Dec 2019 23:21:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:46704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726076AbfLFEVU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Dec 2019 23:21:20 -0500
Received: from localhost (unknown [122.167.86.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C9C0824676;
        Fri,  6 Dec 2019 04:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575606079;
        bh=HS6rms4rMZVPWK20WSDR+1mgnHVL3Sq+/DR2UISwo+4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ilop41n2jDvYLyUIM+dKnWcGdHTj6WLloZex9s/Jfcu0eI9pr1jLSpJlM/RYV0ByK
         MfE0bMFeCrWh7iajihyuKD/VSMZYsfPnEfNNHSKMMH0pZ8GxplOjVpILfI/5CXnJpi
         +DfPIhO35sGupM3gU2IY/ooOT2weDwZjGAQSwo9Q=
Date:   Fri, 6 Dec 2019 09:51:15 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/4] usb: xhci: Add support for Renesas USB controllers
Message-ID: <20191206042115.GJ82508@vkoul-mobl>
References: <20191106083843.1718437-1-vkoul@kernel.org>
 <20191121045457.GH82508@vkoul-mobl>
 <deaa3d5c-e11d-2194-27f8-3a75435d3027@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <deaa3d5c-e11d-2194-27f8-3a75435d3027@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mathias,

On 26-11-19, 17:59, Mathias Nyman wrote:
> On 21.11.2019 6.54, Vinod Koul wrote:
> > On 06-11-19, 14:08, Vinod Koul wrote:
> > > This series add support for Renesas USB controllers uPD720201 and uPD720202.
> > > These require firmware to be loaded and in case devices have ROM those can
> > > also be programmed if empty. If ROM is programmed, it runs from ROM as well.
> > > 
> > > This includes two patches from Christian which supported these controllers
> > > w/o ROM and later my patches for ROM support and multiple firmware versions.
> > 
> > Greg, Mathias
> > 
> > Any feedback on this?
> > 
> 
> I need to take a fresh look at this series, there is a lot of code.

Let me know if you if you have any suggestions for review. I did try to
split it up logically so we have chunks to review independently.

Thanks
-- 
~Vinod
