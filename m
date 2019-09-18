Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55289B6025
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2019 11:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729294AbfIRJ3a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Sep 2019 05:29:30 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38888 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729248AbfIRJ33 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Sep 2019 05:29:29 -0400
Received: by mail-pf1-f196.google.com with SMTP id h195so3998785pfe.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Sep 2019 02:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XGfSZf6zpqugWLz9E/ECTaAWk5AflbcZNfQrHqcfJiI=;
        b=tMIKcF3VViDMpKj4XKmRBULjrjqaQ3bDWghhbjeJPdxAI1tGEJH+Dd1yUsdxorGzCU
         vX1pls9dszPLX9gZQtzLNbplTyPa9bkOieccxfMinLHCoQwgzD71ejncb9sDa3oZ/cOg
         yS2/hctP+HmUBJZvrUFp0MWC7o6Kb8PwlsW55EiUB++a0T4VExjmE6VRDWTlFa+L0pz0
         OHYUXbMiWJMAUC8zKjTMZIpRA7rkoKzf1jKCf3K9VIb+sqK9BzQses2ZbQatt0gUt2Zh
         rDGwvgQiyId1Lzm0DtBjV3JiXPSpb2Ymjn903sOwMOiOwPL3pp4hgwNNuSqtyazFLr9q
         pS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XGfSZf6zpqugWLz9E/ECTaAWk5AflbcZNfQrHqcfJiI=;
        b=IzBvQ+Zo2t0j1wSjMlb5fIa6Shc/1Vwbio6P6ajnb7bZJVstk5+h7TIFHt/gFUmHvc
         gLjiao4SrTh5djUsBweQIobf6+fxTEOIyoZMN7/5+p2Iv4AoWLmuJScpXyyq2rjoyvk5
         KrinTRPO4J9MBZyeJWkeUXFImmwX7G90RWpveZs7Mu9zxs13xa5rIsgjAOi8oa+EHxIA
         VRNDRP4myfsqBOUCLFcLJV59g1UGdahTa8NEE1TZavrmovqO1pnXnsuBxj+CN/Uc0EG/
         AH6SIlv82QZvJ74pUKR0sdgUvIB0SrQy6GuLprSiPmFMzfUGV+ajVFTYRc6iT+oG0tQQ
         Ctug==
X-Gm-Message-State: APjAAAWX5FiO5ImQDuqyD+YhPT409f42GEbSf8AuNv2Ur8DBJu7+JGej
        loUR5w0KIRuAurs3xOgvDI86iaxU+Vk=
X-Google-Smtp-Source: APXvYqyYA7P3uo4EMeZ0CyHqcdj3f3idzeWXRKKFvYXjT1q3TSTfQLukJan+2vTt2Z1VXThtAF4SmQ==
X-Received: by 2002:aa7:955d:: with SMTP id w29mr3107878pfq.60.1568798967721;
        Wed, 18 Sep 2019 02:29:27 -0700 (PDT)
Received: from localhost ([122.172.73.172])
        by smtp.gmail.com with ESMTPSA id c11sm10674911pfj.114.2019.09.18.02.29.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2019 02:29:26 -0700 (PDT)
Date:   Wed, 18 Sep 2019 14:59:25 +0530
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
Message-ID: <20190918092925.5hrvbcdorm2qw2j4@vireshk-mac-ubuntu>
References: <cover.1568240476.git.amit.kucheria@linaro.org>
 <b731b713d8738239c26361ece7f5cadea035b353.1568240476.git.amit.kucheria@linaro.org>
 <20190917093412.GA24757@bogus>
 <20190918090938.b2fj5uk3h6t56t2p@vireshk-mac-ubuntu>
 <20190918091747.GA18121@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190918091747.GA18121@bogus>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18-09-19, 10:17, Sudeep Holla wrote:
> Ah no, I am not referring to building as module. As you mention, that may
> work just fine. I was referring to timing dependency during boot. The idea
> is minimize the number of such initcall dependency. They should all work
> fine even as modules and should have least dependency on initcall sequence.

Yeah, so things work fine for them right now but that can be improved by
changing the sequence of boot here. And that's what Amit is trying to do here.

Even if android builds this as a module later, things will continue to work but
that may not be the best performance/boot-time wise.

When I had a discussion about this with Amit earlier, I asked him to send
patches even if he doesn't have any performance numbers for it as this is a
platform driver and I find it okay for them to decide the boot sequence that
they think is the best :)

-- 
viresh
