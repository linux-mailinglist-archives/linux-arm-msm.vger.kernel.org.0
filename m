Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE28455A519
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jun 2022 01:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbiFXXxt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 19:53:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbiFXXxs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 19:53:48 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED67A44743
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 16:53:47 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id k20so3066850qkj.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 16:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XWbRuL2HNJOazJRDZ8Yz9uaYitC4uPW931tvugnImWs=;
        b=OMISmZTnPSyJ2Zmlprhg32lCJnHsse7hunOaQZu+IvIUb1JqifQ8/cVFphlQf6U1I5
         s4lLnkgPy6GCPqoTsRc38Ek7n/CZs0um1eNVdC12bLEMEahmryIhhQjecpXv/H1miJib
         2oeTjESwobonRtBvptbyFmqVPMEA+eE7tDV8CMWIKfpiR8bNm0NAc+oIkppKCXQpWKOE
         BXJPPjElweEe+KUkC174tN+rPS54PuS+mBCih3c1hS2xH5LS5v4GPJjcNjMlCiHPCNNd
         Hd8vHuPbA0/Ws6k943RaB75NmTs799P4g3AseYGngL8KMbPsS/VnqKJhRcfyR37ZYKbx
         1j1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XWbRuL2HNJOazJRDZ8Yz9uaYitC4uPW931tvugnImWs=;
        b=E29GfdBCFC2kI7aEXG26TcKv9vG6nDpr7zmLMFxd8MIepvGbtgDxTv8pVFFg1Tnwob
         MoD5QbLH3ItVnaqLDvWhY+kr3i9WKgrySbrQ5E9+a6j3PCAcvfabYuDXgx/lgYFJi7yb
         lz47rS+6mMo69Iop2v4YxiiUKmRfmu3Z7NL4oRq72QfguB2eDyS/mK8sIXJHfP+nR3pt
         kromt7aB8cGnyS4X4gxX6iKL/JlRAEKkMz5LLs8tdsk2S9j2PIIZzWD5UZ3FFiADbjJf
         MuY12/3Nt7w2LfPOFr3+/y689I3o/NPch/4+Kzvk0iqrgykq7LLSpWVO9DvfEzhxOAY+
         xFfg==
X-Gm-Message-State: AJIora+6UuGqBtKr4G5r2tUg6HNzDmRQS38UOl2MsYgXTXk0Y8SlqFUJ
        YCULXnBS/OHPWruWpRmV/88mCObxa6c+uqj8riE75g==
X-Google-Smtp-Source: AGRyM1sssDPYLQQkqtjhG0C1nm2ma0r4GcjmmJkpT053S48MTsShoxEygLh6xlx3b4oYiFps99tJYYPjpkLME85zmwY=
X-Received: by 2002:a05:620a:2a0e:b0:6a7:8346:1601 with SMTP id
 o14-20020a05620a2a0e00b006a783461601mr1333795qkp.593.1656114827059; Fri, 24
 Jun 2022 16:53:47 -0700 (PDT)
MIME-Version: 1.0
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <1656090912-18074-3-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52RW+UFJ=hqMWjwR8qvEbww7QjzPW1nhL3Atd97QXAnYw@mail.gmail.com>
 <007ea4c9-9701-f4ab-3278-5d36bf2018c4@quicinc.com> <CAE-0n53kNCK0ajHfY2WQr5HEQZtZSBLnhfbTuZwaUNEOZhsKPg@mail.gmail.com>
 <fa7f8bf1-33cd-5515-0143-6596df2bd740@quicinc.com> <CAE-0n51g-EVsC-i9=sJV-ySa8VnE+yT7cg=b-TNMi9+3uBiOVA@mail.gmail.com>
 <326912ff-9771-0711-366d-79acd436908b@quicinc.com> <CAE-0n51qrdrFtSr0vRwgYkMgSZfnzQuinaUROQsp30QoDchWQA@mail.gmail.com>
 <0ff3d6a3-dc5c-7c77-f8a1-6c4f6c1a3215@quicinc.com> <CAE-0n515hMKqQ+Vj1Sg54PpwkbWMYJ77QN+y+KZNBWymjhpWKw@mail.gmail.com>
In-Reply-To: <CAE-0n515hMKqQ+Vj1Sg54PpwkbWMYJ77QN+y+KZNBWymjhpWKw@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 25 Jun 2022 02:53:36 +0300
Message-ID: <CAA8EJpoD-CJ1mgzef0tA4R=BJUdbSPErXG1fvugAd+5UhWiobA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/msm/dp: decoupling dp->id out of dp
 controller_id at scxxxx_dp_cfg table
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dianders@chromium.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org,
        quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 25 Jun 2022 at 02:45, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Kuogee Hsieh (2022-06-24 16:30:59)
> >
> > On 6/24/2022 4:12 PM, Stephen Boyd wrote:
> > > Quoting Kuogee Hsieh (2022-06-24 15:53:45)
> > >> MSM_DP_CONTROLLER_1 need to match to the index = 1 of sc7280_dp_cfg[] <== This is correct
> > >>
> > >> The problem is sc7280_dp_cfg[] have two entries since eDP place at index
> > >> of MSM_DP_CONTROLLER_1.
> > >>
> > >> but .num_desc = 1  <== this said only have one entry at sc7280_dp_cfg[]
> > >> table. Therefore eDP will never be found at for loop  at
> > >> _dpu_kms_initialize_displayport().
> > >>
> > > Yes, but what else does the MSM_DP_CONTROLLER_1 need to match? Because
> > > the intention of the previous commit was to make it so the order of
> > > sc7280_dp_cfg couldn't be messed up and not match the
> > > MSM_DP_CONTROLLER_1 value that lives in sc7280_intf[].
> >
> >
> > at  _dpu_kms_initialize_displayport()
> >
> > > -             info.h_tile_instance[0] = i; <== assign i to become dp controller id, "i" is index of scxxxx_dp_cfg[]
> >
> > This what I mean MSM_DP_CONTROLLER_1 need to match to index = 1 of
> > scxxxx_dp_cfg[].
> >
> > it it is not match, then MSM_DP_CONTROLLER_1 with match to different INTF.
>
> I thought we matched the INTF instance by searching through
> sc7280_intf[] for a matching MSM_DP_CONTROLLER_1 and then returning that
> INTF number. See dpu_encoder_get_intf() and the caller.

You both are correct here. We are searching through the _intf[] array
for the corresponding controller_id. And yes, the controller_ids are
being passed through the h_tile_instance[] array.

-- 
With best wishes
Dmitry
