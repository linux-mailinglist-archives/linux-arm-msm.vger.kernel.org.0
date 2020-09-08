Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C64902610AA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 13:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729729AbgIHL3v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 07:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729753AbgIHL2i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 07:28:38 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63597C061757
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2020 04:28:38 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id b17so5743302pji.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2020 04:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1ePZz+j1mC26EcXRnLkpEleJBzy12DWxPVVwiIwKyc0=;
        b=XDg4/Uku5/VpdAi0ks3tspgOErVskD47V+JCTvPLbAaCnNjXbzfw0TTt400bpp1D+8
         y21jfjFYMVXGxhgd7TBioi175NEgOo7AJ6a69HpCzcu76LJIlc1Vsr5hxOSLzn+xy60H
         iln98V6VsxN2apajg1j4pMGQ/UX2fbhvF4P6L52Ep4ngu5m791p+QVz8EvZJn8W6OoMA
         DE5FQMkIL/x8oo4+FHaOLz4iBTiyfFBZdXR5lIixDOoWhj6FpDmOsjGmSTL4dmn/2c8d
         fbrvXY6MH3aljUf/3nVdIYo4q7mRfdoPMEMhVrvAccPp6eNOHBUlPAbwSVK5u3yvjQsN
         iEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1ePZz+j1mC26EcXRnLkpEleJBzy12DWxPVVwiIwKyc0=;
        b=hUlAcOT/A5fWyO/XNz4vb91oxsvIqZh/pwQ0bNNrNSVHKnat8R04rDLUNxVS8d90pn
         dC5RSzsTUA7H8HC1Dy3yDh2EECHPy3HY8rme+d45kN/SFpZrYU8U41h4EElJeU8QKkmD
         ywRJ72k0ianrOZg6J2DTp27cH5zglyGihvbGsVu0VG9Jm2dznQg5SWxh2Oy8brHTiTbg
         rFE08rmGVMVrqpr42aCwkegcYckvMC0JnZLujyO+8horIBTy5sk8b7l4Zv2d0PUskq9u
         i6IflEE3L4vqhKny+IyZnMhU7yN5HUxyE/Z2KXwv1TisI8/UXZTjtrxcfJwKtALUcJmv
         UDfw==
X-Gm-Message-State: AOAM532rCZU3UJIu6/WYS2thAUsbwaVgnGPwkAhCYgqPbUjp15sDuGqX
        sL8Xo6O4VTwyOMlY3sN0pStV
X-Google-Smtp-Source: ABdhPJyawctA9wghGbFvi/7vBQj9SNLlIjR+KiOXSTuFRKIHUj+7uS8WYHJyd6wazPN1CbuzWd7JvQ==
X-Received: by 2002:a17:90a:1fcc:: with SMTP id z12mr3490650pjz.106.1599564517585;
        Tue, 08 Sep 2020 04:28:37 -0700 (PDT)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id i8sm10685684pjv.43.2020.09.08.04.28.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 04:28:36 -0700 (PDT)
Date:   Tue, 8 Sep 2020 16:58:28 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     rjw@rjwysocki.net, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, amitk@kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@linaro.org, tdas@codeaurora.org
Subject: Re: [PATCH 5/7] cpufreq: qcom-hw: Use regmap for accessing hardware
 registers
Message-ID: <20200908112828.GA23812@mani>
References: <20200908075716.30357-1-manivannan.sadhasivam@linaro.org>
 <20200908075716.30357-6-manivannan.sadhasivam@linaro.org>
 <20200908103444.5e526uawa45om6lt@vireshk-i7>
 <20200908111141.GB23095@mani>
 <20200908111813.bbgfxo5v7qt6ujpc@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908111813.bbgfxo5v7qt6ujpc@vireshk-i7>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 0908, Viresh Kumar wrote:
> On 08-09-20, 16:41, Manivannan Sadhasivam wrote:
> > On 0908, Viresh Kumar wrote:
> > > On 08-09-20, 13:27, Manivannan Sadhasivam wrote:
> > > > Use regmap for accessing cpufreq registers in hardware.
> > > 
> > > Why ? Please mention why a change is required in the log.
> > > 
> > 
> > Only because it is recommended to use regmap for abstracting the hw access.
> 
> Yes it can be very useful in abstracting the hw access in case of
> busses like SPI/I2C, others, but in this case there is only one way of
> doing it with the exact same registers. I am not sure it is worth it
> here. FWIW, I have never played with regmaps personally, and so every
> chance I can be wrong here.
> 
> > Moreover it handles the proper locking for us in the core (spinlock vs mutex).
> 
> What locking do you need here ?
> 

I was just referring the case where if we need the locking in future, regmap
handles it nicely in the core.

> > I've seen many subsystem maintainers prefer regmap over plain readl/writel
> > calls. I'll add the reason in commit log.
> 
> I am not sure if it is worth it here.
> 

Hmm, I thought it is recommended to use regmap for MMIO access as well. I can
drop the patch if you want but let's wait for Bjorn/Amit to get their views.

Thanks,
Mani

> -- 
> viresh
