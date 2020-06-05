Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAB861EFC1C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2020 17:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbgFEPEc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jun 2020 11:04:32 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:59861 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728055AbgFEPEa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jun 2020 11:04:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591369469; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=/0RmIoKOk/tLUvgTTyB+mzPhSVolwNYfMaAMc7plVF0=;
 b=iv2+Yvtf4edDaLP90XSGqXfHD5LIif54D6Kv6OkJLK19exT54DwmA2Fp0EZwTClaYRP+q+MB
 D+ow4pHaSdVvqlbu+kdcVVWgqLg1QdW9UBuA+Tjb8VoPQEcoFVUgUx3SnfHuYZ9kuCHWgPAm
 eoGNqby8b3hb5jxdzDB6f9LtqRg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5eda5eede276c808dedad913 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Jun 2020 15:04:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0D460C433C6; Fri,  5 Jun 2020 15:04:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED autolearn=ham
        autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 85120C433CA;
        Fri,  5 Jun 2020 15:04:12 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 05 Jun 2020 20:34:12 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        devicetree-owner@vger.kernel.org
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm8150: add apps_smmu node
In-Reply-To: <CAP71WjzMgYb921dV1eJ0zHDAAc33HFsegAw7U_0NcKAn96fJvw@mail.gmail.com>
References: <20200524023815.21789-1-jonathan@marek.ca>
 <20200524023815.21789-2-jonathan@marek.ca>
 <20200529025246.GV279327@builder.lan>
 <d0908f34-a698-3449-35b9-7a98e9641295@marek.ca>
 <20200529031520.GA1799770@builder.lan>
 <91eb7ee0e549b10724c724aebfd91996@codeaurora.org>
 <8cf134f0-381f-7765-2496-e5abd77f3087@marek.ca>
 <e9800dbb6531c9b57a855f41f68753bd@codeaurora.org>
 <CAP71WjwjZgD=msK_2W8eBBk6axZ_uMNurEm9F76u6aHscXPf9Q@mail.gmail.com>
 <81a9d07c0c8d76abf0ef734963788884@codeaurora.org>
 <CAP71WjzMgYb921dV1eJ0zHDAAc33HFsegAw7U_0NcKAn96fJvw@mail.gmail.com>
Message-ID: <6d0aa709dbd00ceda4e27d5d49ecc9ff@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-06-05 20:21, Nicolas Dechesne wrote:
> On Fri, Jun 5, 2020 at 4:39 PM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> Hi Nico,
>> 
>> On 2020-06-05 20:01, Nicolas Dechesne wrote:
>> > On Fri, Jun 5, 2020 at 4:14 PM Sai Prakash Ranjan
>> > <saiprakash.ranjan@codeaurora.org> wrote:
>> >>
>> >> On 2020-06-05 19:40, Jonathan Marek wrote:
>> >> > On 6/5/20 10:03 AM, Sai Prakash Ranjan wrote:
>> >> >> On 2020-05-29 08:45, Bjorn Andersson wrote:
>> >> >>> On Thu 28 May 20:02 PDT 2020, Jonathan Marek wrote:
>> >> >>>
>> >> >>>>
>> >> >>>>
>> >> >>>> On 5/28/20 10:52 PM, Bjorn Andersson wrote:
>> >> >>>> > On Sat 23 May 19:38 PDT 2020, Jonathan Marek wrote:
>> >> >>>> >
>> >> >>>> > > Add the apps_smmu node for sm8150. Note that adding the iommus field for
>> >> >>>> > > UFS is required because initializing the iommu removes the bypass mapping
>> >> >>>> > > that created by the bootloader.
>> >> >>>> > >
>> >> >>>> >
>> >> >>>> > Unrelated to the patch itself; how do you disable the splash screen on
>> >> >>>> > 8150? "fastboot oem select-display-panel none" doesn't seem to work for
>> >> >>>> > me on the MTP - and hence this would prevent my device from booting.
>> >> >>>> >
>> >> >>>> > Thanks,
>> >> >>>> > Bjorn
>> >> >>>> >
>> >> >>>>
>> >> >>>> I don't have a MTP, but on HDK855, "fastboot oem
>> >> >>>> select-display-panel none"
>> >> >>>> combined with setting the physical switch to HDMI mode (which
>> >> >>>> switches off
>> >> >>>> the 1440x2560 panel) gets it to not setup the display at all (just
>> >> >>>> the
>> >> >>>> fastboot command isn't enough).
>> >> >>>>
>> >> >>>
>> >> >>> Okay, I don't think we have anything equivalent on the MTP, but good
>> >> >>> to
>> >> >>> know.
>> >> >>>
>> >> >>
>> >> >> Actually I tried out this in SM8150 MTP and it works fine for me,
>> >> >>
>> >> >> "fastboot set_active a; fastboot set_active b; fastboot set_active a;
>> >> >> fastboot oem select-display-panel none; fastboot reboot bootloader;
>> >> >> fastboot boot boot-sm8150.img"
>> >> >>
>> >> >> Also I need to switch slots everytime like above, otherwise I always
>> >> >> see some error
>> >> >> while loading the boot image.
>> >> >>
>> >> >
>> >> > What is the error? If it is "FAILED (remote: Failed to
>> >> > load/authenticate boot image: Load Error)" then flashing/erasing
>> >> > boot_a will make it go away ("fastboot erase boot_a") for the next 6
>> >> > or so "failed" boots.
>> >> >
>> >>
>> >> Yes this exact error.
>> >
>> > The bootloader maintains a 'boot status' in one of the partition
>> > attributes. After a certain amount of 'failed' boot , it will switch
>> > to the other boot partition. It's the same thing on RB3/DB845c. In our
>> > release for DB845c, we are patching the bootloader so that this
>> > behavior is bypassed. On typical 'product' there is a user space
>> > application that will come and set the partition attribute to indicate
>> > the boot was successful.
>> >
>> > For the record, this is the patch we use on 845c:
>> > https://git.linaro.org/landing-teams/working/qualcomm/abl.git/commit/?h=release/LE.UM.2.3.7-09200-sda845.0&id=e3dc60213234ed626161a568ba587ddac63c5158
>> >
>> > rebuilding EDK2/ABL requires access to signing tools.. so it might not
>> > be possible for everyone. but in case you can, it should be
>> > straightforward to reuse this patch.
>> >
>> 
>> Thank you for these details and the patch, it's very useful.
>> I do have access to ABL code and the signing tools and can build one.
> 
> Good. Then the next problem you will likely face is that building QCOM
> ABL is far from being straightforward. Why would it be? ;)
> That's the script we use to build it ourselves:
> https://git.linaro.org/ci/job/configs.git/tree/lt-qcom-bootloader/dragonboard845c/builders.sh#n61
> 
> It has a reference to sectools which we have (internally) access to,
> but you have it too, and you should be able to leverage most of the
> script.

Looks like a cool tool, will definitely try it out :) Also internally we 
have another
tool to build ABL(if you are aware of kdev then you will know what this 
is called, guess ;))
which takes care of cloning and building and signing all the things 
required
(although very weirdly it clones sectools everytime which should be 
fixed, I just comment
that part out when I build) and all it takes is one command "make" :)

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
