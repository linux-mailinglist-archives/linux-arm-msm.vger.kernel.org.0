Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E34A539138D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 11:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233222AbhEZJXM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 05:23:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232218AbhEZJXL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 05:23:11 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 688BBC061756
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 May 2021 02:21:40 -0700 (PDT)
Received: from [192.168.1.101] (83.6.168.54.neoplus.adsl.tpnet.pl [83.6.168.54])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id CD5873F3BC;
        Wed, 26 May 2021 11:21:35 +0200 (CEST)
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Add support for SONY Xperia X
 Performance / XZ / XZs (msm8996, Tone platform)
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
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
References: <20210525200246.118323-1-konrad.dybcio@somainline.org>
 <20210525200246.118323-7-konrad.dybcio@somainline.org>
 <YK3CxHZELSQzz4Dp@builder.lan>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <3fbf451e-6bab-d72a-1d6b-851ece99c95b@somainline.org>
Date:   Wed, 26 May 2021 11:21:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YK3CxHZELSQzz4Dp@builder.lan>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,


> BSD license in all the files please.

msm8996.dtsi is gpl2-only, so I wasn't sure I can include it..


>> +};
>> \ No newline at end of file
> [..]

Yikes... my mistake


>> +#include "pmi8994.dtsi"
>> +#include <dt-bindings/input/input.h>
>> +#include <dt-bindings/input/gpio-keys.h>
> This seems to be unused for now.

Right. I will add the keys in a separate patch, this one is plenty big already.


>> +		/*
>> +		 * Due to an unknown-for-a-few-years regression,
>> +		 * SDHCI only works on MSM8996 in PIO (lame) mode.
>> +		 */
>> +		bootargs = "sdhci.debug_quirks=0x40 sdhci.debug_quirks2=0x4 maxcpus=2";
> What's up with maxcpus=2? Is this simply because the last 2 are really
> really slow?

Yeah, I think the L2 and cci being stuck at bl clocks are to blame again.. there was a lot of msm8996 cpufreq work but I am not sure if anybody got it to *actually* work in the end, I'll try to look into this soon(tm)..


>> +};
>> +
>> +&CPU0 {
>> +	cpu-supply = <&pmi8994_s11>;
> Isn't this the supply to the CPU-subsystem-internal LDO that actually
> feeds the CPU? Is there a benefit to describing this here?

I believe it was related to the cpufreq-dt madness, I will remove this.


>> +
>> +&pm8994_gpios {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pm8994_gpio_1 &pm8994_vol_down_n &pm8994_vol_up_n
>> +		     &pm8994_cam_snap_n &pm8994_cam_focus_n &pm8994_gpio_6
>> +		     &pm8994_nfc_dload &pm8994_gpio_8 &pm8994_gpio_9
>> +		     &pm8994_gpio_nfc_clk &pm8994_gpio_11 &pm8994_gpio_12
>> +		     &pm8994_ear_en &pm8994_gpio_14 &pm8994_pm_divclk1
>> +		     &pm8994_pmi_clk &pm8994_gpio_17 &pm8994_rome_sleep
>> +		     &pm8994_gpio_19 &pm8994_gpio_22>;
> Shouldn't several of these reference be done from the relevant nodes?

Certainly, but not all peripherals have drivers upstream, and other ones

are hardcoded to their state downstream, and knowing what shady stuff

some vendors do, I'm reluctant to trust the bootloader-default state with

my expensive toys..



> For the ones that isn't, and that you're not going to ever change I
> think it would look better to have a single:
>
> pm8994_gpios_defaults: default-state {
> 	nc {
> 		nc pins...
> 	};
>
> 	vol-up {
> 		...
> 	};
>
> 	...
> };

That does look like a good idea, but I also think it would become a big

mess if any of these pins turned out required for some obscure peripheral,

and then I'd have to dig it out of there, re-create the pin definition outside

and I think you know where this is going..


> +/*
> + * For reasons that are currently unknown
> + * (but probably related to fusb301), USB
> + * takes about 6 minutes to wake up (nothing
> + * interesting in kernel logs), but then it
> + * works as it should.
> This is funny (but please make it ~80 chars wide).

Eh, Torvalds said 100 is fine :P


Konrad

