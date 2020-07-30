Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17A41232B30
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jul 2020 07:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728584AbgG3FKu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jul 2020 01:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgG3FKt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jul 2020 01:10:49 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 872A8C0619D2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2020 22:10:49 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id e22so3548700pjt.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2020 22:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mA4BZd4kK85fl/B02dB2FxAX7zWjXLAMtkaKMXRlAl8=;
        b=QeC5Z4o9gUSaBccsjgXcHVRkllpZndKpz8SQFNaDHEdHlyoajM6S2rNTljlpc+BiJI
         2w8OfDJUIEXOCuHqrkxDWsVhZ/eoKbd4rbVFTbaxqaK3yaXeMKbO/PmumOF+niR8ZAVN
         ecVd7mu0QqOi75ElRfD3aSjjbnrDoATXhJ/yypmCBqgAlGcdYpnC/v8VTSISK4ZAU49s
         hxXK0kmzbG37NsT5PKEdGRMnWARtYMD0WI85tppgoe6x6zkWImbL5A8948ZXJ+s0oIAE
         Em+uNLDw4H7ULrU3hgS4xndgpLkVbM21ntKMONJmJBRjnExddwEPXMLvxRIsyOYz3BPJ
         LqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mA4BZd4kK85fl/B02dB2FxAX7zWjXLAMtkaKMXRlAl8=;
        b=LjDXQtuM7Zi6aXfGSSEOl0KzkWMwZfzwtjOZf8Aq+94V/p719BRdOWlaWDdIBtJ0yq
         22f8QEPkDBLaX90X1EiTtZnHBFH8MEV6hlCUM7x8yZfJMO3TnaOhRCTGE4GHFlkyyd9m
         NUyw4sc43XlN5/HaJQfY8WJjVkb0SAfSc9901DZT4Bi3opr+KH2F5EueiJahXOvxyIBB
         eceUIQj7PS2CaoLXxz+dT5NGMZhVsAktodeUaAd8lgZUzQPj/0i6GNefqhSlg/Ny/1am
         a4wJNtIxxudCu9Kke3RNTuxznLzgNc2IY11aKBTKjPUWVj4LFo3E8/b+esPy7CFBPv1f
         pOeQ==
X-Gm-Message-State: AOAM533eNqgSnS+x8q4s1jpjBf3gnnCXdjeaT4J6/tZ/j7ddXm+u7xYC
        yndofTd1PJAO8jiR6mKhX/gMRA==
X-Google-Smtp-Source: ABdhPJwj9HWHtqAFAKHBCLQOJIrgpN7lsfFwNhMzvnaPW201rcxJCVo3jVRneNq0kLb0y1yqbbw/yw==
X-Received: by 2002:a17:90b:94f:: with SMTP id dw15mr1393733pjb.209.1596085848986;
        Wed, 29 Jul 2020 22:10:48 -0700 (PDT)
Received: from localhost ([106.201.14.19])
        by smtp.gmail.com with ESMTPSA id g18sm4341705pfi.141.2020.07.29.22.10.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jul 2020 22:10:48 -0700 (PDT)
Date:   Thu, 30 Jul 2020 10:40:45 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
        saravanak@google.com, Sibi Sankar <sibis@codeaurora.org>,
        Jonathan <jonathan@marek.ca>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH v5 0/6] Add support for GPU DDR BW scaling
Message-ID: <20200730051045.jejrtkor3b32l2qe@vireshk-mac-ubuntu>
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
 <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu>
 <CAF6AEGurrsd3nrbB=ktZjWfKTNbKwPHYwTFiZdD-NOW1T7gePQ@mail.gmail.com>
 <20200721032442.hv7l4q6633vnmnfe@vireshk-mac-ubuntu>
 <CAF6AEGuhQcRskGhrFvmCf5T3EcZ9S+3LRdZBiaDYqF34yZjd+A@mail.gmail.com>
 <20200722053023.vwaoj5oqh4cazzzz@vireshk-mac-ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722053023.vwaoj5oqh4cazzzz@vireshk-mac-ubuntu>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-07-20, 11:00, Viresh Kumar wrote:
> On 21-07-20, 07:28, Rob Clark wrote:
> > With your ack, I can add the patch the dev_pm_opp_set_bw patch to my
> > tree and merge it via msm-next -> drm-next -> linus
> 
> I wanted to send it via my tree, but its okay. Pick this patch from
> linux-next and add my Ack, I will drop it after that.
> 
> a8351c12c6c7 OPP: Add and export helper to set bandwidth

Oops, sorry for the trouble but this needs to go via my tree only :(

I maintain two different branches, one for OPP and another one for
cpufreq. There was no dependency within the OPP branch and so I
dropped it that day and asked you to take it.

But when I tried to send a pull request today I realised that one of
the qcom patches in the cpufreq branch is dependent on it and I need
to keep this patch in my tree.

-- 
viresh
