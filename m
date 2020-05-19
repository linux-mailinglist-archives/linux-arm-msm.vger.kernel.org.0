Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C171D9476
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 12:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728286AbgESKha (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 06:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgESKh3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 06:37:29 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C62AC05BD09
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2020 03:37:29 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id m185so2914325wme.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2020 03:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nJqGHCLYRoZ39Y3LPONsDokd1MQBpWuhJuodhCCoySM=;
        b=YMdHV7z6BExIROOjIpfvHwSUNwtHyJyHxewUmgQ58pFt2DCJ+Uq3LE6nN5u01qIsPB
         rTnMHvOJ4foaIZQznr6Ev5x+fowQs8Joohvex2NOX8e3CLiyut/6ZWwYdeVM/Lpn+uJg
         PuZjzzrw1kE6Klbf6tp/7LgGBpx+RxVYgAqJ89o4oQgPzP3JodvHnPd1rK6Uid0Y1CS1
         BSRg+2wxS7OWx3hF4QjrYSYrrMdaEWoA68ZfdaWbMNbSyMgwx4PDx1Ism+F2DODBpig5
         zZiibs5LM8fN32E7W8maiyUmM7xI44L6S6gQCO8h07GklbCW+XXxkrZ7CLC5GYdp0UmA
         19Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nJqGHCLYRoZ39Y3LPONsDokd1MQBpWuhJuodhCCoySM=;
        b=Ma3C1WKMORVOPPo4h6yniozYq82K6wp8vPbQt/U4dnug9+/DzBUDbO5kiDKZv8S31v
         XlwV1p+OCfk6mtBzFq42E7ssxkE0WdE7HdCUHiDsN49vUstXf7+GAxGmr7zW6IcZRJz7
         meV0CYgJKFoQpSPzry7RSP8kbsCNbO28g9E1BhjoEf4wQPfZ+YHdxeGH6bKVlKoLzDx8
         QKXx4ki23wKywICNmsK8/CuRy8MHfu9N3NDD0CkQSRhNxbxWROs4LOWzcuEo8Z/2Zg0q
         EvvOzktNxl2yLrw80vtHAoB2/PP92lOpDudUXtDs8riLY3MyYfdOmGv4V6YAZ4dfSZ3T
         YCHw==
X-Gm-Message-State: AOAM532IY57SjHBZR1YprXuiyFRly01+rvSoOYCV78MASmBzL7u+YtvO
        JRDoSPrzjoyqbZDCvmOkbamCMQ==
X-Google-Smtp-Source: ABdhPJxj5fMEywwcRHjfOT2c3qwvdLgOyHayzX2tbuWzyAy4O/+p5lMYXda/U5svbychHMOWNGk9Ww==
X-Received: by 2002:a05:600c:1403:: with SMTP id g3mr4962732wmi.51.1589884647744;
        Tue, 19 May 2020 03:37:27 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id x24sm21634435wrd.51.2020.05.19.03.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 03:37:27 -0700 (PDT)
Date:   Tue, 19 May 2020 11:37:24 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Doug Anderson <dianders@chromium.org>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jason Wessel <jason.wessel@windriver.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Frank Rowand <frowand.list@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-serial@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Jiri Slaby <jslaby@suse.com>,
        kgdb-bugreport@lists.sourceforge.net,
        Sumit Garg <sumit.garg@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Gross <agross@kernel.org>, bp@alien8.de,
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
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        x86@kernel.org
Subject: Re: [PATCH v4 00/12] kgdb: Support late serial drivers; enable early
 debug w/ boot consoles
Message-ID: <20200519103724.eyabo2n4uzms25bp@holly.lan>
References: <20200507200850.60646-1-dianders@chromium.org>
 <20200514162109.6qt5drd27hpilijh@holly.lan>
 <CAD=FV=X+t_Wg5KadZBTGHMSEXY3c-t6DZAtdaLXys31QJJpGGA@mail.gmail.com>
 <20200514163633.GA3154055@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200514163633.GA3154055@kroah.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 14, 2020 at 06:36:33PM +0200, Greg Kroah-Hartman wrote:
> On Thu, May 14, 2020 at 09:34:26AM -0700, Doug Anderson wrote:
> > > (though we must keep
> > > changes to drivers/tty/serial/kgdboc alongside the kgdb changes).
> > >
> > > I can hoover them up but I'd need a solid set of acks and
> > > I don't think we've got that yet.
> > 
> > It would be nice for it to be explicit, but "get_maintainer" says that
> > Greg KH is the maintainer of serial drivers.  Git log confirms that he
> > also has been the one landing changes to these files.  Early-on he
> > provided his Reviewed-by for the series as a whole, so he's aware of
> > it and maybe would be fine w/ the serial changes landing through the
> > kgdb tree?
> > 
> > Greg: is that correct?
> 
> I have no objection for all of these to go through any other tree that
> wants to take them :)
> 
> But if you want me to take them in the serial tree, to make it easier
> for you or any other serial driver issues, I will be glad to do that,
> just send them my way.  It's your call.

Thanks. I've taken then via my tree.


Daniel.
