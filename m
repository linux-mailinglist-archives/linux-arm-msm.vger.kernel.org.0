Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 962F2416A07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Sep 2021 04:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243813AbhIXCdN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 22:33:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232976AbhIXCdM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 22:33:12 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 846DEC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 19:31:39 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id v10so12439520oic.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 19:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mUT08plGeX5Emeo2aNwfpHriiLePv2VUKF/wr4V45A4=;
        b=sqYzhYg+Ulp8TBwx9adVjRHj/KNWs7rlZDXD4VnySjt623ezTRNvAUs7UL7HW4VCXP
         dH7doOcHndpJp3vwcDERzePVSQrvl+6U2TOnkQbL/HK83i8hCNCYofcI9PGwnM72jWig
         s/e6zBQ4aO72/i1e96VEeE4ZpGBDIeYFZlp7BohsfCJtOsC8n3cFxziP2b00umiQlEPM
         zBNwpbHJsP1+hspTSGwQPShz0Ld8WpExtoGu+7lrlUQs0sCZBjY5mHn4QnDP+uE5CRMa
         a2XNx35ojB95RNdopiQHiIt4+KIlSAGi8KlTqV6HEgU8/P5kTcUE+e/JCabG+yZnKMD0
         h3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mUT08plGeX5Emeo2aNwfpHriiLePv2VUKF/wr4V45A4=;
        b=SYoR7xwOlUjKyoPGhynLySg1V8pQTV2uGnGmbrrbFamSDdwAdcNumKH6RXfqOIRVIM
         maQG58yeIqBlQPmc/Oe1ZQT5kymb3XO0zmjndPm19HDHIltW46mTIb6vY5rqZJd/ohm9
         vtkLoRZVDw0sPK6mQU3gD7yyyRfa9KWN4tBB7g+NGRI5ke48ALTc+SHGtF03rnZFLnOP
         ajmy7KwJntQHonrWubKc8fmqgOsdCjbhvkLuKSWPKqHnti7qGwTBVNZOHeTXVpi/xray
         VVFmgQsmeNxUthysSfLyLxtjBnxpde6gJINfn7TuYCBzmja7H7gIsT3plBVlpLXe54X3
         bcog==
X-Gm-Message-State: AOAM533/eNR1LquqY5ti2mL5/u9mlC+v/6CObcy0TDaR1elGKAm73hjZ
        b7AaCWeEzzY7gO9rIngsHEGgbA==
X-Google-Smtp-Source: ABdhPJz3QwP0wn1WvFU+lYK8ASSvDCaN6bpC7MiDbLK/Vw6f/bvs68cMHru3V41xh7uAZSh17Xfhjw==
X-Received: by 2002:aca:ac50:: with SMTP id v77mr9147446oie.15.1632450698812;
        Thu, 23 Sep 2021 19:31:38 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w7sm1112108oic.12.2021.09.23.19.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 19:31:38 -0700 (PDT)
Date:   Thu, 23 Sep 2021 21:31:36 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Elliot Berman <quic_eberman@quicinc.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Prasad Sodagudi <quic_psodagud@quicinc.com>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/1] firmware: smccc: Add tracepoints when SMCCC calls
 are made
Message-ID: <YU04iNTYB1IblIKI@builder.lan>
References: <20210922223701.17521-1-quic_eberman@quicinc.com>
 <20210923112058.GA14893@C02TD0UTHF1T.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210923112058.GA14893@C02TD0UTHF1T.local>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 23 Sep 06:21 CDT 2021, Mark Rutland wrote:

> On Wed, Sep 22, 2021 at 03:37:00PM -0700, Elliot Berman wrote:
> > Add trace events for SMCCC calls. These traces allow for convenient
> > mechanism for kernel to log SMC/HVC instructions without requiring
> > extracting traces from firmware. SMCCC spec currently [1] allows for 7
> > argument registers and 4 result registers.
> 
> I think you've missed additions in recent versions of the spec. Since
> SMCCCv1.2 (which is described in version of the document you've linked),
> SMC64 calls may pass up to 17 argument registers (x1-x17) and receive up
> to 18 result registers (x0-x17). SMC32 calls have up to 7 argument
> registers (r1-r7) and up to 8 return registers (r0-r7).
> 
> What do you want to use this for? What specifically do you want to
> trace.
> 
> I'm worried that this is a very low level transport, and hooking this
> means tracing a bunch of unrelated users (e.g. PSCI, ARCH_WORKAROUND*
> calls, vendor-specific SMC interfaces), and potentially gets in the way
> of some of those use-cases (e.g. tracng this means it cannot be used
> from noinstr code, which we likely need to be able to do in future).
> 
> Generally I'd prefer to have tracepoints in specific drivers rather than
> in the SMCCC transport.
> 

I agree, putting the tracepoint at this low level will essentially
provide us with a hexdump of all SMC operations and one would more or
less need to so some post processing to get something useful out of it.
And in the few cases where the arguments are references to data buffers
there's no way to trace that content (e.g. qcom_scm_assign_mem()).

If we move it one step up we can provide trace data that's directly
useful to a human, provide insights in the data, allow for proper
filtering etc.

Regards,
Bjorn
