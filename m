Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A58003E5125
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 04:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235520AbhHJCrv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Aug 2021 22:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233833AbhHJCru (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Aug 2021 22:47:50 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35489C0613D3
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Aug 2021 19:47:29 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id e19so5453183pla.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Aug 2021 19:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aLz3R/PfInuBDOwjVvzSA+K2mOEipBXOGKBTYuR/UjQ=;
        b=u82RUKq0Cu9k+cH1e/nJUGAYPe+uSr9FwNA/i2Ax5QbR7bnnC5z9Abbug2YTjQxgPQ
         UaI9ruWDRXjrJxQ+E6kokRmM2Olb4t6VPWQiS/R+xMnOg7xskW5sHupXISw6uVhJZVQR
         EeQaz++xbMfFDdseC+9Ya8r4VHLrJ714j/gKVemJFr23QOdzZ32E37pa3+bKyUHekFQP
         t+aELbDGjXDOcLnSJ+YzZBmYsAbxepz1MVngI+I2YZgchl+1mZsm9ZkDFH6PyQA7bd76
         k9RHg4S1IWkgKQ+ptJyXMlhkEOuYP4n+A2vDTRqsJbL4TItoyW+doNNtr02TIXI7gyqN
         vXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aLz3R/PfInuBDOwjVvzSA+K2mOEipBXOGKBTYuR/UjQ=;
        b=iyOnhWyzKT5luC/TCqA7MVQqpffs/apnRWiXqMWuE4IoeFRkSUPxGNPJexOe7UmLoN
         x8SwzxTYdJCU/p+d42u/JNvABKgatbSCZNUmJRZRqzsWaImeFDN7hPPm5lAtnZ52kO54
         +R+14CYZHHJSPGRlK0MJIs/Rx5iEI5DqFhOuKW+kXz6bT9OFq93SP4xZLfMPN4TCmKMA
         t9jd9qoYgypwI4iphI/xmIh2h5c8uext7CdvKa00KRLZdr3TYVa9Nve+Q0hjW+ZSA7Sy
         5Ef81Ytxa/Tgg/AJM4H2oD68vWpiqKg5n/r5cvzxAZtsSTej6GhA2GXokY+t4M2om5mf
         TKMg==
X-Gm-Message-State: AOAM533cWoLuyYC/St/EglAqonP8Vd5SvYbGB4FgXGW/rKWEmeP2f3HX
        kDcasWsPcljvvDLqmd2p0yrdEQ==
X-Google-Smtp-Source: ABdhPJw4qsk6dKbmfyAQJNyBrmv6RENs2/OaroTuk2V8kwmx42VX7YmwQechtP9JeFUoTNE8Hm7Tdw==
X-Received: by 2002:a63:594e:: with SMTP id j14mr491424pgm.249.1628563648525;
        Mon, 09 Aug 2021 19:47:28 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id c23sm21805549pfn.140.2021.08.09.19.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 19:47:28 -0700 (PDT)
Date:   Tue, 10 Aug 2021 08:17:23 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, rjw@rjwysocki.net, robh+dt@kernel.org,
        steev@kali.org, tdas@codeaurora.org, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [Patch v5 3/6] cpufreq: qcom-cpufreq-hw: Add dcvs interrupt
 support
Message-ID: <20210810024723.qne6ntjtv5zxf576@vireshk-i7>
References: <20210809191605.3742979-1-thara.gopinath@linaro.org>
 <20210809191605.3742979-4-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809191605.3742979-4-thara.gopinath@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09-08-21, 15:16, Thara Gopinath wrote:
> Add interrupt support to notify the kernel of h/w initiated frequency
> throttling by LMh. Convey this to scheduler via thermal presssure
> interface.
> 
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> ---
> 
> v4->v5:
> 	- Changed throttle_lock from a spinlock to mutex to take potential
> 	  race between LMh de-init sequence and reenabling of
> 	  interrupts/polling after a thermal throttle event.
> 	- Other cosmetic fixes as pointed out by Viresh.

How do you expect this to get merged ? I pick up this patch alone ?

-- 
viresh
