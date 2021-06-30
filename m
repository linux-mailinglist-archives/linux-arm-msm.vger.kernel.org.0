Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 071AA3B7C4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jun 2021 05:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232902AbhF3Dzq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 23:55:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232373AbhF3Dzl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 23:55:41 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C334CC061766
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 20:53:12 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id g24-20020a17090ace98b029017225d0c013so2093141pju.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 20:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UD8T97d6m5wJ+ibsAaXsXaCeGXCEKJyV5O+K6ZTbqtk=;
        b=R7GIPWVXUcCcFCZro/fdSCmKWKSZvb0/CPUuhSh6bLmBN+XLgDK4j3FaDTiEwW2Uyc
         4jlJ2KBTfrJv6u4/aSfvO+bH6Y1Bw0Oe2fA800RIkbCB9DHg7SIguJYYOdTorgfb4I9D
         ohrOYZYT/ehlwSZRzW5vwL7NJwK+XdkCOltFHuKFzwXVe0RrulCgKq8qSyIw8567KuQi
         SF3Ka/kuOYQ6idEixi3oo3CsrtcRiCAirnFwdTLSQV1J6NVDIwgeu77++PNC+5KZ8ukw
         RCccynICKc9Li5OSM0gK+/iCqXDWMWfQq4PGbmIsQHpsjyX8IWlYvLABj1BSmn6KjIMr
         KkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UD8T97d6m5wJ+ibsAaXsXaCeGXCEKJyV5O+K6ZTbqtk=;
        b=k3ZJ6JV3Z4u1JvIg7kzdhjn1EF38959zZLTHaGFuw8x64Mdvh+bbL7V0WDWb2zODYf
         /flwL62QiIkzjUvmt1n9Um5rSEmzjVqiuPfJiQ1ODqs6u0gcerz0KY5go+0VeAEvTzfH
         gHnpP8lTVI1E/0L13CXktJDjHzYR2uliGDyQIktXXJXhYnb/Qq500XdN2cjXgWejroS9
         FzrW/9RRmLxGTGiAwywGSvrBsg9efp8dfKYx2kArTRXwmqzsaDBs5w9UJT6kgu8xsqBG
         aiVF8XFDhVZKTkUemGP3XbNd0ZKEQHeITuYsB85iZmD2bPlpd0hPCNcbfaPIYtekT2JE
         eWdQ==
X-Gm-Message-State: AOAM531I2MqWQCO8eNEyFGNPSZaorL3Jm0XKx7RNcehulUBVCgyWGy9y
        xKwTy+us4oUhhn3Hw064nqMf0A==
X-Google-Smtp-Source: ABdhPJzwaGRPZR/RwPb5361P3l44INggwSiCue7C9Mww3eNhmzaKQEkIeHOGInLB9v/6PM7o1G3asA==
X-Received: by 2002:a17:90a:fa92:: with SMTP id cu18mr2311163pjb.215.1625025192309;
        Tue, 29 Jun 2021 20:53:12 -0700 (PDT)
Received: from localhost ([136.185.134.182])
        by smtp.gmail.com with ESMTPSA id n33sm19872937pgm.55.2021.06.29.20.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 20:53:11 -0700 (PDT)
Date:   Wed, 30 Jun 2021 09:23:07 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, rjw@rjwysocki.net, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [Patch v2 3/5] cpufreq: qcom-cpufreq-hw: Add dcvs interrupt
 support
Message-ID: <20210630035307.gaglmi36lqk3shwp@vireshk-i7>
References: <20210624115813.3613290-1-thara.gopinath@linaro.org>
 <20210624115813.3613290-4-thara.gopinath@linaro.org>
 <20210629023556.v3u4hdye5ojolubq@vireshk-i7>
 <5d194c91-e557-e5f5-60d6-ad2b1ca2def4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d194c91-e557-e5f5-60d6-ad2b1ca2def4@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29-06-21, 22:25, Thara Gopinath wrote:
> I don't think cpufreq_cooling recognizes boost frequencies. The max state
> there is the max of nominal frequencies , right? If not, it might be a good
> idea to add this check there as well.

Ahh, that explains it.

-- 
viresh
