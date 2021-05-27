Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 080473932D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 May 2021 17:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbhE0Pt6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 May 2021 11:49:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbhE0Pt5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 May 2021 11:49:57 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FB53C061761
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 May 2021 08:48:23 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id r1-20020a4aa2c10000b029023e8c840a7fso206854ool.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 May 2021 08:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yfSNFKosPU4+e760gCsV467KYelw7Cbptpl/kDRnoC8=;
        b=FbtDb/DQyBp+GY9iEqxGg2/FRcFw3WW11uWrvwjePjlW6i8JYevnVBn2UDsOU7Lg4e
         2Lbr3v2zNcR/lXgM3IBgXUHNWqOehYhHPwgIwFkGQFf4FJFn5zJZ0U9uQfS0vyFX5zJW
         J1Oo4GZSzfO1mOykRiwvplTV0E3vXFaVdmLPkz13U+hnkRwpXSucSlUQw3Sfy+EymkL+
         rA5jM7yC3tkJooLA1HfMJ3HhIz7E1dDGptteLT9vZAJD842zrQURe1P/eggjhT7rT3Of
         jk0aZfKTuhRzXYhKJiCGA/dQcEcsSDsuQNAKVbCjVqvQEKjxkJsaH+/jnkZuAiKM1EfQ
         Fa1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yfSNFKosPU4+e760gCsV467KYelw7Cbptpl/kDRnoC8=;
        b=k5jLUGmRWBdL12WEFQpN+s5LFoQfpFd60QrYoUPBbmCxIeHQTwQEyNntXI7R2i5mOf
         krjBPETeGHTaGxnYvgeBszOg2+VdxHvKr26cdqJKiNAld8MQHekknQpKLFMOMBTVw/08
         qLyIhc491yvMxaibKV4y74Q7s0CYw+A9VRzqU4oE5mPhCYh62R47kqyRl7tKZ0exmVKL
         vWY28IOa1BpDfpULpjnBROHYsuskj7DNn+kG7OrKLBffAwPCTDSUTjTWrl3x9zCvkqCA
         WEQN0Zg9o0/X3Zlr8nRxZ7hIdJiER0kXp5rBMibi39T4c//7pq2FKgZuouUqkPIhKX+1
         cMJA==
X-Gm-Message-State: AOAM530Os8bw4zZHjzrooxy8EqvEpvLeTn3riP9sosx7bwgckSETfIu/
        i63MzluP6gbKzN0Yv9TBDvJCMw==
X-Google-Smtp-Source: ABdhPJzyMrFe/vlEUMAHmB0t+9c7Fh3LmqLkK1n4GJOJbCS5aG3EzExhk/Kg2mW8d7RgfqCXHoh/ew==
X-Received: by 2002:a4a:d4c7:: with SMTP id r7mr3291777oos.85.1622130502878;
        Thu, 27 May 2021 08:48:22 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l23sm533270oie.52.2021.05.27.08.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 08:48:22 -0700 (PDT)
Date:   Thu, 27 May 2021 10:48:20 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Add support for SONY Xperia X
 Performance / XZ / XZs (msm8996, Tone platform)
Message-ID: <YK+/RJX2DXvyHh0J@builder.lan>
References: <20210525200246.118323-1-konrad.dybcio@somainline.org>
 <20210525200246.118323-7-konrad.dybcio@somainline.org>
 <YK3CxHZELSQzz4Dp@builder.lan>
 <3fbf451e-6bab-d72a-1d6b-851ece99c95b@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fbf451e-6bab-d72a-1d6b-851ece99c95b@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 26 May 04:21 CDT 2021, Konrad Dybcio wrote:

> Hi,
> 
> 
> > BSD license in all the files please.
> 
> msm8996.dtsi is gpl2-only, so I wasn't sure I can include it..
> 

Very good question, I think it's fine, would prefer it that way and will
be merge it, but ianal.

> 
> >> +};
> >> \ No newline at end of file
> > [..]
> 
> Yikes... my mistake
> 
> 
> >> +#include "pmi8994.dtsi"
> >> +#include <dt-bindings/input/input.h>
> >> +#include <dt-bindings/input/gpio-keys.h>
> > This seems to be unused for now.
> 
> Right. I will add the keys in a separate patch, this one is plenty big already.
> 
> 
> >> +		/*
> >> +		 * Due to an unknown-for-a-few-years regression,
> >> +		 * SDHCI only works on MSM8996 in PIO (lame) mode.
> >> +		 */
> >> +		bootargs = "sdhci.debug_quirks=0x40 sdhci.debug_quirks2=0x4 maxcpus=2";
> > What's up with maxcpus=2? Is this simply because the last 2 are really
> > really slow?
> 
> Yeah, I think the L2 and cci being stuck at bl clocks are to blame
> again.. there was a lot of msm8996 cpufreq work but I am not sure if
> anybody got it to *actually* work in the end, I'll try to look into
> this soon(tm)..
> 

Right, we have some lingering patches on our side for this as well,
unfortunately I have one db82c0 that gets unstable when we bring the
last 2 CPUs up to speed.

I started looking at this and found that some care needs to be taken
when switching between the lower half and higher half of the frequencies
(or perhaps it was voltages?) Unfortunately I didn't conclude anything
in this area, but I would be happy to see this resolved.

> 
> >> +};
> >> +
> >> +&CPU0 {
> >> +	cpu-supply = <&pmi8994_s11>;
> > Isn't this the supply to the CPU-subsystem-internal LDO that actually
> > feeds the CPU? Is there a benefit to describing this here?
> 
> I believe it was related to the cpufreq-dt madness, I will remove this.
> 
> 
> >> +
> >> +&pm8994_gpios {
> >> +	pinctrl-names = "default";
> >> +	pinctrl-0 = <&pm8994_gpio_1 &pm8994_vol_down_n &pm8994_vol_up_n
> >> +		     &pm8994_cam_snap_n &pm8994_cam_focus_n &pm8994_gpio_6
> >> +		     &pm8994_nfc_dload &pm8994_gpio_8 &pm8994_gpio_9
> >> +		     &pm8994_gpio_nfc_clk &pm8994_gpio_11 &pm8994_gpio_12
> >> +		     &pm8994_ear_en &pm8994_gpio_14 &pm8994_pm_divclk1
> >> +		     &pm8994_pmi_clk &pm8994_gpio_17 &pm8994_rome_sleep
> >> +		     &pm8994_gpio_19 &pm8994_gpio_22>;
> > Shouldn't several of these reference be done from the relevant nodes?
> 
> Certainly, but not all peripherals have drivers upstream, and other ones
> 
> are hardcoded to their state downstream, and knowing what shady stuff
> 
> some vendors do, I'm reluctant to trust the bootloader-default state with
> 
> my expensive toys..
> 

I'm in agreement with you that we should vote for these somewhere, so
I'm fine with us agreeing that they are voted for here for now.

> 
> 
> > For the ones that isn't, and that you're not going to ever change I
> > think it would look better to have a single:
> >
> > pm8994_gpios_defaults: default-state {
> > 	nc {
> > 		nc pins...
> > 	};
> >
> > 	vol-up {
> > 		...
> > 	};
> >
> > 	...
> > };
> 
> That does look like a good idea, but I also think it would become a big
> 
> mess if any of these pins turned out required for some obscure peripheral,
> 
> and then I'd have to dig it out of there, re-create the pin definition outside
> 
> and I think you know where this is going..
> 

But if this happens you need to override the giant pinctrl-0 in such
device dts and hope that you don't miss any of the entries anyways.

> 
> > +/*
> > + * For reasons that are currently unknown
> > + * (but probably related to fusb301), USB
> > + * takes about 6 minutes to wake up (nothing
> > + * interesting in kernel logs), but then it
> > + * works as it should.
> > This is funny (but please make it ~80 chars wide).
> 
> Eh, Torvalds said 100 is fine :P
> 

Right, 100 is the new "limit", but 80 is still a good target. What I'm
opposing is that you wrap at 44.

Thanks,
Bjorn
