Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 035602ADEE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 19:58:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731464AbgKJS6r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 13:58:47 -0500
Received: from z5.mailgun.us ([104.130.96.5]:62106 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726179AbgKJS6r (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 13:58:47 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605034727; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=03vIhO1DD9MMUbmvKZXZHZRt0toBn4/mIUEAO6EdjbY=;
 b=qtpBWD1CEup+/WygSr779RZG4q0RQ/oR8mXP8IMBcbC5q2apT6gzeARfN9BgAIe/vIg+mJ7i
 0o3dbT7ycrtq63Y+Ns0BrdXzcM50rwq2XwnsI72KYkvjD2uISify3trt2NgXJnG5fxnMZKhe
 bVrLSQ72eccMkHx8XjzoX3yYYFQ=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5faae2dd40d44461257a237e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Nov 2020 18:58:37
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DB930C433C9; Tue, 10 Nov 2020 18:58:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0886AC433C8;
        Tue, 10 Nov 2020 18:58:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 11 Nov 2020 00:28:36 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7180-lite: Tweak DDR/L3 scaling
 on SC7180-lite
In-Reply-To: <CAD=FV=XFgS-d8L5Q3SEXYYtBszmjdMbBLRWRTHX7rQ5i6Hb=4g@mail.gmail.com>
References: <1602783939-7177-1-git-send-email-sibis@codeaurora.org>
 <CAD=FV=XFgS-d8L5Q3SEXYYtBszmjdMbBLRWRTHX7rQ5i6Hb=4g@mail.gmail.com>
Message-ID: <9f4ae806ba3d283caaab37f0f2aa7ea0@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-17 04:29, Doug Anderson wrote:
> Hi,
> 
> On Thu, Oct 15, 2020 at 10:53 AM Sibi Sankar <sibis@codeaurora.org> 
> wrote:
>> 
>> Tweak the DDR/L3 bandwidth votes on the lite variant of the SC7180 SoC
>> since the gold cores only support frequencies upto 2.1 GHz.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7180-lite.dtsi | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-lite.dtsi
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-lite.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7180-lite.dtsi
>> new file mode 100644
>> index 000000000000..cff50275cfe1
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sc7180-lite.dtsi
>> @@ -0,0 +1,14 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * SC7180 lite device tree source
>> + *
>> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +&cpu6_opp11 {
>> +       opp-peak-kBps = <8532000 22425600>;
>> +};
>> +
>> +&cpu6_opp12 {
>> +       opp-peak-kBps = <8532000 23347200>;
>> +};
> 
> I guess this is OK, but something about it smells just a little
> strange...  I guess:
> 
> a) There's suddenly a big jump from opp10 to opp11.  You don't use
> 7216000 at all anymore.
> 
> b) The fact that we need to do this at all feels like a sign that
> somehow this wasn't designed quite right.
> 
> Just brainstorming a bit: If the higher memory rate wasn't useful for
> OPP11/12 on the non-lite version of the chip, why are they useful for
> that OPP on the lite version?  I guess you're just trying to eek out
> the last little bits of performance once the cpufreq is maxed out?  It

Doug,

Really sorry about the delayed response,
running power tests and getting some fuse
info took longer than expected. Yes the
mapping table as expected is a trade off
between power/perf and it has been determined
that lite version would meet the power
numbers even with the high memory votes
at lower freqs.

1900800000 --> opp-peak-kBps = <7216000 22425600>;
1996800000 --> opp-peak-kBps = <7216000 22425600>;
2112000000 --> opp-peak-kBps = <8532000 23347200>;

^^ is the new recommendation from the perf/power
QC teams for lite and is expected to have better
power numbers with similar perf.

> almost feels like a better way to do this (though it wouldn't be
> monotonically increasing anymore so it wouldn't actually work) would
> be to have a few "OPP" points at the top where the cpufreq stops
> increasing and all you do is increase the memory frequency.
> 
> c) In theory we're supposed to be able to probe whether we're on the
> normal, lite, or pro version, right?  Anyway we could tweak this in
> code so we don't have to know to include the right dtsi file?

Yes we can determine f_max by reading speed_bin
efuse values or by OSM table traversal (though
latter looks more like a hack) and use that
along with opp-supported-hw to identity supported
opps.

I would prefer If we can avoid doing ^^ if
we can get away with overloading the votes
in dt but I don't have any strong opinions
on this. So let me know how you want it done
and I'll fix it up accordingly in the next
re-spin.

> 
> 
> -Doug

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
