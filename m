Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E792C2F5A1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 06:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbhANE7J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 23:59:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbhANE7I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 23:59:08 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81316C061795
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jan 2021 20:58:22 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id h10so2646798pfo.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jan 2021 20:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pj7+cBEgJXtMaQZzh3Z5M/qdd4smvWQjfRymnLpNJDE=;
        b=OTqEl53tlZIfTcY6c6ogIn6A/A5YR8Y1PMMhxyNO6pYF+mFBSkEX2+xbZRn040Dnha
         YZMStQBY1cay6decowTVBFjzhaa4nNnFmONpXeJ3Ip7ncrbp7LqbM3jeyHjIQVBcCURH
         OTqIIKehZ/Ivd8qs8NHFXrH54BP6+waVyWJ6kn9A7lTofRaC9zUg/HSUgmGOr1dYyHlb
         NreRWe8fjyutBWpLl3WcJNXPRvY6XF/afU4c27IJ1nTmnZFKMfTu7Eza4xYhqPAxRpwQ
         gsepjva9wc78cBOzpEb5yVFypgb6hze0/4zqD3QxWWlJLTs3l7WgDGLfKuxa+LnN3I/q
         72xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pj7+cBEgJXtMaQZzh3Z5M/qdd4smvWQjfRymnLpNJDE=;
        b=XV5Ijcy+RyB6Jtym9jLxxSXIZ+qM8EFImOK+LCL0QbW/dSl0bEdWAJ8eyXZZL3Z4dq
         FB8tP7HQekAK9VksIZW47OG2nBmNyT42ax4Cq+0fcgRR1H7PFV7ByaNEKwik7R6iy2EC
         l0RMrK+VHimnCVg7Pdhn58hQ8yB30N/GBfwTtyzPtj5dnLwvAtjr9O6OTsbKTAHy5NmQ
         f9HxUizcnRUZ+oKYdwqm6vi8FPIBXLXEKmeEFPV2lk10cRvG/GAZWteqV6WwhnOxa67d
         Bet/3X776XBFipNvI2o5W5hFIl4FDw4GoQuw0olnBaN5lu3gtroo4ToMlg/jXuYyhnfh
         pJDw==
X-Gm-Message-State: AOAM532v8Y1zXAdqmcMojgvsWGiqmLZZYHwy9Hrh9xhkCxaY47WPc2Bo
        CVLY+spt7rm1cY8V8qekB7O/iA==
X-Google-Smtp-Source: ABdhPJwCm/dwbUIScsf1C9L4ZGYnnv2zRUj6lm0DFn9Y/Pv2L3hwsFwVrHcrgxReyH107F0pQ3jFTQ==
X-Received: by 2002:a63:c501:: with SMTP id f1mr5563244pgd.1.1610600301891;
        Wed, 13 Jan 2021 20:58:21 -0800 (PST)
Received: from localhost ([122.172.85.111])
        by smtp.gmail.com with ESMTPSA id f24sm4109293pjj.5.2021.01.13.20.58.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Jan 2021 20:58:20 -0800 (PST)
Date:   Thu, 14 Jan 2021 10:28:18 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ionela Voinescu <ionela.voinescu@arm.com>,
        Shawn Guo <shawn.guo@linaro.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Andy Gross <agross@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] cpufreq: qcom-hw: add missing devm_release_mem_region()
 call
Message-ID: <20210114045818.d3qu6jpekjol7ch2@vireshk-i7>
References: <20210112095236.20515-1-shawn.guo@linaro.org>
 <X/210llTiuNt3haG@builder.lan>
 <20210113043143.y45mmnw3e2kjkxnl@vireshk-i7>
 <X/5+GbueKg66DoEE@builder.lan>
 <20210113050651.q2txref3d6bifrf3@vireshk-i7>
 <cbd4fb28-24b8-9aa7-fe5f-24571ef6258d@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbd4fb28-24b8-9aa7-fe5f-24571ef6258d@somainline.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13-01-21, 23:12, AngeloGioacchino Del Regno wrote:
> Sorry, are you sure that the eventual fix shouldn't be rebased on top of my
> change (12014503) [1] that is enabling CPU scaling for all of the platforms
> that aren't getting the OSM set-up entirely by the TZ/bootloader?
> It's a pretty big series, that I've rebased 3 times already...
> 
> [1]: https://patchwork.kernel.org/project/linux-arm-msm/patch/20210112182052.481888-15-angelogioacchino.delregno@somainline.org/

I am waiting for someone from Qcom background to review the stuff, perhaps Bjorn
or someone else as it is a big change.

Second, the fixes never get rebased on new stuff as they also need to make it to
stable kernels and current Linux release instead of the next one.

So, this fix will go first irrespective of the timeframe when it was posted.

Thanks Angelo.

-- 
viresh
