Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44A7C4132BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 13:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232564AbhIULnF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 07:43:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:51640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232504AbhIULnC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 07:43:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 16E9860F24;
        Tue, 21 Sep 2021 11:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1632224494;
        bh=LRagK15X7G3x85GkTeZ0DGufm6ujvUR3qrSLF32MkUs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wLRY8Xi1vtd5DwKggCyo2B8jpGaEZgrZr4jskrLLvs8hULuZqlUCTz1HJJa14PM1o
         mzuV+X9J6C2Gnyfr829G996gYU0Z8Md9OMOqqon+PfKkeFqi6A32CQk8oIIypDj08r
         5DOn79YEiZl6rwNHYRmDNKh1dMCtzzXPGo0Xq00A=
Date:   Tue, 21 Sep 2021 13:41:26 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     jeyr@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: Re: [PATCH] [PATCH v2] misc: fastrpc: fix improper packet size
 calculation
Message-ID: <YUnE5laIe4S9xE5t@kroah.com>
References: <1632221847-987-1-git-send-email-jeyr@codeaurora.org>
 <YUnCw4uCSd1O7QX0@kroah.com>
 <c4b294b251ed5ae4d7062edebcb397c1@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4b294b251ed5ae4d7062edebcb397c1@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 21, 2021 at 05:05:29PM +0530, jeyr@codeaurora.org wrote:
> On 2021-09-21 17:02, Greg KH wrote:
> > On Tue, Sep 21, 2021 at 04:27:27PM +0530, Jeya R wrote:
> > > The buffer list is sorted and this is not being considered while
> > > calculating packet size. This would lead to improper copy length
> > > calculation for non-dmaheap buffers which would eventually cause
> > > sending improper buffers to DSP.
> > > 
> > > Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke
> > > method")
> > > Signed-off-by: Jeya R <jeyr@codeaurora.org>
> > > 
> > > Changes in v2:
> > > - updated commit message to proper format
> > > - added fixes tag to commit message
> > > - removed unnecessary variable initialization
> > > - removed length check during payload calculation
> > > ---
> > >  drivers/misc/fastrpc.c | 10 ++++++----
> > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > 
> > The "Changes" need to go below the --- line, as the documentation states
> > to do.
> > 
> > thanks,
> > 
> > greg k-h
> Thanks Greg for your comment. Will resend PATCH 2 to address this.

v3 please.
