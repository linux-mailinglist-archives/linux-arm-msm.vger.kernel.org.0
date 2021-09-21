Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA67541328F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 13:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbhIULdu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 07:33:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:48918 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231743AbhIULdu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 07:33:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6EA4061184;
        Tue, 21 Sep 2021 11:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1632223942;
        bh=n/blwti6pzFnoOXxHZvR7um/QLPRudRaHzUSxgg4Qaw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=euMrFyrIf3BMu44H4lFP/zB61frq0NeD8RiWhPdzjO5RWbBaygQTSusecP3qlUEyv
         qkWyEq0Tm+TsZuNs0EAbeq8jzVUZ1OanJ8OOcPLUyg/rgni/IyrgQNwwDODye6KeQ/
         DenTPH2rsRTV2wy1noPGeQOr/AbfPOQ/GSXPur+g=
Date:   Tue, 21 Sep 2021 13:32:19 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jeya R <jeyr@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: Re: [PATCH] [PATCH v2] misc: fastrpc: fix improper packet size
 calculation
Message-ID: <YUnCw4uCSd1O7QX0@kroah.com>
References: <1632221847-987-1-git-send-email-jeyr@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1632221847-987-1-git-send-email-jeyr@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 21, 2021 at 04:27:27PM +0530, Jeya R wrote:
> The buffer list is sorted and this is not being considered while
> calculating packet size. This would lead to improper copy length
> calculation for non-dmaheap buffers which would eventually cause
> sending improper buffers to DSP.
> 
> Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke method")
> Signed-off-by: Jeya R <jeyr@codeaurora.org>
> 
> Changes in v2:
> - updated commit message to proper format
> - added fixes tag to commit message
> - removed unnecessary variable initialization
> - removed length check during payload calculation
> ---
>  drivers/misc/fastrpc.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

The "Changes" need to go below the --- line, as the documentation states
to do.

thanks,

greg k-h
