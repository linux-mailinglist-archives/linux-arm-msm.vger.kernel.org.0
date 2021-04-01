Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89372352151
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 23:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234400AbhDAVKK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 17:10:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234287AbhDAVKJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 17:10:09 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEE2FC06178A;
        Thu,  1 Apr 2021 14:10:09 -0700 (PDT)
Received: from [192.168.1.101] (abae153.neoplus.adsl.tpnet.pl [83.6.168.153])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 035EE3F5D2;
        Thu,  1 Apr 2021 23:10:06 +0200 (CEST)
Subject: Re: [PATCH 5/6] clk: qcom: gcc-sdm660: Account for needed adjustments
 in probe function
To:     Stephen Boyd <sboyd@kernel.org>, phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Craig Tatlor <ctatlor97@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20210220155618.176559-1-konrad.dybcio@somainline.org>
 <20210220155618.176559-5-konrad.dybcio@somainline.org>
 <161404077336.1254594.15002572465360321874@swboyd.mtv.corp.google.com>
 <3917fba4-e5b0-911f-9220-f401a90aac38@somainline.org>
 <161724198675.2260335.14358880292682931985@swboyd.mtv.corp.google.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <abc821cc-ef43-3241-793a-cc4c85b72563@somainline.org>
Date:   Thu, 1 Apr 2021 23:10:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <161724198675.2260335.14358880292682931985@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


>>>> +
>>>> +       /* Keep bimc gfx clock port on all the time */
>>>> +       clk_prepare_enable(gcc_bimc_gfx_clk.clkr.hw.clk);
>>>> +
>>> Preferably just set these various bits with regmap_update_bits() during
>>> probe. Also, please do it before regsitering the clks, not after.
>> To be fair, now I think that simply adding CLK_IS_CRITICAL flag to the clocks in question is the smartest thing to do. Magic writes don't tell a whole lot.
> This is how it's been done in various other qcom clk drivers. Usually
> there is a comment about what is enabled, but really it's just setting
> random bits that sadly aren't already set by default.

But why.. why should we give Linux less information about the hardware it's running on? It's a kernel after all, I know some parties would prefer to keep the hardware away from its users, but cmon, it's OSSLand out there!

Allocating a few bytes more in memory is proooobably a good trade-off for keeping an eye on the state of various clocks instead of simply setting some seemingly random bits and hoping nothing bad happens under the hood.. This isn't only a case for this clock, but for all ones that are effectively pinky-promise-trusted to function properly with no way of checking if they're even still alive other than poking the registers manually.. As of v5.12-rc2, there are *46* such trust credits..

It's NOT easy to track down issues in big monolithic kernels, especially when people submitting changes to common code seem to think that only their hardware uses it (no hard feelings, but drm/msm broke on !a6xx *at least* two times within the last year) and since making sure the clocks are ticking properly is one of the most crucial things when looking into more complex issues, which may or may not randomly happen on a platform that is just being brought up for various reasons (e.g. half of mdm9607 hardware doesn't wanna play along without a ICC driver), I *really* think we should use CLK_IS_CRITICAL instead and give developers a way to check if everything's in tact with the clock, while still keeping the "never turn it off, don't touch it!" aspect.


>>>> +       /* Set the HMSS_GPLL0_SRC for 300MHz to CPU subsystem */
>>>> +       clk_set_rate(hmss_gpll0_clk_src.clkr.hw.clk, 300000000);
>>> Is this not already the case?
>>
>> This is a mission-critical clock and we cannot trust the bootloader with setting it. Otherwise dragons might appear.
>>
> What does the bootloader set it to?

Sorry but I can't check, nor do I remember right now. But we still shouldn't add a variable that might come from a lazy OEM not incorporating the fix into their release, especially since this one is used for clocking the AP.


Konrad

