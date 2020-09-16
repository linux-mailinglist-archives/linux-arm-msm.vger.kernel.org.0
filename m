Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FACC26C682
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 19:52:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727621AbgIPRw0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 13:52:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:42920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727278AbgIPRwV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 13:52:21 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B5CA421973;
        Wed, 16 Sep 2020 11:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600255155;
        bh=5Jd9jVHxcOyK7zuQDeG8R+4sy3KRHCao0bv2UcrVMR8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Vkai1tLMJU4GdeUGCp9K11DMk7R5iO71tYJ7eFcDU3nm99EXhGeOnzgIeUyqh6jYO
         3EJzlWcAATX/kACui7SjkEzA1PReh35fsj/Z/4CNqfgESq5kIwMYOqEyDyflnw/c1d
         IUU4L3vob8oQNXHnLE1fSpalZax8hfd8OSfm9mFo=
Date:   Wed, 16 Sep 2020 13:19:49 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Paras Sharma <parashar@codeaurora.org>
Cc:     Jiri Slaby <jslaby@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
        akashast@codeaurora.org
Subject: Re: [PATCH V4] serial: qcom_geni_serial: To correct QUP Version
 detection logic
Message-ID: <20200916111949.GA969520@kroah.com>
References: <1600067957-8216-1-git-send-email-parashar@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600067957-8216-1-git-send-email-parashar@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 14, 2020 at 12:49:17PM +0530, Paras Sharma wrote:
> The current implementation reduces the sampling rate by half
> if qup HW version is  greater is than 2.5 by checking if the

2 space characters?

And what is "qup"?

What is "HW"?

> geni SE major version is greater than 2 and geni SE minor version

what is "geni"?

What is "SE"?

> is greater than 5.This implementation fails when the version is
> greater than or equal to 3.
> 
> Hence, a new macro QUP_SE_VERSION_2_5 is defined having value
> for major number 2 and minor number 5 as 0x20050000.Hence,if 

That's not a "macro", it is a simple #define.

And can you use a ' ' after a '.' please?  That's all over this
changelog, including trailing whitespace for some reason :(

> ver is greater than this value,sampling rate is halved. 
> This logic would work for any future qup version.

"will work"?

> 
> Fixes: ce734600545f ("tty: serial: qcom_geni_serial: Update the oversampling rate")
> Signed-off-by: Paras Sharma <parashar@codeaurora.org>
> ---
> Changes in V4:
> Created a new macro QUP_SE_VERSION_2_5 for Qup se version 2.5
> 

What changed from previous versions than v4?

thanks,

greg k-h
