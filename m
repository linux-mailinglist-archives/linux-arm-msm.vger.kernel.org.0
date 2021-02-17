Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14E2831D52D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 06:52:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbhBQFvP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 00:51:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231346AbhBQFvN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 00:51:13 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1696C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Feb 2021 21:50:32 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id m6so7748091pfk.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Feb 2021 21:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qkSCWZe3fPVf1MeLv0asrOZ7NO0HuQyQtXUna6IlKOo=;
        b=C1oz9qbn1tp0GqzJhJGK3w7HzbreQKZ7gl95fjVZDqlxtGMKJKu1XB+CYLR+D1lgqW
         UdTcYDJbq3WCMoUoaNwUrR4HWGPJXeyv27gu01mO4Fb/v26u8mPLXfrKJtXpEaRViEz4
         s5TI4SUh7OhOKpqcrFNkwesCGnoB+0diRzP5PUD1t8pIfNQAk5zKWnEszExIZ5nt3K26
         InkakXPjCRgHLGE2mHVEzvIUJVSJC7S6iaT/Jt8gcny/lHGKowVb1JmzG4GODbfhDfNq
         lMA+xQ6X01go41TmraZRwDj3wA5egSbBq8+OhKDE+uqvcOdu98EIG2Bm4ZHinzkOHm30
         Oekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qkSCWZe3fPVf1MeLv0asrOZ7NO0HuQyQtXUna6IlKOo=;
        b=YV3qG6oteJj1Jm31cFjjp3B94h4jX2zhhat8ctTzQM7Ssez6RAZBDJmUQPrm1KmEqJ
         rbBCE5FO5XR7VY79JD5QfpNxc2WqH9FC8n8Ij+We8kTpl8Va5/v1KynpqNeZg9bDhQyp
         iLT9IQDKNrb2HjvGCt1GXUOAQKIQaC+wmsTwryOe1gLLfgKzBIPy4jFbZFIh0IOKshwF
         ZQzXo0x2oFLISj+CxPYK1ZN1CBrV4+z2M2ep/C+gxjPbPzfGYTCPCqu9k7Q7QlqNCxFx
         FQXAafMxf1gl8e+9MzcaVOcnUMtWJPUpNMxtBJ+xrB5PbwU0nrHs8Qd+R01ImZOW9mdQ
         WBCg==
X-Gm-Message-State: AOAM533+rlGXoFlJ8wbb01yI6R209jyFTqn+I3eYuHYrv0sGfLRo+rJO
        3WOmq87xTSB6WSXj8kYBEeWqAA==
X-Google-Smtp-Source: ABdhPJzpXTBfvNeba7mYHrI+FH1jg2GCvb4+vm+u7jdZvxavOPjvmN3FmJ3miyhBevHte/ldyntmUw==
X-Received: by 2002:a63:ec55:: with SMTP id r21mr21916136pgj.144.1613541032581;
        Tue, 16 Feb 2021 21:50:32 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id h5sm843546pgv.87.2021.02.16.21.50.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Feb 2021 21:50:31 -0800 (PST)
Date:   Wed, 17 Feb 2021 11:20:29 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     rjw@rjwysocki.net, bjorn.andersson@linaro.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] cpufreq: exclude boost frequencies from valid count if
 not enabled
Message-ID: <20210217055029.a25wjsyoosxageti@vireshk-i7>
References: <20210217000013.4063289-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210217000013.4063289-1-thara.gopinath@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Thara,

On 16-02-21, 19:00, Thara Gopinath wrote:
> This is a fix for a regression observed on db845 platforms with 5.7-rc11
> kernel.  On these platforms running stress tests with 5.11-rc7 kernel
> causes big cpus to overheat and ultimately shutdown the system due to
> hitting critical temperature (thermal throttling does not happen and
> cur_state of cpufreq cooling device for big cpus remain stuck at 0 or max
> frequency).
> 
> This platform has boost opp defined for big cpus but boost mode itself is
> disabled in the cpufreq driver. Hence the initial max frequency request
> from cpufreq cooling device(cur_state) for big cpus is for boost
> frequency(2803200) where as initial max frequency request from cpufreq
> driver itself is for the highest non boost frequency (2649600).

Okay.

> qos
> framework collates these two requests and puts the max frequency of big
> cpus to 2649600 which the thermal framework is unaware of.

It doesn't need to be aware of that. It sets its max frequency and other
frameworks can put their own requests and the lowest one wins. In this case the
other constraint came from cpufreq-core, which is fine.

> Now during an
> over heat event, with step-wise policy governor, thermal framework tries to
> throttle the cpu and places a restriction on max frequency of the cpu to
> cur_state - 1

Actually it is cur_state + 1 as the values are inversed here, cooling state 0
refers to highest frequency :)

> which in this case 2649600. qos framework in turn tells the
> cpufreq cooling device that max frequency of the cpu is already at 2649600
> and the cooling device driver returns doing nothing(cur_state of the
> cooling device remains unchanged).

And that's where the bug lies, I have sent proper fix for that now.

> Thus thermal remains stuck in a loop and
> never manages to actually throttle the cpu frequency. This ultimately leads
> to system shutdown in case of a thermal overheat event on big cpus.
 
> There are multiple possible fixes for this issue. Fundamentally,it is wrong
> for cpufreq driver and cpufreq cooling device driver to show different
> maximum possible state/frequency for a cpu.

Not actually, cpufreq core changes the max supported frequency at runtime based
on the availability of boost frequencies.

cpufreq_table_count_valid_entries() is used at different places and it is
implemented correctly.

-- 
viresh
