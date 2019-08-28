Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4F9A0BE4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2019 22:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbfH1Uxp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Aug 2019 16:53:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:58310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726618AbfH1Uxp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Aug 2019 16:53:45 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BDBD62070B;
        Wed, 28 Aug 2019 20:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567025624;
        bh=L658Uoi5wgh1LJ4svG0zhq44VhHlSp/4XyccC4WYsYw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pXJTObT0GlU3fnn9CrEggvS9W+JfyefwiglkaD8sMY+w5maq2PPbTDdJqguMbjJzX
         0K5K9854MN8vMr3z07rThNpEc9GsUJFipR7JyqpSpW4Xo/Ng6ZNpkFTEQJ90Y6eFYg
         HkVrsXked6N2YBJKUrXqElk+iJdMynkTVDhKx4xs=
Date:   Wed, 28 Aug 2019 22:53:41 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     arnd@arndb.de, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mayank Chopra <mak.chopra@codeaurora.org>,
        Abhinav Asati <asatiabhi@codeaurora.org>,
        Vamsi Singamsetty <vamssi@codeaurora.org>
Subject: Re: [PATCH 1/5] misc: fastrpc: Reference count channel context
Message-ID: <20190828205341.GA13049@kroah.com>
References: <20190823100622.3892-1-srinivas.kandagatla@linaro.org>
 <20190823100622.3892-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190823100622.3892-2-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 23, 2019 at 11:06:18AM +0100, Srinivas Kandagatla wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> The channel context is referenced from the fastrpc user and might as
> user space holds the file descriptor open outlive the fastrpc device,
> which is removed when the remote processor is shutting down.
> 
> Reference count the channel context in order to retain this object until
> all references has been relinquished.
> 
> TEST=stop and start remote proc1 using sysfs

What is this for?

Please fix up the series and resend so that I do not have to hand-edit
the changelog text.

thanks,

greg k-h
