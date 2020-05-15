Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05E031D4496
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 06:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbgEOE04 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 May 2020 00:26:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726016AbgEOE0z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 May 2020 00:26:55 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54A72C05BD0A
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 21:26:55 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 145so372575pfw.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 21:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=P+pFPRWA9B/MIZUT1UfZLMRI5u90O++PiGPfW86wNGc=;
        b=Qehsqj/iSB/g6hTTGxsUEEaFmBtK0jsrsSwkElDkmAjSI3imx6JQ92Q7DvhOV6VgkJ
         lj5KMia9fQAj0gdMDNqvgubQjY6bwSw5NjFaMM+NkgmO19RUub62QKXUCemF2e4rlhUA
         7w1HuuVOuBVSaOHoCp9tTBfCowZFH+4dJX1Mj89WATIFneMUKX18Ta1f9q3olo6n7uaP
         75SGmW6mTpPwbhq8+jEjDWlEsn5RS27e6+XI2ZL9TCKMpzD7bu4Bjmio71nLgROKVELG
         HnfzbCfwZhwnb7CGRb0gGSdVOWqS1ek++NNo9T3qn4EcFbJRHvASjlXUutguDCz9TVRP
         puRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=P+pFPRWA9B/MIZUT1UfZLMRI5u90O++PiGPfW86wNGc=;
        b=ejI/k9ir878JIRT+3ZuuD0CgIWIHuzTJ4M7khCB36e8Y3A0vEKAs1CNhyBbBpsjNne
         BRu55KbdeXF/8jmX79T//RSoIRgirSSQTLx7Co61cK1G9CiSmvg9n/d4XGL1QlnAWtt2
         KeONDnMOXncTGX9C4x+T7nzk9YXQQOdjjO/Fn4DUUgyi0fbl9ScO5iStIDkx8eP9W7NL
         aoGnAv2t8NllE+9pRyaFFgFbEg2wMepl9pyWYEGpmXh18yIiUwMx68IQxjupyjUCpbJi
         B+z/QEYX5/I789uxj9fslkf6o854lm3gV6HMoUtCRsb7bUIiTVquoiFiBf0tAM4dJhOW
         KlAQ==
X-Gm-Message-State: AOAM5330tikdZUyXF8itghqgnoEQhpsBoXiHYjAOxWNKQySaLwho2nfd
        vkIwGIjU9MWWRLJdRH+0n3a8fA==
X-Google-Smtp-Source: ABdhPJzGFW3Au6qy/392DkS+OHUt23t2c0amaCec/oEuHEA3pKAmr/TetWbyLeM3Xs2arUGS/yix2w==
X-Received: by 2002:a63:e242:: with SMTP id y2mr1353924pgj.205.1589516814560;
        Thu, 14 May 2020 21:26:54 -0700 (PDT)
Received: from localhost ([122.167.130.103])
        by smtp.gmail.com with ESMTPSA id g43sm444728pje.22.2020.05.14.21.26.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 May 2020 21:26:53 -0700 (PDT)
Date:   Fri, 15 May 2020 09:56:51 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Manu Gautam <mgautam@codeaurora.org>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "open list:ULTRA-WIDEBAND (UWB) SUBSYSTEM:" 
        <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: Re: [PATCH v7 2/4] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
Message-ID: <20200515042651.3z2zfeirz3u3xxwk@vireshk-i7>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org>
 <1585718145-29537-3-git-send-email-sanm@codeaurora.org>
 <878shu4uwk.fsf@kernel.org>
 <875zcy4uuj.fsf@kernel.org>
 <20200514171352.GP4525@google.com>
 <abbc3f8c-c8c9-c189-735e-f8058dab3e40@linaro.org>
 <CAKohpon+JBpV3fC7j=rhc1R4gi_mVG6teBDrE8Yryd4QXfw9bw@mail.gmail.com>
 <20a2adc5-4153-1447-0542-908b7996c187@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20a2adc5-4153-1447-0542-908b7996c187@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15-05-20, 09:53, Manu Gautam wrote:
> Hi,
> 
> On 5/15/2020 9:27 AM, Viresh Kumar wrote:
> > On Fri, 15 May 2020 at 02:33, Georgi Djakov <georgi.djakov@linaro.org> wrote:
> >
> >> ---8<---
> >> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> >> index 206caa0ea1c6..6661788b1a76 100644
> >> --- a/drivers/usb/dwc3/Kconfig
> >> +++ b/drivers/usb/dwc3/Kconfig
> >> @@ -129,6 +129,7 @@ config USB_DWC3_QCOM
> >>         tristate "Qualcomm Platform"
> >>         depends on ARCH_QCOM || COMPILE_TEST
> >>         depends on EXTCON || !EXTCON
> >> +       depends on INTERCONNECT || !INTERCONNECT
> > Again, as I said yesterday. This looks incorrect and may not fix the problem..
> >
> > With this we will be able to select USB_DWC3_QCOM even when INTERCONNECT=m.
> 
> DWC3_QCOM in that case would be 'm' if INTERCONNECT =m and
> that should be fine?

Ahh, I was speaking in context of PM_OPP where it is a bool. Perhaps
this works just fine with DWC3_QCOM, sorry for the confusion.

-- 
viresh
