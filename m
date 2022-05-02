Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1700516BA1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 10:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234054AbiEBIGU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 04:06:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359016AbiEBIGT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 04:06:19 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF57534B9F
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 01:02:50 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-2f7d7e3b5bfso139611257b3.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 01:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kNgrc/VKR7lFM4tEidPV/eyB0oBiyvx07OI/aA9mkMw=;
        b=BNZKbI7vegP9f+sEQUwSakGY9nNSsydVRRq3ICUhttL+PP95SHE69AT16CxMDwYufP
         JCdTwmXwjbjd1eceHlSgWcj1pGaKeinO66JIOV6PoqB6wk8MCBuOUBupHr8Q1+TKAY0H
         1iWf4mC+Kw/mkynajBSr3767fV5G1HQaRKx63oX+UWz/VBdNowUd0wYH6rXydOR9wBxn
         MtBa5wpPc78Z8UcsrkcbkBNTSPVtuBj60cDUbH/7BRAdK3a/SHzXh83EMGGMPdqu3Ch/
         QQ0QihImwOevG/lBO4D7Zq/cMuHtOXtbf2M5wxwaZ6+MWqtiL7Qy5FsjVfZvzA6EHPky
         h1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kNgrc/VKR7lFM4tEidPV/eyB0oBiyvx07OI/aA9mkMw=;
        b=5hJyT5XwqZgD5UlwiNX1CAN//RX75bagzYLjYgV7Hb9qzzduK9Khp86LkNBN5Bav1e
         UgjnRv0/3ljiiRfnIQ9IwjkTNEQ/cJia1UbJDIsIkN8jzsw/3En3DSuP7cuISD240XTZ
         urd9OycbKxb6i/RbhwSzheikiktVn1cYhWc9YunJf3EQ4bDqTk6kGKqzAP0nX3/+EvTb
         TsU10brtjfoRbsxP2e8mgLmcQAfs26zR6ufxINQRRT5KPO/YhHDCCX40ehSbEUQdkLkw
         Ne16QbVNroiXOtPOo5dA5i3nKIeM3AoaD7TlUxB5Q4emr+z03GPzw5UhKBIzkdvyCIn7
         5ZEw==
X-Gm-Message-State: AOAM531zXGoPSfZsdU0lXFOApIxN27JO0O3olulz1YhHNljZ79v5lgmk
        pkX+td5P6Vkc5gqvwU13FNw0/DbEfWlYL8/3I7zZ3A==
X-Google-Smtp-Source: ABdhPJw05mScvDsGdfNP9v1I4CajFpxeIsq0RKFnzjXgJ1hZ2N/oi1FD8xi2zm1InjRr5MlgkboRnEKoBO6iVhJXDDs=
X-Received: by 2002:a81:4ed0:0:b0:2f7:cec6:e5f2 with SMTP id
 c199-20020a814ed0000000b002f7cec6e5f2mr10940362ywb.490.1651478570081; Mon, 02
 May 2022 01:02:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220430175533.3817792-1-dmitry.baryshkov@linaro.org>
 <20220430185807.yn2j2coyc77qzx2o@SoMainline.org> <b4a3bfed-a842-b4ee-d9a5-5adf5b59c09b@quicinc.com>
 <20220501200635.ekl3fw47dv2zytt3@SoMainline.org> <d6a78564-745c-7301-1b57-efc35757fbfd@quicinc.com>
In-Reply-To: <d6a78564-745c-7301-1b57-efc35757fbfd@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 2 May 2022 11:02:38 +0300
Message-ID: <CAA8EJpoU+TDTeoDcgYUGqc=a7O_9O3BAsmP6yejXfyz6sKxENA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dsi: use RMW cycles in dsi_update_dsc_timing
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 2 May 2022 at 02:56, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/1/2022 1:06 PM, Marijn Suijten wrote:
> > On 2022-04-30 12:25:57, Abhinav Kumar wrote:
> >>
> >>
> >> On 4/30/2022 11:58 AM, Marijn Suijten wrote:
> >>> On 2022-04-30 20:55:33, Dmitry Baryshkov wrote:
> >>>> The downstream uses read-modify-write for updating command mode
> >>>> compression registers. Let's follow this approach. This also fixes the
> >>>> following warning:
> >>>>
> >>>> drivers/gpu/drm/msm/dsi/dsi_host.c:918:23: warning: variable 'reg_ctrl' set but not used [-Wunused-but-set-variable]
> >>>>
> >>>> Reported-by: kernel test robot <lkp@intel.com>
> >>>> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> >>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>
> >>> I pointed this out in review multiple times, so you'll obviously get my:
> >>>
> >>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> >>>
> >>> (But are you sure there's nothing else to clear in the 1st CTRL
> >>> register, only the lowest 16 bits?  That should mean `reg` never
> >>> contains anything in 0xffff0000)
> >>
> >> The top 16 bits contain information for stream 1.
> >>
> >> Stream 1 is unused. And whatever is the reset value we should retain that.
> >>
> >> So this patch is correct.
> >
> > I was not debating the correctness of this patch, quite the contrary:
> > it's already much better than it was before.
> >
> > I'm simply asking whether we should prevent `reg` (not `reg_ctrl`!)
> > from having anything in the top 16 bits, which would overwrite the reset
> > value for stream 1 which you correctly say should be retained as it is.
> > It seems unlikely that this happens, but better be safe than sorry?
>
> Wouln't this macro already make sure that 'reg' doesnt have anything in
> the top 16 bits? Its doing a & with 0x00003f00
>
> #define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__MASK
> 0x00003f00
> #define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__SHIFT   8
> static inline uint32_t
> DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(uint32_t val)
> {
>      return ((val) <<
> DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__SHIFT) &
> DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__MASK;
> }
>
> Did you have anything else in mind? If so, please suggest.
>
> >
> > Looking at the DSI register definition for DSC [1] again, I wonder if
> > there's support for defining a common bitfield layout and reusing it
> > thrice: the two channels for CMD mode and a single use for VIDEO.  Don't
> > think that'd make the kernel code better though if even possible at all.
> >
>
> We can have a common bitfield layout for the two channels for command mode.
>
> So we can do something like below for common fields:
>
> -static inline uint32_t
> DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(uint32_t val)
> +static inline uint32_t
> DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM_DATATYPE(uint32_t val, uint32_t
> stream_id)
>   {
> -       return ((val) <<
> DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__SHIFT) &
> DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__MASK;
> +       return ((val) <<
> (DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__SHIFT + (stream_id
> * 16)) & DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__MASK;
>   }

NAK. Please express this in the xml source. This file is autogenerated.

>
> Video mode can also use all of these except for WC as that field is not
> present for cmd modes.
>
> This can go as a separate change .
>
> I can push this and perhaps get a Tested-by from Vinod as I dont have a
> setup to re-validate this.
>
> Thanks
>
> Abhinav
> > [1]: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14967/diffs
> >
> > - Marijn
> >
> >>>
> >>> However, this seems to indicate that the DSC patch series has been
> >>> approved and merged somehow??
> >>>
> >>>> ---
> >>>>
> >>>> Changes since v1:
> >>>>    - Fix c&p error and apply mask clear to reg_ctrl2 instead of reg_ctrl
> >>>>      (Abhinav)
> >>>>
> >>>> ---
> >>>>    drivers/gpu/drm/msm/dsi/dsi_host.c | 5 ++++-
> >>>>    1 file changed, 4 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >>>> index c983698d1384..a95d5df52653 100644
> >>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> >>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >>>> @@ -961,10 +961,13 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
> >>>>                    reg_ctrl = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL);
> >>>>                    reg_ctrl2 = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2);
> >>>>
> >>>> +          reg_ctrl &= ~0xffff;
> >>>>                    reg_ctrl |= reg;
> >>>> +
> >>>> +          reg_ctrl2 &= ~DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH__MASK;
> >>>>                    reg_ctrl2 |= DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH(bytes_in_slice);
> >>>>
> >>>> -          dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg);
> >>>> +          dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg_ctrl);
> >>>>                    dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
> >>>>            } else {
> >>>>                    dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
> >>>> --
> >>>> 2.35.1
> >>>>



-- 
With best wishes
Dmitry
