Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDCF51B95A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2020 05:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgD0Dt4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Apr 2020 23:49:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726391AbgD0Dtz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Apr 2020 23:49:55 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F84FC0610D5
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2020 20:49:55 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id h11so6459787plr.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2020 20:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3BQtmdkZTOxoTu8cuntZt9I/+ptcn4gko9UOiotLnjE=;
        b=we4uRc/H1yVjarr8WAv+iWDbCOBVbG8JDbGr3TEceAesV9+p6UtdP85GbQrANodFxJ
         UiQvQou8pt7sJXJZyVlNlatZIwFCM0ggFaPxrsp1YCLHAzJD+N+lKhx4owfVILvK4vdG
         MYuTBNi+M4YiiOYicEZc2R5s6J0184RvUUMknTefc9Rb4EiZrsr+CIyzHdLOwllnSxpM
         RgnJgQE/o9NRtLPwS+yXMtoXLSeVIrI7dzOjQsTWay7alfb9vx7R4wA1f/BqCCIH9yRD
         7IkJeSEFabtvNck0wvH47c5jznVZnvUxI0blskYH1L7kpeGdFGsQ8/OhoM3xlaTYV6IO
         i+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3BQtmdkZTOxoTu8cuntZt9I/+ptcn4gko9UOiotLnjE=;
        b=kP9sFz7+CLtAlva68KS4G+pqqGUENJW/MEzOZQQTEqg+vbSrIDflGrMHQFebfy7g3T
         Ld25Ztl/HkujKNN0BJikuBAuK1wLtN14XcTtdxOieQqBX3mAnM5C+k8XQPfM25KGmbKQ
         Ae3JfxfyKPTA/wAzg1U5CnsvaV3NZXSk9MOs14Jc/k5JWtP7MF3Q1Sfl7mcWo/l6EmPD
         cmF7xz86dZzv6ss1czqbdcD5wan+SJl5Ht8fMJuCcnd0keRSvvqYshqMMzJBfJHShl4k
         3sbWUKTCIP9QNdxw9I8tD+Hc2PpgczC9t9QGSfFkb25ca1DNpaVevBDND/OMGD3jYUp7
         BlHw==
X-Gm-Message-State: AGi0PuaQ4H49hXUAMSb16iYLdeBcMaIRknZzCoLVOZfC9TccC3KYKWLR
        GkGKzUwG4eu5+RXvzl9HpCaNeg==
X-Google-Smtp-Source: APiQypK5szD7hM+jQL1hCAEBBB1/SOG/vc4lsjbXV3dcq+ENgZR7btz7XbIj75d4suuJOOA2ZPJugQ==
X-Received: by 2002:a17:90a:12c3:: with SMTP id b3mr22498072pjg.57.1587959394422;
        Sun, 26 Apr 2020 20:49:54 -0700 (PDT)
Received: from localhost ([122.171.118.46])
        by smtp.gmail.com with ESMTPSA id j13sm10069756pje.1.2020.04.26.20.49.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Apr 2020 20:49:53 -0700 (PDT)
Date:   Mon, 27 Apr 2020 09:19:51 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     ansuelsmth@gmail.com
Cc:     'Rob Herring' <robh+dt@kernel.org>,
        'Viresh Kumar' <vireshk@kernel.org>,
        'Andy Gross' <agross@kernel.org>,
        'Bjorn Andersson' <bjorn.andersson@linaro.org>,
        'Ilia Lin' <ilia.lin@kernel.org>, 'Nishanth Menon' <nm@ti.com>,
        'Stephen Boyd' <sboyd@kernel.org>,
        "'Rafael J. Wysocki'" <rjw@rjwysocki.net>,
        'Sricharan R' <sricharan@codeaurora.org>,
        'linux-arm-msm' <linux-arm-msm@vger.kernel.org>,
        "'open list:THERMAL'" <linux-pm@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: R: [PATCH v2 2/2] dt-bindings: opp: Fix wrong binding in
 qcom-nvmem-cpufreq
Message-ID: <20200427034951.xrk5ja3pg4anbg4s@vireshk-i7>
References: <20200422201216.10593-1-ansuelsmth@gmail.com>
 <20200422201216.10593-2-ansuelsmth@gmail.com>
 <CAL_JsqLUbM7ed2q7so4Uibiz2URRg1juoGRExy9Ta3J-LWAFow@mail.gmail.com>
 <087301d61a86$68b6f950$3a24ebf0$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <087301d61a86$68b6f950$3a24ebf0$@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25-04-20, 00:19, ansuelsmth@gmail.com wrote:
> > On Wed, Apr 22, 2020 at 3:12 PM Ansuel Smith <ansuelsmth@gmail.com>
> > wrote:
> > >
> > > Update binding to new generic name "operating-points-v2-qcom-cpu"
> > >
> > > Fixes: a8811ec764f9 ("cpufreq: qcom: Add support for krait based socs")
> > > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > > ---
> > >  Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt | 2
> > +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/opp/qcom-nvmem-
> > cpufreq.txt b/Documentation/devicetree/bindings/opp/qcom-nvmem-
> > cpufreq.txt
> > > index 64f07417ecfb..537e1774f589 100644
> > > --- a/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt
> > > +++ b/Documentation/devicetree/bindings/opp/qcom-nvmem-
> > cpufreq.txt
> > > @@ -19,7 +19,7 @@ In 'cpu' nodes:
> > >
> > >  In 'operating-points-v2' table:
> > >  - compatible: Should be
> > > -       - 'operating-points-v2-kryo-cpu' for apq8096, msm8996, msm8974,
> > > +       - 'operating-points-v2-qcom-cpu' for apq8096, msm8996,
> > msm8974,
> > >                                              apq8064, ipq8064, msm8960 and ipq8074.
> > 
> > This is not how you fix the backwards compatibility issue pointed out
> > on the Fixes reference.
> > 
> > Rob
> 
> Sorry but can you give some directive? Should I use the old binding and change
> the driver to use it instead of the new one (and drop it) ?

It is not about the name of the binding, you can rename it to whatever
you want. The kernel needs to keep supporting all the previous
bindings, so we can keep on changing the kernel but keep the same
bootloader (with earlier bindings).

-- 
viresh
