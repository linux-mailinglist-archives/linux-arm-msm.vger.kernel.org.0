Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C9F4301D8A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jan 2021 17:42:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726041AbhAXQmc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jan 2021 11:42:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:45072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725910AbhAXQmc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jan 2021 11:42:32 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E7F0A22AAA;
        Sun, 24 Jan 2021 16:41:50 +0000 (UTC)
Date:   Sun, 24 Jan 2021 11:41:49 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Gaurav Kohli <gkohli@codeaurora.org>, efremov@linux.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] trace: Fix race in trace_open and buffer resize call
Message-ID: <20210124114149.1d8c4a62@gandalf.local.home>
In-Reply-To: <YA1GaFpirfseZkxd@kroah.com>
References: <1611482193-32540-1-git-send-email-gkohli@codeaurora.org>
        <YA1GaFpirfseZkxd@kroah.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 24 Jan 2021 11:05:28 +0100
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Sun, Jan 24, 2021 at 03:26:33PM +0530, Gaurav Kohli wrote:
> > Below race can come, if trace_open and resize of  
> 
> <snip>
> 
> You forgot to cc: stable, and put the git id that this patch is
> upstream...

Hi Greg,

Sorry for the confusion. I wanted to give it a test before pushing it
officially to stable. Gaurav was just following my instructions. After I
get a chance to test it (tomorrow), I'll send it properly to stable.

Thanks,

-- Steve
