Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FBAF54438F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jun 2022 08:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238073AbiFIGId (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jun 2022 02:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231339AbiFIGIc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jun 2022 02:08:32 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB17238BF6
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 23:08:30 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id k6so14037499qkf.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 23:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z2xt3WJKBL/x9uEbroq74mEchD6FMdHN6qruzqVjqgc=;
        b=CE8C+HGi9FuiOQ1PghCsyGCNddUmCBzpOs74F7Kethtp3t1SN1bVkeEiAGhG9eQ+XY
         bkIxy7yEgqbubmeHef/srcWSjdVWIzlZjv3sVYqnm9WzsF4xCoWb1d0k6c+T8dv1427E
         70qUA+CxT6WQOGkVSnCfrFVevauW/wa6Wp3JkRgYgNuaeJ6WvJGzoHb8eQm8SosLBD/D
         uIfatkLP21YoaDsAKTIXG/0c5YnNbSVSVE6WZ2+EOij/hsexjKHDr5jGStkmSnEjtjBP
         O81KAEDEYrnGSSvCZ+IfVvQQCtVtpUXr2m/w/w6xfwu4QFBvHBlXxZzYfhiusdrJXsn9
         rJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z2xt3WJKBL/x9uEbroq74mEchD6FMdHN6qruzqVjqgc=;
        b=CLh2bP9mFzkNVVDuBmLI8vj8vSDIvG1SkqbL6MJdb1bxBkHg+w1krrjL4/vwtghscF
         yp2/9AY2AImbwLCq/cHa17i+M1nbajx3T/p/9FWmFIoYtazoEvE8qJ/kFrEPSODkypcA
         DUkrRFjqAGbak6ZoR7TAjcN34HvYXlbaFJA1JgdoX+ErI5uuD5IFIS0kk5L/zOXhh8qY
         pvcYG1CTsYEoziRORXN3u7783981O1ycxZjKIH5ioapBwESNp85elfuvqxKLN19bVcEd
         MEvBcnVnB0/EQWeIgXZZHoqjHFEWROuwaBISX5+9NnzIii8OZtoNWCRXoKmAUJIHgyyS
         RoMA==
X-Gm-Message-State: AOAM533xoRSg2cBsW8UC0qInSh0b/8RhiVORrp8+VRJc2wDNRwwmpset
        WZo8MOzaRFp9FcZcG/Uftm8ojnvnwv6ZizpPCdvybA==
X-Google-Smtp-Source: ABdhPJw4oEFMOLBxoPiUQ5+EHvp6TLbM8MgYZrpketWFy7+lWRy5C9SYPC1MplNUKtbdRYWoMMTasuBmFMe4POgoOdM=
X-Received: by 2002:a05:620a:4311:b0:67e:8a0f:4cd5 with SMTP id
 u17-20020a05620a431100b0067e8a0f4cd5mr26059708qko.363.1654754909722; Wed, 08
 Jun 2022 23:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220531121825.1126204-1-dmitry.baryshkov@linaro.org>
 <d7084452-ea90-3a8b-d39a-b09d9f45f839@quicinc.com> <CAA8EJprW7xnYJaeqh4vozSTx04DcQ20MMRrzLaEJPJTC3dV30w@mail.gmail.com>
 <80c1da0f-0006-6602-ec86-ebdf71c3037a@quicinc.com> <CAA8EJppfWfP-bZLOYF8QBe6kW6gBBw5eXpzzDA6GFo8U7g=jRQ@mail.gmail.com>
 <963f5ef5-4b1d-6b0d-5b6d-0d6136e9e8d3@quicinc.com> <CAA8EJppCiN65NV7w9TyR=P+XzGPVxZJoAZoX5+XjxKwXsL_FQg@mail.gmail.com>
 <e56780cb-44c1-b26b-90b8-ceb40b8f218b@quicinc.com> <CAA8EJprCHW61_0zd+GqOZgpx1C-CDv6iuJZU60cc-1M2YZZhpw@mail.gmail.com>
 <cb9bf456-2c50-2c59-1738-c72c920330d7@quicinc.com> <2d61784b-fe0c-f572-dc75-2ccd38ff0f6a@linaro.org>
 <08d454e6-5728-63e3-8b67-44158e84b775@quicinc.com> <af4a03c1-70f5-79da-8c6f-932e213415b1@linaro.org>
 <282f0fc4-34de-4549-723b-f5ce8075fcfd@quicinc.com>
In-Reply-To: <282f0fc4-34de-4549-723b-f5ce8075fcfd@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 9 Jun 2022 09:08:18 +0300
Message-ID: <CAA8EJpqVdv8BMGMiQ4=vJ23qSpvzMsLA_yug3z9owKsYQX0xSg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: less magic numbers in msm_mdss_enable
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 9 Jun 2022 at 02:37, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/8/2022 3:46 PM, Dmitry Baryshkov wrote:
> > On 09/06/2022 01:42, Abhinav Kumar wrote:
> >>
> >>
> >> On 6/8/2022 3:38 PM, Dmitry Baryshkov wrote:
> >>> On 09/06/2022 01:35, Abhinav Kumar wrote:
> >>>>
> >>>>
> >>>> On 6/8/2022 3:30 PM, Dmitry Baryshkov wrote:
> >>>>> On Wed, 8 Jun 2022 at 22:29, Abhinav Kumar
> >>>>> <quic_abhinavk@quicinc.com> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> On 6/2/2022 1:13 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Thu, 2 Jun 2022 at 21:18, Abhinav Kumar
> >>>>>>> <quic_abhinavk@quicinc.com> wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 6/1/2022 1:04 PM, Dmitry Baryshkov wrote:
> >>>>>>>>> On Wed, 1 Jun 2022 at 20:38, Abhinav Kumar
> >>>>>>>>> <quic_abhinavk@quicinc.com> wrote:
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> On 6/1/2022 2:46 AM, Dmitry Baryshkov wrote:
> >>>>>>>>>>> On Wed, 1 Jun 2022 at 01:01, Abhinav Kumar
> >>>>>>>>>>> <quic_abhinavk@quicinc.com> wrote:
> >>>>>>>>>>>> On 5/31/2022 5:18 AM, Dmitry Baryshkov wrote:
> >>>>>>>>>>>>> Replace magic register writes in msm_mdss_enable() with
> >>>>>>>>>>>>> version that
> >>>>>>>>>>>>> contains less magic and more variable names that can be
> >>>>>>>>>>>>> traced back to
> >>>>>>>>>>>>> the dpu_hw_catalog or the downstream dtsi files.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>>>>>>>>>> ---
> >>>>>>>>>>>>>       drivers/gpu/drm/msm/msm_mdss.c | 79
> >>>>>>>>>>>>> ++++++++++++++++++++++++++++++----
> >>>>>>>>>>>>>       1 file changed, 71 insertions(+), 8 deletions(-)
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c
> >>>>>>>>>>>>> b/drivers/gpu/drm/msm/msm_mdss.c
> >>>>>>>>>>>>> index 0454a571adf7..2a48263cd1b5 100644
> >>>>>>>>>>>>> --- a/drivers/gpu/drm/msm/msm_mdss.c
> >>>>>>>>>>>>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> >>>>>>>>>>>>> @@ -21,6 +21,7 @@
> >>>>>>>>>>>>>       #define HW_REV                              0x0
> >>>>>>>>>>>>>       #define HW_INTR_STATUS                      0x0010
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> +#define UBWC_DEC_HW_VERSION          0x58
> >>>>>>>>>>>>>       #define UBWC_STATIC                 0x144
> >>>>>>>>>>>>>       #define UBWC_CTRL_2                 0x150
> >>>>>>>>>>>>>       #define UBWC_PREDICTION_MODE                0x154
> >>>>>>>>>>>>> @@ -132,9 +133,63 @@ static int
> >>>>>>>>>>>>> _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
> >>>>>>>>>>>>>           return 0;
> >>>>>>>>>>>>>       }
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> +#define UBWC_1_0 0x10000000
> >>>>>>>>>>>>> +#define UBWC_2_0 0x20000000
> >>>>>>>>>>>>> +#define UBWC_3_0 0x30000000
> >>>>>>>>>>>>> +#define UBWC_4_0 0x40000000
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>> +static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss
> >>>>>>>>>>>>> *msm_mdss,
> >>>>>>>>>>>>> +                                    u32 ubwc_static)
> >>>>>>>>>>>>> +{
> >>>>>>>>>>>>> +     writel_relaxed(ubwc_static, msm_mdss->mmio +
> >>>>>>>>>>>>> UBWC_STATIC);
> >>>>>>>>>>>>> +}
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>> +static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss
> >>>>>>>>>>>>> *msm_mdss,
> >>>>>>>>>>>>> +                                    unsigned int
> >>>>>>>>>>>>> ubwc_version,
> >>>>>>>>>>>>> +                                    u32 ubwc_swizzle,
> >>>>>>>>>>>>> +                                    u32 highest_bank_bit,
> >>>>>>>>>>>>> +                                    u32 macrotile_mode)
> >>>>>>>>>>>>> +{
> >>>>>>>>>>>>> +     u32 value = (ubwc_swizzle & 0x1) |
> >>>>>>>>>>>>> +                 (highest_bank_bit & 0x3) << 4 |
> >>>>>>>>>>>>> +                 (macrotile_mode & 0x1) << 12;
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>> +     if (ubwc_version == UBWC_3_0)
> >>>>>>>>>>>>> +             value |= BIT(10);
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>> +     if (ubwc_version == UBWC_1_0)
> >>>>>>>>>>>>> +             value |= BIT(8);
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>> +     writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
> >>>>>>>>>>>>> +}
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>> +static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss
> >>>>>>>>>>>>> *msm_mdss,
> >>>>>>>>>>>>> +                                    unsigned int
> >>>>>>>>>>>>> ubwc_version,
> >>>>>>>>>>>>> +                                    u32 ubwc_swizzle,
> >>>>>>>>>>>>> +                                    u32 ubwc_static,
> >>>>>>>>>>>>> +                                    u32 highest_bank_bit,
> >>>>>>>>>>>>> +                                    u32 macrotile_mode)
> >>>>>>>>>>>>> +{
> >>>>>>>>>>>>> +     u32 value = (ubwc_swizzle & 0x7) |
> >>>>>>>>>>>>> +                 (ubwc_static & 0x1) << 3 |
> >>>>>>>>>>>>> +                 (highest_bank_bit & 0x7) << 4 |
> >>>>>>>>>>>>> +                 (macrotile_mode & 0x1) << 12;
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>> +     writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>> +     if (ubwc_version == UBWC_3_0) {
> >>>>>>>>>>>>> +             writel_relaxed(1, msm_mdss->mmio + UBWC_CTRL_2);
> >>>>>>>>>>>>> +             writel_relaxed(0, msm_mdss->mmio +
> >>>>>>>>>>>>> UBWC_PREDICTION_MODE);
> >>>>>>>>>>>>> +     } else {
> >>>>>>>>>>>>> +             writel_relaxed(2, msm_mdss->mmio + UBWC_CTRL_2);
> >>>>>>>>>>>>> +             writel_relaxed(1, msm_mdss->mmio +
> >>>>>>>>>>>>> UBWC_PREDICTION_MODE);
> >>>>>>>>>>>>> +     }
> >>>>>>>>>>>>> +}
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>
> >>>>>>>>>>>> Is it possible to unify the above functions by having the
> >>>>>>>>>>>> internal
> >>>>>>>>>>>> ubwc_version checks?
> >>>>>>>>>>>
> >>>>>>>>>>> Note, it's not the ubwc_version, it is the
> >>>>>>>>>>> ubwc_dec_hw_version. And
> >>>>>>>>>>> also different functions take different sets of arguments.
> >>>>>>>>>>>
> >>>>>>>>>>>> It seems like msm_mdss_setup_ubwc_dec_xxx can keep growing.
> >>>>>>>>>>>>
> >>>>>>>>>>>> I have not looked into each bit programming but from the top
> >>>>>>>>>>>> level so
> >>>>>>>>>>>> feel free to correct if wrong but it seems both do write
> >>>>>>>>>>>> UBWC_STATIC
> >>>>>>>>>>>> (different values based on different UBWC versions) and
> >>>>>>>>>>>> write some extra
> >>>>>>>>>>>> registers based on version
> >>>>>>>>>>>
> >>>>>>>>>>> This is what both the current code and the downstream do. See
> >>>>>>>>>>> https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/zeus-s-oss/techpack/display-drivers/msm/sde/sde_hw_top.c#L312
> >>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> Thanks for pointing to the downstream method for this,
> >>>>>>>>>>
> >>>>>>>>>> This is exactly what i was also suggesting to do when I mentioned
> >>>>>>>>>> unifying the above functions.
> >>>>>>>>>>
> >>>>>>>>>> So instead of having a separate function for each version why
> >>>>>>>>>> not handle
> >>>>>>>>>> all the versions in the same function like what the link you
> >>>>>>>>>> have shown
> >>>>>>>>>> does.
> >>>>>>>>>
> >>>>>>>>> I wouldn't like that. The downstream uses hw_catalog to pass all
> >>>>>>>>> possible parameters. We do not, so we'd have a whole set of
> >>>>>>>>> artificial
> >>>>>>>>> values.
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> Now that you brought that up, why cannot even upstream dpu start
> >>>>>>>> using
> >>>>>>>> catalog for ubwc settings?
> >>>>>>>
> >>>>>>> Because msm_mdss lives out of disp/dpu1. And using the disp/dpu1 for
> >>>>>>> it would be an inversion of dependencies.
> >>>>>>> I like the fact that msm_mdss is independent of mdp/dpu drivers
> >>>>>>> and I
> >>>>>>> do not want to add such dependency.
> >>>>>>>
> >>>>>>
> >>>>>> Ok, so I think this function itself is placed incorrectly. It
> >>>>>> should not
> >>>>>> be in msm_mdss.c and should in the DPU folder.
> >>>>>>
> >>>>>> This check tells me that this will not be executed for mdp5 devices.
> >>>>>>
> >>>>>>      /*
> >>>>>>        * HW_REV requires MDSS_MDP_CLK, which is not enabled by the
> >>>>>> mdss on
> >>>>>>        * mdp5 hardware. Skip reading it for now.
> >>>>>>        */
> >>>>>>       if (msm_mdss->is_mdp5)
> >>>>>>           return 0;
> >>>>>
> >>>>> This condition should be changed to check for the MDP_CLK being
> >>>>> available in the clocks array rather than checking for is_mdp5. I'd
> >>>>> like to phase is_mdp5 away at some point.
> >>>>>
> >>>>>> In that case, what prevents us from moving this to dpu and start
> >>>>>> using
> >>>>>> catalog for this?
> >>>>>
> >>>>> Because there is nothing tying mdss and dpu drivers. For example, is
> >>>>> the msm8998 (3.0.0) the DPU or MDP5 device? MSM8996?
> >>>>> Neither struct msm_mdss nor the MDSS device itself are accessible
> >>>>> through the msm_drv (or dpu_kms).
> >>>>> I think trying to invent such a link would make the code worse.
> >>>>>
> >>>>
> >>>> Right, what I am trying to mention with that check is that means
> >>>> that code does not run today for mdp5 and it still works fine.
> >>>>
> >>>> So why not just move it to DPU first to carry less burden of these
> >>>> extra register settings which are unused today for mdp5 anyway.
> >>>
> >>> As I mentioned, there is no good way. msm_mdss doesn't know about
> >>> DPU. DPU doesn't know about the msm_mdss. Even the msm_drv doesn't
> >>> know about the msm_mdss.
> >>>
> >>> If you can sketch a nice piece of code, could you please demonstrate
> >>> your idea?
> >>>
> >>
> >> No, so I am not suggesting to do it in msm_mdss. Only then you will
> >> need msm_mdss to have knowledge of whether its DPU or MDP5.
> >>
> >> Correct me if wrong. msm_mdss is common to both MDP5 and DPU.
> >>
> >>  From the above check its clear that this code does not run for MDP5.
> >>
> >> So I am suggesting move this code completely to dpu_runtime_resume().
> >>
> >> That way you can use catalog there.
> >>
> >> I am questioning why we even need this function to be in msm_mdss. It
> >> can just belong in DPU as its not being used by MDP5 today.
> >
> > The region used by the mdss is not mapped by the DPU (or MDP5). This
> > caused some confusion with DPU code trying to write to the non-mapped or
> > incorrect memory areas before we ended up with Jonathan fixing the code
> > in 544d8b96150d ("drm/msm/dpu: update UBWC config for sm8150 and sm8250").
> >
>
> Thanks so much for the providing this change , it gave me some more context.
>
> I briefly went through this change.
>
> So what happened was dpu_kms->mmio is different from dpu_mdss->mmio in
> terms of offset.
>
> dpu_mdss->mmio is the one which starts from 0 and thats the one we
> should use for the UBWC config.
>
> So even after Jonathan's change we were doing this in dpu_mdss.c
>
> After we removed the dpu_mdss.c layer to start using msm_mdss.c, now
> this function looks somewhat misplaced to me because it was in dpu.
>
> One suggestion I have is, let dpu_kms.c map this region "mdss" by
> getting it from its parent using of_get_parent() and store it as
> "mdss_mmio". Then move this back to dpu_runtime_resume().
>
> Then rework that function to remove these magic numbers and start using
> catalog.
>
> Let me know what you think. Thats the best i can come up with in the
> current design.

I feel this is an overkill for setting just three registers. MDSS
register space is not used for anything else than handling generic
interrupts and setting the UBWC. I'd leave things as is and just
replace cryptic register writes with manageable API.

-- 
With best wishes
Dmitry
