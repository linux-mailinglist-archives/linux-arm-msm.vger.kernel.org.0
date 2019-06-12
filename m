Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F2EB420B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 11:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408733AbfFLJ0Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 05:26:25 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:52010 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406598AbfFLJ0Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 05:26:25 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id AFE27602F3; Wed, 12 Jun 2019 09:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560331584;
        bh=zeHHmyNed96WAFtWPcPGxVLUicNu4T3ZxCI7j9ROzdE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=eYHB8Z0xlAtQF75Iyu1N8rvwvthKbvX4Ybt+BLDJQGOTg35ylXJpB775wnnsL5ZfW
         Lvxfug3sHkdIOsEGVqsPNmR4y1a/HgShJwRHE5eZZN3Vngy151Bshn4ptYeSFvUsSb
         MhgI7HFEvHN3ryBAE8UM0SmUprTZlzzhzXJulQIQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.128.120] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5D72F60256;
        Wed, 12 Jun 2019 09:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560331584;
        bh=zeHHmyNed96WAFtWPcPGxVLUicNu4T3ZxCI7j9ROzdE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=eYHB8Z0xlAtQF75Iyu1N8rvwvthKbvX4Ybt+BLDJQGOTg35ylXJpB775wnnsL5ZfW
         Lvxfug3sHkdIOsEGVqsPNmR4y1a/HgShJwRHE5eZZN3Vngy151Bshn4ptYeSFvUsSb
         MhgI7HFEvHN3ryBAE8UM0SmUprTZlzzhzXJulQIQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5D72F60256
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Subject: Re: [PATCH] arm64: dts: sdm845: Add iommus property to qup1
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>
References: <20190604222939.195471-1-swboyd@chromium.org>
 <20190604223700.GE4814@minitux> <5cf6f4bb.1c69fb81.c39da.5496@mx.google.com>
 <CAFp+6iHZeawnz7Vfk3=Oox-GN_y6c-E9wMwc-qdp1bTOXgqjFQ@mail.gmail.com>
 <5cf82c6f.1c69fb81.9e342.dbda@mx.google.com>
 <CAFp+6iE8FUXxexKbYy=ak+se-pj1XXUZxTu5o=hJvg66V6+Rzw@mail.gmail.com>
 <5cfee60a.1c69fb81.584d9.cf12@mx.google.com>
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
Message-ID: <7299c814-3d9f-c5d1-fe7b-44e05f8b4ec9@codeaurora.org>
Date:   Wed, 12 Jun 2019 14:56:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5cfee60a.1c69fb81.584d9.cf12@mx.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/11/2019 4:51 AM, Stephen Boyd wrote:
> Quoting Vivek Gautam (2019-06-06 04:17:16)
>> Hi Stephen,
>>
>> On Thu, Jun 6, 2019 at 2:27 AM Stephen Boyd <swboyd@chromium.org> wrote:
>>> Quoting Vivek Gautam (2019-06-04 21:55:26)
>>>
>>>> Cheza will throw faults for anything that is programmed with TZ on mtp
>>>> as all of that should be handled in HLOS. The firmwares of all these
>>>> peripherals assume that the SID reservation is done (whether in TZ or HLOS).
>>>>
>>>> I am inclined to moving the iommus property for all 'TZ' to board dts files.
>>>> MTP wouldn't need those SIDs. So, the SOC level dtsi will have just the
>>>> HLOS SIDs.
>>> So you're saying you'd like to have the SID be <&apps_smmu 0x6c3 0x0> in
>>> the sdm845.dtsi file and then override this on Cheza because our SID is
>>> different (possibly because we don't use GSI)? Why can't we program the
>>> SID in Cheza firmware to match the "HLOS" SID of 0x6c3?
>> Sorry my bad, I missed the overriding part.
>> May be we add the lists of SIDs in board dts only. So, cheza dts will
>> have all these SIDs -
>> <&apps_smmu 0x6c0 0x3>   // for both 0x6c0 (TZ) and 0x6c3 (HLOS)
>> <&apps_smmu 0x6d6 0x0>   // if we want to use the GSI dma.
>> and
>> MTP will have
>> <&apps_smmu 0x6c3 0x0>
>> <&apps_smmu 0x6d6 0x0>
>> WDUT?
> I'd prefer to fix the firmware so that the HLOS SID is used even on this
> board. Making Cheza use something different from MTP doesn't sound so
> good. Do you know how that works? Is there some configuration register
> or something that I should be looking for to see why the SID is not the
> HLOS one? It's definitely generating SIDs for the TZ SID (0x6c0), but
> I'd like to make sure that we can't change it because it's tied to some
> hardware signal like the NS bit and/or the Execution Level. Hopefully
> it's a config and then our difference from MTP can be minimized.

I don't think SMMU limits any such programming of SIDs. It's a design 
decision
to program few SIDs in TZ/Hyp and allocate the corresponding context banks
and create respective mappings. You should be able to see these SMR 
configurations
before kernel boots up. I use a simple T32 command -

smmu.add "<name>" <smmu_type> <base_address>
smmu.streammaptable <name>

e.g. for sdm845 apps_smmu

smmu.add "apps" MMU500 a:0x15000000
smmu.StreamMapTable apps

This dumps all the information regarding the smmu.

>
> As far as I can tell, HLOS on SDM845 has always used GPI (yet another
> DMA engine) to do the DMA transfers. And the GPI is the hardware block
> that uses the SID of 0x6d6 above, so putting that into iommus for the
> geniqup doesn't make any sense given that GPI is another node. Can you
> confirm this is the case? Furthermore, the SID of 0x6c3 sounds untested?
> Has it ever been generated on SDM845 MTP?

I will get back with this information.

BRs
Vivek

>
> If we ever support GPI, I'd expect to see something like this in DT:
>
> 	gpi_dma: gpi@a00000 {
> 		reg = <0x00a00000 0x60000>;
> 		iommus = <&apps_smmu 0x6d6 0x0>;
> 		...
> 	};
>
> 	geniqup@ac0000 {
> 		reg = <0x00ac0000 0x6000>;
> 		iommus = <&apps_smmu 0x6c3 0x0>;
>
> 		i2c@....{
>
> 			dmas = <&gpi_dma ....>;
> 		};
>
> But now I'm worried that the geniqup needs the proper geniqup wrapper
> clks to talk to it. Most likely the GPI is embedded inside the geniqup
> wrapper and sits right next to the bus to do bus DMA mastering. From the
> DT side, it means we should either put it inside the geniqup node, or we
> should add the wrapper clks to the GPI node and hope things work out
> with regards to clks and shared resources being used at the right time.
>
> If we're left with trying to figure out how to express the different
> SIDs depending on the CPU execution state then it may be easier to push
> for GPI upstreaming and use that dma engine to "fold" the SID
> numberspace into one SID for the GPI. This would avoid having to deal
> with the HLOS vs. TZ SID problem by adding a whole other driver. Or we
> could just rip out the non-GPI DMA support in this driver because the
> SID is all confused.
>

