Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C42B3B470F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 17:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbhFYP6L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 11:58:11 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:46912 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229738AbhFYP6I (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 11:58:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624636548; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=k+52SBszcH483ZRUtcU+yiloL+pyVt9AUiozgNhX+3M=;
 b=AETq64HupZhUGf52nZarF/VM8WDuCKVVMls8bjujcVQLV6D1+A9FrbRSjEpcbQBkd1k+sdPI
 z0Lz+qIyfHTNZyJapF15K8iHzdm50JOXx0kuFIc7Urq+e2CM8DeAyM9/jvMC4QRjITFQKzj8
 eF4KD0YZ15B4p9Iu/czP9X4CGrM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60d5fc7ed2559fe392b4bc21 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 25 Jun 2021 15:55:42
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6D9EAC43460; Fri, 25 Jun 2021 15:55:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2765CC433F1;
        Fri, 25 Jun 2021 15:55:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 25 Jun 2021 08:55:41 -0700
From:   khsieh@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org, agross@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        abhinavk@codeaurora.org, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64/dts/qcom/sc7180: Add Display Port dt node
In-Reply-To: <YNKiB3ZEtOQ+T/MX@yoga>
References: <CAE-0n50-X03sMyJdsw7s=Ue0dWXBo=iHOc0HxDQm5yh2J-uS3A@mail.gmail.com>
 <YL/uj+t+BFkII1Fh@yoga>
 <CAE-0n50WP25kRQkWMVdDZGsZWBXwfbVSTFKyBLF7f8Mp3x2Wfg@mail.gmail.com>
 <YL/wWdRs6e/eECiC@yoga>
 <CAE-0n51GM65rZVJgXuHy6FerJorHeHKf2W31GijG8sDEhaX_KQ@mail.gmail.com>
 <YL/41hWz8xB+jSeO@yoga> <21dc5c9fc2efdc1a0ba924354bfd9d75@codeaurora.org>
 <CAE-0n52J_mLsmXLS+skZn2u3k9dhn+GcHeXi0B2BeQyQxEUL9A@mail.gmail.com>
 <YM0THrlJlv7ADW8w@builder.lan>
 <CAE-0n53Zr-w5m-eFhLM2BVmphcYb_M4=s5je3Y7Lg6=onNo=uA@mail.gmail.com>
 <YNKiB3ZEtOQ+T/MX@yoga>
Message-ID: <b157a691a1cb8f860219ca3b2c335411@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-22 19:52, Bjorn Andersson wrote:
> On Tue 22 Jun 15:23 CDT 2021, Stephen Boyd wrote:
> 
>> Quoting Bjorn Andersson (2021-06-18 14:41:50)
>> > On Fri 18 Jun 15:49 CDT 2021, Stephen Boyd wrote:
>> >
>> > > Quoting khsieh@codeaurora.org (2021-06-10 09:54:05)
>> > > > On 2021-06-08 16:10, Bjorn Andersson wrote:
>> > > > > On Tue 08 Jun 17:44 CDT 2021, Stephen Boyd wrote:
>> > > > >
>> > > > >> Honestly I suspect the DP PHY is _not_ in the CX domain as CX is for
>> > > > >> digital logic. Probably the PLL is the hardware that has some minimum
>> > > > >> CX
>> > > > >> requirement, and that flows down into the various display clks like
>> > > > >> the
>> > > > >> link clk that actually clock the DP controller hardware. The mdss_gdsc
>> > > > >> probably gates CX for the display subsystem (mdss) so if we had proper
>> > > > >> corner aggregation logic we could indicate that mdss_gdsc is a child
>> > > > >> of
>> > > > >> the CX domain and then make requests from the DP driver for particular
>> > > > >> link frequencies on the mdss_gdsc and then have that bubble up to CX
>> > > > >> appropriately. I don't think any of that sort of code is in place
>> > > > >> though, right?
>> > > > >
>> > > > > I haven't checked sc7180, but I'm guessing that it's following the
>> > > > > other
>> > > > > modern platforms, where all the MDSS related pieces (including e.g.
>> > > > > dispcc) lives in the MMCX domain, which is separate from CX.
>> > > > >
>> > > > > So the parent of MDSS_GDSC should be MMCX, while Kuogee's answer (and
>> > > > > the dp-opp-table) tells us that the PLL lives in the CX domain.
>> > >
>> > > Isn't MMCX a "child" of CX? At least my understanding is that MMCX is
>> > > basically a GDSC that clamps all of multimedia hardware block power
>> > > logic so that the leakage is minimized when multimedia isn't in use,
>> > > i.e. the device is suspended. In terms of bumping up the voltage we have
>> > > to pin that on CX though as far as I know because that's the only power
>> > > domain that can actually change voltage, while MMCX merely gates that
>> > > voltage for multimedia.
>> > >
>> >
>> > No, MMCX is a separate rail from CX, which powers the display blocks and
>> > is parent of MDSS_GDSC. But I see in rpmhpd that sc7180 is not one of
>> > these platforms, so I presume this means that the displayport controller
>> > thereby sits in MDSS_GDSC parented by CX.
>> >
>> > But in line with what you're saying, the naming of the supplies to the
>> > QMP indicates that the power for the PLLs is static. As such the only
>> > moving things would be the clock rates in the DP controller and as such
>> > that's what needs to scale the voltage.
>> >
>> > So if the resources we're scaling is the clocks in the DP controller
>> > then the gist of the patch is correct. The only details I see is that
>> > the DP controller actually sits in MDSS_GDSC - while it should control
>> > the level of its parent (CX). Not sure if we can describe that in a
>> > simple way.
>> 
>> Right. I'm not sure things could be described any better right now. If
>> we need to change this to be MDSS_GDSC power domain and control the
>> level of the parent then I suppose we'll have to make some sort of DT
>> change and pair that with a driver change. Maybe if that happens we 
>> can
>> just pick a new compatible and leave the old code in place.
>> 
> 
> I would prefer that we stay away from making up a new compatible for
> that, but let's see when we get there.
> 
>> Are you happy enough with this current patch?
>> 
> 
> Yes, I think this looks good.
> 
>> >
>> >
>> > PS. Why does the node name of the opp-table have to be globally unique?
>> 
>> Presumably the opp table node name can be 'opp-table' as long as it
>> lives under the node that's using it. If the opp table is at / or /soc
>> then it will need to be unique. I'd prefer just 'opp-table' if 
>> possible.
> 
> I asked the same question (if it has to be globally unique) in the 
> patch
> adding sdhci nodes for sc7280 and I didn't get a sufficient answer...
> 
> So now I do want to know why "opp-table" wouldn't be sufficient name 
> for
> these device-internal nodes.
> 
my opinion is dp_opp_table is more consistency with mdp and dsi.
Either one is fine. Please let me know asap.
> Regards,
> Bjorn
