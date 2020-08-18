Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A0682488D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 17:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbgHRPMi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 11:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbgHRPMS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 11:12:18 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77B0FC061342
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2020 08:12:18 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id q13so10268036vsn.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2020 08:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9cwNj6jiS2head8n5mYo8172HJFHrdfK7H9omFC5dMU=;
        b=YtEnc+zszperrGv/O+6rOzDigV1yPXEvtKJCEFdkYBKuKUOzLWpWyORAFXSIO136Cd
         LGqJWm3kFy8SV4qZHA3MOK/0giLMlWI/7vEeqgRd78oUSDFH7HzesX3wzuHor18nRjQt
         d7fDbV6+J6FFu+lhXhhs5iDVRn0vJBanmJEvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9cwNj6jiS2head8n5mYo8172HJFHrdfK7H9omFC5dMU=;
        b=UPs0t6TMIHxc1zD8ijCekqxy3fyeBG8u/S7fJ8H18QQsd5iJDZy5O1raYdmhk7sByJ
         Fub0Q6F1Onjtydsu/ZaidKLnQRlG8ThPLILyXvJplcB1yXWAgmow28M0ttj2u+CPji1c
         ql5PkSf2vhNPggjIj00rTLQHXN9TVX0UPSdrxEF6mhxuJNTXQNgJMynq0Pq8lA7YGcUP
         yQLuW00XJHYkyFMXsMw4TwZjzOV4wkbuG4S44gCrJxBq3iAAaUSAVadXQNPPL+6cXCPB
         K06mz2jQntfG3QAuPbXUTpqYeLs3aGY7kVWC614Q8EIYFUakO3B9CSNhRjmc2M8PyoGG
         NGyA==
X-Gm-Message-State: AOAM532lGY2m9aXiTukgEMfHTHOMtgXy0MKbwMLHnXyYM5EiIfzzNg8O
        U4yurjrZdlQCXsHzGl7VU4mTUV0cncvvKA==
X-Google-Smtp-Source: ABdhPJxVx2E9NXwGTjFvYgculgHfbM43HI8L7ufGTSbEmfWC9CG0QGtjb5sLzZ92BhfG2sNW7QhvyQ==
X-Received: by 2002:a05:6102:311a:: with SMTP id e26mr12138703vsh.86.1597763536167;
        Tue, 18 Aug 2020 08:12:16 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id c193sm4129926vke.11.2020.08.18.08.12.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 08:12:15 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id j188so10296406vsd.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2020 08:12:15 -0700 (PDT)
X-Received: by 2002:a05:6102:213a:: with SMTP id f26mr11995699vsg.6.1597763534611;
 Tue, 18 Aug 2020 08:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200817144722.6665-1-saiprakash.ranjan@codeaurora.org>
 <CAD=FV=VE6vCPjDvvP0e73tnd8u5rPuMUa-mwvDazrfUpXP+bKQ@mail.gmail.com> <2a0c5fa189dbb2e810ba88f59621b65c@codeaurora.org>
In-Reply-To: <2a0c5fa189dbb2e810ba88f59621b65c@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 18 Aug 2020 08:12:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X8yS1gUNhhVNyfuRPzDUheG2Rco2g16KMegCG6fKJw7Q@mail.gmail.com>
Message-ID: <CAD=FV=X8yS1gUNhhVNyfuRPzDUheG2Rco2g16KMegCG6fKJw7Q@mail.gmail.com>
Subject: Re: [PATCHv2] soc: qcom: llcc: Support chipsets that can write to
 llcc registers
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "Isaac J. Manjarres" <isaacm@codeaurora.org>,
        linux-arm-msm-owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Aug 18, 2020 at 2:40 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi,
>
> On 2020-08-18 02:35, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Aug 17, 2020 at 7:47 AM Sai Prakash Ranjan
> > <saiprakash.ranjan@codeaurora.org> wrote:
> >>
> >> From: "Isaac J. Manjarres" <isaacm@codeaurora.org>
> >>
> >> Older chipsets may not be allowed to configure certain LLCC registers
> >> as that is handled by the secure side software. However, this is not
> >> the case for newer chipsets and they must configure these registers
> >> according to the contents of the SCT table, while keeping in mind that
> >> older targets may not have these capabilities. So add support to allow
> >> such configuration of registers to enable capacity based allocation
> >> and power collapse retention for capable chipsets.
> >
> > I have very little idea about what the above means.  That being said,
> > what's broken that this patch fixes?  Please include this in the CL
> > description.  It should answer, in the very least, the following two
> > questions:
> >
>
> As the commit message says about secure software configuring these LLCC
> registers,
> usually 2 things can happen in that case.
>
> 1) Accessing those registers in non secure world like Kernel would
> result in a
> fault which is trapped by secure side.
>
> 2) Access to those registers may be just ignored and there will be no
> faults.
>
> So for older chipsets, this is a fix to not allow them to access those
> registers.
> For newer chipsets, we follow the recommended settings from HW/SW arch
> teams.
> But... upstream llcc driver only supports SDM845 currently which is not
> required
> to configure those registers and as per my testing, no crash is observed
> on SDM845.
> So we won't need fixes tag.
>
> > a) Were existing attempts to do capacity based allocation failing, or
> > is capacity based allocation a new whizbang feature that a future
> > patch will add and you need this one to land first?
> >
>
> Capacity-based allocation and Way-based allocation are cache
> partitioning
> schemes/algorithms usually used in shared LLCs. Now which one to use or
> why
> one is preferred over the other are decided by HW/SW architecture teams
> and are
> recommended by them. So if the question is what is capacity based
> allocation and
> how it works, then I am afraid that I will not be able to explain that
> algorithm
> just like that.

I guess to start, it wasn't obvious (to me) that there were two
choices and we were picking one.  Mentioning that the other
alternative was way-based allocation would help a lot.  Even if you
can't fully explain the differences between the two, adding something
to the commit message indicating that this is a policy decision (in
other words, both work but each have their tradeoffs) would help.
Something like this, if it's correct:

In general we try to enable capacity based allocation (instead of the
default way based allocation) since that gives us better performance
with the current software / hardware configuration.


> > b) Why was it bad not to enable power collapse retention?  Was this
> > causing things to get corrupted after resume?  Was this causing us to
> > fail to suspend?  Were we burning too little power in S3 and the
> > battery vendors are looking for an excuse to sell bigger batteries?
> >
> > I'm not very smart and am also lacking documentation for what the heck
> > all this is, so I'm looking for the "why" of your patch.
> >
>
> That's a fair point. I will try to dig through to find some context for
> "question b"
> and check if there were any battery vendors involved in this decision ;)

Thanks!


> >> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
> >> (sai: use table instead of dt property and minor commit msg change)
> >> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> >> ---
> >>
> >> Changes in v2:
> >>  * Fix build errors reported by kernel test robot.
> >>
> >> ---
> >>  drivers/soc/qcom/llcc-qcom.c | 27 +++++++++++++++++++++++++++
> >>  1 file changed, 27 insertions(+)
> >>
> >> diff --git a/drivers/soc/qcom/llcc-qcom.c
> >> b/drivers/soc/qcom/llcc-qcom.c
> >> index 429b5a60a1ba..865f607cf502 100644
> >> --- a/drivers/soc/qcom/llcc-qcom.c
> >> +++ b/drivers/soc/qcom/llcc-qcom.c
> >> @@ -45,6 +45,9 @@
> >>  #define LLCC_TRP_ATTR0_CFGn(n)        (0x21000 + SZ_8 * n)
> >>  #define LLCC_TRP_ATTR1_CFGn(n)        (0x21004 + SZ_8 * n)
> >>
> >> +#define LLCC_TRP_SCID_DIS_CAP_ALLOC   0x21F00
> >> +#define LLCC_TRP_PCB_ACT              0x21F04
> >> +
> >>  #define BANK_OFFSET_STRIDE           0x80000
> >>
> >>  /**
> >> @@ -318,6 +321,11 @@ size_t llcc_get_slice_size(struct llcc_slice_desc
> >> *desc)
> >>  }
> >>  EXPORT_SYMBOL_GPL(llcc_get_slice_size);
> >>
> >> +static const struct of_device_id __maybe_unused
> >> qcom_llcc_configure_of_match[] = {
> >> +       { .compatible = "qcom,sc7180-llcc" },
> >> +       { }
> >> +};
> >
> > Why are you introducing a whole second table?  Shouldn't you just add
> > a field to "struct qcom_llcc_config" ?
> >
>
> This was my 2nd option, first one was to have this based on the version
> of LLCC
> which are exposed by hw info registers. But that didn't turn out good
> since I
> couldn't find any relation of this property with LLCC version.
>
> Second option was as you mentioned to have a field to qcom_llcc_config.
> Now this is good,
> but then I thought that if we add LLCC support for 20(random number)
> SoCs of which
> 10 is capable of supporting cap_based_alloc and rest 10 are not, then we
> will still be adding
> 20 more lines to each SoC's llcc_config if we follow this 2nd option.

If you do it right, you'd only need to add lines to the SoCs that need
it.  Linux conventions in general are that it's OK (and encouraged) to
rely on the fact that if you don't mention a variable in static
initialization it's initted to 0/False/NULL.  So if the member
variable is "need_llcc_config" then you only need to add this in
places where you're setting it to true.  It only needs to be a boolean
so if later someone really is worried about all the bytes that flags
like this are taking up we can use a bitfield.  For now (presumably)
just adding a boolean would be more efficient since (presumably) the
extra code needed to access a bitfield would be more than the extra
data bytes used.  In theory this could also be initdata probably, too.


> So why not opt for a 3rd option with the table where you just need to
> specify only the capable
> targets which is just 10 in our sample case above.

Are you trying to save space?  ...or complexity?  Sure a good compiler
will probably pool the constant string here so you won't need to
allocate it twice, but IMO having a second match table is more
complex.  You also need at least a pointer + bool per entry.  Each
probe will now need to parse through all these strings, too.  None of
this is a big deal, but I'd bet just adding a field to the existing
struct is lower overhead all around.


> Am I just overthinking this too much and should just go with the 2nd
> option as you mentioned?

Someone could feel free to vote against me, but I'd just add to the
existing config.


> >> +
> >>  static int qcom_llcc_cfg_program(struct platform_device *pdev)
> >>  {
> >>         int i;
> >> @@ -327,13 +335,17 @@ static int qcom_llcc_cfg_program(struct
> >> platform_device *pdev)
> >>         u32 attr0_val;
> >>         u32 max_cap_cacheline;
> >>         u32 sz;
> >> +       u32 disable_cap_alloc = 0, retain_pc = 0;
> >
> > Don't init to 0.  See below.
> >
> >
> >>         int ret = 0;
> >>         const struct llcc_slice_config *llcc_table;
> >>         struct llcc_slice_desc desc;
> >> +       const struct of_device_id *llcc_configure;
> >>
> >>         sz = drv_data->cfg_size;
> >>         llcc_table = drv_data->cfg;
> >>
> >> +       llcc_configure = of_match_node(qcom_llcc_configure_of_match,
> >> pdev->dev.of_node);
> >> +
> >
> > As per above, just use the existing config.
> >
>
> See above explanation.
>
> >
> >>         for (i = 0; i < sz; i++) {
> >>                 attr1_cfg =
> >> LLCC_TRP_ATTR1_CFGn(llcc_table[i].slice_id);
> >>                 attr0_cfg =
> >> LLCC_TRP_ATTR0_CFGn(llcc_table[i].slice_id);
> >> @@ -369,6 +381,21 @@ static int qcom_llcc_cfg_program(struct
> >> platform_device *pdev)
> >>                                         attr0_val);
> >>                 if (ret)
> >>                         return ret;
> >> +
> >> +               if (llcc_configure) {
> >> +                       disable_cap_alloc |=
> >> llcc_table[i].dis_cap_alloc << llcc_table[i].slice_id;
> >
> > Don't "|=".  You're the only place touching this variable.  Just set
> > it.
> >
>
> Ack, will change.
>
> >
> >> +                       ret = regmap_write(drv_data->bcast_regmap,
> >> +
> >> LLCC_TRP_SCID_DIS_CAP_ALLOC, disable_cap_alloc);
> >> +                       if (ret)
> >> +                               return ret;
> >> +
> >> +                       retain_pc |= llcc_table[i].retain_on_pc <<
> >> llcc_table[i].slice_id;
> >
> > Don't "|=".  You're the only place touching this variable.  Just set
> > it.
> >
>
> Ack, will change.
>
> Thanks,
> Sai
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> member
> of Code Aurora Forum, hosted by The Linux Foundation
