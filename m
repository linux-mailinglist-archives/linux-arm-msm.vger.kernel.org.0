Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63D1B3E511C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 04:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234974AbhHJCnf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Aug 2021 22:43:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231609AbhHJCne (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Aug 2021 22:43:34 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B83AEC061796
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Aug 2021 19:43:13 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id cp15-20020a17090afb8fb029017891959dcbso2178470pjb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Aug 2021 19:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mEtO03OIc860qDPInvLz3qFGfUeCouJ7pFCU8dty4U0=;
        b=eNbU18LmLOH3wLADwMkysokDiIfwMd9Pc2dqHuLtIEFJf75LTAJKNVd2ve1+YdL64C
         +6BCavcHfWuIgrH+fbd/kD5XTBlN0BU9XAa60Xhb1HpO6+YG8HMQxkC+G6yW0/UD4FTh
         3ErovM0ZfBqzEM1Uo0VzmVOgQWDgN/C++aNs0jRsyznmSGQcG3k8AzE2QBg4404aychg
         e3C6dMdT7hVb0v9zYTwHzBiEyuMs7K7f7pVDk3GIYehZzIkOKLjt/93SAAH6YV2TPGMF
         yRWA+3q9wdfsvTb5IHmhoHuxre8zSMGdrTDgPYwRfl5MrIEwqtfN3ghHEcwua98yW/JI
         AjRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mEtO03OIc860qDPInvLz3qFGfUeCouJ7pFCU8dty4U0=;
        b=XXqGpn4JWL64DLzkgD8iMshSNDOCEEsd4OuYCZbYda9kHq2ZpLYg1Sa0cpH1W66ZHH
         qDrBE3a9M8XueHi6nWxcqmZxAvYR4KJBj1hsC+1iSFugx4PIH2sgHoqUaDO4W5+6NOhM
         3vf7Zry1PctL+reyKC3pkyCr1es9yWI67c8+ytx6ln1mZyEhV22i7O3CzI4Q8kgAw2hy
         rYvrzqj+v7C4MqlwaPeyI+8xEXFfesSRR8dQZXLQzflVm8613Fk2xvu/k6Ltya60B97L
         e7mBQIodB9ZizNCWOVJdlKgE9O2G3Al7MUv9C+pFZvv51Hi+HiDgcnRNi5Os7SjpiqbU
         lFxw==
X-Gm-Message-State: AOAM531vqZzSQcPUUg4Zy3TpPRi3/BXROzpL2epFacqnZDHAvxhV5r7x
        W9j/AaMolUupn9hO8f5XVAT8qA==
X-Google-Smtp-Source: ABdhPJzvKKIhjbuNi3WfN/Mlyc/ZFUy4MKEae9P0opKTsgMcUjH38p9Kxd6cmuaYHjdfKvKNlowjDg==
X-Received: by 2002:a17:90a:bb0b:: with SMTP id u11mr2412472pjr.18.1628563393258;
        Mon, 09 Aug 2021 19:43:13 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id v63sm23343203pgv.59.2021.08.09.19.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 19:43:12 -0700 (PDT)
Date:   Tue, 10 Aug 2021 08:13:08 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH v6 1/2] PM / Domains: Add support for 'required-opps' to
 set default perf state
Message-ID: <20210810024308.gurvzpbe2bc2bhky@vireshk-i7>
References: <1628074696-7979-1-git-send-email-rnayak@codeaurora.org>
 <1628074696-7979-2-git-send-email-rnayak@codeaurora.org>
 <CAPDyKFrebwt5=S7hqXvcqRvt+-EXLcVmRSRZt1uPf-9n7_pRDg@mail.gmail.com>
 <2afd0fac-ed28-c090-a345-3fd4284b4125@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2afd0fac-ed28-c090-a345-3fd4284b4125@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09-08-21, 16:38, Rajendra Nayak wrote:
> Sure, I can do that, apart from the error print, the function currently also
> returns a -EINVAL in case of the missing 'required-opps', are we suggesting
> we change that to not return an error also?

No.

> Since this is completely optional in the device node, we would want the function to
> ideally not return error and only do so in case 'required-opps' exists and the
> translation to performance state fails.

Not really. The function should return failure if the property isn't
there, but it shouldn't be EINVAL but ENODEV.

-- 
viresh
