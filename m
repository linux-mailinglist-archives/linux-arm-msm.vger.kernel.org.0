Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 593CD66210B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 10:11:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236307AbjAIJLJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 04:11:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237004AbjAIJKU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 04:10:20 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 469D7165BB
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 01:06:57 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-4c9b9185d18so33885157b3.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 01:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pk8HoU5sl6UY7My5Q7QXvnwfSNOwL/YVw0rPqcw5wI0=;
        b=uxJqcr/vA16Jbso7FMrCavP3Cf2jhnnlPgVnsuBsvS/o+Z1jwaAnN1AQdnbbe+GJc6
         ixviHjNm2JTcHR4e5QhHj1v3nXBUyMlCCBLXphPY6Q+qVkTzrxjlykCBgc2y7oRrP17s
         A5bSkfDmbgJreYllwN7sl/4BZpeZJ/z9eUcIoENMIMYTupxqrttaUSwQCj8s/SrP+sIQ
         6wbCC9UCbTxxCG3hCIRwUkCdwfAGRw4ZfRIfAuJDLhTbJR+AerCjSUWlZklTY53Ts7Et
         bD4pvNfviMu91QcLX9ba5HawO/FK9vk9Bayawpaj1Wn4PcYxCp7iUlPdFSLxeLu0MHla
         foSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pk8HoU5sl6UY7My5Q7QXvnwfSNOwL/YVw0rPqcw5wI0=;
        b=ndfH6ZkOv+nhslp4ie9JMAL8rBtW2Mmnm258XzKlQ4WD9I2MLsCVmXqIyvvU/Z3TUA
         Dw4YQCxg3whBaXMiWfv7471XxeH9ot5/dhpxwzF6eqHbccBVx7GgJYK+iWZoqxNrV5it
         7zgqfdxRSZHD1KNWiZPCqySPy0UUlMuFw+ohU3PndN+zW5rbo+lgc/Rtw3ArG8Xg9Fxs
         HQAX4xrTSXcqVw/NP4Xy0cseba5KYYYZW7P7xsARy96KD4Oyajwyc6awqeFpMWZcBhU9
         bFytvSS4Afilmc9xAPIA7FerCdhTUw74IP1oBlba/QM/WwNuWGmc7aW9Dwhs0E0NHMj6
         ncdA==
X-Gm-Message-State: AFqh2krIsOYc1gLB9Z9DzsthHbgYqWGRf4qOcAMePXglslRO06yuXzS8
        mp6aw07d+uBE2lCz2LVdDZg+l5QAK4oedwUG0J7k1g==
X-Google-Smtp-Source: AMrXdXv7lpAYFxmW/eV/4rKWRDYgiJ5liDzlAKLCsDctqH1bw7LEQ8Q1lC1IVljbsIzfzyvSmxnDP2lGZbHp6UK7mUs=
X-Received: by 2002:a0d:d692:0:b0:477:b56e:e1d6 with SMTP id
 y140-20020a0dd692000000b00477b56ee1d6mr6161ywd.188.1673255216324; Mon, 09 Jan
 2023 01:06:56 -0800 (PST)
MIME-Version: 1.0
References: <20221221231943.1961117-1-marijn.suijten@somainline.org>
 <20221221231943.1961117-5-marijn.suijten@somainline.org> <b415a91d-f804-1fec-52dd-4124d3f1e583@linaro.org>
 <1b872a47-6ffc-1fe9-f283-897dbc37d709@linaro.org> <20230109082357.meebk7udokdfvwle@SoMainline.org>
In-Reply-To: <20230109082357.meebk7udokdfvwle@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 9 Jan 2023 11:06:45 +0200
Message-ID: <CAA8EJppqocjgTbZLhcJtmRGjE4X2u_jDEGDWS9Bsp7MEgD+Ldg@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] drm/msm/dpu: Disallow unallocated resources to be returned
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jani Nikula <jani.nikula@intel.com>,
        sunliming <sunliming@kylinos.cn>,
        Sam Ravnborg <sam@ravnborg.org>,
        Haowen Bai <baihaowen@meizu.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Drew Davenport <ddavenport@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 9 Jan 2023 at 10:24, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-01-09 01:30:29, Dmitry Baryshkov wrote:
> > On 09/01/2023 01:28, Dmitry Baryshkov wrote:
> > > On 22/12/2022 01:19, Marijn Suijten wrote:
> > >> In the event that the topology requests resources that have not been
> > >> created by the system (because they are typically not represented in
> > >> dpu_mdss_cfg ^1), the resource(s) in global_state (in this case DSC
> > >> blocks) remain NULL but will still be returned out of
> > >> dpu_rm_get_assigned_resources, where the caller expects to get an array
> > >> containing num_blks valid pointers (but instead gets these NULLs).
> > >>
> > >> To prevent this from happening, where null-pointer dereferences
> > >> typically result in a hard-to-debug platform lockup, num_blks shouldn't
> > >> increase past NULL blocks and will print an error and break instead.
> > >> After all, max_blks represents the static size of the maximum number of
> > >> blocks whereas the actual amount varies per platform.
> > >>
> > >> ^1: which can happen after a git rebase ended up moving additions to
> > >> _dpu_cfg to a different struct which has the same patch context.
> > >>
> > >> Fixes: bb00a452d6f7 ("drm/msm/dpu: Refactor resource manager")
> > >> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > >> ---
> > >>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 5 +++++
> > >>   1 file changed, 5 insertions(+)
> > >
> > > I think the patch is not fully correct. Please check resource
> > > availability during allocation. I wouldn't expect an error from
> > > get_assigned_resources because of resource exhaustion.
>
> Theoretically patch 5/8 should take care of this, and we should never
> reach this failure condition.  Emphasis on /should/, this may happen
> again if/when another block type is added with sub-par resource
> allocation and assignment implementation.

Yeah. Maybe swapping 4/8 and 5/8 makes sense.

>
> > Another option, since allocation functions (except DSC) already have
> > these safety checks: check error message to mention internal
> > inconstency: allocated resource doesn't exist.
>
> Is this a suggestion for the wording of the error message?

Yes. Because the current message makes one think that it is output
during allocation / assignment to encoder, while this is a safety net.

>
> - Marijn




--
With best wishes
Dmitry
