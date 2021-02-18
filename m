Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF1131ED99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Feb 2021 18:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234651AbhBRRre (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Feb 2021 12:47:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232695AbhBRPtQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Feb 2021 10:49:16 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80C6AC06178B
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 07:48:24 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id fa16so1583586pjb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 07:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5mSfxBVOBRi8bFJ8AYZZL4d/aLlm22/JZaKwGPrt9j0=;
        b=JA7rzsD5N+KAByAnY3zLVeBOz6mJmi6OxbPaVhkgubiURsywlbrD4mT4gLNrxjkqn0
         CnM5eHHDy7ZnvvTLu3KvSB2PAnxLms7rMnm5wRR3XyIsGfwwQl2vlqPUndXBfhL/n0AQ
         q/wwUBtvq3wwQ1kCA9AQa1Vp3sdgzR0CO/GqDhqRhh8VBUHiHRuRELCpExKdTh4GuBO/
         0aS3fiYlfpHW3+qa1Xi63c2XmJkQDSB6YmNgz4ezKjar0RFC19X1jbpGH7oErcBsMjH1
         F5GaaWkj/y0C8HVnCuy0ioIWQGZ0LIZpTvAXBG9x0ZU7UFcnFFNpCWoL+cjH0GlaTXAf
         rvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5mSfxBVOBRi8bFJ8AYZZL4d/aLlm22/JZaKwGPrt9j0=;
        b=KkHvS/bRFJrmE5ijmlx7vvLkX2sCVWkX/++6PrIqkdg4tK6Pwn+5jpWTp5rqt098xq
         faARRQNr8+nVpk4Hv7pOGbSu4TJq3/GBRi+9xLxdxZXpfAabBM4z++Zv8Qrsu5Uqx0wZ
         8vfanci6kaus2R+64171Gv8gOKMlynn0Bnr3SQMdA54/ESnOxYfTC3YPN4Rq71zL/BX+
         kTqnEjHtqxTUH8+GI6KcUsTVlJVfGbXqXwAaI0SsKTtDf44hw1JjJE17pDiyg7Dp75ZU
         dFOIG/b9i4Hi3k4r9nbWQpPFTeLZjwnJHHX1BMFO5o79R54dGLFmCvanPL+z6a8fxiv7
         XrRg==
X-Gm-Message-State: AOAM5311j7sL02AOa15NaGu9PQgM3jccYC6tkFSjAFQMLL0Ab9UIbT4C
        FvFfvPrYJhIClzEeJTqjISnvqA==
X-Google-Smtp-Source: ABdhPJxdSuV3c8mgl+2RGLWQJpA00YGVg4kYZ0W+FXCpcFGoA2E9jl8z0IOGc+JTMSxOXJBmJSyWBw==
X-Received: by 2002:a17:902:403:b029:e3:6b9b:9fd6 with SMTP id 3-20020a1709020403b02900e36b9b9fd6mr4563585ple.54.1613663303995;
        Thu, 18 Feb 2021 07:48:23 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id g6sm6618819pfi.15.2021.02.18.07.48.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Feb 2021 07:48:23 -0800 (PST)
Date:   Thu, 18 Feb 2021 21:18:20 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cpufreq: cpufreq-qcom-hw: Document SM8350
 CPUfreq compatible
Message-ID: <20210218154820.lkcut7a657s6aqeg@vireshk-i7>
References: <20210216111251.1838149-1-vkoul@kernel.org>
 <20210217044955.qmbpd43wis7xtjoj@vireshk-i7>
 <20210218124457.GW2774@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210218124457.GW2774@vkoul-mobl.Dlink>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18-02-21, 18:14, Vinod Koul wrote:
> On 17-02-21, 10:19, Viresh Kumar wrote:
> > On 16-02-21, 16:42, Vinod Koul wrote:
> > > Add the CPUfreq compatible for SM8350 SoC along with note for using the
> > > specific compatible for SoCs
> > > 
> > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > ---
> > >  Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt
> > > index 9299028ee712..3eb3cee59d79 100644
> > > --- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt
> > > +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt
> > > @@ -8,7 +8,9 @@ Properties:
> > >  - compatible
> > >  	Usage:		required
> > >  	Value type:	<string>
> > > -	Definition:	must be "qcom,cpufreq-hw" or "qcom,cpufreq-epss".
> > > +	Definition:	must be "qcom,cpufreq-hw" or "qcom,cpufreq-epss"
> > > +			along with SoC specific compatible:
> > > +			  "qcom,sm8350-cpufreq-epss", "qcom,cpufreq-epss"
> > 
> > And why is SoC specific compatible required here ? Is the implementation on
> > sm8350 any different than the ones using "qcom,cpufreq-epss" compatible ?
> > 
> > FWIW, the same compatible string must be reused until the time there is
> > difference in the hardware. The compatible string must be considered as a marker
> > for a particular version of the hardware.
> 
> Rob has indicated that we should use a SoC specific compatible and I
> agree with that. We are using both soc and generic one here and driver
> will be loaded for generic one.

I am not sure of the context, lets see what Rob has to say on this. I
believe we only need 1 compatible string here (whatever it is), as
this is just one version of the hardware we are talking about. We
already have 2 somehow and you are trying to add one more and I don't
fell good about it. :(

-- 
viresh
