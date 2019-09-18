Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8667B5FD9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2019 11:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728833AbfIRJJp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Sep 2019 05:09:45 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38466 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbfIRJJo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Sep 2019 05:09:44 -0400
Received: by mail-pg1-f196.google.com with SMTP id x10so3655673pgi.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Sep 2019 02:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=G4hxKX4C+UwHppyagtwLzLYaYfdx3vbwuhfidaVb/nQ=;
        b=P4FNd9RhBzPlUfc1CQgYZsdIp18bxRVlkkoZx0inyMmXAe3hlUh8czZiU3x2EXhloM
         xvD7raK2qEG2tfvU8zA8qkG9bqGM+K9BtXJeoSLDVDCpiWqJcwOx0JVNpFJqD12g0ALM
         3EVMoKO99I+KmpFFCWKFqTQtlLC9xXOML1tFkkzbnLZDxZev7cUSKP6ICbBh4Dlo54XM
         O1gfiHx0z+t/QTOgydvUKlpylJGKx1yxBHMv8eUX4a93dnJaj/iwojIWEAcxBh/x7zsR
         cGujmLM//sZv8mFmZmasmc1fV8975M2mO3BtZHVkgGhL2Qcvd1i9qrgWoLMWkbmv0T5a
         /eLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G4hxKX4C+UwHppyagtwLzLYaYfdx3vbwuhfidaVb/nQ=;
        b=bEpI/Qh34tMlt+id/1MfS0LYDZ5EwQfRF8W/7JrNE89FAEegDAD7/HOc4VW40lpFRU
         FtwDKg/s3pTCfaYRVBN++f0qPwQybIF7DHEQuSPOMS7DoKlYcQWdUqln8rhDMacmwTMp
         llZdEVrBZPj2S5gccWDC7BkkaDE53Ojp/OteAl13+uuN9MeFMc1m4om7dmbF0jY7M9bo
         FJ/ir9G6jEf5bcYqY9Bqy8mqEjNz2dNCFYd4XewWYH8ud0kOyNMdkQ/6R4hLbHX4sKpp
         tZsfkj4RtOdr5PB0RXHnkVSTJG1LF/cRsWfF3uncOdAfovZJyFjhj5WWv5RD2OWcY8Gj
         Xkog==
X-Gm-Message-State: APjAAAUkZt8ncVbD+ufhjSihXigvD5irYo5SM42/h+SGaEez46BL/rns
        m3HcZfekKlW1RsatJYZRL6xBng==
X-Google-Smtp-Source: APXvYqxuV3bkoKSY6omGfYg+Szis0+eINu6ixhAs6qhxUbtS4C+EJcXtKq6zOKPNR7eTL+V5NLEaCw==
X-Received: by 2002:a63:465c:: with SMTP id v28mr3046498pgk.310.1568797781919;
        Wed, 18 Sep 2019 02:09:41 -0700 (PDT)
Received: from localhost ([122.172.73.172])
        by smtp.gmail.com with ESMTPSA id v44sm13954434pgn.17.2019.09.18.02.09.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2019 02:09:40 -0700 (PDT)
Date:   Wed, 18 Sep 2019 14:39:38 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Amit Kucheria <amit.kucheria@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        tdas@codeaurora.org, swboyd@chromium.org, ilina@codeaurora.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org
Subject: Re: [PATCH 5/5] cpufreq: qcom-hw: Move driver initialisation earlier
Message-ID: <20190918090938.b2fj5uk3h6t56t2p@vireshk-mac-ubuntu>
References: <cover.1568240476.git.amit.kucheria@linaro.org>
 <b731b713d8738239c26361ece7f5cadea035b353.1568240476.git.amit.kucheria@linaro.org>
 <20190917093412.GA24757@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917093412.GA24757@bogus>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17-09-19, 10:34, Sudeep Holla wrote:
> On Thu, Sep 12, 2019 at 04:02:34AM +0530, Amit Kucheria wrote:
> > -device_initcall(qcom_cpufreq_hw_init);
> > +postcore_initcall(qcom_cpufreq_hw_init);
> 
> I am fine with core framework initcall pushed to earlier initcall levels
> if required, but for individual/platform specific drivers I am not so
> happy to see that.
> 
> This goes against the grand plan of single common kernel strategy by
> Android moving all drivers as modules.

Its been long that I got the opportunity to work on drivers directly, but as far
as I remember (which should be incorrect based on your reply) we can still build
a driver as module even if it has some postcore_initcall() declarations. They
will execute at module insertion. Is that incorrect ? If not, then how is it
going to affect android effort ?

-- 
viresh
