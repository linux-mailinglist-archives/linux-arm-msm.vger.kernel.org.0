Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBA2841B9B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 23:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242699AbhI1V4q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 17:56:46 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:54653 "EHLO
        fanzine.igalia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242985AbhI1V4o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 17:56:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; s=20170329;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=8NPRrjD0p+23l0UNzKKJ5M1oJf/RvTAKxrcgZYfbA0I=;
        b=dSP8QP4dNKmlRqyNn3KeOTeT5aUdK3xudX7hfJjuvje5+ZXgAGuJwL2mZvSAI64hV9haw8DK7E9AdyNjVe9Bn/lJoSqrehyL/KKUo6iq0iFWoE/gIFJrHNQguhQ37JtFjru5H6sVTRFv4xfvycFclJMMPMhQ2AdK9AoTYFdwBd75BY6gmW3m4Ok/ePROFgikXjixab/ehPellhabqyFjeMtDVio8/JiNlz2AV2OaqcZUDY5e5GrvUQa/ni909vq3PdcObXgmdqxR02mLWCeQsUNrrurv2VZTXORNNv2rn7hZDbxuid9xt4A2wd+gZmCEjHiDIavwXJyi0RwrmCMejw==;
Received: from [177.95.15.66] (helo=[192.168.1.64])
        by fanzine.igalia.com with esmtpsa 
        (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
        id 1mVL40-0007jN-Og; Tue, 28 Sep 2021 23:55:01 +0200
Subject: Re: [PATCH] arm64: dts: qcom: db820c: Improve regulator voltage range
 and mark it as always-on
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        kernel@gpiccoli.net
References: <20210927163745.2066610-1-gpiccoli@igalia.com>
 <YVKFeqpe/sWj3h6K@builder.lan>
From:   "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Message-ID: <77a76065-d797-b59d-5570-d1b9606b79fb@igalia.com>
Date:   Tue, 28 Sep 2021 18:54:47 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVKFeqpe/sWj3h6K@builder.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bjorn, first of all, thanks a *lot* for your great/informative response!
Much appreciated =)

I'll respond more inline, below:


On 28/09/2021 00:01, Bjorn Andersson wrote:
> 
> The regulator range described in the datasheet and in the regulator
> driver defines what the PMIC can do, the dts refines this to a range
> that it suitable for this particular board. So it's expected to be more
> narrow.
> 
> The problem with vdd_gfx is that we don't have anything voting for an
> actual voltage, so you will either continue to run with whatever voltage
> we got from the power-on state (or bootloader), or
> regulator-min-microvolt. Until someone could come up with this support
> 0.98V seems to have been picked as some good enough number...
> 
> 
> The right thing would be to ensure that the voltage is scaled with the
> GPU clock, presumably with some reference from gpu_opp_table. This can
> perhaps be done using static voltages, but should in the long run be
> done by votes against the performance states exposed by the CPR block
> attached to the vdd_gfx - which will then ensure that the voltage level
> is adjusted as needed on a per-device basis.
> 

Very interesting...thanks for the details. Just confirming: CPR is Core
Power Reduction, right?
Found its (DTS) documentation at
devicetree/bindings/power/avs/qcom,cpr.txt, I'll study more and also the
driver counter-part.


>> More than that, my experiment showed that this regulator must be set to
>> always-on - this idea came from a commit in Linaro's tree, from Rajendra [2].
> 
> The regulator should be enabled whenever someone is voting for the
> GPU_GX_GDSC power domain of mmcc. Question is why this isn't enough.
> 

This is very interesting, I'll investigate more! I just tested and
indeed, without that setting, the board reboots suddenly.


>> With the voltage range updated plus set as always-on, the GPU is working
>> correctly, in a stable fashion.
>>
> 
> Could you perhaps check /sys/kernel/debug/regulator/regulator_summary to
> see the voltage level you get for your VDD_GFX when it works?
> 

Sure! This is the output:

VDD_GFX  1    1      0    fast  1000mV     0mA   350mV  1350mV
   8c0000.clock-controller-vdd-gfx   0 0mA     0mV     0mV

So, 1000mV is enough it seems.


> [...]
> 
> No need to apologize, the patch itself looks really good and nice to see
> that you tested it on both v5.14 and linux-next!
> 

Thank you =)

>>
> status = "okay" is the default value, so unless you want to disable a
> node in the dtsi by default, or override it to "okay" when it was
> previously disabled, there's no need to provide "status" here.
> 
>> +
> 
> And this empty line is undesirable.
> 
> 
> So to summarize, I do think there might be cases where your patch
> lowers the GPU voltage from 0.98V to 0.35V, which would result in a sad
> outcome. I think we should try to plug some voltages into gpu_opp_table,
> but perhaps we need to look into CPR to figure out what those voltages
> should be?
> 

OK cool, removed the okay status, worked fine as you suggested.

Now, regarding this approach of plugging the voltages on gpu_opp, I can
study more and try to come up with something. But it'll take some days
at least - for now, do you think that'd be interesting to adjust the
regulator voltage with min == 980mV and max == 1000mV? I tried here, and
it worked!

Let me know your thoughts!
Cheers,


Guilherme
