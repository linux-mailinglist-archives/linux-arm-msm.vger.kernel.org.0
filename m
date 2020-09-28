Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D96A27A6E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 07:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgI1FUK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 01:20:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:45764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725298AbgI1FUJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 01:20:09 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D200A21548;
        Mon, 28 Sep 2020 05:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601270409;
        bh=mnSsc69OFsnipr19U1cLgRKqrfuHaVl/8aWgMpwHpEY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nYmw6sPIspVpeYadZOimdagMEBM32ggNIwognp01Ui+TiqniHbXAJg+TfLZ/H0RX6
         71GrkitKSHAwUT7KrMpcpiKgdvsOQeu+Z0adaCAqtqIfkLCoRBKwai4FoY2Df5azbo
         wKeR3CVfRnUGWNT4fL119L4Lj3ABsob3JDXXQ/Pc=
Date:   Mon, 28 Sep 2020 07:20:05 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Prasad Sodagudi <psodagud@codeaurora.org>
Cc:     rostedt@goodmis.org, mingo@redhat.com, keescook@chromium.org,
        saiprakash.ranjan@codeaurora.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, anton@enomsg.org, arnd@arndb.de,
        catalin.marinas@arm.com, ccross@android.com, jbaron@akamai.com,
        jim.cromie@gmail.com, joe@perches.com, joel@joelfernandes.org
Subject: Re: [PATCH] tracing: Add register read and write tracing support
Message-ID: <20200928052005.GB767987@kroah.com>
References: <1601253290-400618-1-git-send-email-psodagud@codeaurora.org>
 <1601253290-400618-2-git-send-email-psodagud@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1601253290-400618-2-git-send-email-psodagud@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Sep 27, 2020 at 05:34:50PM -0700, Prasad Sodagudi wrote:
> +config TRACE_RW
> +	bool "Register read/write tracing"
> +	select TRACING
> +	default n

n is always the default, no need to list it.

And you only did this for one arch, yet you made a generic kernel config
option, is that really wise?

thanks,

greg k-h
