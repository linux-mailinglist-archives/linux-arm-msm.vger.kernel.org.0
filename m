Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5582E337969
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 17:32:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbhCKQbm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 11:31:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbhCKQbT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 11:31:19 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99513C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 08:31:19 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id w195so17099348oif.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 08:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dxCOzqw4OU5tNnGsb0G/mX+YTbwJwLies3DsLPBifnM=;
        b=YTc1qrhxjsnX9+9VweICdIymergn23QKmhuRY3DiCjo8y5jB/7SeamD5tYP0HCTAtP
         VKeFHLfTynEAgFT7EF+MGGhmXdSFJmyAN+ZwfWmdeKKofBwFT7o9duX2Nkt1SRdsS3YV
         YpSLGHo0DxX6/hRelFakKkU5BLbiBpx+xjiV5Ae634VWo2hVBWYm1WVtSBBa1rzb4cW2
         Fyylx8ycQyIsCgjCgIE7n5EWdFvV0RzoT07McHPiX9wcV50MxBDyKgmGZd0EXmLkPR/Q
         8JjTZR0eccWaE3y4aA5ZCoUypcRkHuFplhfZo9TZ3E6xIqczVYyXfGohGbjdUrimmwNh
         1A9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dxCOzqw4OU5tNnGsb0G/mX+YTbwJwLies3DsLPBifnM=;
        b=MF1799XYOb2f5AJAqhoZAkjMOCnUE8+emauorUQFcRDHryWlOKPUqEyFuFSjmuZpqb
         LjL3SLVh5DChx6b9QzgI+ODH5uetph0BEd9hvAedOmu+e1OyzmF/XvtYqtsMIv8bKUSV
         tSUH1h9BAQ2X5fYkuC/R4YtbCOfILcnCGzHSOZ9jm3H+ywuGPJKbln39/ScOzu793M1i
         W/eUtQF3T/gnyQeNBciDxhQEaLFyZ685bxnVLo52Jtox8UrDNEVWz/QqF/Q3rXDpA2mw
         mQmBUXiu8oyhOIpr8dNpj/3JFsAeG1mY8yQFmWk1mHu9uChEZs0i9wZ1Ne8+kceiTa0D
         QQYw==
X-Gm-Message-State: AOAM5327hngQ7In00/Zo+0ujnoVTCNKTOO/qAou2UB9pcRc2nU/jkAmF
        iNc8MrQurlIaU+/7bUy6bsbPNAS6062Glg==
X-Google-Smtp-Source: ABdhPJy8g+TsPd2NUk3K/DbblvGVMt7+KSupjIq5Fp3bjoYNBvD/mp6WLJf/7RBLg4CdHqxr5X8eCg==
X-Received: by 2002:aca:c2d7:: with SMTP id s206mr6544020oif.95.1615480278918;
        Thu, 11 Mar 2021 08:31:18 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s193sm625571oih.52.2021.03.11.08.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 08:31:18 -0800 (PST)
Date:   Thu, 11 Mar 2021 10:31:16 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Souradeep Chowdhury <schowdhu@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        sibis@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        vkoul@kernel.org
Subject: Re: [PATCH V1 2/6] soc: qcom: dcc: Add driver support for Data
 Capture and Compare unit(DCC)
Message-ID: <YEpF1JO4CAd2pb0m@builder.lan>
References: <cover.1615393454.git.schowdhu@codeaurora.org>
 <48556129a02c9f7cd0b31b2e8ee0f168e6d211b7.1615393454.git.schowdhu@codeaurora.org>
 <YElUCaBUOx7hEuIh@builder.lan>
 <ab30490c016f906fd9bc5d789198530b@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab30490c016f906fd9bc5d789198530b@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 11 Mar 00:19 CST 2021, Sai Prakash Ranjan wrote:

> Hi Bjorn,
> 
> On 2021-03-11 04:49, Bjorn Andersson wrote:
> > On Wed 10 Mar 10:46 CST 2021, Souradeep Chowdhury wrote:
> > 
> > > The DCC is a DMA Engine designed to capture and store data
> > > during system crash or software triggers. The DCC operates
> > > based on link list entries which provides it with data and
> > > addresses and the function it needs to perform. These
> > > functions are read, write and loop. Added the basic driver
> > > in this patch which contains a probe method which instantiates
> > > the resources needed by the driver. DCC has it's own SRAM which
> > > needs to be instantiated at probe time as well.
> > > 
> > 
> > So to summarize, the DCC will upon a crash copy the configured region
> > into the dcc-ram, where it can be retrieved either by dumping the memory
> > over USB or from sysfs on the next boot?
> > 
> 
> Not just the next boot, but also for the current boot via /dev/dcc_sram,
> more below.
> 

Interesting!

> > > Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
> > > ---
> > >  drivers/soc/qcom/Kconfig  |   8 +
> > >  drivers/soc/qcom/Makefile |   1 +
> > >  drivers/soc/qcom/dcc.c    | 388
> > > ++++++++++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 397 insertions(+)
> > >  create mode 100644 drivers/soc/qcom/dcc.c
> > > 
> 
> <snip>...
> 
> > 
> > How about implementing this using pstore instead of exposing it through
> > a custom /dev/dcc_sram (if I read the code correclty)
> > 
> 
> Using pstore is definitely a good suggestion, we have been thinking of
> adding it as a separate change once the basic support for DCC gets in.
> But pstore ram backend again depends on warm reboot which is present only
> in chrome compute platforms but android platforms do not officially support
> warm reboot. Pstore with block devices as a backend would be ideal but it
> is still a work in progress to use mmc as the backend [1].
> 

I was under the impression that we can have multiple pstore
implementations active, so we would have ramoops and dcc presented
side by side after such restart. Perhaps that's a misunderstanding on my
part?

> Now the other reason as to why we need this dev interface in addition to
> pstore,
> 
>  * Pstore contents are retrieved on the next boot, but DCC SRAM contents
>    can be collected via dev interface for the current boot via SW trigger.
>    Lets say we have some non-fatal errors in one of the subsystems and we
>    want to analyze the register values, it becomes as simple as configuring
>    that region, trigger dcc and collect the sram contents and parse it.
> 
>    echo "addr" > /sys/bus/platform/devices/***.dcc/config
>    echo  1 > /sys/bus/platform/devices/***.dcc/trigger
>    cat /dev/dcc_sram > dcc_sram.bin
>    python dcc_parser.py -s dcc_sram.bin --v2 -o output/
> 
> We don't have to reboot at all for SW triggers. This is very useful and
> widely used internally.
> 
> Is the custom /dev/dcc_sram not recommended because of the dependency on
> the userspace component being not available openly? If so, we already have
> the dcc parser upstream which we use to extract the sram contents [2].
> 

My concern is that we come up with a custom chardev implementation for
something that already exists or should exist in a more generic form.


In the runtime sequence above, why don't you have trigger just generate
a devcoredump? But perhaps the answer is that we want a unified
interface between the restart and runtime use cases?


It would be nice to have some more details of how I can use this and how
to operate the sysfs interface to achieve that, would you be able to
elaborate on this?

Regards,
Bjorn

> [1]
> https://lore.kernel.org/lkml/20210120121047.2601-1-bbudiredla@marvell.com/
> [2] https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/tools/tree/dcc_parser
> 
> Thanks,
> Sai
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
