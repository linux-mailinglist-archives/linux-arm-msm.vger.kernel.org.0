Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 718C13932F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 May 2021 17:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233824AbhE0P4i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 May 2021 11:56:38 -0400
Received: from relay08.th.seeweb.it ([5.144.164.169]:44695 "EHLO
        relay08.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233653AbhE0P4i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 May 2021 11:56:38 -0400
Received: from [192.168.1.101] (83.6.168.54.neoplus.adsl.tpnet.pl [83.6.168.54])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id BF2CF3F35C;
        Thu, 27 May 2021 17:55:01 +0200 (CEST)
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
 <3fbf451e-6bab-d72a-1d6b-851ece99c95b@somainline.org>
 <YK+/RJX2DXvyHh0J@builder.lan>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <2d1377bf-ca8f-eb69-2b62-fdb61590dad8@somainline.org>
Date:   Thu, 27 May 2021 17:55:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YK+/RJX2DXvyHh0J@builder.lan>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,


>> Very good question, I think it's fine, would prefer it that way and will
>> be merge it, but ianal.

Wikipedia says that 2- and 3- clause BSD and GPLv2 are compatible, so let's trust random folks from the interwebz and go with BSD.


>> Yeah, I think the L2 and cci being stuck at bl clocks are to blame
>> again.. there was a lot of msm8996 cpufreq work but I am not sure if
>> anybody got it to *actually* work in the end, I'll try to look into
>> this soon(tm)..
>>
> Right, we have some lingering patches on our side for this as well,
> unfortunately I have one db82c0 that gets unstable when we bring the
> last 2 CPUs up to speed.
>
> I started looking at this and found that some care needs to be taken
> when switching between the lower half and higher half of the frequencies
> (or perhaps it was voltages?) Unfortunately I didn't conclude anything
> in this area, but I would be happy to see this resolved.

Yeah.. as if 96 didn't have enough problems already.. :/



>> That does look like a good idea, but I also think it would become a big
>>
>> mess if any of these pins turned out required for some obscure peripheral,
>>
>> and then I'd have to dig it out of there, re-create the pin definition outside
>>
>> and I think you know where this is going..
>>
> But if this happens you need to override the giant pinctrl-0 in such
> device dts and hope that you don't miss any of the entries anyways.

Ok, you convinced me.



>> Eh, Torvalds said 100 is fine :P
>>
> Right, 100 is the new "limit", but 80 is still a good target. What I'm
> opposing is that you wrap at 44.

That's what I get when I skip supper and don't feed my brain.. Ofc I can make it longer per-line, heh. V2 should hit your inbox soon.


Konrad

