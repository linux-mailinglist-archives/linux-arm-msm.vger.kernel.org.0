Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FED01EFB72
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2020 16:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727945AbgFEObU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jun 2020 10:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728039AbgFEObT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jun 2020 10:31:19 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CCF5C08C5C4
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2020 07:31:19 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id d13so4902611ybk.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2020 07:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WOsCrCTNiZk4z+CHWASXWYuAh1VB0KhtNd4BIKGCzJI=;
        b=OUIw/jA7GurZ4+wdldpY/tDf9ZOqqgayumJTo2diTmo50FUSPj0nwWMdttY/TJtsXH
         j9lNXy4OmfX3l7Cg8vE3jEzfXyn+sHapl9ZpX1PoVf2sm5k/yzULPT/TX7D4sfTUpg8V
         p9tmddxnUfE3GuLyXTdTjrBY3VwIyLbtQdCg0MAYe82KdacOL1AApsNq4ahwOmtkVqc0
         CJrXkFYb6LPVrG80d7Oykp2kJj98tolgdAielogldvlmZevSsIIcpFe2TFtQzNLqGNf4
         F8dN2FZmwfaJjb3QNkedLVz6JNsR7Nudthi6q6gRu9ceYGHId2/8545yIK6Ygs7EtSXL
         C6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WOsCrCTNiZk4z+CHWASXWYuAh1VB0KhtNd4BIKGCzJI=;
        b=uj90YkpZmqn91onbaPC4tMjsiNgtO5a9VIwg2KDy3BsyU1ShkUMFRHtCi43IS/scSh
         ru0oHDx+PjkjC9u+b4zh4oaDPPNeUweVVSyYgV31VxAZmsDlJO48QEGaDYO4R2j0cvZ0
         V83Wmee9l5Y0G89P3HwweSVLiT7IGoTItNCqoC9LC7gsKCThAfwAZypd1suGHYwx/EDX
         j0WnnWgIdwmiysa5udS84KRJ/NUKMyldCdhkJgU3tPcjy1GKezkfpqKCgDzdSBr1eJfj
         CQX9K3kwWlyuzZDdDeWqv0BB0QJhgnG/Uj0aS/Y+QEQxAjTlTqMQxyb/ph/8pdP9bfFF
         9Cbg==
X-Gm-Message-State: AOAM5334ZsMbMtNa5JFjt+AfXAWT6VWdpsS9kWYHyxZMnJ1K4FKCMPlA
        sO4+Lp6BBoI6RzlTIO1zyC02SuCllC8NU9nKZ0yyXA==
X-Google-Smtp-Source: ABdhPJym9u6hVVH2jk8MmIvgD+zczkiUi9KmFGJ+AvzBdGI1kaQnqrM3IEsoTTd/O7hYVXqf/JR8tqSePI3hD4yEHXk=
X-Received: by 2002:a25:b442:: with SMTP id c2mr17737809ybg.273.1591367478104;
 Fri, 05 Jun 2020 07:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200524023815.21789-1-jonathan@marek.ca> <20200524023815.21789-2-jonathan@marek.ca>
 <20200529025246.GV279327@builder.lan> <d0908f34-a698-3449-35b9-7a98e9641295@marek.ca>
 <20200529031520.GA1799770@builder.lan> <91eb7ee0e549b10724c724aebfd91996@codeaurora.org>
 <8cf134f0-381f-7765-2496-e5abd77f3087@marek.ca> <e9800dbb6531c9b57a855f41f68753bd@codeaurora.org>
In-Reply-To: <e9800dbb6531c9b57a855f41f68753bd@codeaurora.org>
From:   Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date:   Fri, 5 Jun 2020 16:31:07 +0200
Message-ID: <CAP71WjwjZgD=msK_2W8eBBk6axZ_uMNurEm9F76u6aHscXPf9Q@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm8150: add apps_smmu node
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        devicetree-owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 5, 2020 at 4:14 PM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> On 2020-06-05 19:40, Jonathan Marek wrote:
> > On 6/5/20 10:03 AM, Sai Prakash Ranjan wrote:
> >> On 2020-05-29 08:45, Bjorn Andersson wrote:
> >>> On Thu 28 May 20:02 PDT 2020, Jonathan Marek wrote:
> >>>
> >>>>
> >>>>
> >>>> On 5/28/20 10:52 PM, Bjorn Andersson wrote:
> >>>> > On Sat 23 May 19:38 PDT 2020, Jonathan Marek wrote:
> >>>> >
> >>>> > > Add the apps_smmu node for sm8150. Note that adding the iommus field for
> >>>> > > UFS is required because initializing the iommu removes the bypass mapping
> >>>> > > that created by the bootloader.
> >>>> > >
> >>>> >
> >>>> > Unrelated to the patch itself; how do you disable the splash screen on
> >>>> > 8150? "fastboot oem select-display-panel none" doesn't seem to work for
> >>>> > me on the MTP - and hence this would prevent my device from booting.
> >>>> >
> >>>> > Thanks,
> >>>> > Bjorn
> >>>> >
> >>>>
> >>>> I don't have a MTP, but on HDK855, "fastboot oem
> >>>> select-display-panel none"
> >>>> combined with setting the physical switch to HDMI mode (which
> >>>> switches off
> >>>> the 1440x2560 panel) gets it to not setup the display at all (just
> >>>> the
> >>>> fastboot command isn't enough).
> >>>>
> >>>
> >>> Okay, I don't think we have anything equivalent on the MTP, but good
> >>> to
> >>> know.
> >>>
> >>
> >> Actually I tried out this in SM8150 MTP and it works fine for me,
> >>
> >> "fastboot set_active a; fastboot set_active b; fastboot set_active a;
> >> fastboot oem select-display-panel none; fastboot reboot bootloader;
> >> fastboot boot boot-sm8150.img"
> >>
> >> Also I need to switch slots everytime like above, otherwise I always
> >> see some error
> >> while loading the boot image.
> >>
> >
> > What is the error? If it is "FAILED (remote: Failed to
> > load/authenticate boot image: Load Error)" then flashing/erasing
> > boot_a will make it go away ("fastboot erase boot_a") for the next 6
> > or so "failed" boots.
> >
>
> Yes this exact error.

The bootloader maintains a 'boot status' in one of the partition
attributes. After a certain amount of 'failed' boot , it will switch
to the other boot partition. It's the same thing on RB3/DB845c. In our
release for DB845c, we are patching the bootloader so that this
behavior is bypassed. On typical 'product' there is a user space
application that will come and set the partition attribute to indicate
the boot was successful.

For the record, this is the patch we use on 845c:
https://git.linaro.org/landing-teams/working/qualcomm/abl.git/commit/?h=release/LE.UM.2.3.7-09200-sda845.0&id=e3dc60213234ed626161a568ba587ddac63c5158

rebuilding EDK2/ABL requires access to signing tools.. so it might not
be possible for everyone. but in case you can, it should be
straightforward to reuse this patch.

>
>
> -Sai
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> member
> of Code Aurora Forum, hosted by The Linux Foundation
