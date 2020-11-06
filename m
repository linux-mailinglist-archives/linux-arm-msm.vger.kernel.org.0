Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62CE92A9220
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 10:09:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbgKFJJZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Nov 2020 04:09:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:45798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726320AbgKFJJY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Nov 2020 04:09:24 -0500
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8998E208B3;
        Fri,  6 Nov 2020 09:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604653763;
        bh=arVLg/T+ZpsGVvzOO8U7XSGQI5zczdoHqogI6XGdhWs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z//f/omQISsEE7KXannULHQkXiQTndwb0IyxeIv7zx2cERwM39CABJz1U73oJH36v
         bd8dZL+Ucd8V3JFmWlPBzHb1+oZ1tvQXl5tya3+NdLBpJTDI4/00XJaVEHdXLWEqRM
         hCXgChumBSw132sDVSphL/HtZ7d6XtMh7Q0nuG1k=
Date:   Fri, 6 Nov 2020 09:09:17 +0000
From:   Will Deacon <will@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Prasad Sodagudi <psodagud@codeaurora.org>, rostedt@goodmis.org,
        mingo@redhat.com, keescook@chromium.org, catalin.marinas@arm.com,
        saiprakash.ranjan@codeaurora.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, anton@enomsg.org, arnd@arndb.de,
        ccross@android.com, jbaron@akamai.com, jim.cromie@gmail.com,
        joe@perches.com, joel@joelfernandes.org
Subject: Re: [PATCH v2] tracing: Add register read and write tracing support
Message-ID: <20201106090916.GB9496@willie-the-truck>
References: <1604631386-178312-1-git-send-email-psodagud@codeaurora.org>
 <1604631386-178312-2-git-send-email-psodagud@codeaurora.org>
 <20201106064929.GC697514@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106064929.GC697514@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 06, 2020 at 07:49:29AM +0100, Greg KH wrote:
> On Thu, Nov 05, 2020 at 06:56:26PM -0800, Prasad Sodagudi wrote:
> > Add register read/write operations tracing support.
> > ftrace events helps to trace register read and write
> > location details of memory mapped IO registers.
> 
> This sentance does not parse for me, can you please rework it?
> 
> > These trace logs helps to debug un clocked access
> > of peripherals.
> 
> "un clocked"?  What does that mean?
> 
> And you do have 72 columns to fill, please use it :)
> 
> > 
> > Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
> > ---
> >  arch/arm64/include/asm/io.h    |  9 ++++++++
> >  arch/arm64/kernel/image-vars.h |  8 +++++++
> 
> You are only adding it for arm64, why not add the generic support first,
> and then add it for all "major" arches afterwards?

Yeah, or just hook the higher-level accessors rather than the arch-specific
bowels. Less work for more coverage that way!

Will
