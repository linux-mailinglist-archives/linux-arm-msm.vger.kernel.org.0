Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16726513E30
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Apr 2022 23:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236609AbiD1Vzi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Apr 2022 17:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245068AbiD1Vxc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Apr 2022 17:53:32 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E3AC3E92
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 14:49:59 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-e67799d278so6443159fac.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 14:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=raLa1RhQQr1A0ntQ+5+55SWHnInlmTf3908R5YkmSCU=;
        b=By+Tcwfzep/u2vDE7Vf7eynSfwr4hxh3y0ltm0hrThSrt8S+bvPbf9p7fAvp7HzwGq
         YMsf64RiGKps+dUqUstzBn7RBIf6Ye2A6sbcDRw9ijC9orNf5Hbz8k8KSlmI5xFht95O
         agZKIb5xq8+0n7+6O8pt1nmfjXN3TVYWdZRYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=raLa1RhQQr1A0ntQ+5+55SWHnInlmTf3908R5YkmSCU=;
        b=kD/nOuHvMLUI+7kZ12zTtyZ/7QqkDjwls/gGxvnKNNK91iVUWWEgwuT1aDi19jJHuI
         YGSpM/5BAVU1o9uFc5yXwK4xEzdAO2D17cDnzkfJAu+EthJmENPASYtbgVlTdKGIjdVl
         EU4uQeoYlZO0cu2i9FFWebGfHO6bgp5Sl4id8lg3+uFKryraxznFYlZSn4mAOSRCRjyT
         MiGyxfd6Pda2azNNTbt+tRDpx5RtcyoGjLEhh1yBoVDDT2CLUqddvK+Gu3JaMwNJoLlQ
         FcIf8zl87WbGCueicf5a/+PiOgc7KwZB8e3uYOJPBDbnDlfhcw5S/l1M7J8m4SatwXjM
         D2IQ==
X-Gm-Message-State: AOAM5301aTOMTYG26Co2wsZmsDB6QAzfKos8um7l3jZrSE9yj4TOGr1h
        Qx3qOOxGyAaI/5fDij5MFOGQ3YlBHCZndKElBPXwbg==
X-Google-Smtp-Source: ABdhPJxDunjl2C+LoabmMLvodkEblzsXuptAtAJwy3mvIfzQev+jhaT8KsU38spAnnhbSrFhbrc/fgXXhQlP30Kc/MA=
X-Received: by 2002:a05:6870:15ca:b0:e9:551:6d1c with SMTP id
 k10-20020a05687015ca00b000e905516d1cmr105932oad.193.1651182586543; Thu, 28
 Apr 2022 14:49:46 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 Apr 2022 14:49:45 -0700
MIME-Version: 1.0
In-Reply-To: <77e7ed06-8b7a-35d9-c133-561058a9ea6d@linaro.org>
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
 <20220217055529.499829-4-dmitry.baryshkov@linaro.org> <CAE-0n529mx1ke89iw8xXZEDcs0z84hA09B31cWeVQSTU9RAAYg@mail.gmail.com>
 <CAA8EJpq4fXHH6GEJO=m3Ckw0A2p7B_X0D3SiXi1xnJ=4VZOC=g@mail.gmail.com>
 <CAE-0n50h=REsyLsjNMaMaZtH7Dptowink7Tq0nzmBRYNas9OmQ@mail.gmail.com>
 <CAA8EJppT9O+bDjfEZv9tWCWpeCDMDPTf+VV0a0HxDw2mXhiMtw@mail.gmail.com>
 <CAE-0n522eve3K1ou-sFgNnfwtb6qSzOssB0=Ewu53PnBYkzO-g@mail.gmail.com> <77e7ed06-8b7a-35d9-c133-561058a9ea6d@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 28 Apr 2022 14:49:45 -0700
Message-ID: <CAE-0n50NyXAYuyb0-uWfHkt56ZNZXM2aWrApoBBkbKU=++y_iQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] drm/msm/dp: set stream_pixel rate directly
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-04-19 09:34:18)
> On 08/03/2022 23:46, Stephen Boyd wrote:
> >
> > Yes that's my concern. The qmp phy driver has a couple clk_set_rate()
> > calls in the .configure_dp_phy callback. That is called from
> > phy_power_on() (see qcom_qmp_phy_power_on() and qcom_qmp_phy_dp_ops).
> > Looking at qcom_qmp_v3_phy_configure_dp_phy() it does
> >
> >          clk_set_rate(dp_clks->dp_link_hw.clk, dp_opts->link_rate * 100000);
> >          clk_set_rate(dp_clks->dp_pixel_hw.clk, pixel_freq);
> >
> > and I believe the child of dp_pixel_hw is find_clock("stream_pixel").
> > Looks like that is DISP_CC_MDSS_DP_PIXEL_CLK which is
> > disp_cc_mdss_dp_pixel_clk_src for the rate settable part. That has
> > clk_dp_ops which is clk_rcg2_dp_set_rate() for the set rate part. That
> > wants the parent clk frequency to be something non-zero to use in
> > rational_best_approximation(). If the clk_set_rate("stream_pixel") call
> > is made before phy_power_on() then the parent_rate in
> > clk_rcg2_dp_set_rate() won't be valid and the pixel clk frequency will
> > be wrong.
>
>
> Please excuse me, I didn't have time for this patchset up to now.

No worries. I lost this in my inbox!

>
> I double checked the previous patch (drm/msm/dp: "inline"
> dp_ctrl_set_clock_rate("ctrl_link")). Note, that the OPP is set _after_
> the PHY is powered on and configured.
>

Ok. If the clk_set_rate("stream_pixel") call is made after the
phy_power_on() then it should be equivalent.
