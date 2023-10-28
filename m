Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03E307DA463
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Oct 2023 02:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbjJ1AiD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Oct 2023 20:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjJ1AiC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Oct 2023 20:38:02 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F82129
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Oct 2023 17:37:59 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-59e88a28b98so23856127b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Oct 2023 17:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698453479; x=1699058279; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DmV04Dp8n+rjqqag6HgSNHHH01v3B7yQX+cBFsCk30Q=;
        b=O0D4BsIqy0D0qivg7rUxx0mY359jLktP3H0unPvaCmp1W12BUuhT5aWbSfSmxDQnzh
         kFLVulHG7XSygIuuJuMXqvo0eq5Lelhu3liq8D+0pV8UnZcf29Wk+0A8eJpqcyt7Xrrw
         MGC0AchEi4bWk07x1HcqtT/S8GbDNs9D3ezTD8cuzzZICEN9LnVWN6I5XPBvHwRqRfMw
         rmZDpLpaIRYG0K1CDjOsOZL9pSc/pSmrpO/jgAf2CMf3cic//fetDjlbCP8MWJ6bw36/
         abIEBH/VQYpWKLL3E8YhO3PfR5iBCYLKAbvEAZ6ZoSBN904UBcxdBqHjy3Nd5E8be8xR
         Iywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698453479; x=1699058279;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DmV04Dp8n+rjqqag6HgSNHHH01v3B7yQX+cBFsCk30Q=;
        b=IyHdlAxoQruPAPuRT6Id9LZgDU+wuiAl3uU4ZcIVA4NwFNQ2qwBD/Ho3w95mDZPrdS
         GpHiDpwUvIJ2/XmpbNr9uXW5YDcmHaSyv0Qs26QXHaTYLWcgi4gFvw/K4AtSIyl4vc8j
         Ao9MvPv3Lb2f/r0KObqok6bEd1nVuOocgOIQBiy5f4xML7ivr+Wvow92CG5lgtJdjCIS
         PUK8AmsJeJCitfQAwFYrhnaYhiJtgTKXH31N82CTU5sv4c37PNsiChZW+kl0B9awR8pI
         u1ShMEwigVwg04GOUmbKcdY7UJLpzDGoKz8P3JpX09dPGmXM3eCEuF7HL7XZe6FLym4i
         yC6Q==
X-Gm-Message-State: AOJu0YzIfHqIUXtY2nWkaC9oU8zC3I3t05ELwzjxsa3ZLU0q5LfMmA+B
        34RFJaS4PWIAsxHc7kKVttoW4Q2GjzGI3COVC9Q5lg==
X-Google-Smtp-Source: AGHT+IE29XUeiiTmE/KmVbh4xF/1yO3eBtK3ViC6hAlTaHc1uavtyLD/MOuUAuFFiGdzA1p4cT87alBlLCasJvYcxRk=
X-Received: by 2002:a81:4328:0:b0:5a7:d8c8:aa17 with SMTP id
 q40-20020a814328000000b005a7d8c8aa17mr8366769ywa.13.1698453478747; Fri, 27
 Oct 2023 17:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231025092711.851168-1-dmitry.baryshkov@linaro.org>
 <20231025092711.851168-2-dmitry.baryshkov@linaro.org> <37b52c67-7abb-d607-dc46-1cde33606997@quicinc.com>
In-Reply-To: <37b52c67-7abb-d607-dc46-1cde33606997@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 28 Oct 2023 03:37:47 +0300
Message-ID: <CAA8EJpqMXMU__zKU+_4rwjyg0kEB1HvRhUviRBwKnbjABS_xQA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm/dp: don't touch DP subconnector property
 in eDP case
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 28 Oct 2023 at 00:02, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 10/25/2023 2:23 AM, Dmitry Baryshkov wrote:
> > From: Abel Vesa <abel.vesa@linaro.org>
> >
> > In case of the eDP connection there is no subconnetor and as such no
> > subconnector property. Put drm_dp_set_subconnector_property() calls
> > under the !is_edp condition.
> >
> > Fixes: bfcc3d8f94f4 ("drm/msm/dp: support setting the DP subconnector type")
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++++-----
> >   1 file changed, 10 insertions(+), 5 deletions(-)
> >
>
> We still need to unify the calls to drm_dp_set_subconnector_property()
> for the hpd connect/disconnect places preferably in
> dp_display_send_hpd_notification().
>
> That way, we would have had to make this change only in one location.

Good point, I'd like to take another look at the HPD handling in the
DP driver after we land the pending pm_runtime changes. As a part of
that I'll check the drm_dp_set_subconnector_property() calls.

> If you want to pursue that as a separate patch, I am fine as well.
>
> Hence,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>



-- 
With best wishes
Dmitry
