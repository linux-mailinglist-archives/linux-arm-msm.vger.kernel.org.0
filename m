Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42660365E68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Apr 2021 19:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232473AbhDTRVf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Apr 2021 13:21:35 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:32817 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232913AbhDTRVe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Apr 2021 13:21:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618939263; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=7nGA6TE9zULQazyvaHn6Yh1DQZ8seh4Es18HpsC0kek=;
 b=fdfWQdyv2MGaYNkt6s2JTv9p1jO9l/IpscQQFv9vPJyhJsGe/q2ocnSgPphS7zjRQu79bzot
 Sf1zOyEChH7LSOWfZLoAblclv7CHfut/OOURHQwfYpgVfE6+tfpOOTfE8IYVE020M3ofsnas
 SCmSOXAfhKnz6U7N8d1o+JjguLw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 607f0d6ba817abd39abdf6a6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Apr 2021 17:20:43
 GMT
Sender: sbhanu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F3B93C4360C; Tue, 20 Apr 2021 17:20:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sbhanu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 15CBFC433D3;
        Tue, 20 Apr 2021 17:20:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 20 Apr 2021 22:50:41 +0530
From:   sbhanu@codeaurora.org
To:     Doug Anderson <dianders@google.com>
Cc:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        Ram Prakash Gupta <rampraka@codeaurora.org>,
        Sayali Lokhande <sayalil@codeaurora.org>,
        sartgarg@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>, cang@codeaurora.org,
        pragalla@codeaurora.org, nitirawa@codeaurora.org,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH V2] arm64: dts: qcom: sc7280: Add nodes for eMMC and SD
 card
In-Reply-To: <CAD=FV=XavWbf_b7-=JT6V5_RNA8CjdK4oRu7H719AaPDJ5tsqQ@mail.gmail.com>
References: <1616264220-25825-1-git-send-email-sbhanu@codeaurora.org>
 <CAD=FV=WLZCSd6D5VFyD+1KBp5n1qyszER2EVaEMwYjQfPSSDnA@mail.gmail.com>
 <b77f207b-2d90-3c8b-857f-625bd3867ed1@codeaurora.org>
 <6fdf704c4716f5873d413229ca8adc57@codeaurora.org>
 <CAD=FV=Wa4fT5wZgd0==8kLy_tzTLgdZ-HwdfOEAM9pMeMjjFyg@mail.gmail.com>
 <8126e130e5c0ea1e7ea867414f0510c0@codeaurora.org>
 <CAD=FV=XavWbf_b7-=JT6V5_RNA8CjdK4oRu7H719AaPDJ5tsqQ@mail.gmail.com>
Message-ID: <32096a375966e1fcc149016df012c445@codeaurora.org>
X-Sender: sbhanu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-04-15 01:55, Doug Anderson wrote:
> Hi,
> 
> On Tue, Apr 13, 2021 at 3:59 AM <sbhanu@codeaurora.org> wrote:
>> 
>> >> >>> +                                       required-opps =
>> >> >>> <&rpmhpd_opp_low_svs>;
>> >> >>> +                                       opp-peak-kBps = <1200000
>> >> >>> 76000>;
>> >> >>> +                                       opp-avg-kBps = <1200000
>> >> >>> 50000>;
>> >> >> Why are the kBps numbers so vastly different than the ones on sc7180
>> >> >> for the same OPP point. That implies:
>> >> >>
>> >> >> a) sc7180 is wrong.
>> >> >>
>> >> >> b) This patch is wrong.
>> >> >>
>> >> >> c) The numbers are essentially random and don't really matter.
>> >> >>
>> >> >> Can you identify which of a), b), or c) is correct, or propose an
>> >> >> alternate explanation of the difference?
>> >> >>
>> >>
>> >> We calculated bus votes values for both sc7180 and sc7280 with ICB
>> >> tool,
>> >> above mentioned values we got for sc7280.
>> >
>> > I don't know what an ICB tool is. Please clarify.
>> >
>> > Also: just because a tool spits out numbers that doesn't mean it's
>> > correct. Presumably the tool could be wrong or incorrectly configured.
>> > We need to understand why these numbers are different.
>> >
>> we checked with ICB tool team on this they conformed as Rennell & 
>> Kodiak
>> are different chipsets,
>> we might see delta in ib/ab values due to delta in scaling factors.
> 
> ...but these numbers are in kbps, aren't they? As I understand it
> these aren't supposed to be random numbers spit out by a tool but are
> supposed to be understandable by how much bandwidth an IP block (like
> MMC) needs from the busses it's connected to. Since the MMC IP block
> on sc7180 and sc7280 is roughly the same there shouldn't be a big
> difference in numbers.
> 
> Something smells wrong.
> 
> Adding a few people who understand interconnects better than I do, 
> though.
> 

ICB team has re-checked the Rennell ICB tool and they confirmed that 
some configs were wrong in Rennell ICB tool and they corrected it.With 
the new updated Rennell ICB tool below are the values :


Rennell LC:(Sc7180)

opp-384000000 {
              opp-hz = /bits/ 64 <384000000>;
              required-opps = <&rpmhpd_opp_nom>;
              opp-peak-kBps = <5400000 490000>;
              opp-avg-kBps = <6600000 300000>;
};


And now, these values are near to Kodaik LC values:

Kodaik LC:(SC7280)

opp-384000000 {
            opp-hz = /bits/ 64 <384000000>;
            required-opps = <&rpmhpd_opp_nom>;
            opp-peak-kBps = <5400000 399000>;
            opp-avg-kBps = <6000000 300000>;
};


> -Doug
