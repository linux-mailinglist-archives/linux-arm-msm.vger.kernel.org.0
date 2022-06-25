Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A00D655A5B8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jun 2022 03:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbiFYBPW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 21:15:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbiFYBPV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 21:15:21 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A81FB3ED2C
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 18:15:20 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-101b4f9e825so5994360fac.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 18:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=EHOMV/tMxEFeh2Jng8BcJ4ThhtxwYK4Dk9aplz67guk=;
        b=dGn3J5hQVt31ATY+uLJZzcCFaJ2JarOQfjsSRAoyAOLFZ/LZ6aRroA1lMOzHRyV1ki
         5QBWVFvxporoAtTgNCi1cvCtAv8z6W0TjsGa4P3ZhTS3w9IbIPsHxqOrTcoJyQvTCtmT
         KMlEKexTypASbOy9WZvAz+s2jPY5gfTr5oDQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=EHOMV/tMxEFeh2Jng8BcJ4ThhtxwYK4Dk9aplz67guk=;
        b=EE9hA4J1vE5OC76MzyNRu9eVNqvMCOMP5ONSVwCQOogSz0wQOv55paA+a1t+uQMeef
         ZwUuJEtviLSPcYjmFi/PQroKq7S4VXaEbqlJCbsdbVwMygQw9mJlDgU9HCa0uMG60zg4
         /CNJO9LUPP/JAVP3eFF3q0Ox9jJUauw/Z2dM+XIasHf/0q0jefQA1Kg5UfpOmqfgFcKo
         yP4E5q/ihYiLWkD3FTWy8hbezHetBdHdafeLHg5re40pjAfph7Yrn5/bY71NLgsTUwdp
         mrSI2i/kah/S3NxagI3T8UpVyseh9sSDqie2HAmTiONzYVbD9dO1HtjZEfV19SshGhff
         kItw==
X-Gm-Message-State: AJIora/friEf/VCAkxrNEENgA1BMwaJZMBd9ENzB3N43IQBDsBM4Rgw9
        RGjhKg+VC1SjfodwJsBgIErr7BMn5GXnvTNgcsRNrA==
X-Google-Smtp-Source: AGRyM1sqn6raMG8ZnZmf/2BHjOiUNC2au51zyE6rJgQNmVhLHQ9NGqlBsSYe0+jwNvxHxItIz1kyFnssvhq/pbyt8OU=
X-Received: by 2002:a05:6870:b627:b0:102:f25:a460 with SMTP id
 cm39-20020a056870b62700b001020f25a460mr1138464oab.193.1656119719962; Fri, 24
 Jun 2022 18:15:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jun 2022 18:15:19 -0700
MIME-Version: 1.0
In-Reply-To: <1a2e7574-8f78-d48e-a189-020ffcd39f60@quicinc.com>
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <66ff4642-f268-f5b0-7e28-b196368c508a@quicinc.com> <5cf094cf-343a-82d7-91c4-1284683f9748@quicinc.com>
 <CAA8EJprqq=vxXT2DmEWii_Ajx2UbkHRexPTT58xFcWkBa_D5hA@mail.gmail.com>
 <26263c16-8cbc-ccca-6081-7eba14635d73@quicinc.com> <CAA8EJpqEoXXA=eKGHRGuQ3VOHnmEShY8u_SMZ6WFWORCFhFcrw@mail.gmail.com>
 <8445f93a-00f0-64af-5650-07f2bc487742@quicinc.com> <CAA8EJpqB2KPyvFehK9WRGgiVnqvD24cz5BcHsw8a5PQ2Vs1oKA@mail.gmail.com>
 <CAA8EJppZdyutyNBG+OFinickQoDxg0i4GwbaNQubo_LSRWNh4w@mail.gmail.com> <1a2e7574-8f78-d48e-a189-020ffcd39f60@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 24 Jun 2022 18:15:19 -0700
Message-ID: <CAE-0n52L1fvvpEH56+HD_UXuV61tMvhh8Qjp781bW9tTKRQymw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/msm/dp: decoupling dp->id out of dp
 controller_id at scxxxx_dp_cfg table
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dianders@chromium.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org,
        quic_aravindh@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-06-24 18:02:50)
>
> On 6/24/2022 5:46 PM, Dmitry Baryshkov wrote:
> > On Sat, 25 Jun 2022 at 03:28, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >> On Sat, 25 Jun 2022 at 03:23, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >>> On 6/24/2022 5:21 PM, Dmitry Baryshkov wrote:
> >>>> On Sat, 25 Jun 2022 at 03:19, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >>>>> How can I have eDP call dpu_encoder_init() before DP calls with
> >>>>> _dpu_kms_initialize_displayport()?
> >>>> Why do you want to do it? They are two different encoders.
> >>> eDP is primary display which in normal case should be bring up first if
> >>> DP is also presented.
> >> I do not like the concept of primary display. It is the user, who must
> >> decide which display is primary to him. I have seen people using just
> >> external monitors and ignoring built-in eDP completely.from
>
> >> Also, why does the bring up order matters here? What do you gain by
> >> bringing up eDP before the DP?
> > I should probably rephrase my question to be more clear. How does
> > changing the order of DP vs eDP bringup help you 'to fix screen
> > corruption'.
>
> it did fix the primary display correction issue if edp go first and i do
> not know the root cause yet.
>
> We are still investigating it.
>
> However I do think currently msm_dp_config sc7280_dp_cfg has issues need
> be addressed.
>

What issues exist with sc7280_dp_cfg? It looks correct to me.
