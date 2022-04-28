Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66692513E31
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Apr 2022 23:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352614AbiD1Vzk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Apr 2022 17:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352753AbiD1Vz0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Apr 2022 17:55:26 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 939B957B1F
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 14:52:05 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-2f7ca2ce255so67431307b3.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 14:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PcHi7ONc79tcvDl17+xTZqXv6Z1wnjDOjO1qXbe8GZM=;
        b=Wy3ZvzT5HMOC0TqIrbPMYdA0mMgd4oZgDSQMmqJI6Ct635e8/iHpaNjwdtOq2Xu3hZ
         +2rs0708RSE8ZDb6LEVHV3IpOsRmXAjQu9RKLPpBwy7n9nBMFxrKf/rqtdOjhO1atv/K
         gVidXHn/6SoMChngMZ4PD7eHYcKOV/EURZ3Mt5iQZzb/e9i2EgRPLyhR7cVrGVhjo0xb
         b3zX3Ak9ipasUX579HSIkE6ewzfbjyytFFHe/PaifDrb8DuZSyeQ12ZOedKcbqh2FdEC
         UOOSuL80MtP+qRhFN/JZuM0nrAyDfMQuKVEW8vRA32HpMENLnv4UZq5ilzJtZKKJv9AB
         CsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PcHi7ONc79tcvDl17+xTZqXv6Z1wnjDOjO1qXbe8GZM=;
        b=lG/bhyeOUd7d1CxgwbvJT3OTRhv/2Gs5dcfBydIz7GgrJDmbCree5FjFQBKX6KZiAJ
         Kg5Y0wNwrdj0UaqolPQffULpJOCRyxIiSgdDPkxulzq9yuqUd9fd+MBt2LyjTFnNR1GF
         7ecG+aRFzV9YmGEJp7dw20sbbYkHpp8jhpLjSGro51qaXhT7xwZiLp+KldeqG150CBnV
         oFhkoUL9aPT9eKuzaL7va6dR4j/cMwYv3tZ4KfRPWw/l/sY7UuQhPwe4l/LjKZs7GUGn
         6lXjO6iIUaXjn4q/iNZZooJxXEvLY5HECXNGPVxzDU6/HD0cPEDg0349OO7lg3XQVTOU
         0uzg==
X-Gm-Message-State: AOAM531PiLHKBmZVpfY+JqlrX5XIjf0nsojJ8NpU5Y0OCtgk/2xElfN5
        j5C4yzsSWtpUBrDV1ZCH3qYmAfb9U48c35ScDxfi8A==
X-Google-Smtp-Source: ABdhPJxGfqMRyMFA46Ok0JKSL5EXEsdELoZtAFWtrwE5PAns//M/eOXeeFNy61jXI50YHyTUewNSFouKHniMlNSpwEI=
X-Received: by 2002:a81:4ed0:0:b0:2f7:cec6:e5f2 with SMTP id
 c199-20020a814ed0000000b002f7cec6e5f2mr28098943ywb.490.1651182724647; Thu, 28
 Apr 2022 14:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
 <20220217055529.499829-4-dmitry.baryshkov@linaro.org> <CAE-0n529mx1ke89iw8xXZEDcs0z84hA09B31cWeVQSTU9RAAYg@mail.gmail.com>
 <CAA8EJpq4fXHH6GEJO=m3Ckw0A2p7B_X0D3SiXi1xnJ=4VZOC=g@mail.gmail.com>
 <CAE-0n50h=REsyLsjNMaMaZtH7Dptowink7Tq0nzmBRYNas9OmQ@mail.gmail.com>
 <CAA8EJppT9O+bDjfEZv9tWCWpeCDMDPTf+VV0a0HxDw2mXhiMtw@mail.gmail.com>
 <CAE-0n522eve3K1ou-sFgNnfwtb6qSzOssB0=Ewu53PnBYkzO-g@mail.gmail.com>
 <77e7ed06-8b7a-35d9-c133-561058a9ea6d@linaro.org> <CAE-0n50NyXAYuyb0-uWfHkt56ZNZXM2aWrApoBBkbKU=++y_iQ@mail.gmail.com>
In-Reply-To: <CAE-0n50NyXAYuyb0-uWfHkt56ZNZXM2aWrApoBBkbKU=++y_iQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 29 Apr 2022 00:51:53 +0300
Message-ID: <CAA8EJprC8adq+WpNCLyeBQv=ALLtoykU1FeHf46wfCednhH9gw@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] drm/msm/dp: set stream_pixel rate directly
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 29 Apr 2022 at 00:49, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-04-19 09:34:18)
> > On 08/03/2022 23:46, Stephen Boyd wrote:
> > >
> > > Yes that's my concern. The qmp phy driver has a couple clk_set_rate()
> > > calls in the .configure_dp_phy callback. That is called from
> > > phy_power_on() (see qcom_qmp_phy_power_on() and qcom_qmp_phy_dp_ops).
> > > Looking at qcom_qmp_v3_phy_configure_dp_phy() it does
> > >
> > >          clk_set_rate(dp_clks->dp_link_hw.clk, dp_opts->link_rate * 100000);
> > >          clk_set_rate(dp_clks->dp_pixel_hw.clk, pixel_freq);
> > >
> > > and I believe the child of dp_pixel_hw is find_clock("stream_pixel").
> > > Looks like that is DISP_CC_MDSS_DP_PIXEL_CLK which is
> > > disp_cc_mdss_dp_pixel_clk_src for the rate settable part. That has
> > > clk_dp_ops which is clk_rcg2_dp_set_rate() for the set rate part. That
> > > wants the parent clk frequency to be something non-zero to use in
> > > rational_best_approximation(). If the clk_set_rate("stream_pixel") call
> > > is made before phy_power_on() then the parent_rate in
> > > clk_rcg2_dp_set_rate() won't be valid and the pixel clk frequency will
> > > be wrong.
> >
> >
> > Please excuse me, I didn't have time for this patchset up to now.
>
> No worries. I lost this in my inbox!
>
> >
> > I double checked the previous patch (drm/msm/dp: "inline"
> > dp_ctrl_set_clock_rate("ctrl_link")). Note, that the OPP is set _after_
> > the PHY is powered on and configured.
> >
>
> Ok. If the clk_set_rate("stream_pixel") call is made after the
> phy_power_on() then it should be equivalent.

R-B?

-- 
With best wishes
Dmitry
