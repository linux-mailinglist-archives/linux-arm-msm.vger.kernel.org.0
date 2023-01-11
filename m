Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3860766661F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 23:22:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbjAKWWG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 17:22:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235938AbjAKWWE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 17:22:04 -0500
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C87CC43E44
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 14:22:02 -0800 (PST)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 4933B3F311;
        Wed, 11 Jan 2023 23:22:00 +0100 (CET)
Date:   Wed, 11 Jan 2023 23:21:59 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [RFC PATCH 1/4] drm/msm/mdss: convert UBWC setup to use match
 data
Message-ID: <20230111222159.rqsrtdfuop3tpllq@SoMainline.org>
References: <20221208000850.312548-1-dmitry.baryshkov@linaro.org>
 <20221208000850.312548-2-dmitry.baryshkov@linaro.org>
 <047cd859-7141-d52f-4989-847fd2ada002@quicinc.com>
 <b66de0ab-a31b-c86a-c1d0-c9a5f98c4f85@linaro.org>
 <5aa47cf1-0589-4830-c1fb-22e15bac974a@quicinc.com>
 <20230111084458.wcwzipew3ny7fpno@SoMainline.org>
 <e1c49c07-8ae2-f82f-97e0-4bb03c5f5af6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1c49c07-8ae2-f82f-97e0-4bb03c5f5af6@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-01-11 17:11:03, Dmitry Baryshkov wrote:
> On 11/01/2023 10:44, Marijn Suijten wrote:
> > On 2023-01-09 12:32:18, Abhinav Kumar wrote:
> > <snip>
> >>>> On 12/7/2022 4:08 PM, Dmitry Baryshkov wrote:
> > <snip>
> >>>>> +struct msm_mdss_data {
> >>>>> +    u32 ubwc_version;
> >>>>> +    u32 ubwc_swizzle;
> >>>>> +    u32 ubwc_static;
> >>>>> +    u32 highest_bank_bit;
> >>>>> +    u32 macrotile_mode;
> >>>>> +};
> > 
> > This magic struct could really use some documentation, otherwise users
> > will have no idea what fields to set (or omit) nor what values to use.
> > For example decoder 2.0 seems to only use ubwc_static as a sort of magic
> > "we don't know what the bits in UBWC_STATIC mean", whereas decoder 3.0
> > reconstructs this field entirely from the other parameters.  Decoder 4.0
> > however does the same, but _also_ embeds this uwbc_static magic value
> > back into the register value....?
> 
> On the bright side these magic values correspond 1:1 to the vendor dtsi 
> and to the part of DPU hw catalog. It would be nice to know the bit used 
> by decoder 2.0, but I fear that we'd have to resort to wild guesses 
> unless Qualcomm decides to disclose that information.

If downstream has these fields verbatim that makes it easier to
copy-paste, agreed.

> As for dec 4.0 and ubwc_static. I fear that it's just somebody (writing 
> downstream DT parsing) reused the ubwc-static name for the bitfield 
> which in reality has some sensible name.

Yes, ugh.

> > Also read on below about checking "compatibility" between this struct
> > and the decoder version, and why I feel this struct (versus mandatory
> > function arguments) makes this struct less robust.
> > 
> >>>>>    struct msm_mdss {
> >>>>>        struct device *dev;
> >>>>> @@ -40,6 +48,7 @@ struct msm_mdss {
> >>>>>            unsigned long enabled_mask;
> >>>>>            struct irq_domain *domain;
> >>>>>        } irq_controller;
> >>>>> +    const struct msm_mdss_data *mdss_data;
> >>>>>        struct icc_path *path[2];
> >>>>>        u32 num_paths;
> >>>>>    };
> >>>>> @@ -180,46 +189,40 @@ static int _msm_mdss_irq_domain_add(struct
> >>>>> msm_mdss *msm_mdss)
> >>>>>    #define UBWC_3_0 0x30000000
> >>>>>    #define UBWC_4_0 0x40000000
> >>>>> -static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss,
> >>>>> -                       u32 ubwc_static)
> >>>>> +static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
> >>>>>    {
> >>>>> -    writel_relaxed(ubwc_static, msm_mdss->mmio + UBWC_STATIC);
> >>>>> +    const struct msm_mdss_data *data = msm_mdss->mdss_data;
> >>>>> +
> >>>>> +    writel_relaxed(data->ubwc_static, msm_mdss->mmio + UBWC_STATIC);
> >>>>>    }
> >>>>> -static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss,
> >>>>> -                       unsigned int ubwc_version,
> >>>>> -                       u32 ubwc_swizzle,
> >>>>> -                       u32 highest_bank_bit,
> >>>>> -                       u32 macrotile_mode)
> >>>>> +static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
> >>>>>    {
> >>>>> -    u32 value = (ubwc_swizzle & 0x1) |
> >>>>> -            (highest_bank_bit & 0x3) << 4 |
> >>>>> -            (macrotile_mode & 0x1) << 12;
> >>>>> +    const struct msm_mdss_data *data = msm_mdss->mdss_data;
> >>>>> +    u32 value = (data->ubwc_swizzle & 0x1) |
> >>>>> +            (data->highest_bank_bit & 0x3) << 4 |
> >>>>> +            (data->macrotile_mode & 0x1) << 12;
> >>>>> -    if (ubwc_version == UBWC_3_0)
> >>>>> +    if (data->ubwc_version == UBWC_3_0)
> >>>>>            value |= BIT(10);
> >>>>> -    if (ubwc_version == UBWC_1_0)
> >>>>> +    if (data->ubwc_version == UBWC_1_0)
> >>>>>            value |= BIT(8);
> >>>>>        writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
> >>>>>    }
> >>>>> -static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss,
> >>>>> -                       unsigned int ubwc_version,
> >>>>> -                       u32 ubwc_swizzle,
> >>>>> -                       u32 ubwc_static,
> >>>>> -                       u32 highest_bank_bit,
> >>>>> -                       u32 macrotile_mode)
> >>>>> +static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
> >>>>>    {
> >>>>> -    u32 value = (ubwc_swizzle & 0x7) |
> >>>>> -            (ubwc_static & 0x1) << 3 |
> >>>>> -            (highest_bank_bit & 0x7) << 4 |
> >>>>> -            (macrotile_mode & 0x1) << 12;
> >>>>> +    const struct msm_mdss_data *data = msm_mdss->mdss_data;
> >>>>> +    u32 value = (data->ubwc_swizzle & 0x7) |
> >>>>> +            (data->ubwc_static & 0x1) << 3 |
> >>>>> +            (data->highest_bank_bit & 0x7) << 4 |
> >>>>> +            (data->macrotile_mode & 0x1) << 12;
> >>>>>        writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
> >>>>> -    if (ubwc_version == UBWC_3_0) {
> >>>>> +    if (data->ubwc_version == UBWC_3_0) {
> >>>>>            writel_relaxed(1, msm_mdss->mmio + UBWC_CTRL_2);
> >>>>>            writel_relaxed(0, msm_mdss->mmio + UBWC_PREDICTION_MODE);
> >>>>>        } else {
> >>>>> @@ -232,6 +235,7 @@ static int msm_mdss_enable(struct msm_mdss
> >>>>> *msm_mdss)
> >>>>>    {
> >>>>>        int ret;
> >>>>>        u32 hw_rev;
> >>>>> +    u32 ubwc_dec_hw_version;
> >>>>>        /*
> >>>>>         * Several components have AXI clocks that can only be turned
> >>>>> on if
> >>>>> @@ -250,53 +254,36 @@ static int msm_mdss_enable(struct msm_mdss
> >>>>> *msm_mdss)
> >>>>>         * HW_REV requires MDSS_MDP_CLK, which is not enabled by the
> >>>>> mdss on
> >>>>>         * mdp5 hardware. Skip reading it for now.
> >>>>>         */
> >>>>> -    if (msm_mdss->is_mdp5)
> >>>>> +    if (msm_mdss->is_mdp5 || !msm_mdss->mdss_data)
> >>>>>            return 0;
> >>>>>        hw_rev = readl_relaxed(msm_mdss->mmio + HW_REV);
> >>
> >> hw_rev is not used anymore now so why not just drop that reg read
> >> altogether.
> >>
> >>>>>        dev_dbg(msm_mdss->dev, "HW_REV: 0x%x\n", hw_rev);
> >>>>> +
> >>>>> +    ubwc_dec_hw_version = readl_relaxed(msm_mdss->mmio +
> >>>>> UBWC_DEC_HW_VERSION);
> >>
> >> If we are going to tie UBWC version to the HW compatible match, then
> >> even this register read can be skipped and instead you can add
> >> ubwc_dec_hw_version to your match data struct and skip this read as well.
> > 
> > I have suggested in IRC to keep this register read, and utilize it to at
> > least sanity check the configuration.  You are right that the DPU HW
> > version already describes what UWBC decoder version is used, but we're
> > are already questioning whether it was ported correctly for SM6115.  A
> > WARN() that catches a mismatch between what was written in the "catalog"
> > (or this match table) versus what the hardware reports would have gone a
> > long way.
> 
> Well... Sanity checking here means we do not trust the kernel. And whom 
> we can trust then?

I have no reason to trust the kernel here.  Knowing the read-back value
might even be necessary to decipher the "downstream" kernel, since it
doesn't specify the decoder /hardware/ version but only the data format?

> Note, that for 6115 I had a question regarding the 
> ubwc_version stated in the comment, not in the code. I asked for 
> UBWC_DEC_HW_VERSION value just to be sure.

Right, that is some weird paraphrasing.  Is it the UBWC_2_0 data format
(because there's nothing in dec_20 performing a conditional based on
this) and only coincidentally being the same as the HW decoder version?

> > This is especially relevant with the new struct where fields are
> > (un)used depending on the UBWC HW decoder version, making for an extra
> > exercise to the developer to double-check whether their struct values
> > are taken into account or not (or if used ones are accidentally
> > omitted).
> 
> Granted the overlay between DPU catalog and MDSS device data maybe we 
> should make DPU ask MDSS for the ubwc settings.

Is DPU also holding on to these values?  I was more so referring to the
fact that the HW_DEC version determines what specific fields are read
and what are not, which may not be immediately obvious when adding a
struct instance unless reading the code.

- Marijn
