Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7741A2F9A0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 07:44:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730346AbhARGoL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 01:44:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726624AbhARGoK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 01:44:10 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E31C061793
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 22:43:20 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id m6so9627641pfm.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 22:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ImV+82CIi7B39yd3/wElKC3YQUigOnNA5i3r3aKhvos=;
        b=uJArfO8M5KkGLDGLtyNtg4vDzHlYh7h7uMQYsIiaFNpfy3NgAJs/tkVtMDj/8nvyY6
         IKSlVuZJSrJcAjqsJNSYLm5O0tiEPSE2oAD3Oj/SgwMgvowU+fLRaM6yQm+9eFURkj7o
         KuOgrUpqg95cUMabcEl+nwAj7rXPqjPrEpNOFS33CdiV9125vKPrJIzSv6LMfdpbHW+q
         6ClMxkds5l2beB23K/QHKETzFrySLoVlFzwMxxTAve4d+7BtiPun97JMKIjwy4akVi8q
         xdw5PF7motbwHTNU7St4y0HvgtkX4OZ6y4iCFP5JYyMMcyqJOx3wraedW0sElVCnfjR3
         keuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ImV+82CIi7B39yd3/wElKC3YQUigOnNA5i3r3aKhvos=;
        b=s6vm8A2wP7vCiSGJZYtxPATZmfMbVhN1/LCBRDvi3ROHl2tfSwiupsFeaIOnfDuaH/
         tqub41QWkGw+D1n/P4JX+IaLtIdTv+460lRXuqUE59HFUpaJAoIk/hM5T36utsZX7wch
         9LY5BnIuWLluTpiZNw7HWe1xfwem35r64mYAD2SIH1Ws+Y7Mmb9zsQCDCS1LqTikPHDn
         PmLrBOsg8xbhOjf0z1OSz4eOBTouIadpL3W2+5YWW0ISKeTeYGyov2KG54YWpf+DeFJz
         NGH5N6N7t1ibyXwUqPhej79v5kXg/pQmLH9hSOub45Lzzt72l2PPBIezAXeggwyYujNR
         KhSw==
X-Gm-Message-State: AOAM532hUNV+Skvl+Z4GUXqnZAnrKjerVc6pJ2+mi8KIIy2p+kwPIIG3
        dIZzX+/5zE/EznjTVh8eRrtcjA==
X-Google-Smtp-Source: ABdhPJy3wbEFkD5GKIXSbxFSxsyPa/S4jzn/K8tRtRM9SmxXq0x1+HYZbKiRTWT/a+3In3ya70LPUQ==
X-Received: by 2002:a05:6a00:2296:b029:1b6:6972:2f2a with SMTP id f22-20020a056a002296b02901b669722f2amr7288713pfe.69.1610952199657;
        Sun, 17 Jan 2021 22:43:19 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id z13sm15526078pjz.42.2021.01.17.22.43.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Jan 2021 22:43:19 -0800 (PST)
Date:   Mon, 18 Jan 2021 12:13:16 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ionela Voinescu <ionela.voinescu@arm.com>
Cc:     Shawn Guo <shawn.guo@linaro.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Andy Gross <agross@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] cpufreq: qcom-hw: add missing devm_release_mem_region()
 call
Message-ID: <20210118064316.nuo6ivetefxt63n6@vireshk-i7>
References: <20210112095236.20515-1-shawn.guo@linaro.org>
 <X/210llTiuNt3haG@builder.lan>
 <20210113043143.y45mmnw3e2kjkxnl@vireshk-i7>
 <X/5+GbueKg66DoEE@builder.lan>
 <20210113050651.q2txref3d6bifrf3@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113050651.q2txref3d6bifrf3@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13-01-21, 10:36, Viresh Kumar wrote:
> On 12-01-21, 22:59, Bjorn Andersson wrote:
> > But that said, why are the ioremap done at init and not at probe time?
> 
> These are some hardware registers per cpufreq policy I believe, and so
> they did it from policy init instead.
> 
> And yes I agree that we shouldn't use devm_ from init() for the cases
> where we need to put the resources in exit() as well. But things like
> devm_kzalloc() are fine there.
> 
> Ionela, since you were the first one to post a patch about this, can
> you send a fix for this by dropping the devm_ thing altogether for the
> ioremap thing ? Mark it suggested by Bjorn. Thanks.

Ionela, I hope you are working on this so we can get it fixed quickly
?

-- 
viresh
