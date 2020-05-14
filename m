Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E71C1D3262
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 16:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbgENOOH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 10:14:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:59110 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726073AbgENOOH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 10:14:07 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D6B8B20671;
        Thu, 14 May 2020 14:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589465646;
        bh=ptk6RhZzidMTuDqXDzMYBSDIiI5ksWNu/M5pgjk1MzE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tn+uFlqx6SmlGyrkqEGYMEcoGXw/yn2Xzp/ia/GSzW9s3pGovSxktqzLENFVZefwM
         KtcEBPP3ulIZ6epAymUsxyBlZjwlQI3h5NpmG/d/z5jQuBd2Ynnb8CsXWd4qi3Fbxu
         BMX8oo4h1hkvWP8+mHdVSrUOeX8/90mwrgk9BLS0=
Date:   Thu, 14 May 2020 16:14:03 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     arnd@arndb.de, manivannan.sadhasivam@linaro.org,
        bjorn.andersson@linaro.org, wufan@codeaurora.org,
        pratanan@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 5/8] qaic: Implement data path
Message-ID: <20200514141403.GB2643665@kroah.com>
References: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org>
 <1589465266-20056-6-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589465266-20056-6-git-send-email-jhugo@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 14, 2020 at 08:07:43AM -0600, Jeffrey Hugo wrote:
> +struct qaic_execute {
> +	__u16		ver;    /* struct version, must be 1 */

No need for structures to be versioned.  If you change something, then
add a new ioctl if you really needed it.

thanks,

greg k-h
