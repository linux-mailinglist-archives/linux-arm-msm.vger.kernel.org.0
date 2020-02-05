Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D76C15266E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 07:51:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725497AbgBEGvo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Feb 2020 01:51:44 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:35982 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725468AbgBEGvo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 01:51:44 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580885503; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=FEUHkLBJ+nAGJuyoz3LEU26JARROyquI5FGuyUlZs9g=;
 b=PJ+u2sUNGTqIhHAX3Syi37z/mqW16j3oPsi0A1fg+iYwHY6sb8G8ofiqetpgBRP9s/jkLNIC
 lCTW9Lu7uXiljg1cexb3kaoa4222Cz1qNSIZqqrIQ182/bD8qGqgnr/SQKjgWrf3go6UtdVz
 Y0bYmCZdsSHIJy3VyPfMM+G4hoE=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3a65fb.7ff54b745b58-smtp-out-n01;
 Wed, 05 Feb 2020 06:51:39 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 39525C447A1; Wed,  5 Feb 2020 06:51:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: smasetty)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8AF06C43383;
        Wed,  5 Feb 2020 06:51:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 05 Feb 2020 12:21:38 +0530
From:   smasetty@codeaurora.org
To:     Doug Anderson <dianders@chromium.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: sc7180: Add A618 gpu dt blob
In-Reply-To: <CAD=FV=XJF4KworkHFLoNtxB7d+VyGqZSZkDUdie+09ur1g5thw@mail.gmail.com>
References: <1580472220-3453-1-git-send-email-smasetty@codeaurora.org>
 <1580472220-3453-2-git-send-email-smasetty@codeaurora.org>
 <CAD=FV=XJF4KworkHFLoNtxB7d+VyGqZSZkDUdie+09ur1g5thw@mail.gmail.com>
Message-ID: <1e29097cc1cdf18671379f6420f872b0@codeaurora.org>
X-Sender: smasetty@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-02-01 03:13, Doug Anderson wrote:
> Hi,
> 
> On Fri, Jan 31, 2020 at 4:04 AM Sharat Masetty 
> <smasetty@codeaurora.org> wrote:
>> 
>> +               adreno_smmu: iommu@5040000 {
>> +                       compatible = "qcom,sc7180-smmu-v2", 
>> "qcom,smmu-v2";
>> +                       reg = <0 0x05040000 0 0x10000>;
>> +                       #iommu-cells = <1>;
>> +                       #global-interrupts = <2>;
>> +                       interrupts = <GIC_SPI 229 
>> IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 231 
>> IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 364 
>> IRQ_TYPE_EDGE_RISING>,
>> +                                       <GIC_SPI 365 
>> IRQ_TYPE_EDGE_RISING>,
>> +                                       <GIC_SPI 366 
>> IRQ_TYPE_EDGE_RISING>,
>> +                                       <GIC_SPI 367 
>> IRQ_TYPE_EDGE_RISING>,
>> +                                       <GIC_SPI 368 
>> IRQ_TYPE_EDGE_RISING>,
>> +                                       <GIC_SPI 369 
>> IRQ_TYPE_EDGE_RISING>,
>> +                                       <GIC_SPI 370 
>> IRQ_TYPE_EDGE_RISING>,
>> +                                       <GIC_SPI 371 
>> IRQ_TYPE_EDGE_RISING>;
>> +                       clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>> +                               <&gcc GCC_GPU_CFG_AHB_CLK>,
>> +                               <&gcc GCC_DDRSS_GPU_AXI_CLK>;
>> +
>> +                       clock-names = "bus", "iface", "mem_iface_clk";
> 
> Repeated comment from v2 feedback:
> 
> Please send a patch to:
> 
> Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> 
> ...adding 'qcom,sc7180-smmu-v2'.  If you do this it will point out
> that you've added a new clock: "mem_iface_clk".  Is this truly a new
> clock in sc7180 compared to previous IOMMUs?  ...or is it not really
> needed?
I can confirm that this clock is needed for SC7180. I will send out a 
new patch
to update the documentation this week.
> 
> 
>> +               gmu: gmu@506a000 {
>> +                       compatible="qcom,adreno-gmu-618.0", 
>> "qcom,adreno-gmu";
>> +                       reg = <0 0x0506a000 0 0x31000>, <0 0x0b290000 
>> 0 0x10000>,
>> +                               <0 0x0b490000 0 0x10000>;
>> +                       reg-names = "gmu", "gmu_pdc", "gmu_pdc_seq";
>> +                       interrupts = <GIC_SPI 304 
>> IRQ_TYPE_LEVEL_HIGH>,
>> +                                  <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
>> +                       interrupt-names = "hfi", "gmu";
>> +                       clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
>> +                              <&gpucc GPU_CC_CXO_CLK>,
>> +                              <&gcc GCC_DDRSS_GPU_AXI_CLK>,
>> +                              <&gcc GCC_GPU_MEMNOC_GFX_CLK>;
>> +                       clock-names = "gmu", "cxo", "axi", "memnoc";
>> +                       power-domains = <&gpucc CX_GDSC>;
>> +                       power-domain-names = "cx";
> 
> As per continued comments on v2, please see if this works for you:
> 
>   power-domains = <&gpucc CX_GDSC>, <0>;
>   power-domain-names = "cx", "gx";
> 
> ...and work to get something more real for "gx" ASAP.  It did seem to
> boot for me and (unless someone disagrees) it seems better than
> totally leaving it out / violating the bindings?
> 
> 
> -Doug
