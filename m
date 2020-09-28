Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC97D27A708
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 07:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgI1FqC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 01:46:02 -0400
Received: from z5.mailgun.us ([104.130.96.5]:55101 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726396AbgI1FqC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 01:46:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601271961; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Ie5rUDiiovTLKTOWZjkrtVsETmI7mVXRVE6tZnlDGJk=;
 b=A/neGERpgQqYyzxYZXyalbJNbRfywclmsl8K7qYhc0nIcUamz4mmnrdCwhugq9VYl28F+Tkp
 kI/GKyEURRBnSCPljI9f3/NfLKJ/bgaRScgD1ET66NAQ7NG8WUL+VCxVOzpMbo1PPsLr/3eo
 my+3bVfQ542vX9Yz3Z2enhz83hk=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f717899c00ccaf02881b51f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 05:46:01
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0405CC433CB; Mon, 28 Sep 2020 05:46:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DB659C433CA;
        Mon, 28 Sep 2020 05:45:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 28 Sep 2020 11:15:58 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Prasad Sodagudi <psodagud@codeaurora.org>
Cc:     rostedt@goodmis.org, mingo@redhat.com, keescook@chromium.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
        anton@enomsg.org, arnd@arndb.de, catalin.marinas@arm.com,
        ccross@android.com, jbaron@akamai.com, jim.cromie@gmail.com,
        joe@perches.com, joel@joelfernandes.org,
        Will Deacon <will@kernel.org>
Subject: Re: [PATCH] Register read and writes tracing
In-Reply-To: <1601253290-400618-1-git-send-email-psodagud@codeaurora.org>
References: <1601253290-400618-1-git-send-email-psodagud@codeaurora.org>
Message-ID: <ecc13f64210678c99cfcf7285f80c0c0@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Prasad,

On 2020-09-28 06:04, Prasad Sodagudi wrote:
> Qualcomm team have tried to upstreaming the register trace buffer(RTB)
> use case earlier - [1]
> with pstore approach. In that discussion, there was suggestion to use
> the ftrace events for
> tracking the register reads and writes. In this patch, added register
> read/write operations
> tracing support and also add _no_log variants(for example -
> readl_relaxed_no_log  to readl_relaxed)
> functions, which will help to avoid excessive logging for certain
> register operations
> (continuous writes from a loop).  These tracepoints can be used by 
> modules
> to register probes and log the data convenient  for silicon vendor 
> format.
> 
> [1] -
> https://lore.kernel.org/lkml/cover.1535119710.git.saiprakash.ranjan@codeaurora.org/
> 

Thanks for picking this up again. This kind of looks like going back to
downstream implementation of having log and nolog variants which was
exactly the thing we wanted to avoid.

I believe the reason for this nolog variants is not just to avoid 
excessive
logging but also to provide filtering i.e, selectively trace the 
register
reads/writes from required drivers or subsystems like for example we
wouldn't want to trace register reads/writes from serial drivers, now if
you use these nolog variants  then it will need to be sprinkled all over
the kernel in various drivers to provide this kind of filtering. That 
was
the reason I did not want to introduce these nolog and log variants, 
instead
introduced a way to use dynamic debug [2] to provide this kind of 
filtering.
Dynamic debug provides an array of filtering capacity such as filter by 
files,
folders and even is applicable for modules making it a prime candidate 
for
these kind of scenarios.

So why not use it instead of all these new variants? Then you don't have 
to
export things like you do in this patch and just have to add 
tracepoints.
Also the patch series[1][2] was almost OK'ed(they didn't give a formal 
review)
by arm folks at the time and even acked by Steve[3] except for the 
pstore part.
We have ways to extract trace events from ramdumps via crash utility or 
STM,
so pstore support is not mandatory and can be done later(it is currently 
being
worked on). Plus the link you mentioned was an RFC and there was a new 
version
posted after that[4]. Please take at the series[4] look once and see if 
you
can use that, only thing required I suppose is decouple the pstore 
patches
and you should be good to go.

[1] https://patchwork.kernel.org/patch/10593175/
[2] https://patchwork.kernel.org/patch/10593175/
[3] https://patchwork.kernel.org/patch/10593173/
[4] https://patchwork.kernel.org/cover/10593159/

> Qualcomm teams uses these logs for debugging various issues in the
> product life cycle and
> hopping that this logging would help other silicon vendors as this is
> generic approach.
> Please provide your suggestion/comments to bring this patch upstream 
> quality.
> 
> Prasad Sodagudi (1):
>   tracing: Add register read and write tracing support
> 
>  arch/arm64/include/asm/io.h    | 117 
> ++++++++++++++++++++++++++++++++++++++---
>  include/linux/iorw.h           |  20 +++++++
>  include/trace/events/rwio.h    |  51 ++++++++++++++++++
>  kernel/trace/Kconfig           |  11 ++++
>  kernel/trace/Makefile          |   1 +
>  kernel/trace/trace_readwrite.c |  30 +++++++++++
>  6 files changed, 222 insertions(+), 8 deletions(-)
>  create mode 100644 include/linux/iorw.h
>  create mode 100644 include/trace/events/rwio.h
>  create mode 100644 kernel/trace/trace_readwrite.c

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
