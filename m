Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 028D82F436E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 05:59:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbhAME7t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 23:59:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbhAME7t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 23:59:49 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA4D5C061786
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jan 2021 20:59:08 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id d8so783906otq.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jan 2021 20:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NAZs9noQhlL0cRjPUJTA7ti5rvMwGHtWYzwNXwiNE0w=;
        b=TLxfiBx9bh8QDCnVF+Q8dR9+6oWyqBjC9ha5gzry/p87YZLloMn5agcXRlQY/H7IMS
         hJMp2s8PGOpmsbV0iylz6km7yUp2x1h9MOfxh4cpATfHU32A+B6xD4yOMJV7yFgDJMcI
         lNc7HMQpID6pW23sNxwaQofyz57hhzUdfDMOom07ZzrhBsFWuvfbZv/jBDbmpt8wfJQF
         0A8H+fDz921X3HKReHlwA/3NnW6vUk1EcjGPlKIBPV/DR2w7buCjKKpG14kVKZYDGBIA
         lwTVnDAHBsfy6pj5joN8Kgb2mzmatbeybBSfuDDCfRJ4w0s7NexplED5HhHvCl8UQQty
         YwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NAZs9noQhlL0cRjPUJTA7ti5rvMwGHtWYzwNXwiNE0w=;
        b=m29hMGEsUbUkhgBoGS5bnICdfIIHnEGfTgy1wr1MXtdyCAXbnlaAkfzmMRjuGip0QI
         Xl0a61leYPKXYFoHdcbG+bhwSayjBHrzmgmTUZAUQULuehFpfYiyVcqEhOVFduTRAff8
         UMzxyCsFKe2ev1njklOGpHmy7KCBEi3/+m9pJTXQJpyqUFUa/V2cwuoloNCUmFlt2ciP
         tffRv9iLF3VIlNI/kZerJcUxOZ/y0GCBORKMDx9FdfDFAeG5Qw9o612EKEtwiF0bByl1
         +NL0NNwDK3zu/2yLglFAz8LGZJXPr/zPOedwicgVRYx8vZ2S6siMZ0P/puJsYUEQaS4J
         Vpqg==
X-Gm-Message-State: AOAM533b2XcEanFutQDxxX4kPGSNQNYwWmQBqHu3oDdHXBc2esMfua+Q
        Ul5mBPUcItzSJ4eRRPYaUx1cD9Sklx8CAQ==
X-Google-Smtp-Source: ABdhPJwOYw8C6NPbdBKv6uPhbGzyqD5EgVf+oNLFiaIDJRLmhTpp4UV0FlqUsWcdMTljtjX85vK3Dg==
X-Received: by 2002:a9d:70d9:: with SMTP id w25mr176833otj.0.1610513948198;
        Tue, 12 Jan 2021 20:59:08 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v17sm196428oou.41.2021.01.12.20.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 20:59:07 -0800 (PST)
Date:   Tue, 12 Jan 2021 22:59:05 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Shawn Guo <shawn.guo@linaro.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Andy Gross <agross@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] cpufreq: qcom-hw: add missing devm_release_mem_region()
 call
Message-ID: <X/5+GbueKg66DoEE@builder.lan>
References: <20210112095236.20515-1-shawn.guo@linaro.org>
 <X/210llTiuNt3haG@builder.lan>
 <20210113043143.y45mmnw3e2kjkxnl@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113043143.y45mmnw3e2kjkxnl@vireshk-i7>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 12 Jan 22:31 CST 2021, Viresh Kumar wrote:

> On 12-01-21, 08:44, Bjorn Andersson wrote:
> > Intuitively I feel that resources allocated in cpufreq_driver->init()
> > should be explicitly freed in cpufreq_driver->exit() and should thereby
> > not use devm to track the allocations.
> 
> I agree.
> 
> > But afaict when qcom_cpufreq_hw_driver_remove() calls
> > cpufreq_unregister_driver() to end up in cpufreq_remove_dev() it will
> > only call cpufreq_driver->exit() iff cpufreq_driver->offline() is
> > implemented - which it isn't in our case.
> 
> cpufreq_offline() calls exit() in your case. So no memory leak here.
> 

Okay, so cpufreq_offline() calls exit iff there's no offline implemented
and therefor cpufreq_remove_dev() need to call exit if the other code
path was taken in cpufreq_offline()...that's...clever...

Thanks for confirming that exit() will be invoked, then we should stop
using the devm versions of the allocators.


But that said, why are the ioremap done at init and not at probe time?

Regards,
Bjorn

> > So without using devm to track
> > this we would leak the memory - which also implies that we're leaking
> > the "freq_table" when this happens.
> > 
> > But isn't that simply a typo in cpufreq_remove_dev()? And can't we just
> > use ioremap()/iounmap() here instead?
> 
> -- 
> viresh
