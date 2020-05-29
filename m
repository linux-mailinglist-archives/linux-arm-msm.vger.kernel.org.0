Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB0691E7A29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 12:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbgE2KMS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 May 2020 06:12:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:42356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725775AbgE2KMR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 May 2020 06:12:17 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 99C412074D;
        Fri, 29 May 2020 10:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590747137;
        bh=Yl+5FEwzOOeZ8hYUoXsCXAbU3LDBkX87gD4CrrxKtSs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yNzc+6/JphBjd5egkaD9BnpKWOOfFI4ax9kFqcSb30A43a5fGOeZLBcjqQ5K12KpQ
         BBhsv8gKvsvILykkAjdjQv8OBLRXBiUK1QcJD+1VHoovufrAK8bAlisdKfQycTSCqg
         VLyxNIVURxjUGEHIJg9LzB1m/DgVdPm8VbkzD7iA=
Date:   Fri, 29 May 2020 12:12:14 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     robh+dt@kernel.org, bjorn.andersson@linaro.org, balbi@kernel.org,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [RFC v3 0/3] Re-introduce TX FIFO resize for larger EP bursting
Message-ID: <20200529101214.GA1321073@kroah.com>
References: <1590630363-3934-1-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590630363-3934-1-git-send-email-wcheng@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 27, 2020 at 06:46:00PM -0700, Wesley Cheng wrote:
> Changes in V3:
>  - Removed "Reviewed-by" tags
>  - Renamed series back to RFC
>  - Modified logic to ensure that fifo_size is reset if we pass the minimum
>    threshold.  Tested with binding multiple FDs requesting 6 FIFOs.
> 
> Changes in V2:
>  - Modified TXFIFO resizing logic to ensure that each EP is reserved a
>    FIFO.
>  - Removed dev_dbg() prints and fixed typos from patches
>  - Added some more description on the dt-bindings commit message
> 
> Currently, there is no functionality to allow for resizing the TXFIFOs, and
> relying on the HW default setting for the TXFIFO depth.  In most cases, the
> HW default is probably sufficient, but for USB compositions that contain
> multiple functions that require EP bursting, the default settings
> might not be enough.  Also to note, the current SW will assign an EP to a
> function driver w/o checking to see if the TXFIFO size for that particular
> EP is large enough. (this is a problem if there are multiple HW defined
> values for the TXFIFO size)
> 
> It is mentioned in the SNPS databook that a minimum of TX FIFO depth = 3
> is required for an EP that supports bursting.  Otherwise, there may be
> frequent occurences of bursts ending.  For high bandwidth functions,
> such as data tethering (protocols that support data aggregation), mass
> storage, and media transfer protocol (over FFS), the bMaxBurst value can be
> large, and a bigger TXFIFO depth may prove to be beneficial in terms of USB
> throughput. (which can be associated to system access latency, etc...)  It
> allows for a more consistent burst of traffic, w/o any interruptions, as
> data is readily available in the FIFO.
> 
> With testing done using the mass storage function driver, the results show
> that with a larger TXFIFO depth, the bandwidth increased significantly.

Why is this still a "RFC" series?  That implies you don't want this
applied...

