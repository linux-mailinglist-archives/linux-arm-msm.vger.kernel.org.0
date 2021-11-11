Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EFDF44CEC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 02:25:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232767AbhKKB14 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 20:27:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232528AbhKKB14 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 20:27:56 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E05EEC061766
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 17:25:07 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id n15-20020a17090a160f00b001a75089daa3so3355003pja.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 17:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nWbslJ60ZPCanj2HYtzA6ZLWxe4Hhp7nGp3LzxZFt38=;
        b=IXFXRaZfJ4nCndxstxP8bxiKUWIm4Wt4A6H5xsMg4TiWsNfFAA+vZ5KkIO9UACPT63
         ifosOGyAyEBSysgvuM4SmXBxYsfqeQUzEychsoFuIR2FsiYsbyq6rCMgHwIMlwoycKS2
         M5BiNXgtnhe+0A23d6bpVAFiW18+D6ftwvk84dJYq3CgLAPuNe5WOJ0/Y2x9VFEoZa/6
         NEiBvIRIwlAcTIpoZFROZA7jaiPkgaxXAYzJtdpwWbixo/3cHR56jL08ho8Ut6dub+pe
         bUf/FUPgYZvpmFRi3+Mir8XOENzazvNgN0xGnCJOkgOE4khmoYR5wEFdreIJCG/sx0e0
         NzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nWbslJ60ZPCanj2HYtzA6ZLWxe4Hhp7nGp3LzxZFt38=;
        b=DLMozYhepHq1NoZBWGtMNoEYsn3aMh6Bpoh0q8Y4gMDwVGx4/330hr5DdfN6A/eiqu
         lxqM9pb7ZmxRQbaJIQprr7LV0guTUNOcu1OBAVrfJfDCzX/CSczej4dzgD/ckIyBpl3F
         qsC4RsDDEmZ3T8tsxkuBB7d2bggGYPW0WVajyB3FIwEd2vXAeyYwRAG52lyD1WpNkBRL
         SGooydLGXPOCMlIimaXx27K5HbG0ax0PceqFrjSG79xIoaVWIUUxC1ETf6sDYBY8Wp2y
         1qFUXEAKkkc76tI7j2hox8QJzeEAzhG1VbUwnvApnYbRM2TldTKmG74JY7Z/9K5t3OrU
         tSXw==
X-Gm-Message-State: AOAM532YW222WCEgqPxLXDQMpL6DueqExyoifT4aJNApiNMsNeoeqJNH
        xSCLhVyGmJSxCi052EXzI+gGC4n9KlyxJw==
X-Google-Smtp-Source: ABdhPJyr75OcvjSZSdThMZRuLnUhVC6TaRHanJoEKMxWRqcV4KBA3sK7U08wDtERoltIKWx03tuShA==
X-Received: by 2002:a17:90a:5b:: with SMTP id 27mr4084014pjb.148.1636593907401;
        Wed, 10 Nov 2021 17:25:07 -0800 (PST)
Received: from localhost ([223.226.77.81])
        by smtp.gmail.com with ESMTPSA id h134sm823053pfe.67.2021.11.10.17.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 17:25:06 -0800 (PST)
Date:   Thu, 11 Nov 2021 06:55:03 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ard Biesheuvel <ardb@kernel.org>
Cc:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] cpufreq: qcom-hw: Fix exposed stack contents
Message-ID: <20211111012503.rmz2kvcdzmht5rnw@vireshk-i7>
References: <20211110152745.1868099-1-vladimir.zapolskiy@linaro.org>
 <YYvn1CJBrWprEKCD@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YYvn1CJBrWprEKCD@ripper>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10-11-21, 07:40, Bjorn Andersson wrote:
> On Wed 10 Nov 07:27 PST 2021, Vladimir Zapolskiy wrote:
> 
> > On irq request it is improper to pass its designated name, which is
> > allocated on stack, because the irq name string is not copied, thus
> > there is a risk of leaking partial stack contents to userspace.
> > 
> > Fixes: 275157b367f4 ("cpufreq: qcom-cpufreq-hw: Add dcvs interrupt support")
> > Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> This was already proposed and reviewed at:
> 
> https://lore.kernel.org/all/20210901084732.943248-1-ardb@kernel.org/
> 
> Could Ard's patch please be picked up by the maintainers, preferably
> with above Fixes added, so we get this backported onto v5.15 stable...

It never reached any of the PM guys unfortunately.

Ard, can you please repost it again ?

-- 
viresh
