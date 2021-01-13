Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD1A2F4381
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 06:10:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbhAMFHg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 00:07:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbhAMFHg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 00:07:36 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C722DC061794
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jan 2021 21:06:55 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id b8so419947plx.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jan 2021 21:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gyKIFw+IPWRbdD3u9S0/inpqqBfelQFBDgUhalF3D4o=;
        b=oC/8+wx9OS5TrvncTk9uKUJsoDN0GpZ9jAPR1pJ2adPYtYkJ7zr99b/qpQEK0+7sMK
         cT5C7uRDk3hruPnRjbcMprurgOT4b/GY5NusBKRi/ofm9GUX2OhsByV1D2smhmVlEKkk
         MWd0/3kALZDn+M31ANta1DBXq4Q8xsXx/sDGIPSL9kRCSjh8Em7qWkL5IyCni7FggMZt
         dX1rfKnSHQRqbNRkhrL9k/R1d53g3bWFl9mIYp5Y7mE0BoymmY90G6DePNLYMJUUG8Y5
         HPX5OP0535cj2LMM/i4O4hBra6lcp4Ckc0mWFqJZfQo6ONj/MVqOocGfLwN+hz7N4ytG
         ZGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gyKIFw+IPWRbdD3u9S0/inpqqBfelQFBDgUhalF3D4o=;
        b=O/MnRrgaCmH21y4z6G+Y6wox8Sc1nHkxx3hxIdZmEMGx+o4kTfM7gZ/pXGgaxSdfY4
         SHs8fVHFkt6mF9/Iig0iIqR4naIflV7+8LrLC4OV/TLWGILnz5YUmIM1WmegqdCQYulh
         OxYWl3z3k9QwFxDryvCPg7yINUHk0cnQYY10IdM7RgL0k8A1KekuPyDo0HdlwX8Odh47
         LoYc47kApxBGp2XfCY3j5vxF6/ZiY18E0DNkiQPTytNut9hqrLC4HMER8qhrQTazNboe
         duBemNvV26NVzZf4cPYd99FwlKpHz4i5Zhy/9bziF9SWgESib90lSnqsZAQkGdf9IQDT
         FmbQ==
X-Gm-Message-State: AOAM532uOc691EAFDLUFKdDRqgW6qMud4SVCLVZFJZ1wWL8205BZQTge
        KYxi3IoUyeyF5Zwr24NCExnGBQ==
X-Google-Smtp-Source: ABdhPJzP3V6xcb8suT8nqzb7MmeBAtJDFAETD/WxvXgCPy6ZwHQdClJgivOX5JPkGy5gX2UvLvn1ug==
X-Received: by 2002:a17:90a:b296:: with SMTP id c22mr308880pjr.91.1610514415205;
        Tue, 12 Jan 2021 21:06:55 -0800 (PST)
Received: from localhost ([122.172.85.111])
        by smtp.gmail.com with ESMTPSA id j15sm857607pfn.180.2021.01.12.21.06.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Jan 2021 21:06:53 -0800 (PST)
Date:   Wed, 13 Jan 2021 10:36:51 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ionela Voinescu <ionela.voinescu@arm.com>
Cc:     Shawn Guo <shawn.guo@linaro.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Andy Gross <agross@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] cpufreq: qcom-hw: add missing devm_release_mem_region()
 call
Message-ID: <20210113050651.q2txref3d6bifrf3@vireshk-i7>
References: <20210112095236.20515-1-shawn.guo@linaro.org>
 <X/210llTiuNt3haG@builder.lan>
 <20210113043143.y45mmnw3e2kjkxnl@vireshk-i7>
 <X/5+GbueKg66DoEE@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/5+GbueKg66DoEE@builder.lan>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12-01-21, 22:59, Bjorn Andersson wrote:
> But that said, why are the ioremap done at init and not at probe time?

These are some hardware registers per cpufreq policy I believe, and so
they did it from policy init instead.

And yes I agree that we shouldn't use devm_ from init() for the cases
where we need to put the resources in exit() as well. But things like
devm_kzalloc() are fine there.

Ionela, since you were the first one to post a patch about this, can
you send a fix for this by dropping the devm_ thing altogether for the
ioremap thing ? Mark it suggested by Bjorn. Thanks.

-- 
viresh
