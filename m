Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC4C1D3658
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 18:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbgENQVO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 12:21:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbgENQVN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 12:21:13 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C141C061A0E
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 09:21:13 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id g12so33529516wmh.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 09:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KV4BSoviEBOfIIyT+7Io9PqJ+AxGL6m4ncG0jX3R3Vg=;
        b=iiHyiJ4q0+KsNNeDxvvCz9wtZO9sC8IuSU69MkWg6ukuylaAreG2+ufhhS2q0LvI4a
         9ZFBQEB3gresJbeadDdort7B7CJztVaOzd+imGLK9adisFs8l1EkEXwjPix6DMwXWpjX
         /bCdQB8gtMafG88ExRQb7sOFOT2TnNJlqCmCoaS8LyHnYhBzplYGqcazpRuc/Byl/kdH
         h8OE0uxsaWxjlIp/J8ewc/SWJUPpFj3CJfpjNNHOJYP6BbciN+6P7zMR4GQBICDm8oYj
         m2m8J1vRn9sCMPHm5LZbqiU0px2GbT9jNPn6q/3jziLa6B8kfu211fXDrBPg+K08gUdF
         P8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KV4BSoviEBOfIIyT+7Io9PqJ+AxGL6m4ncG0jX3R3Vg=;
        b=cBvQZrrXhDOAJnbvUg0QazqovOaKPWufT/dumm85k1/2iQ4SBg9T+OD2qZlUUaMOq3
         q2JwZZyfbWjp4iAiZBMq4HfjDEUZ5ZPk8TNPSbYJdfbhasO1s86JrGeE9nT2SDjtIGa/
         qd0MI1hYxyocjpo1PXFCouTVp7Y6Xp5kY870A4vOZy+SgBEdYAs8L/OyneHhWbuB+VTs
         KRZhjQvsaMjb6fDQbD6+UPpywn5Y7KGsnZHkSejjWIMFvmGmm85t77OoTNkyfQMB8cuM
         41OK7Gljt98SucAkiDIchjmsPr9AbizI62/tzWx4JKwORwThv+1hx8CaoWvZtKwS2MV7
         rUug==
X-Gm-Message-State: AGi0PuZ1lAB3IruPNFbThxOliJFNs0o/dOvdN2dagHbF4qIR5iZr7ZRQ
        AdZCcaGgCgW4IerADuKvCQ3ohw==
X-Google-Smtp-Source: APiQypKzrysBhAd4T+CnYHlYyQM0grnydFJdjF31clt1OcgBcXllaYep5/9TgtCb41lshr5MEdxP5g==
X-Received: by 2002:a1c:ed04:: with SMTP id l4mr49969579wmh.93.1589473272074;
        Thu, 14 May 2020 09:21:12 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id b14sm29577880wmb.18.2020.05.14.09.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 09:21:11 -0700 (PDT)
Date:   Thu, 14 May 2020 17:21:09 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     jason.wessel@windriver.com, gregkh@linuxfoundation.org,
        corbet@lwn.net, frowand.list@gmail.com, bjorn.andersson@linaro.org,
        linux-serial@vger.kernel.org, mingo@redhat.com, hpa@zytor.com,
        jslaby@suse.com, kgdb-bugreport@lists.sourceforge.net,
        sumit.garg@linaro.org, will@kernel.org, tglx@linutronix.de,
        agross@kernel.org, catalin.marinas@arm.com, bp@alien8.de,
        Alexios Zavras <alexios.zavras@intel.com>,
        Allison Randal <allison@lohutok.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dave Martin <Dave.Martin@arm.com>,
        Enrico Weigelt <info@metux.net>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        James Morse <james.morse@arm.com>,
        Juergen Gross <jgross@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
        Russell King <linux@armlinux.org.uk>,
        jinho lim <jordan.lim@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v4 00/12] kgdb: Support late serial drivers; enable early
 debug w/ boot consoles
Message-ID: <20200514162109.6qt5drd27hpilijh@holly.lan>
References: <20200507200850.60646-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507200850.60646-1-dianders@chromium.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 07, 2020 at 01:08:38PM -0700, Douglas Anderson wrote:
> <snip>
>
> My first attempt was to try to get the existing "ekgdboc" to work
> earlier.  I tried that for a bit until I realized that it needed to
> work at the tty layer and I couldn't find any serial drivers that
> managed to register themselves to the tty layer super early at boot.
> The only documented use of "ekgdboc" is "ekgdboc=kbd" and that's a bit
> of a special snowflake.  Trying to get my serial driver and all its
> dependencies to probe normally and register the tty driver super early
> at boot seemed like a bad way to go.  In fact, all the complexity
> needed to do something like this is why the system already has a
> special concept of a "boot console" that lives only long enough to
> transition to the normal console.
> 
> <snip>
> 
> The devices I had for testing were:
> - arm32: rk3288-veyron-jerry
> - arm64: rk3399-gru-kevin
> - arm64: qcom-sc7180-trogdor (not mainline yet)
> 
> These are the devices I tested this series on.  I tried to test
> various combinations of enabling/disabling various options and I
> hopefully caught the corner cases, but I'd appreciate any extra
> testing people can do.  Notably I didn't test on x86, but (I think) I
> didn't touch much there so I shouldn't have broken anything.

I have tested a slightly earlier version using qemu and will test this
set before it moves forwards.


>  .../admin-guide/kernel-parameters.txt         |  20 ++
>  Documentation/dev-tools/kgdb.rst              |  24 ++
>  arch/arm64/Kconfig                            |   1 +
>  arch/arm64/include/asm/debug-monitors.h       |   2 +
>  arch/arm64/kernel/debug-monitors.c            |   2 +-
>  arch/arm64/kernel/traps.c                     |   3 +
>  arch/x86/Kconfig                              |   1 +
>  drivers/tty/serial/8250/8250_early.c          |  23 ++
>  drivers/tty/serial/amba-pl011.c               |  32 +++
>  drivers/tty/serial/kgdboc.c                   | 268 ++++++++++++++++--
>  drivers/tty/serial/qcom_geni_serial.c         |  32 +++
>  include/linux/kgdb.h                          |   4 +
>  kernel/debug/debug_core.c                     |  52 +++-
>  lib/Kconfig.kgdb                              |  18 ++
>  14 files changed, 436 insertions(+), 46 deletions(-)

Any thoughts on how best to land these changes?

AFAICT the arm64 and 8250/amba-pl011/qcom_geni_serial code
could be applied independently of the kgdb changes (though we must keep
changes to drivers/tty/serial/kgdboc alongside the kgdb changes).

I can hoover them up but I'd need a solid set of acks and
I don't think we've got that yet.

I'd also be happy to ack where needed and let someone else pick it up
(the other changes queued for kgdb this cycle are pretty small so we
shouldn't see much conflict in kernel/debug/ ).


Daniel.
